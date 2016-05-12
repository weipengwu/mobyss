<?php
use CallFire\Api\Rest\Request;
use CallFire\Api\Rest\Response;
require 'CallFire-PHP-SDK/vendor/autoload.php';

$client = CallFire\Api\Client::Rest('7fc7e8230320', '9dffbcb2165e5901', "Text");

$request = new Request\SendText;
$request->setFrom('67076');

$request->setTo($sendTo);

$request->setMessage('Text API test');

$response = $client->SendText($request);

$result = $client::response($response);

if($result instanceof ResourceReference) {
    echo json_encode($result);
}

