import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Hakkimizda extends StatefulWidget {
  @override
  _HakkimizdaState createState() => _HakkimizdaState();
}

class _HakkimizdaState extends State<Hakkimizda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("HAKKIMIZDA",style: GoogleFonts.davidLibre(),),
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Text(
          "Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen 3006881 kodlu MOBİL PROGRAMLAMA dersi kapsamında 173006005 numaralı Çağatay Murat YILDIZ tarafından 25 Haziran 2021 günü yapılmıştır.",
          style: GoogleFonts.thasadith(fontWeight: FontWeight.bold,fontSize: 30),
        ),
      ),
    );
  }
}
