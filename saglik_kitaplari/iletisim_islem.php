<?php
require "veritabani.php";

header("Content-Type: application/json; charset=utf-8");

if ($_SERVER["REQUEST_METHOD"] !== "POST") {
  echo json_encode(["ok"=>false, "hata"=>"Geçersiz istek."]);
  exit;
}

$ad    = trim($_POST["ad"] ?? "");
$eposta= trim($_POST["eposta"] ?? "");
$konu  = trim($_POST["konu"] ?? "");
$mesaj = trim($_POST["mesaj"] ?? "");

if ($ad === "" || $eposta === "" || $konu === "" || $mesaj === "") {
  echo json_encode(["ok"=>false, "hata"=>"Lütfen tüm alanları doldur."]);
  exit;
}

if (!filter_var($eposta, FILTER_VALIDATE_EMAIL)) {
  echo json_encode(["ok"=>false, "hata"=>"E-posta formatı hatalı."]);
  exit;
}

try {
  $ip = $_SERVER["REMOTE_ADDR"] ?? null;

  $sql = "INSERT INTO iletisim_mesajlari (ad, eposta, konu, mesaj, ip)
          VALUES (?, ?, ?, ?, ?)";
  $st = $db->prepare($sql);
  $st->execute([$ad, $eposta, $konu, $mesaj, $ip]);

  echo json_encode(["ok"=>true, "mesaj"=>"Mesajın alındı ✅"]);
} catch (Exception $e) {
  echo json_encode(["ok"=>false, "hata"=>"Kayıt hatası: ".$e->getMessage()]);
}
