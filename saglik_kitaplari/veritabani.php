<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

$host = "localhost";
$veritabani = "saglik_kitaplari";
$kullanici = "root";
$sifre = "";

try {
    $db = new PDO("mysql:host=$host;dbname=$veritabani;charset=utf8", $kullanici, $sifre);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Veritabanı bağlantı hatası: " . $e->getMessage());
}
