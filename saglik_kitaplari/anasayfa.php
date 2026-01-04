<?php
require "veritabani.php";

$gunun_ipuclari = [
  "💧 Gün içinde yeterli su içmek odaklanmayı artırır.",
  "🚶‍♀️ 10 dakikalık kısa bir yürüyüş zihni rahatlatır.",
  "📖 Günde en az 10 sayfa kitap okumaya çalış.",
  "😴 Uyumadan 1 saat önce ekranlardan uzak dur.",
  "🧘‍♂️ Derin nefes egzersizleri stresi azaltır.",
  "🍎 Dengeli beslenme zihinsel performansı artırır.",
  "☀️ Güne erken başlamak motivasyonu yükseltir."
];

$gunun_ipucu = $gunun_ipuclari[array_rand($gunun_ipuclari)];


$kitaplar = $db->query("SELECT * FROM kitaplar ORDER BY id DESC")->fetchAll(PDO::FETCH_ASSOC);

$favoriler = [];
if (isset($_SESSION["kullanici_id"])) {
  $kid = (int)$_SESSION["kullanici_id"];
  $sqlFav = "
    SELECT k.id, k.kitap_adi
    FROM favoriler f
    JOIN kitaplar k ON k.id = f.kitap_id
    WHERE f.kullanici_id = ?
    ORDER BY f.eklenme_tarihi DESC
  ";
  $favoriler = [];
if (isset($_SESSION["kullanici_id"])) {
  $kid = (int)$_SESSION["kullanici_id"];

  $sqlFav = "
    SELECT k.id, k.kitap_adi
    FROM favoriler f
    JOIN kitaplar k ON k.id = f.kitap_id
    WHERE f.kullanici_id = ?
    ORDER BY f.eklenme_tarihi DESC
  ";
  $st = $db->prepare($sqlFav);
  $st->execute([$kid]);
  $favoriler = $st->fetchAll(PDO::FETCH_ASSOC);
}

}




// Kategori listesi
$kategoriler = [];
foreach ($kitaplar as $k) {
  $kat = trim((string)$k["kategori"]);
  if ($kat !== "" && !in_array($kat, $kategoriler, true)) $kategoriler[] = $kat;
}
sort($kategoriler);
?>
<!doctype html>
<html lang="tr">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Sağlık Kitaplığı</title>
  <link rel="stylesheet" href="kaynaklar/stil.css">
</head>
<body>

<header class="ust">
  <div class="ust_icerik">
    <div>
      <h1>Sağlık & Wellness Kitaplığı</h1>
      <p class="alt_yazi">Keşfet • İncele • Favorile</p>
    </div>
    <div class="ust_butonlar">
  <?php if(isset($_SESSION["kullanici_adi"])): ?>
    <span style="color:var(--soluk); padding:10px 12px;">
      Hoşgeldin, <b><?= htmlspecialchars($_SESSION["kullanici_adi"]) ?></b>
    </span>
    <a class="buton_ghost" href="cikis.php">Çıkış</a>
  <?php else: ?>
    <a class="buton_ghost" href="giris.php">Giriş</a>
    <a class="buton" href="kayit.php">Kayıt Ol</a>
  <?php endif; ?>
</div>


  <nav class="ust_menu">
    <a href="anasayfa.php" class="aktif">Anasayfa</a>
    <a href="hakkinda.php">Hakkında</a>
    <a href="iletisim.php">İletişim</a>
    <a href="#kitaplar">Kitaplar</a>
  </nav>
</header>

