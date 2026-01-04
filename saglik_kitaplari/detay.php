<?php
require "veritabani.php";

$id = isset($_GET["id"]) ? (int)$_GET["id"] : 0;
$stmt = $db->prepare("SELECT * FROM kitaplar WHERE id = ?");
$stmt->execute([$id]);
$k = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$k) {
  die("Kitap bulunamadı. ID: " . $id);
}
?>
<!doctype html>
<html lang="tr">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title><?= htmlspecialchars($k["kitap_adi"]) ?> • Detay</title>
  <link rel="stylesheet" href="kaynaklar/stil.css">
</head>
<body>

<header class="ust">
  <div class="ust_icerik">
    <div>
      <h1>Kitap Detayı</h1>
      <p class="alt_yazi"><a href="anasayfa.php">← Anasayfa</a></p>
    </div>
  </div>
</header>

<main class="detay_sayfa">
  <img class="detay_kapak" src="<?= htmlspecialchars($k["kapak_yolu"]) ?>" alt="Kapak">

  <div class="detay_bilgi">
    <h2><?= htmlspecialchars($k["kitap_adi"]) ?></h2>
    <p class="yazar"><?= htmlspecialchars($k["yazar"]) ?></p>

    <p class="rozetler">
      <span class="rozet"><?= htmlspecialchars($k["kategori"]) ?></span>
      <span class="rozet rozet_acik"><?= htmlspecialchars($k["yayin_yili"]) ?></span>
    </p>

    <h3>Faydaları</h3>
    <p><?= nl2br(htmlspecialchars($k["faydalari"])) ?></p>

    

    <?php if (!empty($k["ozet"])): ?>
      <hr>
      <h3>📖 Kısa Özet</h3>
      <p><?= nl2br(htmlspecialchars($k["ozet"])) ?></p>
    <?php endif; ?>

    <hr>

    

    <h3>👤 Kimler İçin Uygun?</h3>
    <ul class="liste">
      <li>Kişisel gelişime ilgi duyanlar</li>
      <li>Sağlık ve psikoloji konularına meraklı olanlar</li>
      <li>Daha dengeli bir yaşam isteyenler</li>
    </ul>

  </div>
</main>

</body>
</html>
