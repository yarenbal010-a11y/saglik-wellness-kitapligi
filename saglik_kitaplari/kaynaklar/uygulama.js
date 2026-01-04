const modal = document.getElementById("modal");
const modalKapat = document.getElementById("modal_kapat");

const mKapak = document.getElementById("m_kapak");
const mKitap = document.getElementById("m_kitap");
const mYazar = document.getElementById("m_yazar");
const mKategori = document.getElementById("m_kategori");
const mYil = document.getElementById("m_yil");
const mFayda = document.getElementById("m_fayda");
const mAciklama = document.getElementById("m_aciklama");
const mDetay = document.getElementById("m_detay");
const mFavoriBtn = document.getElementById("m_favori_btn"); // modal favori butonu

function modalAc(k) {
  mKapak.src = k.kapak_yolu;
  mKitap.textContent = k.kitap_adi;
  mYazar.textContent = k.yazar;
  mKategori.textContent = k.kategori || "-";
  mYil.textContent = k.yayin_yili || "-";
  mFayda.textContent = k.faydalari || "-";
  mAciklama.textContent = k.aciklama || "-";

  // Detay linki
  mDetay.href = "detay.php?id=" + encodeURIComponent(k.id);

  // Favori butonuna kitap id taşı
  if (mFavoriBtn) mFavoriBtn.dataset.kitapId = k.id;

  // hidden input varsa doldur
  const hidden = document.getElementById("modal_kitap_id");
  if (hidden) hidden.value = k.id;

  modal.classList.add("acik");
}

function modalKapatFn() {
  modal.classList.remove("acik");
}

modalKapat?.addEventListener("click", modalKapatFn);
modal?.addEventListener("click", (e) => { if (e.target === modal) modalKapatFn(); });
document.addEventListener("keydown", (e) => { if (e.key === "Escape") modalKapatFn(); });

// Kart tıklama
const kartlar = Array.from(document.querySelectorAll(".kitap_kart"));
kartlar.forEach((kart) => {
  kart.addEventListener("click", () => {
    modalAc({
      id: kart.dataset.id,
      kitap_adi: kart.dataset.kitap_adi,
      yazar: kart.dataset.yazar,
      kategori: kart.dataset.kategori,
      faydalari: kart.dataset.faydalari,
      aciklama: kart.dataset.aciklama,
      kapak_yolu: kart.dataset.kapak_yolu,
      yayin_yili: kart.dataset.yayin_yili
    });
  });
});

// Filtre
const arama = document.getElementById("arama");
const kategoriSec = document.getElementById("kategori_sec");
const sayac = document.getElementById("sayac");

function filtreUygula() {
  const q = (arama?.value || "").toLowerCase();
  const kat = kategoriSec?.value || "";

  let gorunen = 0;

  kartlar.forEach((k) => {
    const metin = (k.dataset.kitap_adi + " " + k.dataset.yazar + " " + k.dataset.kategori).toLowerCase();
    const kategoriUyar = (kat === "" || (k.dataset.kategori === kat));
    const aramaUyar = (q === "" || metin.includes(q));

    const goster = kategoriUyar && aramaUyar;
    k.style.display = goster ? "" : "none";
    if (goster) gorunen++;
  });

  if (sayac) sayac.textContent = gorunen + " kitap";
}

arama?.addEventListener("input", filtreUygula);
kategoriSec?.addEventListener("change", filtreUygula);

// Favori gönderme
function favoriGonder(islem, kitapId) {
  const body = new URLSearchParams();
  body.set("islem", islem);
  body.set("kitap_id", kitapId);

  return fetch("favori_islem.php", {
    method: "POST",
    headers: { "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8" },
    body: body.toString()
  }).then(r => r.json());
}

// Modal favori butonu
if (mFavoriBtn) {
  mFavoriBtn.addEventListener("click", (e) => {
    e.preventDefault();
    e.stopPropagation();

    const id = mFavoriBtn.dataset.kitapId;
    if (!id) return;

    favoriGonder("toggle", id).then((sonuc) => {
      if (!sonuc.ok) {
        alert(sonuc.hata || "Hata");
        return;
      }
      location.reload();
    });
  });
}

// Sağ panel kaldır butonları
document.querySelectorAll(".fav_kaldir_btn").forEach((btn) => {
  btn.addEventListener("click", () => {
    const id = btn.dataset.kitapId;

    favoriGonder("kaldir", id).then((sonuc) => {
      if (!sonuc.ok) {
        alert(sonuc.hata || "Hata");
        return;
      }
      location.reload();
    });
  });
});
