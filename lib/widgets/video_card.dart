import 'package:flutter/material.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Container(
            child: SizedBox(
              width: 300, // Define el ancho deseado
              height: 300, // Define la altura deseada
              child: Image.asset("assets/images/img1.jpg"),
              ),
            ),
          const SizedBox(
            height: 10.0,
            ),
          Row(
            children: [
              const CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage("assets/images/img2.jpg"),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Titulo del video"),
                  Text("jugando al tenis")
                ],
              )
            ],
          )
        ],
        
        ),
    );
  }
}
