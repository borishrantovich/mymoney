<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;

class Customer extends Model
{
    const MIN_BONUS = 5;
    const MAX_BONUS = 25;

    private static $errorMessages = [];
    public static $fieldsAllowedToUpdate = [
        'first_name',
        'last_name',
        'gender',
        'country_code',
    ];

    private static function validationCreate(array $data)
    {
        Validator::extend('checkCountryCodes', function ($attribute, $value, $parameters) {
            return \DB::table('countries')->where('code', $value)->exists();
        });

        $rules = [
            'first_name' => 'string|required|max:191',
            'last_name' => 'string|required|max:191',
            'email'    =>'required|email|unique:customers',
            'gender' => 'required|in:male,female,other',
            'country_code'   => 'required|checkCountryCodes'
        ];
        $messages = [
            'country_code.check_country_codes' => 'The selected country code is invalid.',
        ];

        $validation = Validator::make($data, $rules, $messages);

        if ($validation->fails()) {
            self::setErrorMessage($validation->errors()->all());

            return false;
        }

        return true;
    }

    private static function validationUpdate(array $data)
    {
        Validator::extend('checkCountryCodes', function ($attribute, $value, $parameters) {
            return \DB::table('countries')->where('code', $value)->exists();
        });

        $rules = [
            'first_name' => 'string|max:191',
            'last_name' => 'string|max:191',
            'gender' => 'in:male,female,other',
            'country_code'   => 'checkCountryCodes'
        ];
        $messages = [
            'country_code.check_country_codes' => 'The selected country code is invalid.',
        ];

        $validation = Validator::make($data, $rules, $messages);

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

    public function getID()
    {
        return $this->id;
    }

    public function getCountryCode()
    {
        return $this->country_code;
    }

    private function setBonus()
    {
        $this->bonus = self::generateBonusPercent();
    }

    private function addBalance($amount)
    {
        $this->balance += $amount;
    }

    private function addBonusBalance($amount)
    {
        $bonus = ($amount * $this->bonus)/100;
        $this->bonus_balance += $bonus;

        return $bonus;
    }

    private static function generateBonusPercent()
    {
        return rand(self::MIN_BONUS, self::MAX_BONUS);
    }

    public static function searchCustomer($search)
    {
        $customerQuery = self::where('email', $search);
        if(is_numeric($search))
            $customerQuery->orWhere('id', $search);
        return $customerQuery->first();
    }

    public function create(Request $data)
    {
        if(self::validationCreate($data->all())) {
            $attributes = $data->json()->all();
            foreach($attributes as $attribute => $value)
                $this->$attribute = $value;
            $this->setBonus();

            $this->save();

            return $this;
        }
    }

    public function updateCustomer(Request $data)
    {
        $userCredential = $data->all()['search'];
        $data = $data->all()['update'];

        $customer = self::searchCustomer($userCredential);

        if($customer && self::validationUpdate($data)) {
            foreach($data as $attribute => $value) {
                if(in_array($attribute, self::$fieldsAllowedToUpdate))
                    $customer->$attribute = $value;
            }

            $customer->update();

            return $customer;
        }
    }

    public function changeBalance($customer_id, $amount, $isBonus = false)
    {
        $customer = self::find($customer_id);
        $customer->addBalance($amount);
        if($isBonus) {
            $bonus = $customer->addBonusBalance($amount);
            (new Transaction())->makeBonus(['amount' => $bonus], $customer_id);
        }
        $customer->update();
    }

    public function withdraw($withdrawalAmount)
    {
        if($this->hasEnoughBalance($withdrawalAmount)) {
            $this->balance -= $withdrawalAmount;
            return $this->update();
        }

        return false;
    }

    public function hasEnoughBalance($withdrawalAmount)
    {
        return $this->balance >= $withdrawalAmount;
    }
}
