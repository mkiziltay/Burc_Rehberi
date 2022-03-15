import 'package:flutter/material.dart';
import 'package:horoscope_guide/model/burc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Burçlar Listesi'),
      ),
      body: CardStyle(title: "Akrep", subtitle: "21 Nisan - 20 Haziran", image: "images/ikizler3.png"),
    );
  }
}

class CardStyle extends StatelessWidget {
  const CardStyle({
    Key? key, required this.title, required this.subtitle, required this.image,
  }) : super(key: key);

  final String? title, subtitle, image;

  @override
  Widget build(BuildContext context) {
    var myTextStyle = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size; //Size of our screen
    return Padding(
        padding: const EdgeInsets.all(14.0),
        child: Container(
          height: size.width * 0.15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(image.toString()),
                radius: 30,
              ),
              SizedBox(width: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title.toString(), style: TextStyle(color: Colors.black, fontSize: 26)),
                  Text(subtitle.toString(), style: TextStyle(color: Colors.grey, fontSize: 16)),
                ],
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios, color: Colors.pink)
            ],
          ),
        ));
  }
}
