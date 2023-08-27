import 'package:flutter/material.dart';
import '../utils/text.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launch_on;

  const Description(
      {Key? key,
      required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launch_on})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: (Colors.black),
      ),
      body: Container(
        child: ListView(children: [
          SizedBox(
              height: 250,
              child: Stack(children: [
                Positioned(
                  child: SizedBox(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerurl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    child: modified_text(
                      text: '⭐ Calificación Media - ' + vote,
                      size: 18,
                    )),
              ])),
          const SizedBox(height: 15),
          Container(
              padding: const EdgeInsets.all(10),
              child: modified_text(
                  text: name != null ? name : 'Not Loaded', size: 30)),
          Container(
              padding: const EdgeInsets.only(left: 10),
              child: modified_text(
                  text: 'Fecha de Salida - ' + launch_on, size: 16)),
          Row(
            children: [
              Container(
                height: 200,
                width: 100,
                child: Image.network(posterurl),
              ),
              Flexible(
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: modified_text(text: description, size: 20)),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
