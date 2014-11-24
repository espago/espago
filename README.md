Espago gem
======

[![Build Status](https://travis-ci.org/espago/espago.png?branch=master)](https://travis-ci.org/espago/espago)

### Installing Espago gem

    gem install espago

or just add it to your Gemfile if you are running a Rails project

## Configuration

After registering at <http://espago.com> configure your app with the security credentials. More information about configuration of merchant account you can find in our documentation <https://espago.com/doc/en>

The most standard way of configuring Espago is to do it globally on the Espago class.

    Espago.app_id = 'your-espago-app-id'
    Espago.app_password = 'your-espago-secret'
    Espago.public_key = 'your-espago-key'
    Espago.production = false #sets Espago enviroment to sandbox

## Sending request

There are two possible ways of sending requests by using Espago gem. 
The first possibility is to call everytime send_request() function with proper path, HTTP method and parameters. 

    Espago.send_request path, request_type, [parameters]

Here it is an example of using this way to create new client:

    Espago.send_request :clients, :post, {description: "Jan Kowalski", email: "kowalski@example.com", card: {first_name: "Jan", last_name: "Kowalski", number: "4242424242424242", year: "2019", month: "03"}}

The second possible way to sending requests by Espago gem is to call the proper path on Espago object, using specific HTTP method and setting chosen parameteres. 

    Espago.path request_type, [parameters]

Below, it is an example of using this possibility to create new client:

    Espago.clients :post, {description: "Jan Kowalski", email: "kowalski@example.com", card: {first_name: "Jan", last_name: "Kowalski", number: "4242424242424242", year: "2019", month: "03"}}

## Getting response

Every returned object includes informations about header and body of response.

For example for request:

    client = Espago.clients :post, {description: "Jan Kowalski", email: "kowalski@example.com", card: {first_name: "Jan", last_name: "Kowalski", number: "4242424242424242", year: "2019", month: "03"}}

Espago returns an special response object:

    #<Espago::Response:0x000001038dba40
      @body=
       {"email"=>"kowalski@example.com",
        "id"=>"cli_N2NNf85cFB1xWs",
        "created_at"=>1381834598,
        "description"=>"Jan Kowalski",
        "card"=>
         {"company"=>"VI",
          "last4"=>"4242",
          "year"=>2019,
          "month"=>3,
          "first_name"=>"Jan",
          "last_name"=>"Kowalski",
          "authorized"=>nil,
          "created_at"=>1381834598},
        "deleted"=>false},
      @status=201>

To get response status code you should use "status" method. 
For example

    client.status

returns "201" code.

To get body of response you should use "body" method.
For example

    client.body

can return hash with client details:

    {
      "email"=>"kowalski@example.com",
      "id"=>"cli_N2NNf85cFB1xWs",
      "created_at"=>1381834598,
      "description"=>"Jan Kowalski",
      "card"=>
       {"company"=>"VI",
        "last4"=>"4242",
        "year"=>2019,
        "month"=>3,
        "first_name"=>"Jan",
        "last_name"=>"Kowalski",
        "authorized"=>nil,
        "created_at"=>1381834598},
      "deleted"=>false
    }

Now if you want get customer's e-mail this short code should execute operation:

    client.body["email"]
    => "kowalski@example.com"

## All possible paths (resources)

<table align="center">
<tr>
  <th>Parameter</th><th>Description</th><th>Documentation link</th>
</tr>  
<tr>
  <th>tokens</th><td>special id for credit card</td><td>https://www.espago.com/doc/en#card-tokens</td>
</tr>
<tr>
  <th>clients</th><td>clients data</td><td>https://www.espago.com/doc/en#customers</td>
</tr>
<tr>
  <th>charges</th><td>all channels (transfers and credit payments)</td><td>https://www.espago.com/doc/en#card-payments</td>
</tr>
<tr>
  <th>plans</th><td>plans for recurring payments</td><td>https://www.espago.com/doc/en#recurring-payments/plans</td>
</tr>
<tr>
  <th>subscriptions</th><td>recurring payments for client according to the created plan</td><td>https://www.espago.com/doc/en#recurring-payments/subscriptions</td>
</tr>
<tr>
  <th>invoices</th><td>single recurring payment</td><td>https://www.espago.com/doc/en#recurring-payments/invoices</td>
</tr>
<tr>
  <th>line_items</th><td>element of every invoice</td><td>https://www.espago.com/doc/en#recurring-payments/line-items</td>
</tr>
</table>
