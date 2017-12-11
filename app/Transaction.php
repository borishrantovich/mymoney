<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;

class Transaction extends Model
{
    const TYPE_DEPOSIT = 'deposit';
    const TYPE_WITHDRAWAL = 'withdrawal';
    const TYPE_BONUS = 'bonus';

    const STATUS_SUCCESS = 'success';
    const STATUS_FAIL = 'fail';

    private static $errorMessages = [];
    public static $fieldsForTransaction = [
        'amount',
    ];
    public $updated_at = false;

    private static function validationDeposit(array $data)
    {
        $rules = [
            'amount' => 'numeric|required|min:1',
        ];

        $validation = Validator::make($data, $rules);

        if ($validation->fails()) {
            self::setErrorMessage($validation->errors()->all());

            return false;
        }

        return true;
    }

    private static function validationBonusAndWithdrawal(array $data)
    {
        $rules = [
            'amount' => 'numeric|required|min:0.05',
        ];

        $validation = Validator::make($data, $rules);

        if ($validation->fails()) {
            self::setErrorMessage($validation->errors()->all());

            return false;
        }

        return true;
    }

    private static function setErrorMessage(array $errors)
    {
        foreach($errors as $error)
            self::$errorMessages[] = $error;
    }

    public static function getErrorMessages()
    {
        $messages = self::$errorMessages;
        self::$errorMessages = [];

        return $messages;
    }

    public function customer()
    {
        return $this->belongsTo('App\Customer');
    }

    private function setCustomerID($id)
    {
        $this->customer_id = $id;
    }

    private function setDepositType()
    {
        $this->type = self::TYPE_DEPOSIT;
    }

    private function setBonusType()
    {
        $this->type = self::TYPE_BONUS;
    }

    private function setWithdrawalType()
    {
        $this->type = self::TYPE_WITHDRAWAL;
    }

    private function setSuccessStatus()
    {
        $this->status = self::STATUS_SUCCESS;
    }

    private function setFailStatus()
    {
        $this->status = self::STATUS_FAIL;
    }

    public function getAmount()
    {
        return $this->amount;
    }

    public function getCustomerID()
    {
        return $this->customer_id;
    }

    public function getDate()
    {
        return date('Y-m-d', strtotime($this->created_at));
    }

    private function changeCustomerBalance()
    {
        $customerID = $this->getCustomerID();
        $transactions = \DB::table('transactions')->where('customer_id', $customerID)->where('type', 'deposit')->count();
        $isBonus = false;
        if($transactions%3 == 0)
            $isBonus = true;

        (new Customer())->changeBalance($customerID, $this->getAmount(), $isBonus);
    }

    public function makeDeposit(Request $data)
    {
        $userCredential = $data->all()['customer'];
        $data = $data->all()['deposit'];

        $customer = Customer::searchCustomer($userCredential);

        if($customer && self::validationDeposit($data)) {
            foreach($data as $attribute => $value)
                if(in_array($attribute, self::$fieldsForTransaction))
                    $this->$attribute = $value;

            $this->setCustomerID($customer->id);
            $this->setDepositType();
            $this->setSuccessStatus();

            $this->save();
            $this->changeCustomerBalance();

            return $this;
        }
    }

    public function makeBonus(array $data, $customerID)
    {
        $customer = Customer::find($customerID);
        if($customer && self::validationBonusAndWithdrawal($data)) {
            foreach($data as $attribute => $value)
                if(in_array($attribute, self::$fieldsForTransaction))
                    $this->$attribute = $value;

            $this->setCustomerID($customerID);
            $this->setBonusType();
            $this->setSuccessStatus();

            $this->save();

            return $this;
        }
    }

    public function makeWithdrawal(Request $data)
    {
        $userCredential = $data->all()['customer'];
        $data = $data->all()['withdrawal'];

        $customer = Customer::searchCustomer($userCredential);

        if($customer && self::validationBonusAndWithdrawal($data)) {
            foreach($data as $attribute => $value)
                if(in_array($attribute, self::$fieldsForTransaction))
                    $this->$attribute = $value;

            $this->setCustomerID($customer->getID());
            $this->setWithdrawalType();

            if($customer->withdraw($this->getAmount()))
                $this->setSuccessStatus();
            else {
                $this->setFailStatus();
                $message = ['message' => 'Not Enough Balance'];
            }

            $this->save();

            if(isset($message))
                return [$this, $message];

            return $this;
        }
    }

    public static function getByDateInterval($interval)
    {
        $from = date('Y-m-d', strtotime($interval['from']));
        $to = date('Y-m-d', strtotime($interval['to']));

        return self::whereBetween('created_at', [$from, $to])->where('status', self::STATUS_SUCCESS)->get();
    }
}
