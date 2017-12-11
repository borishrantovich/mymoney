<?php

use Illuminate\Http\Request;
Use App\Customer;
Use App\Transaction;
Use App\Reporting;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('customer/create', function(Request $request) {
    if($customer = (new Customer)->create($request))
        return response()->json(['status' => 'success', 'customer' => $customer], 201);

    return response()->json(['status' => 'fail', 'errors' => Customer::getErrorMessages(), 'dataSent' => $request->all()], 400);
});

Route::put('customer/update', function(Request $request) {
    if($customer = (new Customer)->updateCustomer($request))
        return response()->json(['status' => 'success', 'customer' => $customer], 201);

    return response()->json(['status' => 'fail', 'errors' => Customer::getErrorMessages(), 'dataSent' => $request->all()], 400);
});

Route::post('deposit', function(Request $request) {
    if($transaction = (new Transaction())->makeDeposit($request))
        return response()->json(['status' => 'success', 'transaction' => $transaction], 201);

    return response()->json(['status' => 'fail', 'errors' => Transaction::getErrorMessages(), 'dataSent' => $request->all()], 400);
});

Route::post('deposit', function(Request $request) {
    if($transaction = (new Transaction())->makeDeposit($request))
        return response()->json(['status' => 'success', 'transaction' => $transaction], 201);

    return response()->json(['status' => 'fail', 'errors' => Transaction::getErrorMessages(), 'dataSent' => $request->all()], 400);
});

Route::post('withdraw', function(Request $request) {
    if($withdrawal = (new Transaction())->makeWithdrawal($request))
        return response()->json(['status' => 'success', 'transaction' => $withdrawal], 201);

    return response()->json(['status' => 'fail', 'errors' => Transaction::getErrorMessages(), 'dataSent' => $request->all()], 400);
});

Route::get('report', function(Request $request) {
    if($reporting = (new Reporting())->getReport($request))
        return response()->json(['status' => 'success', 'transaction' => $reporting], 201);

    return response()->json(['status' => 'fail', 'errors' => Transaction::getErrorMessages(), 'dataSent' => $request->all()], 400);
});
