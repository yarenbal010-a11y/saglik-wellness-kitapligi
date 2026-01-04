-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 04 Oca 2026, 20:57:54
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `saglik_kitaplari`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `favoriler`
--

CREATE TABLE `favoriler` (
  `id` int(11) NOT NULL,
  `kullanici_id` int(11) NOT NULL,
  `kitap_id` int(11) NOT NULL,
  `eklenme_tarihi` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tablo döküm verisi `favoriler`
--

INSERT INTO `favoriler` (`id`, `kullanici_id`, `kitap_id`, `eklenme_tarihi`) VALUES
(5, 1, 29, '2025-12-25 10:01:14'),
(7, 3, 27, '2025-12-30 11:59:28');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `iletisim_mesajlari`
--

CREATE TABLE `iletisim_mesajlari` (
  `id` int(11) NOT NULL,
  `ad` varchar(100) NOT NULL,
  `eposta` varchar(150) NOT NULL,
  `konu` varchar(150) NOT NULL,
  `mesaj` text NOT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `olusturma_tarihi` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `iletisim_mesajlari`
--

INSERT INTO `iletisim_mesajlari` (`id`, `ad`, `eposta`, `konu`, `mesaj`, `ip`, `olusturma_tarihi`) VALUES
(1, 'yaren bal', 'yarenbal010@gmail.com', 'sdfsfs', 'sfasfasgaged', '::1', '2025-12-25 22:30:45'),
(2, 'yaren bal', 'yarenbal010@gmail.com', 'skljllxlsjkxjlskk', 'skşlkxşkşxkxşslxmşmsklx', '::1', '2025-12-26 08:24:25');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kitaplar`
--

CREATE TABLE `kitaplar` (
  `id` int(11) NOT NULL,
  `kitap_adi` varchar(200) NOT NULL,
  `yazar` varchar(150) NOT NULL,
  `kategori` varchar(100) DEFAULT NULL,
  `faydalari` text DEFAULT NULL,
  `aciklama` text DEFAULT NULL,
  `ozet` text DEFAULT NULL,
  `kapak_yolu` varchar(255) DEFAULT NULL,
  `yayin_yili` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `kitaplar`
--

INSERT INTO `kitaplar` (`id`, `kitap_adi`, `yazar`, `kategori`, `faydalari`, `aciklama`, `ozet`, `kapak_yolu`, `yayin_yili`) VALUES
(2, 'Atomic Habits', 'James Clear', 'Sağlık & Alışkanlık', 'Davranış değişimi ve sürdürülebilir alışkanlıklar', 'Küçük adımlarla büyük değişimler yaklaşımı', 'Pozitif psikoloji, psikolojinin sadece sorunları ve hastalıkları değil, insanların iyi oluşunu, mutluluğunu ve potansiyelini inceleyen alanıdır. Kitapta; mutluluğun doğuştan gelen bir özellik olmadığı, alışkanlıklar, bakış açısı ve davranışlar yoluyla geliştirilebileceği vurgulanır.\r\n\r\nOlumlu duygular yaşamanın, güçlü yönleri tanımanın, anlamlı hedefler belirlemenin ve sağlıklı sosyal ilişkiler kurmanın yaşam doyumunu artırdığı anlatılır. Ayrıca şükretme, iyimserlik, anda kalma ve başkalarına katkı sağlama gibi uygulamaların psikolojik dayanıklılığı güçlendirdiği örneklerle açıklanır.', 'dosyalar/kapaklar/atomic_habits.jpg', 2018),
(3, 'The Power of Habit', 'Charles Duhigg', 'Alışkanlık', 'Alışkanlık döngüsünü anlamaya yardım eder', 'Alışkanlıkların nasıl oluştuğunu anlatır', 'Kitap, alışkanlıkların nasıl oluştuğunu ve nasıl değiştirilebileceğini açıklar. Charles Duhigg, her alışkanlığın üç aşamalı bir döngüden oluştuğunu söyler: tetikleyici (ipucu), rutin (davranış) ve ödül. Bu döngü tekrarlandıkça alışkanlık otomatik hale gelir.\r\n\r\nKitapta bireysel alışkanlıkların yanı sıra şirketlerin ve toplumların alışkanlıkları da ele alınır. Kötü bir alışkanlığı tamamen silmenin zor olduğu, ancak aynı tetikleyici ve ödül korunarak rutin değiştirildiğinde alışkanlığın dönüştürülebileceği vurgulanır. Farkındalık ve küçük ama tutarlı değişimlerle, hem kişisel yaşamda hem de iş hayatında kalıcı dönüşümün mümkün olduğu anlatılır.', 'dosyalar/kapaklar/the_power_of_habit.jpg', 2012),
(4, 'Why We Sleep', 'Matthew Walker', 'Uyku', 'Uyku kalitesi ve sağlık ilişkisi', 'Uykunun beden ve zihin üzerindeki etkileri', 'Kitap, uykunun insan sağlığı için vazgeçilmez olduğunu bilimsel verilerle açıklar. Matthew Walker, yeterli ve kaliteli uykunun; hafıza, öğrenme, duygusal denge, bağışıklık sistemi ve fiziksel performans üzerinde doğrudan etkili olduğunu vurgular. Uyku sırasında beyin bilgileri düzenler, toksinleri temizler ve duygusal yükü dengeler.\r\n\r\nUykusuzluğun ise dikkat dağınıklığı, depresyon, obezite, diyabet, kalp hastalıkları ve Alzheimer riskini artırdığı anlatılır. Kitap ayrıca kafein, alkol, ekran ışığı ve düzensiz uyku saatlerinin uyku kalitesini nasıl bozduğunu açıklar. Daha sağlıklı bir yaşam için düzenli uyku, karanlık ortam, sabit saatler ve uykuya öncelik vermenin gerekliliği güçlü bir şekilde savunulur.', 'dosyalar/kapaklar/why_we_sleep.jpg', 2017),
(5, 'How Not to Die', 'Michael Greger', 'Beslenme', 'Beslenme ile hastalık riskini azaltma', 'Kanıta dayalı beslenme önerileri', 'Kitap, modern dünyadaki erken ölümlerin büyük bir kısmının beslenme alışkanlıklarıyla önlenebileceğini savunur. Dr. Michael Greger, kalp hastalıkları, kanser, diyabet ve hipertansiyon gibi yaygın hastalıkların temelinde hayvansal ürün ağırlıklı ve işlenmiş gıdalarla dolu beslenmenin yattığını bilimsel araştırmalarla açıklar.\r\n\r\n“How Not to Die”, çözüm olarak tamamen ya da ağırlıklı bitki temelli beslenmeyi önerir. Sebze, meyve, baklagil, tam tahıl, kuruyemiş ve tohumların; vücudu iyileştirdiği, iltihabı azalttığı ve hastalık riskini düşürdüğü anlatılır. Kitap, sağlığın ilaçlardan çok günlük besin seçimleriyle şekillendiğini ve bilinçli beslenmenin yaşam süresini uzatabileceğini vurgular.', 'dosyalar/kapaklar/how_not_to_die.jpg', 2015),
(6, 'The Blue Zones', 'Dan Buettner', 'Uzun Yaşam', 'Uzun yaşayan toplumların ortak alışkanlıkları', 'Blue Zones araştırmalarına dayalı yaşam önerileri', 'Kitap, dünyada insanların en uzun ve en sağlıklı yaşadığı bölgeleri inceler. Dan Buettner, bu “Mavi Bölgeler”de yaşayan insanların genetikten çok yaşam tarzı sayesinde uzun ömürlü olduğunu gösterir. Bu bölgelerde ortak özellikler; doğal hareket, bitki ağırlıklı beslenme, aşırı yememek, güçlü aile ve toplum bağlarıdır.\r\n\r\n“The Blue Zones” ayrıca insanların bir yaşam amacına sahip olmasının, stresi azaltan ritüeller geliştirmesinin ve aidiyet duygusunun uzun ömrü desteklediğini vurgular. Kitap, daha uzun ve kaliteli bir yaşam için küçük ama sürdürülebilir alışkanlıkların günlük hayata nasıl uyarlanabileceğini anlatır.', 'dosyalar/kapaklar/the_blue_zones.jpg', 2008),
(7, 'Breath', 'James Nestor', 'Nefes', 'Doğru nefes teknikleri ve faydaları', 'Nefesin performans ve sağlık üzerindeki etkisi', 'Kitap, doğru nefes almanın insan sağlığı üzerindeki hayati etkilerini ele alır. James Nestor, modern insanların yanlış nefes alma alışkanlıkları (ağızdan nefes alma, hızlı ve yüzeysel soluma) nedeniyle birçok fiziksel ve zihinsel sorun yaşadığını bilimsel araştırmalar ve tarihsel örneklerle açıklar.\r\n\r\n“Breath”, burundan nefes almanın, yavaş ve kontrollü solumanın; stres, uyku, odaklanma, spor performansı ve bağışıklık sistemi üzerinde olumlu etkiler yarattığını vurgular. Kitapta eski nefes teknikleri, modern bilimle birleştirilerek anlatılır ve nefesin, sağlığı iyileştirmek için basit ama güçlü bir araç olduğu mesajı verilir.', 'dosyalar/kapaklar/breath.jpg', 2020),
(8, 'Ikigai', 'Héctor García & Francesc Miralles', 'Wellness', 'Amaç duygusu ve yaşam dengesi', 'Japon yaşam felsefesinden esinli öneriler', 'Kitap, Japonların uzun ve mutlu yaşam felsefesi olan ikigaiyi (yaşam amacı) anlatır. İkigai; insanın sevdiği, iyi olduğu, dünyanın ihtiyaç duyduğu ve karşılığını alabildiği şeylerin kesişiminde bulunur. Bu amacı olan insanların hayata daha bağlı, daha enerjik ve daha sağlıklı olduğu vurgulanır.\r\n\r\nKitapta özellikle Japonya’daki uzun ömürlü insanların yaşam tarzları incelenir. Yavaş yaşamak, anda kalmak, küçük mutluluklardan keyif almak, güçlü sosyal bağlar kurmak ve sürekli öğrenmeye açık olmak ikigainin temel unsurları olarak sunulur. İkigai, büyük hedeflerden çok günlük hayata anlam katan küçük nedenler bulmayı öğütler.', 'dosyalar/kapaklar/ikigai.jpg', 2016),
(9, 'The Body Keeps the Score', 'Bessel van der Kolk', 'Psikoloji', 'Travmanın beden-zihin etkileri', 'Travmanın beyinde ve bedende izleri', 'Kitap, travmanın yalnızca zihinde değil, bedende de kalıcı izler bıraktığını açıklar. Dr. Bessel van der Kolk, travmatik deneyimlerin beynin işleyişini, sinir sistemini, duyguları ve hatta bağışıklık sistemini nasıl etkilediğini bilimsel çalışmalar ve klinik vakalarla anlatır. Travma yaşayan kişilerin, olay sona erse bile bedensel tepkiler (gerginlik, donakalma, aşırı tetikte olma) yaşamaya devam ettiği vurgulanır.\r\n\r\n“The Body Keeps the Score”, iyileşmenin sadece konuşarak değil; bedeni de sürece dahil eden yöntemlerle mümkün olduğunu savunur. Yoga, nefes çalışmaları, EMDR, beden farkındalığı ve güvenli ilişkilerin travma iyileşmesinde önemli rol oynadığı anlatılır. Kitap, travmayı anlamaya ve şefkatle iyileşmeye yönelik bütüncül bir bakış sunar.', 'dosyalar/kapaklar/the_body_keeps_the_score.jpg', 2014),
(10, 'Mindfulness in Plain English', 'Bhante Gunaratana', 'Mindfulness', 'Stres azaltma ve dikkat geliştirme', 'Mindfulness pratiğine giriş', 'Kitap, mindfulness (bilinçli farkındalık) meditasyonunu sade ve anlaşılır bir dille açıklar. Bhante Henepola Gunaratana, meditasyonun mistik ya da dini bir ritüelden çok, zihni eğitmenin pratik bir yolu olduğunu vurgular. Temel odak noktası, nefesi izleyerek anda kalmak ve düşünceleri yargılamadan gözlemlemektir.\r\n\r\nKitapta mindfulness’ın; stresi azaltma, zihinsel berraklık kazanma, duyguları yönetme ve iç huzuru artırma üzerindeki etkileri anlatılır. Ayrıca meditasyon sırasında karşılaşılan zorluklar (dikkatin dağılması, sabırsızlık, beklenti) ele alınır ve bunlarla nasıl başa çıkılacağı açıklanır. “Mindfulness in Plain English”, günlük hayatta daha sakin, farkında ve dengeli bir yaşam sürmek için temel bir rehber sunar.', 'dosyalar/kapaklar/mindfulness_in_plain_english.jpg', 1991),
(11, 'Grit', 'Angela Duckworth', 'Motivasyon', 'Azim ve dayanıklılık geliştirme', 'Başarıda tutkunun ve azmin rolü', 'Kitap, başarının temelinde yetenekten çok azim ve tutkuyla uzun vadeli çaba gösterme olduğunu savunur. Angela Duckworth, “grit” kavramını; zorluklara rağmen vazgeçmemek, hedefe sadık kalmak ve istikrarlı şekilde çalışmak olarak tanımlar. Araştırmalar, yüksek yetenekli ama çabuk pes eden kişilerin, daha az yetenekli fakat azimli kişilere kıyasla daha az başarılı olduğunu gösterir.\r\n\r\n“Grit”, azmin geliştirilebilir bir özellik olduğunu vurgular. İlgi alanı bulmak, bilinçli pratik yapmak, anlamlı bir amaç edinmek ve büyüme odaklı bir zihniyet geliştirmek grit’i artırır. Kitap; eğitim, spor, iş ve kişisel yaşamda sürdürülebilir başarının anahtarının sabır, sebat ve kararlılık olduğunu anlatır.', 'dosyalar/kapaklar/grit.jpg', 2016),
(12, 'Spark', 'John J. Ratey', 'Egzersiz', 'Egzersizin beyin sağlığına faydaları', 'Hareketin öğrenme ve ruh haline etkisi', 'Kitap, egzersizin beyin üzerindeki güçlü etkilerini bilimsel verilerle anlatır. Dr. John J. Ratey, düzenli fiziksel hareketin yalnızca bedeni değil; öğrenme, hafıza, dikkat, ruh hali ve stres yönetimini de önemli ölçüde iyileştirdiğini açıklar. Hareket, beyinde yeni sinir hücrelerinin oluşmasını ve bağlantıların güçlenmesini destekler.\r\n\r\n“Spark”, egzersizin depresyon, anksiyete, ADHD ve yaşa bağlı zihinsel gerileme üzerinde koruyucu ve iyileştirici etkileri olduğunu vurgular. Kitabın temel mesajı şudur: Hareket etmek, beynin en güçlü ilacıdır. Düzenli ve sürdürülebilir egzersiz, zihinsel performansı ve yaşam kalitesini artırmanın en etkili yollarından biridir.', 'dosyalar/kapaklar/spark.jpg', 2008),
(13, 'The Mediterranean Diet', 'Various', 'Beslenme', 'Kalp-damar sağlığına destek', 'Akdeniz beslenme prensipleri', 'Kitap, Akdeniz ülkelerinde yaygın olan beslenme ve yaşam tarzının kalp sağlığı, uzun ömür ve genel iyi oluş üzerindeki olumlu etkilerini açıklar. Akdeniz diyeti; zeytinyağı, sebze, meyve, baklagiller, tam tahıllar, kuruyemişler ve balık ağırlıklı beslenmeyi; kırmızı et, işlenmiş gıdalar ve rafine şekerin ise sınırlı tüketilmesini önerir.\r\n\r\n“The Mediterranean Diet”, bu beslenme biçiminin sadece bir diyet değil, aynı zamanda sosyal paylaşıma, yavaş yemeye ve aktif bir yaşama dayanan bütüncül bir yaklaşım olduğunu vurgular. Bilimsel araştırmalar ışığında, Akdeniz diyetinin kalp hastalıkları, diyabet, obezite ve bilişsel gerileme riskini azalttığı; daha sağlıklı ve sürdürülebilir bir yaşam sunduğu anlatılır.', 'dosyalar/kapaklar/mediterranean_diet.jpg', 2015),
(14, 'Sağlıklı Yaşam Rehberi', 'Canan Karatay', 'Beslenme', 'Doğru beslenme ve metabolizma sağlığı', 'Beslenme alışkanlıklarına dair öneriler', 'Kitap, sağlıklı bir yaşamın tek bir alışkanlığa değil, bütüncül bir yaşam tarzına dayandığını anlatır. Dengeli beslenme, düzenli fiziksel aktivite, yeterli uyku ve stres yönetimi sağlığın temel taşları olarak ele alınır. Vücudun ihtiyaçlarını tanımanın ve sürdürülebilir alışkanlıklar geliştirmenin önemi vurgulanır.\r\n\r\nRehber ayrıca zihinsel ve duygusal sağlığa da odaklanır. Pozitif düşünme, sosyal ilişkiler, anda kalma ve kişisel farkındalık gibi unsurların yaşam kalitesini artırdığı belirtilir. Kitabın temel mesajı; küçük ama istikrarlı değişimlerle daha enerjik, dengeli ve uzun vadede sağlıklı bir hayatın mümkün olduğudur.', 'dosyalar/kapaklar/saglikli_yasam_rehberi.jpg', 2013),
(15, 'İyi Hissetmek', 'David Burns (TR Baskı)', 'Psikoloji', 'Kaygı ve stresle baş etme', 'Bilişsel davranışçı yaklaşım temelli', 'Kitap, bilişsel davranışçı terapi (BDT) temelli bir yaklaşımla depresyon, kaygı ve olumsuz düşüncelerle başa çıkmayı öğretir. Dr. David Burns, insanların kötü hissetmesine neden olan şeyin olayların kendisi değil, bu olaylara yüklenen otomatik ve çarpıtılmış düşünceler olduğunu açıklar.\r\n\r\n“İyi Hissetmek”, zihindeki felaketleştirme, ya hep ya hiç düşünme, aşırı genelleme gibi düşünce hatalarını tanımayı ve bunları daha gerçekçi düşüncelerle değiştirmeyi öğretir. Kitapta yer alan pratik egzersizler sayesinde kişi, duygularını yönetmeyi, özgüvenini artırmayı ve ruh halini kalıcı şekilde iyileştirmeyi öğrenir. Temel mesajı şudur: Düşünceler değiştiğinde duygular da değişir.', 'dosyalar/kapaklar/iyi_hissetmek.jpg', 2006),
(16, 'Mutlu Beyin', 'Serkan Karaismailoğlu', 'Beyin & Psikoloji', 'Beynin mutluluk mekanizmalarını anlamaya yardımcı olur', 'Bilimsel bilgilerle davranış ve duygu ilişkisi', 'Kitap, beynin olumsuza odaklanma eğilimi olduğunu ve bu nedenle mutluluğun kendiliğinden kalıcı olmadığını anlatır. Dr. Rick Hanson, beynin evrimsel olarak tehlikeleri hatırlamaya programlı olduğunu, olumlu deneyimlerin ise hızla unutulduğunu açıklar. Bu durumun stres, kaygı ve tatminsizlik duygularını artırdığını vurgular.\r\n\r\n“Mutlu Beyin”, iyi haberin şu olduğunu söyler: Beyin yeniden şekillendirilebilir. Bilinçli farkındalıkla olumlu deneyimlere daha uzun süre odaklanmak, şükretmek, güven ve bağlanma duygularını güçlendirmek beynin mutlulukla ilgili devrelerini kalıcı hale getirir. Kitap, küçük zihinsel pratiklerle daha sakin, dayanıklı ve mutlu bir beyin inşa etmenin mümkün olduğunu anlatır.', 'dosyalar/kapaklar/mutlu_beyin.jpg', 2018),
(17, 'Eat to Beat Disease', 'William Li', 'Beslenme', 'Bağışıklığı güçlendirir', 'Beslenme ile hastalıkların önlenmesini açıklar', 'Kitap, vücudun doğuştan gelen bağışıklık sisteminin doğru beslenmeyle güçlendirilebileceğini savunur. Dr. William Li, kanser, kalp hastalıkları, diyabet ve enfeksiyonlara karşı vücudun savunma mekanizmalarının; özellikle anjiyogenez (damar oluşumu), bağışıklık, DNA onarımı ve mikrobiyom yoluyla nasıl çalıştığını açıklar.\r\n\r\n“Eat to Beat Disease”, çözüm olarak ilaçlardan önce günlük besin seçimlerine odaklanır. Yeşil çay, brokoli, yaban mersini, zeytinyağı, domates, sarımsak, baklagiller ve fermente gıdaların bağışıklığı desteklediği bilimsel çalışmalarla anlatılır. Kitabın temel mesajı şudur: Doğru besinler, vücudun hastalıklarla savaşma gücünü doğal olarak artırabilir ve sağlıklı yaşam aktif bir tercihtir.', 'dosyalar/kapaklar/eat_to_beat_disease.jpg', 2019),
(18, 'Lifespan', 'David Sinclair', 'Uzun Yaşam', 'Yaşlanmayı yavaşlatır', 'Uzun yaşamın bilimsel temellerini anlatır', 'Kitap, yaşlanmanın kaçınılmaz bir kader değil, yavaşlatılabilir hatta kısmen tersine çevrilebilir bir biyolojik süreç olduğunu savunur. Dr. David Sinclair, yaşlanmanın temel nedeninin hücrelerin zamanla bilgi kaybına uğraması olduğunu ve bu durumun hastalıklara zemin hazırladığını açıklar.\r\n\r\n“Lifespan”, uzun ve sağlıklı bir yaşam için hücresel savunma mekanizmalarını (sirtuinler, NAD⁺, otofaji) aktive etmenin önemini vurgular. Aralıklı oruç, kalori kısıtlaması, egzersiz, soğuğa/ısıya maruz kalma ve bazı takviyelerin yaşlanma sürecini yavaşlatabileceği bilimsel çalışmalarla anlatılır. Kitabın ana mesajı: Amaç daha uzun yaşamak değil, daha uzun süre sağlıklı yaşamaktır.', 'dosyalar/kapaklar/lifespan.jpg', 2019),
(19, 'The Happiness Advantage', 'Shawn Achor', 'Mutluluk', 'Motivasyonu artırır', 'Mutluluğun başarıya etkisini anlatır', 'Kitap, başarının mutluluğu getirdiği düşüncesinin tersine, mutluluğun başarıyı artırdığını savunur. Shawn Achor, pozitif bir zihniyetin beyin performansını, yaratıcılığı, motivasyonu ve problem çözme becerilerini güçlendirdiğini bilimsel araştırmalarla açıklar.\r\n\r\n“The Happiness Advantage”, mutluluğu artırmaya yönelik pratik stratejiler sunar: şükretme alışkanlığı, olumlu deneyimleri fark etmek, sosyal bağları güçlendirmek, stresi yeniden çerçevelemek ve küçük kazanımlara odaklanmak. Kitabın temel mesajı şudur: Zihni mutluluğa göre eğitmek, işte ve hayatta sürdürülebilir başarı sağlar.', 'dosyalar/kapaklar/the_happiness_advantage.jpg', 2010),
(20, 'Think Like a Monk', 'Jay Shetty', 'Zihinsel Sağlık', 'Stresi azaltır', 'Modern hayatta zihinsel huzuru anlatır', 'Kitap, modern hayatın stres ve karmaşası içinde bir keşiş gibi düşünmeyi öğrenerek daha sakin, odaklı ve anlamlı bir yaşam sürmenin yollarını anlatır. Jay Shetty, keşişlik döneminde edindiği öğretileri günlük hayata uyarlanabilir pratikler hâline getirir. Temel vurgu; zihni olumsuz düşüncelerden arındırmak, egoyu yönetmek ve iç huzuru geliştirmektir.\r\n\r\n“Think Like a Monk”, korku, karşılaştırma, öfke ve bağımlılık gibi zihinsel engelleri tanımayı; disiplin, hizmet, şükür ve bilinçli farkındalıkla dönüştürmeyi öğretir. Meditasyon, niyet belirleme ve değerlerle yaşama gibi uygulamalarla, dış koşullardan bağımsız kalıcı mutluluk ve netlik kazanmanın mümkün olduğu mesajını verir.', 'dosyalar/kapaklar/think_like_a_monk.jpg', 2020),
(21, 'The Plant-Based Diet', 'T. Colin Campbell', 'Beslenme', 'Kalp sağlığını destekler', 'Bitkisel beslenmenin faydalarını açıklar', 'Kitap, sağlığın temelinin bitki ağırlıklı beslenme olduğunu savunur. Sebzeler, meyveler, baklagiller, tam tahıllar, kuruyemişler ve tohumların; kalp hastalıkları, diyabet, obezite ve bazı kanser türleri riskini azalttığı bilimsel çalışmalarla açıklanır. Hayvansal ürünlerin ve işlenmiş gıdaların ise iltihaplanma ve kronik hastalıklarla ilişkili olduğu vurgulanır.\r\n\r\n“The Plant-Based Diet”, bu yaklaşımın sadece kilo vermeye değil; enerji artışı, bağışıklık güçlenmesi ve uzun vadeli sağlık sağlamaya odaklandığını belirtir. Kitabın temel mesajı şudur: Ne kadar çok doğal ve bitkisel besin, o kadar güçlü ve dayanıklı bir vücut.', 'dosyalar/kapaklar/plant_based_diet.jpg', 2005),
(22, 'Sağlıklı Yaşlanma', 'Osman Müftüoğlu', 'Uzun Yaşam', 'Yaşlanma sürecini iyileştirir', 'Sağlıklı yaşlanmanın yollarını anlatır', 'Kitap, yaşlanmanın kaçınılmaz olmakla birlikte nasıl yaşlandığımızın büyük ölçüde yaşam tarzımıza bağlı olduğunu anlatır. Amaç, sadece daha uzun yaşamak değil; fiziksel, zihinsel ve duygusal olarak aktif ve bağımsız kalabilmektir. Beslenme, hareket, uyku ve stres yönetimi sağlıklı yaşlanmanın temel unsurları olarak ele alınır.\r\n\r\nRehberde; düzenli egzersizin kas ve kemik sağlığını koruduğu, dengeli ve doğal beslenmenin kronik hastalık riskini azalttığı, zihinsel olarak aktif kalmanın ise hafıza ve bilişsel gerilemeyi yavaşlattığı vurgulanır. Ayrıca sosyal ilişkiler, yaşam amacı ve pozitif bakış açısının yaşlılıkta yaşam kalitesini belirleyen önemli faktörler olduğu belirtilir. Temel mesaj şudur: Sağlıklı yaşlanma, gençken atılan küçük ama bilinçli adımlarla mümkün olur.', 'dosyalar/kapaklar/saglikli_yaslanma.jpg', 2019),
(23, 'Hayat Seninle Başlar', 'Mümin Sekman', 'Motivasyon', 'Özgüveni artırır', 'Kişisel gelişim ve yaşam bilinci kazandırır', 'Kitap, insanın hayatını değiştiren asıl gücün kendi bakış açısı, kararları ve sorumluluk alması olduğunu vurgular. Mümin Sekman, başarının ve mutluluğun dış koşullardan çok, kişinin kendine inanması, hedef belirlemesi ve harekete geçmesiyle mümkün olduğunu anlatır. Mağdur psikolojisinden çıkıp “yapabilirim” zihniyetine geçmenin önemine dikkat çeker.\r\n\r\n“Hayat Seninle Başlar”, kişinin potansiyelini fark etmesi, korkularını aşması ve ertelemeyi bırakması için motive edici örnekler sunar. Temel mesaj nettir: Hayat değişmez; sen değişirsen hayat değişir.', 'dosyalar/kapaklar/hayat_seninle_baslar.jpg', 2017),
(24, 'Beyin Gücünü Geliştir', 'Acar Baltaş', 'Beyin', 'Zihinsel performansı artırır', 'Beynin verimli kullanımını anlatır', 'Kitap, beynin sanıldığından çok daha büyük bir potansiyele sahip olduğunu ve doğru tekniklerle bu gücün geliştirilebileceğini anlatır. Tony Buzan, beynin doğal çalışma biçimine uygun öğrenme yöntemlerinin; hafızayı, yaratıcılığı ve düşünme hızını önemli ölçüde artırdığını vurgular.\r\n\r\n“Beyin Gücünü Geliştir”, özellikle zihin haritaları (mind maps) tekniğiyle bilgilerin daha kalıcı ve etkili şekilde öğrenilebileceğini açıklar. Odaklanma, hayal gücü, kelimeler, renkler ve görsellerin birlikte kullanılmasıyla beynin her iki yarım küresinin de aktif hâle geldiği anlatılır. Kitabın temel mesajı: Doğru yöntemlerle herkes beynini daha verimli, hızlı ve yaratıcı kullanabilir.', 'dosyalar/kapaklar/beyin_gucu.jpg', 2016),
(25, 'The Art of Rest', 'Claudia Hammond', 'Dinlenme', 'Tükenmişliği azaltır', 'Dinlenmenin bilimsel yönlerini anlatır', 'Kitap, dinlenmenin tek bir biçimi olmadığını ve herkes için farklı anlamlar taşıdığını anlatır. Claudia Hammond, dünyanın dört bir yanından binlerce insanın katıldığı araştırmalara dayanarak, zihinsel ve fiziksel olarak gerçekten neyin dinlendirdiğini inceler. Sadece uyumanın değil; doğada vakit geçirmek, okumak, hayal kurmak, yalnız kalmak ve bilinçli molalar vermenin de güçlü dinlenme biçimleri olduğu vurgulanır.\r\n\r\n“The Art of Rest”, modern yaşamın sürekli meşgul olma baskısına karşı, dinlenmeyi hak edilen bir ihtiyaç olarak yeniden tanımlar. Kitabın temel mesajı şudur: Doğru dinlenme, tembellik değil; iyi yaşamın ve verimliliğin anahtarıdır.', 'dosyalar/kapaklar/the_art_of_rest.jpg', 2019),
(26, 'Sağlık Sırları', 'Ender Saraç', 'Genel Sağlık', 'Yaşam kalitesini artırır', 'Doğal ve sağlıklı yaşam önerileri sunar', 'Kitap, sağlıklı ve dengeli bir yaşamın doğal alışkanlıklar ve bilinçli seçimlerle mümkün olduğunu anlatır. Beslenme, hareket, uyku ve stres yönetimi sağlığın temel taşları olarak ele alınır. Vücudun kendi kendini iyileştirme kapasitesine sahip olduğu, ancak bunun doğru yaşam tarzıyla desteklenmesi gerektiği vurgulanır.\r\n\r\n“Sağlık Sırları” ayrıca zihinsel ve duygusal dengenin fiziksel sağlık üzerindeki etkilerine dikkat çeker. Pozitif düşünce, düzenli yaşam, doğayla uyum ve aşırılıklardan kaçınma kitabın öne çıkan temalarındandır. Temel mesaj şudur: Sağlık gizli reçetelerde değil, günlük hayatta sürdürülebilen basit ama doğru alışkanlıklardadır.', 'dosyalar/kapaklar/saglik_sirlari.jpg', 2015),
(27, 'Move Your Body', 'Katy Bowman', 'Egzersiz', 'Hareket kabiliyetini artırır', 'Doğru hareket etmenin önemini anlatır', NULL, 'dosyalar/kapaklar/move_your_body.jpg', 2018),
(28, 'The Comfort Crisis', 'Michael Easter', 'Zihinsel Dayanıklılık', 'Dayanıklılığı artırır', 'Konfor alanından çıkmanın faydalarını anlatır', NULL, 'dosyalar/kapaklar/the_comfort_crisis.jpg', 2021),
(29, 'Pozitif Psikoloji', 'Tal Ben-Shahar', 'Psikoloji', 'Mutluluğu artırır', 'Pozitif psikoloji biliminin temellerini açıklar', NULL, 'dosyalar/kapaklar/pozitif_psikoloji.jpg', 2010);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanicilar`
--

CREATE TABLE `kullanicilar` (
  `id` int(11) NOT NULL,
  `kullanici_adi` varchar(50) NOT NULL,
  `eposta` varchar(120) NOT NULL,
  `sifre_hash` varchar(255) NOT NULL,
  `kayit_tarihi` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `kullanicilar`
--

INSERT INTO `kullanicilar` (`id`, `kullanici_adi`, `eposta`, `sifre_hash`, `kayit_tarihi`) VALUES
(1, 'yaren', 'yarenbal010@gmail.com', '$2y$10$VWWvB47TKbSJpyYZaPnE.ec/KFm2HpqLHo7zn0/Q5GIydjmvr9deK', '2025-12-18 22:57:41'),
(2, 'çağla erdoğan', 'erdogancagla253@gmail.com', '$2y$10$A72KZ9a9KIyQGw0SgOAIzuqOiw7FaSoCZZqXeCde5adZy.SzxBAeS', '2025-12-22 20:48:26'),
(3, 'selen', 'selenerler@gmail.com', '$2y$10$4hJilUuDFJFAyKf/wlm6TunAFbd6tBMkgGqFagUd225AwS/GzdN/q', '2025-12-26 08:20:19');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `favoriler`
--
ALTER TABLE `favoriler`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_fav` (`kullanici_id`,`kitap_id`),
  ADD KEY `kullanici_id` (`kullanici_id`),
  ADD KEY `kitap_id` (`kitap_id`);

--
-- Tablo için indeksler `iletisim_mesajlari`
--
ALTER TABLE `iletisim_mesajlari`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `kitaplar`
--
ALTER TABLE `kitaplar`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `kullanicilar`
--
ALTER TABLE `kullanicilar`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kullanici_adi` (`kullanici_adi`),
  ADD UNIQUE KEY `eposta` (`eposta`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `favoriler`
--
ALTER TABLE `favoriler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `iletisim_mesajlari`
--
ALTER TABLE `iletisim_mesajlari`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `kitaplar`
--
ALTER TABLE `kitaplar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Tablo için AUTO_INCREMENT değeri `kullanicilar`
--
ALTER TABLE `kullanicilar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
