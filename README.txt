//Create a Customer
Method - POST
URL - /myMoney/public/api/customer/create

attributes
*first_name string|required
*last_name string|required
*email string|valid email|required
*gender male|female|other|required
*country_code from Country.code|required

$testData = [
            "first_name" => "First",
            "last_name" => "Last",
            "email" => "test@test.com",
            "gender" => "male",
            "country_code" => "am"
    ];

//Update the Customer
Method - PUT
URL - /myMoney/public/api/customer/update

attributes
*first_name string
*last_name string
*gender male|female|other
*country_code from Country.code

searchBy
search - *email string
         *id int

$data = [
        "update" => [
                "first_name" => "FirstUpdated",
            ],
        "search" => "test@test.com"
    ];

//Make a Deposit
Method - POST
URL - /myMoney/public/api/deposit

attributes
*amount required|numeric

searchBy
customer - *email string
           *id int

$data = [
        "deposit" => [
                "amount" => "1"
            ],
        "customer" => "boris.aghajanyansl@gmail.com"
    ];

//Make a Withdrawal
Method - POST
URL - /myMoney/public/api/withdraw

attributes
*amount required|numeric

searchBy
customer - *email string
           *id int

$data = [
        "withdrawal" => [
                "amount" => "1"
            ],
        "customer" => "boris.aghajanyansl@gmail.com"
    ];

//Get The report
Method - GET
URL - /myMoney/public/api/report

attributes
*from date
*to date
if no attributes are set default interval is the last 7 days

$data = [
        "dateInterval" => [
                "from" => date('Y-m-d', time()-14*24*60*60),
                "to" => date('Y-m-d', time()),
            ],
    ];