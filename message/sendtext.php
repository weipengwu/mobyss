<?php

//After register automatically send message
session_start();
    if (!isset($_SESSION['WaitingRoomAdmin'])) die();

    $type = isset($_POST['type'])?$_POST['type']:null;
    $sendTo = isset($_POST['sendTo'])?$_POST['sendTo']:null;
    $type=substr($type,0,5);
    if ($type=='Email') {
	   mail($sendTo,'Hello from Your MOBYSS Team','Thank-you for your interest in MOBYSS. We will send you a text 10 minutes before your appointment is to start. Please note, we do not provide emergency services. If an emergency develops while you are waiting, please go to your nearest emergency room. Thank-you, Your MOBYSS Team');
    } else {

    /* check if phone number is valid */



    if (empty($sendTo)) {

        exit("Phone number cannot be blank.");

    }



    if (strlen($sendTo) != 10) {

        exit("Invalid phone number. Phone number length should be 10 digits.");

    }



    if (!is_numeric($sendTo)) {

        exit("Invalid phone number. Phone number should contain only digits.");

    }

    

    /* prepare data for sending */

    $data = array(

        "User"          => "MOBYSS", /* change to your EZ Texting username */

        "Password"      => "Temp811MOB", /* change to your EZ Texting password */

        "PhoneNumbers"  => array($sendTo),

        "Subject"       => 'HI. MOBYSS.',

        "Message"       => "We'll send a text 10 mins before your appt. We do not provide emergency services, if an emergency develops call 9-11.",


    );



    /* send message */

    $curl = curl_init("https://app.eztexting.com/sending/messages?format=json");

    curl_setopt($curl, CURLOPT_POST, 1);

    curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($data));

    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);

    $response = curl_exec($curl);

    curl_close($curl);



    /* parse result of API call */

    $json = json_decode($response);

    switch ($json->Response->Code) {

        case 201:

            exit("Message Sent");

        case 401:

            exit("Invalid user or password");

        case 403:

            $errors = $json->Response->Errors;

            exit("The following errors occurred: " . implode('; ', $errors));

        case 500:

            exit("Service Temporarily Unavailable");

    }

}
