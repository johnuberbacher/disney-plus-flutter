import 'package:flutter/material.dart';

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}
// Highlighted Movies Widget
Container profiles(String imagePath, String name) {
  return Container(
    width: 100.0,
    height: 100.0,
    // width: MediaQuery.of(context).size.width * 0.85,
    margin: const EdgeInsets.symmetric(horizontal: 5.0),
    decoration: BoxDecoration(
      borderRadius: new BorderRadius.only(
        topLeft: const Radius.circular(5.0),
        topRight: const Radius.circular(5.0),
        bottomRight: const Radius.circular(5.0),
        bottomLeft: const Radius.circular(5.0),
      ),
      image: DecorationImage(
        image: AssetImage(imagePath),
        fit: BoxFit.cover,
      ),
    ),
  );
}

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            stops: [0.0, 1.0],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [_colorFromHex("2d3045"), _colorFromHex("1a1d29")]
        ),
      ),
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            new Container(
              margin: const EdgeInsets.only(bottom: 20.0, top: 1.0,),
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              height: 120.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  new Container(
                    height: MediaQuery.of(context).size.width * 0.15,
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        profiles("assets/images/profiles/1.png","name"),
                        profiles("assets/images/profiles/2.png","name"),
                        profiles("assets/images/profiles/3.png","name"),
                        profiles("assets/images/profiles/4.png","name"),
                        profiles("assets/images/profiles/5.png","name"),
                        profiles("assets/images/profiles/6.png","name"),
                        profiles("assets/images/profiles/7.png","name"),
                        profiles("assets/images/profiles/8.png","name"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            new FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: () {
                /*...*/
              },
              child: Text(
                "Edit Profiles",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}