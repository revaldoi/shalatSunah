import 'package:flutter/material.dart';
import 'package:hello_world/detail_shalat.dart';
import 'package:hello_world/mainMain.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xFFF6F6F6), // navigation bar color
    statusBarColor: Color(0xFFF6F6F6), // status bar color
  ));
  runApp(MaterialApp(
    title: "Shalat Sunah",
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<MyApp> {
  List<Container> macamShalatSunah = List();

  var dataShalatSunah = [
    {
      "judul": "Shalat Sunah Wudhu",
      "nama": "Wudhu",
      "gambar": "sholatWudhu.jpg",
      "deskripsingkat": "Shalat sunah yang dilakukan setelah melakukan wudhu",
      "deskripsi1":
          "Shalat sunnah wudhu merupakan shalat dua rakaat yang disunnahkan untuk  dilakukan setelah melakukan wudhu sempurna.",
      "judul1": "Doa Setelah Shalat Sunah Wudhu",
      "penjelasan1":
          "DZIKIR PENDEK : \nsubhaanallaah wabihamdih, subhaanallaahil'azhim (3X) \nallahu akbar (3X) \nalhamdu lillaah (3X) \nlaa ilaaha illallaah (3X)",
      "judul2": "",
      "penjelasan2":
          "laa illaaha illallaah, wahdahuu laa syarikalah, lahul mulku walahul hamdu yuhii wa yumiitu wa huwa 'alaa kulli syai-in qadiir \nastaghfirullaahal 'azhiim (3X) \nrabbighfirlii warhamnii watub 'alayya \n\nSHALAWAT NUR \nallaahumma shalli 'alaa nuuril anwaar, wasirril asraar, watiryaaqil aghyaar, wamiftaahi baabil yasaar, sayyidinaa muhammadinil mukhtaae wa aalihil ath-haar, wa ash-haabihil akhyaar, 'adada ni' amillaahi wa ifdhaalih",
      "juduldoa": "",
      "doa": "Doa Setelah Shalat Sunah Wudhu",
      "latin": "allaahumma al himnii rusydii wa a'idzinii min syarri nafsii (3x)",
      "arti": "",
      "tabel1": "",
      "tabel2": "",
      "niat": "اُصَلِّيْ سُنَّةَ اْلوُضُوْءِ رَكْعَتَيْنِ لِلهِ تَعَالَى",
      "gambarNiat": "Ushallii sunnatal-wudhuu’I rak’ ataini lillaahi ta’aalaa."
    },
    {
      "judul": "Shalat Dhuha",
      "nama": "Dhuha",
      "gambar": "shalatDhuha.jpg",
      "deskripsingkat":
          "Shalat ini dilakukan setelah matahari terbit sempurna hingga",
      "deskripsi1":
          "adalah salat sunah yang dilakukan seorang muslim ketika waktu dhuha. Waktu dhuha adalah waktu ketika matahari mulai naik kurang lebih 7 hasta sejak terbitnya (kira-kira pukul tujuh pagi) hingga waktu zuhur. Jumlah rakaat salat dhuha minimal 2 rakaat dan maksimal 12 rakaat.",
      "judul1": "Keutamaan Shalat Dhuha",
      "penjelasan1":
          "- Merupakan Pesan Rasulullah\n- Dibangunkan Sebuah Rumah di Surga\n- Berpahala Seperti Orang Pergi Haji dan Umroh\n- Termasuk Shalat Awwabin (shalatnya orang taat)\n- Dicukupkan Rezeki",
      "judul2": "",
      "penjelasan2": "",
      "juduldoa": "",
      "doa": "Doa Setelah Shalat Dhuha",
      "latin":
          "ALLAHUMMA INNADHDHUHA-A DHUHA-UKA, WALBAHAA-ABAHAA-UKA, WAL JAMAALA JAMAALUKA, WAL QUWWATA QUWAATUKA, WAL QUDROTA QUDROTUKA, WAL ‘ISHMATA ISHMATUKA. \nALLAHUMA INKAANA RIZQII FISSAMMA-I FA ANZILHU, WA INKAANA FIL ARDHI FA-AKHRIJHU, WA INKAANA MU’SIRON FAYASSIRHU, WAINKAANA HAROOMAN FA THOHHIRHU, WA INKAANA BA’IDAN FA QORIBHU, BIHAQQIDUHAA-IKA WA BAHAAIKA, WA JAMAALIKA WA QUWWATIKA WA QUDROTIKA, AATINI MAA ATAITA ‘IBAADAKASH SHOOLIHIiN.",
      "arti":
          "Ya Allah, sesungguhnya waktu dhuha adalah waktu dhuha-Mu, keagungan adalah keagungan-Mu, keindahan adalah keindahan-Mu, kekuatan adalah kekuatan-Mu, penjagaan adalah penjagaan-Mu, Ya Allah, apabila rezekiku berada di atas langit maka turunkanlah, apabila berada di dalam bumi maka keluarkanlah, apabila sukar mudahkanlah, apabila haram sucikanlah, apabila jauh dekatkanlah dengan kebenaran dhuha-Mu, keagungan-Mu, keindahan-Mu dan kekuatan-Mu, berikanlah kepadaku apa yang Engkau berikan kepada hamba-hambaMu yang shalih”",
      "tabel1": "",
      "tabel2": "",
      "niat": "اُصَلِّى سُنَّةَ الضَّحٰى رَكْعَتَيْنِ مُسْتَقْبِلَ الْقِبْلَةِ اَدَاءً ِللهِ تَعَالَى",
      "gambarNiat": "Ushollii Sunnatadh Dhuha Rok’ataini Mustaqbilal Qiblati Adaa’an Lillaahi Ta’aalaa."
    },
    {
      "judul": "Shalat Tahiyyatul Masjid",
      "nama": "Tahiyyatul Masjid",
      "gambar": "sholattahiyatul.jpg",
      "deskripsingkat":
          "Sholat tahiyatul masjid disunahkan dua rakaat sebelum duduk.",
      "deskripsi1":
          "Sholat tahiyatul masjid disunahkan dua rakaat sebelum duduk. Kesunahan sholat sunah tahiyatul masjid hilang ketika masuk masjid langsung duduk, baik lama ataupun sebentar. Kalau lupa atau tidak tahu dibolehkan langsung berdiri mengerjakan shalat sunah tahiyatul masjid, dengan syarat duduknya tidak terlalu lama.",
      "judul1": "Keutamaan Shalat Sunah Tahiyyatul Masjid :",
      "penjelasan1":
          "- Menutupi Kekurangan Sholat Wajib\n- Menghapus Dosa dan Ditinggikan Derajat\n- Sebagai Bentuk Rasa Syukur \n- Sebaik-baik Amalan",
      "judul2": "",
      "penjelasan2": "",
      "juduldoa": "",
      "doa": "Doa Setelah Shalat Tahiyyatu Masjid",
      "latin":
          "ALLOOHUMMAFTAH ‘ALAINAA HIKMATAKA WANSYUR ‘ALAINAA MIN KHOZAA-INI ROHMATIKA YAA ARHAMAR ROOHIMIIN.",
      "arti":
          "Ya Allah, anugerahilah kami hikmah dari-Mu, dan curahan rahmat-Mu, wahai Dzat yang Maha Pengasih, Maha Penyayang.",
      "tabel1": "",
      "tabel2": "",
      "niat":
          "اُصَلِّى سُنَّةً تَحِيَّةَ الْمَسْجِدِ رَكْعَتَيْنِ لِلّٰهِ تَعَالَى",
      "gambarNiat":
          "Usholli sunnatan tahiyyatal masjidi rok'ataini lillaahi ta'aalaa"
    },
    {
      "judul": "Shalat Tahajjud",
      "nama": "Tahajjud",
      "gambar": "shalatmalam.jpg",
      "deskripsingkat":
          "Shalat sunnah yang dikerjakan pada waktu malam hari",
      "deskripsi1":
          "Shalat tahajud adalah sholat sunnah yang dikerjakan pada waktu malam hari dan dilaksanakan sesudah tidur sebentar. Sholat tahajud juga disebut dengan sholat malam (Qiyamul Laili). Sholat tahajud menjadi sholat sunnah yang utama setelah sholat fardhu. Sholat tahajud dikerjakan minimal 2 rakaat dengan jumlah maksimal yang tidak terbatas.",
      "judul1": "Keutamaan Shalat Tahajjud",
      "penjelasan1":
          "- Doanya dikabulkan \n- Penghapus dan pencegah dosa \n- Jembatan untuk masuk surga \n- Menjaga kesehatan rohani",
      "judul2": "",
      "penjelasan2": "",
      "juduldoa": "",
      "doa": "Doa Setelah Shalat Tahadjjud",
      "latin":
          "ALLAHUMMA LAKAL HAMDU ANTA QAYYIMUS SAMAWAATI WAL ARDHI WA MAN FIIHINN(A), WA LAKAL HAMDU LAKA MULKUS SAMAWAATI WAL ARDHI WA MAN FIIHINN(A), WA LAKAL HAMDU ANTA NUURUS SAMAWAATI WAL ARDHI WA MAN FIIHINN(A), WA LAKAL HAMDU ANTA MALIKUS SAMAWAATI WAL ARDH(I), WA LAKAL HAMDU ANTAL HAQQ(U), WA WA’DUKAL HAQQ(U), WA LIQAA-UKAL HAQQ(U), WAL JANNATU HAQQ(UN), WAN NAARU HAQQ(UN), WAN NABIYYUUNA HAQQ(UN), WA MUHAMMADUN SHALLALLAHU ‘ALAIHI WA SALLAMA HAQQ(UN), WAS SAA’ATU HAQQ(UN), ALLAHUMMA LAKA ASLAMTU, WA BIKA AAMANTU, WA ‘ALAIKA TAWAKKALTU, WA ILAIKA ANABTU, WA BIKA KHAASHAMTU, WA ILAIKA HAAKAMTU, FAGHFIR LII MAA QADDAMTU, WA MAA AKHKHARTU WA MAA ASRARTU WA MAA A’LANTU, ANTAL MUQADDIMU, WA ANTAL MUAKHKHIRU, LAA ILAAHA ILLA ANT(A) AW LAA ILAAHA GHAIRUKA WA LAA HAULA WA LAA QUWWATA ILLA BILLAH(I)",
      "arti":
          "Ya Allah, milikmulah segala puji, Engkaulah penegak langit dan bumi serta apa-apa yang ada di dalamnya, milik-Mu lah segala puji, milik-Mu lah kerajaan langit dan bumi dan apa-apa yang ada di dalamnya, milik-Mu lah segala puji, Engkaulah cahaya langit dan bumi dan apa-apa yang ada di dalamnya, milik-Mu lah segala puji, Engkaulah penguasa langit dan bumi , milik-Mu lah segala puji, Engkaulah yang benar dan janjimu adalah benar, pertemuan dengan-Mu adalah benar, perkataanmu benar, surga-Mu itu benar ada, neraka itu benar ada, para nabi itu benar, Nabi Muhammad Saw itu benar, dan kiamat itu benar ada. Ya Allah hanya kepada-Mu lah aku berserah diri, hanya kepada-Mu lah aku beriman, hanya kepada-Mu lah aku bertawakkal, hanya kepada-Mu lah aku kembali, hanya dengan-mu lah aku menghadapi musuh, dan hanya kepada-Mu lah aku berhukum. Maka ampunilah aku atas segala dosa yang telah aku lakukan dan yang mungkin akan aku lakukan, dosa yang aku lakukan sembunyi-sembunyi maupun terang-terangan. Engkaulah yang Maha terdahulu dan Engkaulah yang Maha terakhir. Tiada Tuhan selain Engkau dan tiada daya upaya dan kekuatan kecuali dengan (pertolongan) Allah.",
      "tabel1": "",
      "tabel2": "",
      "niat":
          "اُصَلِّى سُنَّةً التَّهَجُّدِ رَكْعَتَيْنِ مُسْتَقْبِلَ الْقِبْلَةِ ِللهِ تَعَالَى",
      "gambarNiat":
          "Ushallii sunnatan tahajjudi rak'ataini mustaqbilal qiblati lillahi ta'alla"
    },
    {
      "judul": "Shalat Istikharah",
      "nama": "Istikharah",
      "gambar": "shalatistikharah.jpg",
      "deskripsingkat":
          "Shalat sunnah yang dikerjakan untuk meminta petunjuk Allah",
      "deskripsi1":
          "Shalat Istikharah adalah salat sunnah yang dikerjakan untuk meminta petunjuk Allah oleh mereka yang berada di antara beberapa pilihan dan merasa ragu-ragu untuk memilih atau saat akan memutuskan sesuatu hal. Spektrum masalah dalam hal ini tidak dibatasi. Seseorang dapat salat istikharah untuk menentukan di mana ia kuliah, siapa yang lebih cocok menjadi jodohnya atau perusahaan mana yang lebih baik ia pilih. Setelah salat istikharah, maka dengan izin Allah pelaku akan diberi kemantapan hati dalam memilih.",
      "judul1": "Waktu Pengerjaan",
      "penjelasan1":
          "Pada dasarnya salat istikharah dapat dilaksanakan kapan saja namun dianjurkan pada waktu sepertiga malam terakhir. Nabi Muhammad menjelaskan jika umatnya memiliki keinginan atau memilih keputusan yang terbaik maka disunnahkan untuk melakukan salat ini",
      "judul2": "",
      "penjelasan2": "",
      "juduldoa": "",
      "doa": "Doa Setelah Shalat Istikharah",
      "latin":
          "ALLAHUMMA INNII ASTAKHIIRUKA BI ‘ILMIKA WA ASTAQDIRUKA BI QUDRATIKA WA AS’ALUKA MIN FADHLIKAL-‘AZHIIM FA INNAKA TAQ-DIRU WA LAA AQDIRU WA TA’LAMU WA LAA A’LAMU WA ANTA’ALLAAMUL-GHUYUUB. ALLAHUMMA IN KUNTA TA’LAMU ANNA HAADZAL AMRA KHAIRUL LII FII DIINII WA MA’AASYII WA ‘AAQIBATU AMRII FAQDIRHU LII WA YASSIRHU LII TSUMMA BAARIK LII FIIHI WA IN KUNTA TA’LAMU ANNA HAADZAA SYARRUL LII FII DIINII WA MA’AASYII WA ‘AAQIBATI AMRII FASHRIFHU ‘ANNII FASHRIIFNII ‘ANHU WAQDIR LIYAL-KHAIRA HAITSU KAANA TSUMMA IRDHINII BIH",
      "arti":
          "Ya Allah, sesungguhnya aku meminta pilihan yang tepat kepadaMu, dengan ilmu pengetahuanMu, dan aku mohon kekuasaanMu (untuk mengatasi persoalanku) dengan keMaha KuasaanMu. Aku mohon kepadaMu sesuatu dari anugerahMu Yang Maha Agung, sesungguhnya Engkau Maha Kuasa, sedang aku tidak kuasa, Engkau mengetahui, sedang aku tidak mengetahuinya, dan Engkau adalah Maha Mengetahui hal yang ghaib. Ya Allah, apabila Engkau mengetahui bahwa urusan ini (Orang yang mempunyai hajat hendaknya menyebut persoalannya) lebih baik dalam agamaku, dan akibatnya terhadap diriku sukseskanlah untuk ku, mudahkan jalannya, kemudian berilah berkah. Akan tetapi apabila Engkau mengetahui bahwa persoalan ini lebih berbahaya bagiku dalam agama, perekonomian dan akibatnya kepada diriku, maka singkirkan persoalan tersebut, dan jauhkan aku daripadanya, takdirkan kebaikan untuk ku di mana saja kebaikan itu berada, kemudian berilah kerelaanMu kepadaku.",
      "tabel1": "",
      "tabel2": "",
      "niat": "أصلى سنة الإستخارة ركعتين لله تعالى",
      "gambarNiat": "Ushollii sunnatal istikhooroti rok'ataini lillaahi ta'aalaa"
    },
    {
      "judul": "Shalat Mutlaq",
      "nama": "Mutlaq",
      "gambar": "shalatmutlaq.png",
      "deskripsingkat":
          "Shalat sunah yang dapat dilakukan tanpa memerlukan sebab tertentu",
      "deskripsi1":
          "Salat Sunnat Mutlaq adalah salat sunnat yang dapat dilakukan tanpa memerlukan sebab tertentu dan kapan saja kecuali waktu-waktu yang diharamkan untuk mengerjakan salat (lihat pada salat sunnah). Jumlah rakaatnya tidak terbatas dan dilakukan dengan seri 2 raka'at.",
      "judul1": "",
      "penjelasan1":
          "Secara definitif, shalat sunnah mutlak ini dimaknai sebagai shalat sunnah yang dapat dilakukan tanpa memerlukan sebab tertentu dan kapan saja bisa dilakukan kecuali pada waktu-waktu tertentu yang dilarang untuk dikerjakannya. Waktu-waktu tersebut ialah:\n- Sesudah shalat shubuh\n- Ketika matahari terbit hingga naik sepenggalah\n- Saat matahari tepat dipuncaknya (zenith), hingga ia mulai condong\n- Sesudah ashar sampai matahari terbenam\n- Ketika matahari terbenam hingga sempurna terbenamnya",
      "judul2": "",
      "penjelasan2": "",
      "juduldoa": "",
      "doa": "",
      "latin":
          "                                                                                           ",
      "arti": "",
      "tabel1": "",
      "tabel2": "",
      "niat": "اُصَلِّى سُنَّةً رَكْعَتَيْنِ ِللهِ تَعَالٰى",
      "gambarNiat": "Usholli sunnatan rok’atayni lillahi ta’aala"
    },
    {
      "judul": "Shalat Hajat",
      "nama": "Hajat",
      "gambar": "shalathajat.png",
      "deskripsingkat":
          "Shalat yang dilakukan ketika seseorang memiliki suatu keinginan",
      "deskripsi1":
          "Sholat hajat ialah sholat yang dilakukan ketika seseorang memiliki suatu keinginan ataupun hajat. Seseorang yang melaksanakan sholat ini memiliki harapan bahwa keinginannya ataupun hajatnya dapat dikabulkan oleh Allah SWT.",
      "judul1": "Keutamaan Shalat Hajat",
      "penjelasan1":
          "- Mendapatkan pahala dari Allah SWT\n- Mendekatkan diri kepada Allah SWT\n- Mendapatkan perasaan yang tenang4. Rasa tawakal yang lebih kuat",
      "judul2": "",
      "penjelasan2": "",
      "juduldoa": "",
      "doa": "Doa Setelah Shalat Hajat",
      "latin":
          "LAA ILAHA ILLALLOHUL HALIIMUL KARIIMU SUBHAANALLOHI ROBBIL ‘ARSYIL ‘AZHIIM. ALHAMDU LILLAAHI ROBBIL ‘AALAMIIN. AS `ALUKA MUUJIBAARI ROHMATIKA WA ‘AZAAIMA MAGHFIROTIKA WAL GHONIIMATA MING KULLI BIRRI WASSALAAMATA MING KULLI ITSMIN LAA TADA’ LII DZAMBAN ILLA GHOFARTAHU WALAA HAMMAN ILLAA FAROJTAHU WALAA HAAJATAN HIYA LAKA RIDHON ILLA QODHOITAHAA YAA ARHAMAR ROOHIMIIN",
      "arti": "",
      "tabel1": "",
      "tabel2": "",
      "niat": "اُصَلِّى سُنَّةَ الْحَاجَةِ رَكْعَتَيْنِ لِلهِ تَعَالَى",
      "gambarNiat": "Usholli sunnatal-haajati rok’atayni lillahi ta’aala"
    },
    {
      "judul": "Shalat Taubat",
      "nama": "Hajat",
      "gambar": "shalataubat.png",
      "deskripsingkat":
          "Sholat Taubat dilakukan untuk memohon ampunan kepada Allah",
      "deskripsi1":
          "Sholat Taubat dilakukan untuk memohon ampunan kepada Allah atas dosa-dosa besar atau pun dosa-dosa kecil yang telah dilakukan.\n\nManfaat sholat taubat sendiri adalah untuk menghapus dosa-dosa yang pernah dilakukan. Jika berbuat dosa dan tidak meminta ampun, maka ini akan membuat seorang manusia menyesal di alam akhirat kelak.",
      "judul1": "Waktu yang diharamkan untuk shalat taubat",
      "penjelasan1":
          "- Ketika matahari terbit hingga naik sepenggalah\n- Saat matahari tepat dipuncaknya (zenith), hingga ia mulai condong\n- Sesudah ashar sampai matahari terbenam\n- Ketika matahari terbenam hingga sempurna terbenamnya",
      "judul2": "",
      "penjelasan2": "",
      "juduldoa": "",
      "doa": "Doa Setelah Shalat Taubat",
      "latin":
          "ALLAHUMMA ANTA ROBBII LAA ILAAHA ILLAA ANTA, KHOLAQTANII WA ANA 'ABDUKA WA ANA 'ALA 'AHDIKA WA WA'DIKA MASTATHO'TU. A'UDZU BIKA MIN SYARRI MAA SHONA'TU, ABUU-U LAKA BINI'MATIKA 'ALAYYA, WA ABUU-U BI DZANBII, FAGHFIRLII FAINNAHUUA LAA YAGHFIRUDZ DZUNUUBA ILLA ANTA",
      "arti": "a Allah Engkau adalah Tuhanku. Tidak ada sesembahan yang hak kecuali Engkau. Engkau yang menciptakanku, sedang aku adalah hambamu dan aku di atas ikatan janjimu dan akan menjalankannya dengan semampuku. Aku berlindung kepadamu dari segala kejahatan yang telah aku perbuat, aku mengakuimu atas nikmatmu terhadap diriku dan aku mengakui dosaku padamu, maka ampunilah aku. Sesungguhnya tiada yang mengampuni segala dosa kecuali Engkau.",
      "tabel1": "",
      "tabel2": "",
      "niat": "أُصَلِّيْ سُنَّةَ التَّوْبَةِ رَكْعَتَيْنِ لِلَّهِ تَعَالَى",
      "gambarNiat": "Ushollii sunnatat taubati rok’ataini lillaahi ta’aalaa."
    },
    {
      "judul": "Shalat Tarawih",
      "nama": "Tarawih",
      "gambar": "shalatwitir.jpg",
      "deskripsingkat":
          "Shalat sunnah yang dilakukan khusus hanya pada bulan ramadan",
      "deskripsi1":
          "Sholat tarawih adalah ibadah sunnah yang dikerjakan di setiap malam pada Ramadhan atau bulan puasa. Dikerjakan sesudah shalat isya dan biasanya umat muslim menjalankan sholat tarawih di masjid pada bulan Ramadan, namun dikerjakan di rumah juga tidak apa-apa.",
      "judul1": "Jumlah Rakaat",
      "penjelasan1":
          "Umumnya, salat tarawih, baik yang 8 rakaat maupun 20 rakaat, ditutup dengan menggelar salat witir 3 rakaat.\n\n Jika dijadikan rumus, maka salat tarawih dan witir yang 8 rakaat di atas bisa dilangsungkan dengan sistem 4-4-3, 2-2-2-2-2-1, ataupun 4-4-2-1.\n\nUntuk yang 20 rakaat, dikerjakan dengan sistem 2 rakaat salat tarawih sebanyak 10 kali dilanjutkan salat witir dua rakaat kemudian satu rakaat (dua kali salam).",
      "judul2": "",
      "penjelasan2": "",
      "juduldoa": "",
      "doa": "Doa Setelah Shalat Tarawih",
      "latin":
          "ALLAAHUMMAJALNAA BIL ILMAANI KAAMILDNA , WALIFARAA IDLIKA MU-ADDIINA WA 'ALASH SHALAWATI MU HAAFIZHI1NA, WALIZ ZAKAATI FAA'I LINA, WALIMAA 'INDAKA THAALIBIINA WALI'AFWI KA RAAJIINA, WABIL HUDAA MUTAMASSIKIINA, WA'ANIL LAGHWI MU'RIDLIINA, WAFIDDUN-YAA ZAAHIDIINA, WAFIL AAKHIRATI RAAGHIBIINA, WABIL QADLAA I RAADLINA, WABIN NA'MAA I SYAAKIRII NA, WA'ALAL BALAA-I SHAABIRIINA WATAHTA LI WAA-I SAYYIDINAA MUHAMMADIN S H A L L A L L A A H U 'ALAIHI WASALLAMA Y AUM A L QIYAAMATI SAA-IRII NA, WA'ALALHAUDLI WAARIDIINA, WAFIL J AN N ATI DAAKHILnNA WA 'ALAA SARIIRATIL KARA AM ATI QATDIIN, WABIHLURIN TININ MIJTAZAWWIJIINA, W AMIN SUNDLSIN WA ISTABRAQIN WADIIBAAJIN MUTALABBISHNA, WAMIN THA'AAMIL JANNATI AAKILIINA, WAMIN LABANIN WA 'ASALIN MUSHAF FDNA SYAARIBIINA BI-AKWAABIN WA-ABAARIIQA WAKA'SIN MIN MATININ MA'ALLAADZIIN A AN'AMTA 'ALAIHIM MINANNABIYYHNA WASIi SHIDDIIQIINA WASY SYUHADAA-I WASH SHAALIHIIN A WAHASUNA ULAAIKA RAFIIQAA, DZAALIKAL FADL LU MINAL LAAHI WAKAFAA BILLAAHI 'ALIIMAA, WAL HAMDU LILLAAHI RABBIL 'AALAMIINA.",
      "arti": "",
      "tabel1": "",
      "tabel2": "",
      "niat": "اُصَلِّى سُنَّةَ التَّرَاوِيْحِ رَكْعَتَيْنِ مُسْتَقْبِلَ الْقِبْلَةِ أَدَاءً لِلهِ تَعَالَى",
      "gambarNiat": "Ushalli sunnatat Tarāwīhi rak‘atayni mustaqbilal qiblati adā’an lillāhi ta‘ālā."
    },
    {
      "judul": "Shalat Witir",
      "nama": "Witir",
      "gambar": "shalattarawih.jpg",
      "deskripsingkat":
          "Shalat sunnah yang dilaksanakan usai sholat sunah malam",
      "deskripsi1":
          "Sholat witir adalah ibadah sunnah yang dianjurkan untuk dilaksanakan usai mengerjakan sholat-sholat sunnah lainnya pada malam hari. Jadi, sholat witir menjadi penutup dari ibadah qiyamul lail, seperti sholat tahajud, sholat hajat dan lainnya, serta sholat tarawih pada malam bulan Ramadhan.",
      "judul1": "Shalat Witir 3 Rakaat",
      "penjelasan1":
          "Sholat witir bisa dikerjakan satu rakaat dan maksimal 11 rakaat. Setiap bulan Ramadhan, banyak umat muslim mengerjakan sholat witir dengan tiga rakaat, terutama yang berjamaah di masjid. Namun, ada dua cara dalam melaksanakan sholat witir tiga rakaat.",
      "judul2": "",
      "penjelasan2": "",
      "juduldoa": "",
      "doa": "Doa Setelah Shalat Witir",
      "latin":
          "ALLAHUMMA INNAA NAS-ALUKA IIMAANAN DAA IMAA, WANAS-ALUKA QALBAN KHAASYJ'AA. WANASALUKA ILMAN NAAFI'AA, WANAS-ALUKA YAQIINA SHAADIOAA. WANAS ALUKA 'AMALAN SHAALIHAA WANAS-ALUKA DIINAN QAYYIMAA. WANAS ALUKA KHAIRAN KATSIIRAA. WANAS ALUKAL AFWA WAL 'AAFIYATA. WANAS-ALUKA TAMAAMAL AAFIYATI. WANAS-ALUKASY SYUKRA ALAL 'AAFIYATI. WANAS ALUKAL GHINAA A 'ANIN NAASI. ALLAHUMMA RABBANAA TAOABBAL MINNAA SHA LAATANAA, WASHIYAAMANAA, WAQIYAAMANAA WATAKHSYSYU'ANAA, WATADLARRU'ANAA, W ATA' ABBUDANAA, WATAMMIM TAQSHIIRANAA YA A AL LAH YA A ALLAH YA A ALLAH, YAA ARHAMAR RAA HIMIINA, WASHALLALLAAHU ALA A KHAIRI KHAL QIHI MUHAMMADIN WA 'ALAA AALIHII WASHAHBI HII AJMAIN. WALHAMDU LILLAAHI RABBIL 'AALAMIIN",
      "arti": "",
      "tabel1": "",
      "tabel2": "",
      "niat": "أصلى سنة من الوتر ركعتين لله تعالى",
      "gambarNiat": "Ushallii sunnatam minal witri rak'ataini lillaahhi ta'aalaa."
    },
  ];

  listShalatDhuha() async {
    for (var i = 0; i < dataShalatSunah.length; i++) {
      final dataShalat = dataShalatSunah[i];
      final String gambar = dataShalat["gambar"];
      macamShalatSunah.add(
        Container(
          height: 50.0,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(0.0),
              child: InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => Detail(
                        judul: dataShalat["judul"],
                        nama: dataShalat["nama"],
                        gambar: gambar,
                        deskripsi1: dataShalat["deskripsi1"],
                        judul1: dataShalat["judul1"],
                        judul2: dataShalat["judul2"],
                        penjelasan1: dataShalat["penjelasan1"],
                        penjelasan2: dataShalat["penjelasan2"],
                        juduldoa: dataShalat["juduldoa"],
                        doa: dataShalat["doa"],
                        latin: dataShalat["latin"],
                        arti: dataShalat["arti"],
                        tabel1: dataShalat["tabel1"],
                        tabel2: dataShalat["tabel2"],
                        niat: dataShalat["niat"],
                        gambarNiat: dataShalat["gambarNiat"]),
                  ),
                ),
                child: Container(
                    child: Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Container(
                          width: 190.0,
                          margin: EdgeInsets.all(12),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image(image: AssetImage("img/$gambar")),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 15, 15, 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  dataShalat["judul"],
                                  style: TextStyle(
                                      color: const Color(0xFF565656),
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      fontFamily: 'Roboto',
                                      fontSize: 20),
                                ),
                                Padding(padding: EdgeInsets.all(1.0)),
                                Flexible(
                                  child: Text(
                                    dataShalat["deskripsingkat"],
                                    style: TextStyle(
                                        color: const Color(0xFF565656),
                                        fontWeight: FontWeight.w300,
                                        fontStyle: FontStyle.normal,
                                        fontFamily: 'Roboto',
                                        fontSize: 13),
                                  ),
                                )
                              ],
                            )),
                      ),
                    ],
                  ),
                )

                    // child: ListTile(
                    //   leading: Image.asset("img/$gambar",
                    //       width: 60, height: 60, fit: BoxFit.fill),
                    //   title: Text(dataShalat["judul"]),
                    //   subtitle: Text(dataShalat["deskripsingkat"]),
                    // ),
                    ),
              ),
            ),
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    listShalatDhuha();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(00.0), // here the desired height
          child: AppBar(
            backgroundColor: Color(0xfff6f6f6),
            elevation: 0,
            brightness: Brightness.light,
          )),
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF6F6F6),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(13, 13, 13, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TombolTombol(),
              Expanded(
                child: GridView.count(
                    shrinkWrap: true,
                    mainAxisSpacing: 5.0,
                    crossAxisCount: 1,
                    childAspectRatio: (3.2 / 1),
                    children: macamShalatSunah),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TombolTombol extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: <Widget>[
        Expanded(
            flex: 7,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    "Tuntunan",
                    style: TextStyle(
                        color: const Color(0xFF565656),
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Roboto',
                        fontSize: 29),
                  ),
                  Text(
                    "Shalat Sunah",
                    style: TextStyle(
                        color: const Color(0xFF565656),
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Roboto',
                        fontSize: 29),
                  ),
                ])),
        Expanded(
          flex: 2,
          child: Container(
            height: 68,
            child: Card(
              color: Color(0xFFF8C2D2),
              semanticContainer: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: IconButton(
                icon: new Icon(Icons.access_alarm, size: 35.0, color: Colors.white,),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => MedicineReminder(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
