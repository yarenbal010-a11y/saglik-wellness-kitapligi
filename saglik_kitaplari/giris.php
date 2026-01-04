<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);


require "veritabani.php";

$hata = "";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $kullanici_adi = trim($_POST["kullanici_adi"] ?? "");
    $sifre = $_POST["sifre"] ?? "";

    $sorgu = $db->prepare("SELECT * FROM kullanicilar WHERE kullanici_adi=?");
    $sorgu->execute([$kullanici_adi]);
    $k = $sorgu->fetch(PDO::FETCH_ASSOC);

    if (!$k || !password_verify($sifre, $k["sifre_hash"])) {
        $hata = "Kullanıcı adı veya şifre yanlış.";
    } else {
        $_SESSION["kullanici_id"] = (int)$k["id"];
        $_SESSION["kullanici_adi"] = $k["kullanici_adi"];
        header("Location: anasayfa.php");
        exit;
    }
}
?>
<!doctype html>
<html lang="tr">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Giriş</title>
  <link rel="stylesheet" href="kaynaklar/stil.css">
</head>
<body>

<header class="ust">
  <div class="ust_icerik">
    <div>
      <h1>Giriş</h1>
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

    <form method="post" class="form">
      <label>Kullanıcı Adı</label>
      <input name="kullanici_adi" type="text" required>

      <label>Şifre</label>
      <input name="sifre" type="password" required>

      <button class="buton" type="submit">Giriş Yap</button>
      <a class="buton_ghost" href="kayit.php">Hesabım yok (Kayıt)</a>
    </form>
  </div>
</main>
</body>
</html>
