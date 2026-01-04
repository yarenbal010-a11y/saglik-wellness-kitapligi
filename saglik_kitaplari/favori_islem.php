<?php
header("Content-Type: application/json; charset=utf-8");

require "veritabani.php"; 

// session yoksa başlat
if (session_status() === PHP_SESSION_NONE) {
  session_start();
}

if ($_SERVER["REQUEST_METHOD"] !== "POST") {
  echo json_encode(["ok"=>false, "hata"=>"Geçersiz istek (POST değil)."]);
  exit;
}

if (!isset($_SESSION["kullanici_id"])) {
  echo json_encode(["ok"=>false, "hata"=>"Giriş yapmalısın."]);
  exit;
}

$kitapId = isset($_POST["kitap_id"]) ? (int)$_POST["kitap_id"] : 0;
$islem   = isset($_POST["islem"]) ? trim($_POST["islem"]) : "";

if ($kitapId <= 0) {
  echo json_encode(["ok"=>false, "hata"=>"kitap_id gelmedi."]);
  exit;
}

$kullaniciId = (int)$_SESSION["kullanici_id"];

try {
  // kitap var mı kontrol
  $st = $db->prepare("SELECT id FROM kitaplar WHERE id=?");
  $st->execute([$kitapId]);
  if (!$st->fetch()) {
    echo json_encode(["ok"=>false, "hata"=>"Kitap bulunamadı."]);
    exit;
  }

  // favori var mı?
  $st = $db->prepare("SELECT id FROM favoriler WHERE kullanici_id=? AND kitap_id=?");
  $st->execute([$kullaniciId, $kitapId]);
  $varMi = (bool)$st->fetch();

  if ($islem === "ekle") {
    if (!$varMi) {
      $st = $db->prepare("INSERT INTO favoriler (kullanici_id, kitap_id) VALUES (?, ?)");
      $st->execute([$kullaniciId, $kitapId]);
    }
    echo json_encode(["ok"=>true, "durum"=>"eklendi"]);
    exit;
  }

  if ($islem === "kaldir") {
    $st = $db->prepare("DELETE FROM favoriler WHERE kullanici_id=? AND kitap_id=?");
    $st->execute([$kullaniciId, $kitapId]);
    echo json_encode(["ok"=>true, "durum"=>"kaldirildi"]);
    exit;
  }

  if ($islem === "toggle") {
    if ($varMi) {
      $st = $db->prepare("DELETE FROM favoriler WHERE kullanici_id=? AND kitap_id=?");
      $st->execute([$kullaniciId, $kitapId]);
      echo json_encode(["ok"=>true, "durum"=>"kaldirildi"]);
    } else {
      $st = $db->prepare("INSERT INTO favoriler (kullanici_id, kitap_id) VALUES (?, ?)");
      $st->execute([$kullaniciId, $kitapId]);
      echo json_encode(["ok"=>true, "durum"=>"eklendi"]);
    }
    exit;
  }

  echo json_encode(["ok"=>false, "hata"=>"islem hatalı. ekle/kaldir/toggle olmalı."]);
  exit;

} catch (Exception $e) {
  echo json_encode(["ok"=>false, "hata"=>"Sunucu hatası: ".$e->getMessage()]);
  exit;
}
