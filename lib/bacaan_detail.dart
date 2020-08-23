import 'package:flutter/material.dart';

class DetailBacaan extends StatefulWidget {
  DetailBacaan({this.gerakan, this.bacaan, this.picture, this.arabnya, this.keterangan});
  final String gerakan;
  final String bacaan;
  final String picture;
  final String arabnya;
  final String keterangan;

  @override
  _DetailBacaanState createState() => _DetailBacaanState();
}

class _DetailBacaanState extends State<DetailBacaan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F6F6),
        title: Text(
          "${widget.gerakan}",
          style: TextStyle(color: Colors.black, fontSize: 16.0),
        ),
        leading: IconButton(
          icon: Image.asset('img/back.png'),
          onPressed: () => Navigator.of(context).pop(false),
        ),
        elevation: 0.0,
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: ListView(
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                color: const Color(0xFFA4A4A4),
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(0.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Text(""),
                        ),
                        Expanded(
                          flex: 5,
                          child: Image.asset("img/${widget.picture}"),
                        ),
                        Expanded(
                          flex: 2,
                          child:  Text(""),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(5),),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                color: const Color(0xFFF6F6F6),
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Bacaan Arab: ", style: TextStyle(
                          color: const Color(0xFF565656),
                          fontWeight: FontWeight.w700,                          fontStyle: FontStyle.normal,
                          fontFamily: 'Roboto',
                          fontSize: 13),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            child: Text("${widget.arabnya}", style: TextStyle(
                              color: const Color(0xFF565656),
                              fontWeight: FontWeight.w400,                          fontStyle: FontStyle.normal,
                              fontFamily: 'Roboto',
                              fontSize: 13),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(2.0)),
                        Text("Latin : ", style: TextStyle(
                          color: const Color(0xFF565656),
                          fontWeight: FontWeight.w700,                          fontStyle: FontStyle.normal,
                          fontFamily: 'Roboto',
                          fontSize: 13),
                        ),
                        Text("${widget.bacaan}", style: TextStyle(
                          color: const Color(0xFF565656),
                          fontWeight: FontWeight.w400,                          fontStyle: FontStyle.normal,
                          fontFamily: 'Roboto',
                          fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Text("${widget.keterangan}", style: TextStyle(
                  color: Colors.red[400],
                  fontWeight: FontWeight.w400,                          fontStyle: FontStyle.normal,
                  fontFamily: 'Roboto',
                  fontSize: 11),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Niat extends StatefulWidget {
  Niat({this.niat, this.gambarNiat});
  final String niat;
  final String gambarNiat;

  @override
  _NiatState createState() => _NiatState();
}

class _NiatState extends State<Niat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F6F6),
        title: Text(
          "Niat Shalat",
          style: TextStyle(color: Colors.black, fontSize: 16.0),
        ),
        leading: IconButton(
          icon: Image.asset('img/back.png'),
          onPressed: () => Navigator.of(context).pop(false),
        ),
        elevation: 0.0,
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: ListView(
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                color: const Color(0xFFA4A4A4),
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(0.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Text(""),
                        ),
                        Expanded(
                          flex: 5,
                          child: Image.asset("img/niat.png"),
                        ),
                        Expanded(
                          flex: 2,
                          child:  Text(""),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(5),),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                color: const Color(0xFFF6F6F6),
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Bacaan Arab: ", style: TextStyle(
                          color: const Color(0xFF565656),
                          fontWeight: FontWeight.w700,                          
                          fontStyle: FontStyle.normal,
                          fontFamily: 'Roboto',
                          fontSize: 13),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            child: Text("${widget.niat}", style: TextStyle(
                              color: const Color(0xFF565656),
                              fontWeight: FontWeight.w400,                          fontStyle: FontStyle.normal,
                              fontFamily: 'Roboto',
                              fontSize: 13),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(2.0)),
                        Text("Latin : ", style: TextStyle(
                          color: const Color(0xFF565656),
                          fontWeight: FontWeight.w700,                          fontStyle: FontStyle.normal,
                          fontFamily: 'Roboto',
                          fontSize: 13),
                        ),
                        Text("${widget.gambarNiat}", style: TextStyle(
                          color: const Color(0xFF565656),
                          fontWeight: FontWeight.w400,                          fontStyle: FontStyle.normal,
                          fontFamily: 'Roboto',
                          fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
