<?php
use CallFire\Api\Rest\Request;
use CallFire\Api\Rest\Response;
require 'CallFire-PHP-SDK/vendor/autoload.php';

$client = CallFire\Api\Client::Rest(CALLFIRE_USER, CALLFIRE_PASS, "Call");

$soundId = CALLFIRE_MSG;

$request = new Request\SendCall;
$request->setType($client::BROADCAST_VOICE);
$request->setFrom(CALLFIRE_PHN);

$request->setTo($sendTo);

$request->setAnsweringMachineConfig($client::AMCONFIG_LIVE_IMMEDIATE);
$request->setLiveSoundId($soundId);

$response = $client->SendCall($request);
$result = $client::response($response);
echo json_encode($result);
