import 'package:flutter/material.dart';
import 'package:hello_world/bacaan_detail.dart';

class TataCara extends StatefulWidget {
  TataCara({this.nama, this.niat, this.gambarNiat});
  final String nama;
  final String niat;
  final String gambarNiat;

  @override
  _TataCaraState createState() => _TataCaraState();
}

class _TataCaraState extends State<TataCara> {
  List<Container> tataCaraShalat = List();

  var dataTataCara = [
    {
      "bacaan": "Allahu Akbar",
      "bacaanPendek": "Allahu Akbar",
      "arabnya": "ٱللَّٰهُ أَكْبَرُ",
      "gerakan": "Takbiratul Ikhram",
      "picture": "takbiratul.png",
      "keterangan" : ""
    },
    {
      "bacaan": "Allaahu akbaru Kabiraa Walhamdulillaahi Katsiiraa, Wa Subhaanallaahi Bukratan Wa’ashiilaa, Innii Wajjahtu Wajhiya Lilladzii Fatharas Samaawaati Wal Ardha Haniifan Musliman Wamaa Anaa Minal Musyrikiin. Inna Shalaatii Wa Nusukii Wa Mahyaaya Wa Mamaatii Lillaahi Rabbil ‘Aalamiina. Laa Syariikalahu Wa Bidzaalika Umirtu Wa Ana Minal Muslimiin",
      "bacaanPendek": "Allaahu akbaru Kabiraa Walhamdulillaahi Katsiiraa",
      "arabnya": " اللهُ اَكْبَرُ كَبِرًا وَالْحَمْدُ لِلهِ كَشِيْرًا وَسُبْحَانَ اللهِ بُكْرَةً وَاَصِيْلًا . اِنِّى وَجَّهْتُ وَجْهِيَ لِلَّذِيْ فَطَرَالسَّمَاوَاتِ وَالْااَرْضَ حَنِيْفًا مُسْلِمًا وَمَا اَنَا مِنَ الْمُشْرِكِيْنَ . اِنَّ صَلَاتِيْ وَنُسُكِيْ وَمَحْيَايَ وَمَمَاتِيْ لِلهِ رَبِّ الْعَا لَمِيْنَ . لاَ شَرِيْكَ لَهُ وَبِذَ لِكَ اُمِرْتُ وَاَنَ مِنَ الْمُسْلِمِيْنَ",
      "gerakan": "Membaca Doa Iftitah",
      "picture": "berdiri.png",
      "keterangan" : ""

    },
    {
      "bacaan": "(1) bismillāhir-raḥmānir-raḥīm (2) al-ḥamdu lillāhi rabbil-'ālamīn (3) ar-raḥmānir-raḥīm (4) māliki yaumid-dīn (5) iyyāka na'budu wa iyyāka nasta'īn (6) ihdinaṣ-ṣirāṭal-mustaqīm (7) ṣirāṭallażīna an'amta 'alaihim gairil-magḍụbi 'alaihim wa laḍ-ḍāllīn",
      "bacaanPendek": "al-ḥamdu lillāhi rabbil-'ālamīn",
      "arabnya": "بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيْمِ  (١) اَلْحَمْدُ لِلّٰهِ رَبِّ الْعٰلَمِيْنَۙ  (٢) الرَّحْمٰنِ الرَّحِيْمِۙ  (٣)  مٰلِكِ يَوْمِ الدِّيْنِۗ   (٤)  اِيَّاكَ نَعْبُدُ وَاِيَّاكَ نَسْتَعِيْنُۗ  (٥)  اِهْدِنَا الصِّرَاطَ الْمُسْتَقِيْمَ ۙ (٦) صِرَاطَ الَّذِيْنَ اَنْعَمْتَ عَلَيْهِمْ ەۙ غَيْرِ الْمَغْضُوْبِ عَلَيْهِمْ وَلَا الضَّاۤلِّيْنَ ࣖ (٧)",
      "gerakan": "Membaca Al-Fatihah",
      "picture": "berdiri.png",
      "keterangan" : ""
    },
    {
      "bacaan": "(1) wal-'aṣr (2) innal-insāna lafī khusr (3) illallażīna āmanụ wa 'amiluṣ-ṣāliḥāti wa tawāṣau bil-ḥaqqi wa tawāṣau biṣ-ṣabr",
      "bacaanPendek": "wal-'aṣr. innal-insāna lafī khusr",
      "arabnya": "وَالْعَصْرِۙ (١) اِنَّ الْاِنْسَانَ لَفِيْ خُسْرٍۙ (٢) اِلَّا الَّذِيْنَ اٰمَنُوْا وَعَمِلُوا الصّٰلِحٰتِ وَتَوَاصَوْا بِالْحَقِّ ەۙ وَتَوَاصَوْا بِالصَّبْرِ ࣖ (٣)",
      "gerakan": "Membaca Surah Quran",
      "picture": "berdiri.png",
      "keterangan" : "* hanya contoh surah, boleh membaca surah lainnya"
    },
    {
      "bacaan": "Subhaana rabbiyal ‘adziimi wa bihamdih (3x)",
      "bacaanPendek": "Subhaana rabbiyal ‘adziimi wa bihamdih",
      "arabnya": "سُبْحَانَ رَبِّىَ الْعَظِيمِ وَبِحَمْدِهِ",
      "gerakan": "Ruku'",
      "picture": "ruku.png",
      "keterangan" : ""
    },
    {
      "bacaan": "Sami’alloohu liman hamidah\n\n(SETELAH BERDIRI MEMBACA:)\nRobbanaa lakal hamdu mil’as samaawaati wal ardli wa mil-a maa syi’ta min syai’in ba’du)",
      "bacaanPendek": "Sami’alloohu liman hamidah",
      "arabnya": "سَمِعَ اللَّهُ لِمَنْ حَمِدَهُ\n\n رَبَّنَا لَكَ الْحَمْدُ مِلْءَ السَّمَوَاتِ وَالأَرْضِ وَمِلْءَ مَا شِئْتَ مِنْ شَىْءٍ بَعْدُ    ",
      "gerakan": "I'tidal",
      "picture": "berdiri.png",
      "keterangan" : ""
    },
    {
      "bacaan": "Subhaana robbiyal ‘a’la wabihamdih (3x)",
      "bacaanPendek": "Subhaana robbiyal ‘a’la wabihamdih",
      "arabnya": "سُبْحَانَ رَبِّىَ الْأَعْلَى وَبِحَمْدِهِ",
      "gerakan": "Sujud",
      "picture": "sujud.png",
      "keterangan" : ""
    },
    {
      "bacaan": "Allohummaghfirlii warhamnii a’aafinii wahdinii warzuqnii",
      "bacaanPendek": "Allohummaghfirlii warhamnii a’aafinii wahdinii warzuqnii",
      "arabnya": "اللَّهُمَّ اغْفِرْ لِى وَارْحَمْنِى وَعَافِنِى وَاهْدِنِى وَارْزُقْنِى",
      "gerakan": "Duduk Antara Dua Sujud",
      "picture": "dudukantara.png",
      "keterangan" : ""
    },
    {
      "bacaan": "Subhaana robbiyal ‘a’la wabihamdih (3x)",
      "bacaanPendek": "Subhaana robbiyal ‘a’la wabihamdih",
      "arabnya": "سُبْحَانَ رَبِّىَ الْأَعْلَى وَبِحَمْدِهِ",
      "gerakan": "Sujud",
      "picture": "sujud.png",
      "keterangan" : ""
    },
    {
      "bacaan": "(1) bismillāhir-raḥmānir-raḥīm (2) al-ḥamdu lillāhi rabbil-'ālamīn (3) ar-raḥmānir-raḥīm (4) māliki yaumid-dīn (5) iyyāka na'budu wa iyyāka nasta'īn (6) ihdinaṣ-ṣirāṭal-mustaqīm (7) ṣirāṭallażīna an'amta 'alaihim gairil-magḍụbi 'alaihim wa laḍ-ḍāllīn",
      "bacaanPendek": "al-ḥamdu lillāhi rabbil-'ālamīn",
      "arabnya": "بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيْمِ  (١) اَلْحَمْدُ لِلّٰهِ رَبِّ الْعٰلَمِيْنَۙ  (٢) الرَّحْمٰنِ الرَّحِيْمِۙ  (٣)  مٰلِكِ يَوْمِ الدِّيْنِۗ   (٤)  اِيَّاكَ نَعْبُدُ وَاِيَّاكَ نَسْتَعِيْنُۗ  (٥)  اِهْدِنَا الصِّرَاطَ الْمُسْتَقِيْمَ ۙ (٦) صِرَاطَ الَّذِيْنَ اَنْعَمْتَ عَلَيْهِمْ ەۙ غَيْرِ الْمَغْضُوْبِ عَلَيْهِمْ وَلَا الضَّاۤلِّيْنَ ࣖ (٧)",
      "gerakan": "Membaca Al-Fatihah",
      "picture": "berdiri.png",
      "keterangan" : ""
    },
    {
      "bacaan": "(1) wal-'aṣr (2) innal-insāna lafī khusr (3) illallażīna āmanụ wa 'amiluṣ-ṣāliḥāti wa tawāṣau bil-ḥaqqi wa tawāṣau biṣ-ṣabr",
      "bacaanPendek": "wal-'aṣr. innal-insāna lafī khusr",
      "arabnya": "وَالْعَصْرِۙ (١) اِنَّ الْاِنْسَانَ لَفِيْ خُسْرٍۙ (٢) اِلَّا الَّذِيْنَ اٰمَنُوْا وَعَمِلُوا الصّٰلِحٰتِ وَتَوَاصَوْا بِالْحَقِّ ەۙ وَتَوَاصَوْا بِالصَّبْرِ ࣖ (٣)",
      "gerakan": "Membaca Surah Quran",
      "picture": "berdiri.png",
      "keterangan" : "* hanya contoh surah, boleh membaca surah lainnya"
    },
    {
      "bacaan": "Subhaana rabbiyal ‘adziimi wa bihamdih (3x)",
      "bacaanPendek": "Subhaana rabbiyal ‘adziimi wa bihamdih",
      "arabnya": "سُبْحَانَ رَبِّىَ الْعَظِيمِ وَبِحَمْدِهِ",
      "gerakan": "Ruku'",
      "picture": "ruku.png",
      "keterangan" : ""
    },
    {
      "bacaan": "Sami’alloohu liman hamidah\n\n(SETELAH BERDIRI MEMBACA:)\nRobbanaa lakal hamdu mil’as samaawaati wal ardli wa mil-a maa syi’ta min syai’in ba’du)",
      "bacaanPendek": "Sami’alloohu liman hamidah",
      "arabnya": "سَمِعَ اللَّهُ لِمَنْ حَمِدَهُ\n\n رَبَّنَا لَكَ الْحَمْدُ مِلْءَ السَّمَوَاتِ وَالأَرْضِ وَمِلْءَ مَا شِئْتَ مِنْ شَىْءٍ بَعْدُ    ",
      "gerakan": "I'tidal",
      "picture": "berdiri.png",
      "keterangan" : ""
    },
    {
      "bacaan": "Subhaana robbiyal ‘a’la wabihamdih (3x)",
      "bacaanPendek": "Subhaana robbiyal ‘a’la wabihamdih",
      "arabnya": "سُبْحَانَ رَبِّىَ الْأَعْلَى وَبِحَمْدِهِ",
      "gerakan": "Sujud",
      "picture": "sujud.png",
      "keterangan" : ""
    },
    {
      "bacaan": "Allohummaghfirlii warhamnii a’aafinii wahdinii warzuqnii",
      "bacaanPendek": "Allohummaghfirlii warhamnii a’aafinii wahdinii warzuqnii",
      "arabnya": "اللَّهُمَّ اغْفِرْ لِى وَارْحَمْنِى وَعَافِنِى وَاهْدِنِى وَارْزُقْنِى",
      "gerakan": "Duduk Antara Dua Sujud",
      "picture": "dudukantara.png",
      "keterangan" : ""
    },
    {
      "bacaan": "Subhaana robbiyal ‘a’la wabihamdih (3x)",
      "bacaanPendek": "Subhaana robbiyal ‘a’la wabihamdih",
      "arabnya": "سُبْحَانَ رَبِّىَ الْأَعْلَى وَبِحَمْدِهِ",
      "gerakan": "Sujud",
      "picture": "sujud.png",
      "keterangan" : ""
    },
    {
      "bacaan": "Attahiyyatu lillaah wash sholawaatu wath thoyyibaat. Assalaamu ‘alaika ayyuhan nabiyyu wa rohmatulloohi wa barokaatuh. Assalaaamu’alainaa wa ‘alaa ‘ibaadillaahish shoolihiin. Asyhadu allaa ilaaha illallooh wa asyhadu anna ‘abduhu warosuuluh\n\nAlloohumma sholli ‘alaa Muhammad wa ‘alaa aali Muhammad kamaa shollaita ‘alaa Ibroohim wa ‘alaa aali Ibroohimm innaka hamiidum majiid. Alloohumma baarik ‘alaa Muhammad wa ‘alaa aali Muhammad kamaa baarokta ‘alaa Ibroohim wa ‘alaa aali Ibroohimm innaka hamiidum majiid.",
      "bacaanPendek": "Attahiyyatu lillaah wash sholawaatu wath thoyyibaat.",
      "arabnya": "التَّحِيَّاتُ لِلَّهِ وَالصَّلَوَاتُ وَالطَّيِّبَاتُ ، السَّلاَمُ عَلَيْكَ أَيُّهَا النَّبِىُّ وَرَحْمَةُ اللَّهِ وَبَرَكَاتُهُ ، السَّلاَمُ عَلَيْنَا وَعَلَى عِبَادِ اللَّهِ الصَّالِحِينَ ، أَشْهَدُ أَنْ لاَ إِلَهَ إِلاَّ اللَّهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهُ وَرَسُولُهُ\n\n اَللَّهُمَّ صَلِّ عَلىَ مُحَمَّدٍ وَعَلىَ آلِ مُحَمَّدٍ كَماَ صَلَّيْتَ عَلىَ إِبْرَاهِيْمَ وَعَلىَ آلِ إِبْرَاهِيْمَ إِنـَّكَ حَمِيْدٌ مَجِيْدٌ اَللَّهُمَّ باَرِكْ عَلىَ مُحَمَّدٍ وَعَلىَ آلِ مُحَمَّدٍ كَماَ باَرَكْتَ عَلىَ إِبْرَاهِيْمَ وَعَلىَ آلِ إِبْرَاهِيْمَ إِنـَّكَ حَمِيْدٌ مَجِيْدٌ  ",
      "gerakan": "Tasyadud Akhir",
      "picture": "dudukantara.png",
      "keterangan" : ""
    },
    {
      "bacaan": "Assalaamu’alaikum warohmatulloohi wabarookaatuh",
      "bacaanPendek": "Assalaamu’alaikum warohmatulloohi wabarookaatuh",
      "arabnya": "السَّلاَمُ عَلَيْكُمْ وَرَحْمَةُ اللَّهِ وَ بَرَكَاتُهُ",
      "gerakan": "Salam",
      "picture": "salam.png",
      "keterangan" : ""
    },
  ];

