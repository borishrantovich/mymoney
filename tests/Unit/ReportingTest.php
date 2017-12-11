<?php

namespace Tests\Unit;

use Tests\TestCase;
use App\Transaction;
use App\Reporting;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;

class ReportingTest extends TestCase
{
    protected static function getMethod($name) {

        $reflection = new \ReflectionClass('App\Reporting');
        $method = $reflection->getMethod($name);
        $method->setAccessible(true);
        return $method;
    }

    public function testMakeTheReport()
    {
        $transactions = Transaction::all();
        $makeTheReport = self::getMethod('makeTheReport');
        $data = $makeTheReport->invokeArgs((new Reporting), [$transactions])[0];

        $attributesForReport = ['date', 'country', 'unique_customers', 'number_of_deposits', 'amount_of_deposits', 'number_of_withdrawals', 'amount_of_withdrawals'];
        $keysForReport = array_flip($attributesForReport);

        return $this->assertTrue(count(array_intersect_key($data, $keysForReport)) == count($attributesForReport));
    }
}
