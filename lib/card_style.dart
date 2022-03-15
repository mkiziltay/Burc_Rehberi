import 'package:flutter/material.dart';

class CardStyle extends StatelessWidget {
  const CardStyle({
    Key? key, required this.title, required this.subtitle, required this.image,
  }) : super(key: key);

  final String? title, subtitle, image;

  @override
  Widget build(BuildContext context) {

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
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title.toString(), style: const TextStyle(color: Colors.black, fontSize: 26)),
                  Text(subtitle.toString(), style: const TextStyle(color: Colors.grey, fontSize: 16)),
                ],
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios, color: Colors.pink)
            ],
          ),
        ));
  }
}
