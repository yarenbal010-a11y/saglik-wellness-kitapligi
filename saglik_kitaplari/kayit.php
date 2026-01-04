<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);


require "veritabani.php";

$hata = "";
$basari = "";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $kullanici_adi = trim($_POST["kullanici_adi"] ?? "");
    $eposta = trim($_POST["eposta"] ?? "");
    $sifre = $_POST["sifre"] ?? "";

    if ($kullanici_adi === "" || $eposta === "" || $sifre === "") {
        $hata = "Lütfen tüm alanları doldur.";
    } elseif (strlen($sifre) < 6) {
        $hata = "Şifre en az 6 karakter olmalı.";
    } else {
        // kullanıcı adı / eposta var mı?
        $kontrol = $db->prepare("SELECT id FROM kullanicilar WHERE kullanici_adi=? OR eposta=?");
        $kontrol->execute([$kullanici_adi, $eposta]);
        if ($kontrol->fetch()) {
            $hata = "Bu kullanıcı adı veya e-posta zaten kayıtlı.";
        } else {
            $hash = password_hash($sifre, PASSWORD_DEFAULT);
            $ekle = $db->prepare("INSERT INTO kullanicilar (kullanici_adi, eposta, sifre_hash) VALUES (?,?,?)");
            $ekle->execute([$kullanici_adi, $eposta, $hash]);
            $basari = "Kayıt başarılı! Şimdi giriş yapabilirsin.";
        }
    }
}
?>
<!doctype html>
<html lang="tr">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Kayıt Ol</title>
  <link rel="stylesheet" href="kaynaklar/stil.css">
</head>
<body>

<header class="ust">
  <div class="ust_icerik">
    <div>
      <h1>Kayıt Ol</h1>
      <p class="alt_yazi"><a href="anasayfa.php">← Anasayfa</a></p>
    </div>
  </div>
</header>

<main class="detay_sayfa">
  <div class="detay_bilgi" style="grid-column:1/-1; max-width:520px;">
    <?php if($hata): ?>
      <p style="padding:10px;border:1px solid #fca5a5;background:#fee2e2;border-radius:12px;">
        <?= htmlspecialchars($hata) ?>
      </p>
    <?php endif; ?>

    <?php if($basari): ?>
      <p style="padding:10px;border:1px solid #86efac;background:#dcfce7;border-radius:12px;">
        <?= htmlspecialchars($basari) ?>
      </p>
    <?php endif; ?>

    <form method="post" class="form">
      <label>Kullanıcı Adı</label>
      <input name="kullanici_adi" type="text" required>

      <label>E-Posta</label>
      <input name="eposta" type="email" required>

      <label>Şifre</label>
      <input name="sifre" type="password" required>

      <button class="buton" type="submit">Kayıt Ol</button>
      <a class="buton_ghost" href="giris.php">Zaten üyeyim (Giriş)</a>
    </form>
  </div>
</main>
</body>
</html>
