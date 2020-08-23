import 'package:flutter/material.dart';
import 'package:hello_world/tata_cara_shalat.dart';

class Detail extends StatefulWidget {
  Detail(
      {this.judul,
      this.nama,
      this.gambar,
      this.deskripsi1,
      this.judul1,
      this.penjelasan1,
      this.judul2,
      this.penjelasan2,
      this.juduldoa,
      this.doa,
      this.latin,
      this.arti,
      this.tabel1,
      this.tabel2,
      this.niat,
      this.gambarNiat});
  final String judul;
  final String nama;
  final String gambar;
  final String deskripsi1;
  final String judul1;
  final String judul2;
  final String penjelasan1;
  final String penjelasan2;
  final String juduldoa;
  final String doa;
  final String latin;
  final String arti;
  final String tabel1;
  final String tabel2;
  final String niat;
  final String gambarNiat;

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 400.0,
              iconTheme: IconThemeData(
                color: Colors.black, //change your color here
              ),
              floating: true,
              pinned: true,
              backgroundColor: const Color(0xFFF6F6F6),
              leading: IconButton(
                icon: Image.asset('img/back.png'),
                onPressed: () => Navigator.of(context).pop(false),
              ),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: const EdgeInsets.all(22.0)),
                    Text(
                      "${widget.judul}",
                      style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'Roboto',
                          fontSize: 16),
                    ),
                  ],
                ),
                background: Image.asset(
                  "img/${widget.gambar}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: Container(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 8,
                            child: Container(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                  Text("Shalat Sunah"),
                                  Text(
                                    "${widget.nama}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontStyle: FontStyle.normal,
                                        fontFamily: 'Roboto',
                                        fontSize: 27),
                                  ),
                                ])),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 57,
                              child: Card(
                                color: Color(0xFFF8C2D2),
                                semanticContainer: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                child: IconButton(
                                  icon: new Icon(
                                    Icons.directions,
                                    size: 30.0,
                                    color: Colors.white,
                                  ),
                                  onPressed: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          TataCara(
                                              nama: widget.nama,
                                              niat: widget.niat,
                                              gambarNiat: widget.gambarNiat),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(padding: const EdgeInsets.all(10.0)),
                      Text("${widget.deskripsi1}"),
                      Padding(padding: const EdgeInsets.all(10.0)),
                      Text(
                        "${widget.judul1}",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'Roboto',
                            fontSize: 12),
                      ),
                      Text("${widget.penjelasan1}"),
                      Text(
                        "${widget.judul2}",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'Roboto',
                            fontSize: 12),
                      ),
                      Text("${widget.penjelasan2}"),
                      Padding(
                        padding: EdgeInsets.all(5),
                      ),
                      Text(
                        "${widget.doa}",
                        style: TextStyle(
                            color: const Color(0xFF565656),
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'Roboto',
                            fontSize: 13),
                      ),
                    // ignore: unrelated_type_equality_checks
                    if ({widget.latin}.length == 0)
                      Container()
                    else
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        color: const Color(0xFFFFFFFF),
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "${widget.latin}",
                                  style: TextStyle(
                                      color: const Color(0xFF565656),
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontFamily: 'Roboto',
                                      fontSize: 13),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5),
                                ),
                                // Text(
                                //   "Arti",
                                //   style: TextStyle(
                                //       color: const Color(0xFF565656),
                                //       fontWeight: FontWeight.w700,
                                //       fontStyle: FontStyle.normal,
                                //       fontFamily: 'Roboto',
                                //       fontSize: 13),
                                // ),
                                // Text(
                                //   "${widget.arti}",
                                //   style: TextStyle(
                                //       color: const Color(0xFF565656),
                                //       fontWeight: FontWeight.w400,
                                //       fontStyle: FontStyle.normal,
                                //       fontFamily: 'Roboto',
                                //       fontSize: 13),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
