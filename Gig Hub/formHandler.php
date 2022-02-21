<?php
$name = $_POST['name'];
$visitor_email = $_POST['email'];
$inquiry = $_POST['inquiry'];
$message = $_POST['message'];

$email_from = 'info@gighub.com';

$email_subject = 'New Form Submission';

$email_body = "User Name: $name. \n" .
               "User Email: $visitor_email.\n".
                 "Inquiry: $inquiry.\n"
                 "User message: $message. \n";



$to = 'menekevin11@gmail.com'

$headers = "From: $email_from \r\n";

$headers . ="Reply to: $visitor_email \r\n";

mail($to,$email_subject,$email_body,$headers);

header("Location: contact.html");






?>