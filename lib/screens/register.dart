import 'dart:convert';

import 'package:flutter/material.dart';
import 'login.dart';
import 'package:http/http.dart' as http;
import '../widgets/env.sample.dart';
import 'package:fluttertoast/fluttertoast.dart';

class KayitOl extends StatefulWidget {
  @override
  _KayitOlState createState() => _KayitOlState();
}

class _KayitOlState extends State<KayitOl> {
  TextEditingController kullaniciEmail = new TextEditingController();
  TextEditingController kullaniciSifre = new TextEditingController();

  Future register() async {
    var response = await http
        .post(Uri.parse("${SiteLink.URL_PREFIX}/admin_register.php"), body: {
      "username": kullaniciEmail.text,
      "password": kullaniciSifre.text,
    });

    var data = json.decode(response.body);

    if (data == "Error") {
      Fluttertoast.showToast(
          msg: "Kaydınız bulunmaktadır!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "Kaydınız Oluşturuldu!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Giris()));
    }
  }

  String DurumMesaji = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Hoşgeldiniz... Kayıt Yapınız!"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://banner2.cleanpng.com/20180408/wae/kisspng-computer-icons-button-user-register-button-5acad54600d9f7.0732636515232423100035.jpg"))),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                controller: kullaniciEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email adresinizi giriniz!',
                    hintText: 'yildizc49@gmail.com',
                    icon: Icon(Icons.email)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextFormField(
                controller: kullaniciSifre,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Şifreniz',
                    hintText: '123123',
                    icon: Icon(Icons.lock_clock)),
              ),
            ),
            RaisedButton(
              onPressed: () {
                var kulEmail = kullaniciEmail.text;
                var kulSifre = kullaniciSifre.text;
                setState(() {
                  DurumMesaji =
                      "ßilgileriniz : Email , $kulEmail Şifreniz, $kulSifre";
                });
              },
              child: Text(
                'Bilgilerimi Göster!',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Text("$DurumMesaji"),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  register();
                },
                child: Text(
                  'Kayıt OL !',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
          ],
        ),
      ),
    );
  }
}
