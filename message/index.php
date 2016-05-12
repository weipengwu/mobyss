<?php
//send message when admin click Notify button
    session_start();
    if (!isset($_SESSION['WaitingRoomAdmin'])) die();

    $type = isset($_POST['type'])?$_POST['type']:null;
    $sendTo = isset($_POST['sendTo'])?$_POST['sendTo']:null;
    $type=substr($type,0,5);
    if ($type=='Email') {
	   mail($sendTo,'Hello your appointment will start in 10 mins.','Hi. The MOBYSS team will be ready to see you in 10 minutes. Can you please make your way to MOBYSS. If you do not make your appointment within the next 10 minutes, you will be placed back on the waitlist one more time. If you miss that appointment, we cannot guarantee that we will be able to see you today but would be happy to see you again in the future. If an emergency develops while you are waiting, please go to your nearest emergency room. Thank-you, Your MOBYSS Team.');
    } else {

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

            "Subject"       => '10 min notice',

            "Message"       => "Can you please make your way to us. If you don't make your appt in the next 10 mins, you'll be placed back on the waitlist.",


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