<main class="duzen">
  <!-- SOL MENÜ -->
  <aside class="sol">
    <h2>Menü</h2>
    <ul class="liste">
      <li><a href="anasayfa.php">📚 Kitap Listesi</a></li>
      <li><a href="hakkinda.php">ℹ️ Hakkında</a></li>
      <li><a href="iletisim.php">✉️ İletişim</a></li>
      <li><a href="giris.php">👤 Giriş</a></li>

    </ul>

    <div class="kart_kutu">
      <h3>Hızlı Filtre</h3>
      <label class="etiket">Kategori</label>
      <select id="kategori_sec">
        <option value="">Tümü</option>
        <?php foreach($kategoriler as $kat): ?>
          <option value="<?= htmlspecialchars($kat) ?>"><?= htmlspecialchars($kat) ?></option>
        <?php endforeach; ?>
      </select>

      <label class="etiket">Arama</label>
      <input id="arama" type="text" placeholder="Kitap / yazar ara...">
      
    </div>

    <marquee class="kayan">✨ Yeni eklenen kitaplara göz at! Sağlıklı yaşam için okumaya başla! ✨</marquee>
  </aside>

  <!-- ORTA İÇERİK -->
  <section class="orta" id="kitaplar">
    <div class="baslik_satiri">
      <h2>Kitaplar</h2>
      <span class="sayac" id="sayac"><?= count($kitaplar) ?> kitap</span>
    </div>

    <div class="kartlar" id="kartlar">
      <?php foreach($kitaplar as $k): ?>
        <article class="kitap_kart"
          data-id="<?= (int)$k["id"] ?>"
          data-kitap_adi="<?= htmlspecialchars($k["kitap_adi"]) ?>"
          data-yazar="<?= htmlspecialchars($k["yazar"]) ?>"
          data-kategori="<?= htmlspecialchars($k["kategori"]) ?>"
          data-faydalari="<?= htmlspecialchars($k["faydalari"]) ?>"
          data-aciklama="<?= htmlspecialchars($k["aciklama"]) ?>"
          data-kapak_yolu="<?= htmlspecialchars($k["kapak_yolu"]) ?>"
          data-yayin_yili="<?= htmlspecialchars((string)$k["yayin_yili"]) ?>"
        >
          <div class="kapak_sarma">
            <img src="<?= htmlspecialchars($k["kapak_yolu"]) ?>" alt="Kapak">
          </div>
          <div class="kitap_bilgi">
            <h3><?= htmlspecialchars($k["kitap_adi"]) ?></h3>
            <p class="yazar"><?= htmlspecialchars($k["yazar"]) ?></p>
            <p class="rozetler">
              <span class="rozet"><?= htmlspecialchars($k["kategori"]) ?></span>
              <span class="rozet rozet_acik"><?= htmlspecialchars((string)$k["yayin_yili"]) ?></span>
            </p>
           

          </div>
        </article>
      <?php endforeach; ?>
    </div>
    </section>


   
  <!-- SAĞ PANEL -->
  <aside class="sag">
    <div class="kart_kutu">
  <div class="kart_kutu">
  <div class="kart_kutu">
  <h3>Favorilerim</h3>

  <?php if(!isset($_SESSION["kullanici_id"])): ?>
    <p>Favori eklemek için <b>giriş yap</b>.</p>
  <?php else: ?>

    <?php if(empty($favoriler)): ?>
      <p>Henüz favorin yok.</p>
    <?php else: ?>
      <ul class="liste">
        <?php foreach($favoriler as $fv): ?>
          <li style="display:flex; justify-content:space-between; gap:8px;">
            <a href="detay.php?id=<?= (int)$fv["id"] ?>">⭐ <?= htmlspecialchars($fv["kitap_adi"]) ?></a>

            <!-- kaldır butonu -->
            <button class="fav_kaldir_btn" data-kitap-id="<?= (int)$fv["id"] ?>" type="button">Kaldır</button>

          </li>
        <?php endforeach; ?>
      </ul>
    <?php endif; ?>

  <?php endif; ?>
</div>



 

    
   <h2>Öneriler</h2>
<p class="min_yazi">
  Sağlıklı yaşam için seçilmiş küçük ama etkili öneriler.
</p>

<div class="kart_kutu">
  <h3>📘 Bugün Ne Okumalısın?</h3>
  <p>Alışkanlık, psikoloji ve uyku kategorilerindeki kitaplar bugün için ideal.</p>
</div>

<div class="kart_kutu">
  <h3>⏱️ Günlük Okuma Hedefi</h3>
  <p>Günde <b>15 dakika</b> kitap okumak bile büyük fark yaratır.</p>
</div>

<div class="kart_kutu">
  <h3>⭐ Popüler Tavsiye</h3>
  <p>Kullanıcıların en çok favorilediği kitaplara göz at.</p>
</div>


    <div class="kart_kutu">
  <h3>Günün Mini İpucu</h3>
  <p><?= htmlspecialchars($gunun_ipucu) ?></p>
  <p class="min_yazi"><i></i></p>
