import 'package:flutter/material.dart';

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

class Downloads extends StatefulWidget {
  @override
  _DownloadsState createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 70.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            stops: [0.0, 1.0],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [_colorFromHex("2d3045"), _colorFromHex("1a1d29")]
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 15.0,),
            child: Icon(
              Icons.file_download,
              color: Colors.white.withOpacity(0.33),
              size: 120.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 15.0,),
            child: Text(
                "You have no downloads",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white,
                  fontSize: 17.0, fontWeight: FontWeight.bold,)
            ),
          ),
          Center(
            child: Text(
                "Movies and series you download will appear here.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white.withOpacity(0.5),
                  fontSize: 15.0, fontWeight: FontWeight.bold,)
            ),
          ),
        ],
      ),
    );
  }
}