<?php
require "veritabani.php";
?>
<!doctype html>
<html lang="tr">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>İletişim</title>
  <link rel="stylesheet" href="kaynaklar/stil.css">
</head>
<body>

<header class="ust">
  <div class="ust_icerik">
    <div>
      <h1>İletişim</h1>
      <p class="alt_yazi"><a href="anasayfa.php">← Anasayfa</a></p>
    </div>
  </div>
</header>

<main class="detay_sayfa">
  <div class="detay_bilgi" style="grid-column:1/-1;">
    <h2>Bize Ulaş</h2>

    <form id="iletisimForm">
      <label class="etiket">Ad Soyad</label>
      <input name="ad" required>

      <label class="etiket">E-posta</label>
      <input name="eposta" type="email" required>

      <label class="etiket">Konu</label>
      <input name="konu" required>

      <label class="etiket">Mesaj</label>
      <textarea name="mesaj" rows="5" required></textarea>

      <button type="submit" class="buton">Gönder</button>

      <p id="iletisimSonuc" class="min_yazi"></p>
    </form>
  </div>
</main>

<script>
const form = document.getElementById("iletisimForm");
const sonuc = document.getElementById("iletisimSonuc");

form.addEventListener("submit", async (e) => {
  e.preventDefault();
  sonuc.textContent = "Gönderiliyor...";

  const fd = new FormData(form);
  const res = await fetch("iletisim_islem.php", { method: "POST", body: fd });
  const data = await res.json();

  if (data.ok) {
    sonuc.textContent = data.mesaj;
    form.reset();
  } else {
    sonuc.textContent = data.hata || "Bir hata oluştu.";
  }
});
</script>

</body>
</html>