</div>


    <h3>Wikipedia</h3>
    <iframe class="cerceve" src="https://www.wikipedia.org" title="iframe"></iframe>
  </aside>
</main>
<section class="alt_panel">
  <h2>Ek Bölüm</h2>

  <div class="alt_grid">
    <div class="alt_kutu">
      <h3>Günün Önerisi</h3>
      <p>Bugün 10 dakika yürüyüş + 10 sayfa okuma hedefi koy.</p>
    </div>

    <div class="alt_kutu">
      <h3>En Çok Okunan Kategoriler</h3>
      <ul>
        <li>Beslenme</li>
        <li>Uyku</li>
        <li>Psikoloji</li>
        <li>Alışkanlık</li>
      </ul>
    </div>

    <div class="alt_kutu">
      <h3>Hızlı Linkler</h3>
      <p><a href="#kitaplar">Kitaplara git</a></p>
      <p><a href="hakkinda.php">Hakkında</a></p>
      <p><a href="iletisim.php">İletişim</a></p>
    </div>
  </div>
</section>


<footer class="alt" id="alt">
  <p>© Sağlık Kitaplığı • <a href="iletisim.php">İletişim</a></p>
</footer>

<!-- MODAL -->
<div class="modal" id="modal">
  <div class="modal_kutu" role="dialog" aria-modal="true">
    <button class="kapat" id="modal_kapat">✕</button>
    <div class="modal_icerik">
      <img id="m_kapak" alt="Kapak">
      <div>
        <h2 id="m_kitap"></h2>
        <p><b>Yazar:</b> <span id="m_yazar"></span></p>
        <p><b>Kategori:</b> <span id="m_kategori"></span></p>
        <p><b>Yıl:</b> <span id="m_yil"></span></p>
        <p><b>Faydaları:</b> <span id="m_fayda"></span></p>
        <p><b>Açıklama:</b> <span id="m_aciklama"></span></p>

       <div class="modal_butonlar">
  <a class="buton_ghost" id="m_detay" href="#">Detay Sayfası</a>

  <?php if (isset($_SESSION["kullanici_id"])): ?>
    <button id="m_favori_btn" type="button" class="buton mor">⭐ Favoriye Ekle</button>
  <?php else: ?>
    <a href="giris.php" class="buton mor">⭐ Favori için giriş yap</a>
  <?php endif; ?>
</div>




        </div>
      </div>
    </div>
  </div>
</div>

<script src="kaynaklar/uygulama.js"></script>
<script>console.log("✅ JS YÜKLENDİ");</script>

<button id="enUsteGit" class="en_uste_git">En üste git ↑</button>
<script>
  const btn = document.getElementById("enUsteGit");

  window.addEventListener("scroll", () => {
    if (window.scrollY > 300) btn.style.display = "block";
    else btn.style.display = "none";
  });

  btn.addEventListener("click", () => {
    window.scrollTo({ top: 0, behavior: "smooth" });
  });
</script>
<script>
async function favoriDegistir(kitapId, btn){
  const aktifMi = btn.classList.contains("favori_aktif");
  const islem = aktifMi ? "kaldir" : "ekle";

  const fd = new FormData();
  fd.append("kitap_id", kitapId);
  fd.append("islem", islem);

  const res = await fetch("favori_islem.php", { method:"POST", body: fd });
  const data = await res.json();

  if(!data.ok){
    alert(data.hata || "Bir hata oldu.");
    return;
  }

  btn.classList.toggle("favori_aktif");
  favoriListeyiYenile();
}

function favoriListeyiYenile(){
  const liste = document.getElementById("favoriListe");
  if(!liste) return;

  // Sayfadaki favori aktif kartları oku (hızlı çözüm)
  const aktifler = document.querySelectorAll(".favori_buton.favori_aktif");
  if(aktifler.length === 0){
    liste.innerHTML = '<p class="min_yazi">Henüz favorin yok.</p>';
    return;
  }

  const items = [];
  aktifler.forEach(btn=>{
    const kart = btn.closest(".kitap_kart");
    const ad = kart?.dataset?.kitap_adi || "—";
    const yazar = kart?.dataset?.yazar || "";
    items.push(`<div class="favori_item">★ ${ad} <span class="min_yazi">— ${yazar}</span></div>`);
  });

  liste.innerHTML = items.join("");
}

favoriListeyiYenile();
</script>



</body>
</html>
