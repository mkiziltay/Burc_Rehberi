import 'package:flutter/material.dart';
import 'package:horoscope_guide/model/burc.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  final Burc secilenBurc;
  const BurcDetay({required this.secilenBurc, Key? key}) : super(key: key);

  @override
  _BurcDetayState createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appbarRengi = Colors.transparent;
  late PaletteGenerator _generator;

  @override
  void initState() {
    super.initState();

    print('init state ');
    WidgetsBinding.instance!.addPostFrameCallback((_) => appbarRenginiBul());
    // _generator = PaletteGenerator.fromImageProvider(AssetImage(assetName));
  }

  @override
  Widget build(BuildContext context) {
    print('build ');
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 250,
          pinned: true,
          backgroundColor: appbarRengi,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(widget.secilenBurc.burcAdi + " Burcu ve Özellikleri"),
            centerTitle: true,
            background: Image.asset(
              'images/' + widget.secilenBurc.burcBuyukResim,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Text(
                widget.secilenBurc.burcDetayi,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ),
        ),
      ],
    ));
  }

  void appbarRenginiBul() async {
    print('build bitti baskın renk bulunacak');
    _generator = await PaletteGenerator.fromImageProvider(
        AssetImage('images/${widget.secilenBurc.burcBuyukResim}'));
    appbarRengi = _generator.vibrantColor!.color;
    print('baskın renk bulundu build metotu tekrar calıstırılacak');
    setState(() {});
    // print(appbarRengi); //print generated appBar color
  }
}
