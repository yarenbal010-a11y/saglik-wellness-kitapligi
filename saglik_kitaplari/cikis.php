<?php
require "veritabani.php";
session_destroy();
header("Location: anasayfa.php");
exit;
