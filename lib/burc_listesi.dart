import 'package:flutter/material.dart';
import 'package:horoscope_guide/card_style.dart';
import 'package:horoscope_guide/data/strings.dart';

import 'model/burc.dart';

class BurcListesi extends StatelessWidget {
  late final List<Burc> tumBurclar;

  BurcListesi({Key? key}) : super(key: key) {
    tumBurclar = veriKaynaginiHazirla();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Burçlar Listesi',
        style:  TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 1, 21, 58))),
        elevation: 8,centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            //return BurcItem(listelenenBurc: tumBurclar[index]);
            return GestureDetector(onTap: () {
              Navigator.pushNamed(context, '/burcDetay',
                  arguments: tumBurclar[index]);
            },
              child: CardStyle(
                  title: tumBurclar[index].burcAdi,
                  subtitle: tumBurclar[index].burcTarihi,
                  image: "images/"+tumBurclar[index].burcKucukResim),
            );
          },
          itemCount: tumBurclar.length,
        ),
      ),
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> gecici = [];

    for (int i = 0; i < 12; i++) {
      var burcAdi = Strings.BURC_ADLARI[i];
      var burcTarih = Strings.BURC_TARIHLERI[i];
      var burcDetay = Strings.BURC_GENEL_OZELLIKLERI[i];
      //koc1.png değerini olusturmak  Koc --> koc --> koc1.png
      var burcKucukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + '${i + 1}.png';
      //koc_buyuk1.png
      var burcBuyukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + '_buyuk' + '${i + 1}.png';
      Burc eklenecekBurc =
          Burc(burcAdi, burcTarih, burcDetay, burcKucukResim, burcBuyukResim);
      gecici.add(eklenecekBurc);
    }
    return gecici;
  }
}
