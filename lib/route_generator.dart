

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horoscope_guide/burc_detay.dart';
import 'package:horoscope_guide/burc_listesi.dart';
import 'package:horoscope_guide/model/burc.dart';

import 'del_main_page.dart';

class RouteGenerator {
  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => BurcListesi(),
        );

      case '/burcDetay':
        final Burc secilen = settings.arguments as Burc;
        return MaterialPageRoute(
          builder: (context) => BurcDetay(secilenBurc: secilen),
        );
    }
  }
}
