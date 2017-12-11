<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;


class Reporting extends Model
{
    public function getReport(Request $data)
    {
        if(!isset($data->all()['dateInterval']) || !isset($data->all()['dateInterval']['from']) || !isset($data->all()['dateInterval']['to'])) {
            $interval = [
                "from" => date('Y-m-d', time()-7*24*60*60),
                "to" => date('Y-m-d', time()),
            ];
        } else {
            $interval = $data->all()['dateInterval'];
        }
        $transactions = Transaction::getByDateInterval($interval);
        return self::makeTheReport($transactions);
    }

    private static function makeTheReport($transactions)
    {
        $report = [];
        $customers = [];
        $deposits = [];
        $withdrawals = [];
        $dates = [];
        $countries = [];
        foreach($transactions as $transaction)
        {
            $country = $transaction->customer->getCountryCode();
            $date = strtotime($transaction->getDate());

            if(!isset($customers[$date][$country]) || !in_array($transaction->getCustomerID(), $customers[$date][$country])) {
                $customers[$date][$country][] = $transaction->getCustomerID();
            }

            if($transaction->type == 'deposit') {
                if(!isset($deposits[$date][$country])) {
                    $deposits[$date][$country]['amount'] = $transaction->amount;
                    $deposits[$date][$country]['qty'] = 1;
                } else {
                    $deposits[$date][$country]['amount'] += $transaction->amount;
                    $deposits[$date][$country]['qty']++;
                }
            } else if($transaction->type == 'withdrawal') {
                if(!isset($withdrawals[$date][$country])) {
                    $withdrawals[$date][$country]['amount'] = $transaction->amount;
                    $withdrawals[$date][$country]['qty'] = 1;
                } else {
                    $withdrawals[$date][$country]['amount'] += $transaction->amount;
                    $withdrawals[$date][$country]['qty']++;
                }
            }
            if(!in_array($date, $dates))
                $dates[] = $date;
            if(!in_array($country, $countries))
                $countries[] = $country;
        }

        foreach($dates as $date) {
            foreach($countries as $country)
                if(isset($customers[$date][$country]))
                    $report[] = [
                        'date' => date('Y-m-d', $date),
                        'country' => strtoupper($country),
                        'unique_customers' => count($customers[$date][$country]),
                        'number_of_deposits' => isset($deposits[$date][$country]['qty'])?$deposits[$date][$country]['qty']:0,
                        'amount_of_deposits' => isset($deposits[$date][$country]['amount'])?$deposits[$date][$country]['amount']:0,
                        'number_of_withdrawals' => isset($withdrawals[$date][$country]['qty'])?$withdrawals[$date][$country]['qty']:0,
                        'amount_of_withdrawals' => isset($withdrawals[$date][$country]['amount'])?('-' . $withdrawals[$date][$country]['amount']):0,
                    ];
        }

        return $report;
    }
}