  listTataCara() async {
    for (var i = 0; i < dataTataCara.length; i++) {
      final dataTata = dataTataCara[i];
      final String picture = dataTata["picture"];
      tataCaraShalat.add(Container(
          height: 30.0,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => DetailBacaan(
                    gerakan: dataTata["gerakan"], bacaan: dataTata["bacaan"], picture: picture, arabnya: dataTata["arabnya"], keterangan: dataTata["keterangan"]),
              )),
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
                          borderRadius: BorderRadius.circular(0),
                          child: Image(image: AssetImage("img/$picture")),
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
                                dataTata["gerakan"],
                                style: TextStyle(
                                    color: const Color(0xFF000000),
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    fontFamily: 'Roboto',
                                    fontSize: 17),
                              ),
                              Padding(padding: EdgeInsets.all(1.0)),
                              Flexible(
                                child: Text(
                                  dataTata["bacaanPendek"],
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
              )),
            ),
          )));
    }
  }

  @override
  void initState() {
    listTataCara();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF6F6F6),
          title: Text("Tata Cara Shalat", style: TextStyle(
            color: Colors.black,
            fontSize: 16.0),
          ),
          leading: IconButton(
            icon: Image.asset('img/back.png'), 
            onPressed: () => Navigator.of(context).pop(false),  
          ),
          elevation: 0.0,
        ),
        body: Container(
        color: const Color(0xFFF6F6F6),
        child: Padding(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // NIAT NIH
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              child : InkWell (
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Niat(
                    niat: widget.niat, gambarNiat: widget.gambarNiat,),
              )),
              child: Container(
                height: 88.0,
                child: Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Container(
                          width: 190.0,
                          margin: EdgeInsets.all(15),
                          child: Image.asset("img/berdiri.png"),
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
                                "Niat",
                                style: TextStyle(
                                    color: const Color(0xFF000000),
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    fontFamily: 'Roboto',
                                    fontSize: 17),
                              ),
                              Padding(padding: EdgeInsets.all(1.0)),
                              Flexible(
                                child: Text(
                                  "${widget.gambarNiat}",maxLines: 2,
                                  style: TextStyle(
                                      color: const Color(0xFF565656),
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.normal,
                                      fontFamily: 'Roboto',
                                      fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ),
            Expanded(
              child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 1,
                  childAspectRatio: (3.5 / 1),
                  children: tataCaraShalat),
            ),
            SizedBox(height: 7.0),
            // Center(
            //   child: Text("Revaldo Putra", 
            //     style: TextStyle(
            //       color: Colors.grey[300],
            //       fontStyle: FontStyle.normal,
            //       fontSize: 10),),
            // ),
          ],
        ),
      ),
    ));
  }
}
