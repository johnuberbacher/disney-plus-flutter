import 'package:flutter/material.dart';

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}
class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              stops: [0.0, 1.0],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [_colorFromHex("2d3045"), _colorFromHex("1a1d29")]
          ),
        ),
        child: Column(
          children: [
            Theme(
              data: Theme.of(context).copyWith(splashColor: Colors.transparent),
              child: TextField(
                autofocus: false,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'search...',
                  contentPadding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, bottom: 15.0, top: 15.0),
                ),
              ),
            ),
            new Container(
              margin: const EdgeInsets.only(top: 60.0,),
              alignment: Alignment.centerLeft,
              // Align however you like (i.e .centerRight, centerLeft)
              child: Text("Explore",
                  style: TextStyle(color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,)
              ),
            ),
            new Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        decoration: new BoxDecoration(color: Colors.black.withOpacity(0.2)),
                        child: Column(
                            children: <Widget>[
                              new Icon(
                                Icons.movie,
                                color: Colors.white,
                                size: 30.0,
                              ),
                              new Text("Movies",
                                  style: TextStyle(color: Colors.white.withOpacity(0.8),)),
                            ]
                        )
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      decoration: new BoxDecoration(color: Colors.black.withOpacity(0.2)),
                      child: Column(
                        children: <Widget>[
                          new Icon(
                            Icons.movie,
                            color: Colors.white,
                            size: 30.0,
                          ),
                          new Text("Movies",
                              style: TextStyle(color: Colors.white.withOpacity(0.8),)),
                        ]
                      )
                    ),
                  ),
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        decoration: new BoxDecoration(color: Colors.black.withOpacity(0.2)),
                        child: Column(
                            children: <Widget>[
                              new Icon(
                                Icons.movie,
                                color: Colors.white,
                                size: 30.0,
                              ),
                              new Text("Movies",
                                  style: TextStyle(color: Colors.white.withOpacity(0.8),)),
                            ]
                        )
                    ),
                  ),
                ]
              ),
            ),
          ],
        )
    );
  }
}