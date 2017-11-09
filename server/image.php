<?php
session_start();
$_SESSION = array();

include("simple-php-captcha.php");
$_SESSION['captcha'] = simple_php_captcha();

//header("Content-Type: image/png");


//echo '<img src="' . $_SESSION['captcha']['image_src'] . '" alt="CAPTCHA code">';
$actual_link = (isset($_SERVER['HTTPS']) ? "https" : "http") . "://$_SERVER[HTTP_HOST]";
$img_url = $actual_link.$_SESSION['captcha']['image_src']."&_DATA=".serialize($_SESSION['_CAPTCHA']['config']);
//echo file_get_contents($img_url);
//print_r($img_url);
//echo "<img src=".$img_url." >";
renderImage();
//header("Content-Length: " . filesize($file));
//print_r($file);
//echo $file;
//readfile($)


//header('Content-Type: image/png');
//header('url: '.$img_url);
//readfile($img_url);
