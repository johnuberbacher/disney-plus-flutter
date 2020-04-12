import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Container IntroFeed(String imagePath) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
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
  Container Categories(String imagePath) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.18,
      margin: const EdgeInsets.symmetric(horizontal: 1.5),
      decoration: BoxDecoration(
          border: Border.all(
            color: _colorFromHex("364365"),// set border color
            width: 1.0),   // set border width
          gradient: LinearGradient(
            stops: [0.0, 1.0],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [_colorFromHex("071a47"), _colorFromHex("064a9c")],
        ),
        borderRadius: new BorderRadius.only(
          topLeft: const Radius.circular(5.0),
          topRight: const Radius.circular(5.0),
          bottomRight: const Radius.circular(5.0),
          bottomLeft: const Radius.circular(5.0),
        ),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
  Container StarWarsMovies(String imagePath) {
    return Container(
      width: 105.0,
      margin: const EdgeInsets.only(right: 10.0,),
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

  Color _colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: _colorFromHex("2d3045"),
      appBar: AppBar(
        centerTitle: true,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Image.asset('assets/images/disney_plus_logo.png',),
        backgroundColor: _colorFromHex("2d3045"),
        elevation: 0.0,
        actions: <Widget>[
          // action button
          IconButton(
            icon:
            Icon(
              Icons.cast,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            stops: [0.0, 1.0],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [_colorFromHex("2d3045"), _colorFromHex("1a1d29")]
            ),
        ),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: SingleChildScrollView(
          child: Column(
            children: [
              new Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                height: MediaQuery.of(context).size.height * 0.25,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    IntroFeed("assets/images/posters/1.jpg"),
                    IntroFeed("assets/images/posters/2.jpg"),
                    IntroFeed("assets/images/posters/3.jpg"),
                  ],
                ),
              ),
              new Container(
                height: MediaQuery.of(context).size.width * 0.15,
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Categories("assets/images/categories/disney.png"),
                    Categories("assets/images/categories/pixar.png"),
                    Categories("assets/images/categories/starwars.png"),
                    Categories("assets/images/categories/marvel.png"),
                    Categories("assets/images/categories/natgeo.png"),
                  ],
                ),
              ),
              new Container(
                margin: const EdgeInsets.only(left: 15.0, top: 20.0,),
                alignment: Alignment.centerLeft, // Align however you like (i.e .centerRight, centerLeft)
                child: Text("Recommended For You",
                    style: TextStyle(color: Colors.white.withOpacity(0.8), fontWeight: FontWeight.bold,)
                ),
              ),
              new Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                height: 160.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    StarWarsMovies("assets/images/posters/1.jpg"),
                    StarWarsMovies("assets/images/posters/2.jpg"),
                    StarWarsMovies("assets/images/posters/3.jpg"),
                    StarWarsMovies("assets/images/posters/4.jpg"),
                    StarWarsMovies("assets/images/posters/5.jpg"),
                    StarWarsMovies("assets/images/posters/6.jpg"),
                    StarWarsMovies("assets/images/posters/7.jpg"),
                    StarWarsMovies("assets/images/posters/8.jpg"),
                    StarWarsMovies("assets/images/posters/9.jpg"),
                    StarWarsMovies("assets/images/posters/10.jpg"),
                    StarWarsMovies("assets/images/posters/12.jpg"),
                  ],
                ),
              ),
              new Container(
                margin: const EdgeInsets.only(left: 15.0,),
                alignment: Alignment.centerLeft, // Align however you like (i.e .centerRight, centerLeft)
                child: Text("New to Disney+",
                    style: TextStyle(color: Colors.white.withOpacity(0.8), fontWeight: FontWeight.bold,)
                ),
              ),
              new Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                height: 160.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    StarWarsMovies("assets/images/posters/1.jpg"),
                    StarWarsMovies("assets/images/posters/2.jpg"),
                    StarWarsMovies("assets/images/posters/3.jpg"),
                    StarWarsMovies("assets/images/posters/4.jpg"),
                    StarWarsMovies("assets/images/posters/5.jpg"),
                    StarWarsMovies("assets/images/posters/6.jpg"),
                    StarWarsMovies("assets/images/posters/7.jpg"),
                    StarWarsMovies("assets/images/posters/8.jpg"),
                    StarWarsMovies("assets/images/posters/9.jpg"),
                    StarWarsMovies("assets/images/posters/10.jpg"),
                    StarWarsMovies("assets/images/posters/12.jpg"),
                  ],
                ),
              ),
              new Container(
                margin: const EdgeInsets.only(left: 15.0, top: 20.0,),
                alignment: Alignment.centerLeft, // Align however you like (i.e .centerRight, centerLeft)
                child: Text("Marvel Cinematic Universe",
                    style: TextStyle(color: Colors.white.withOpacity(0.8), fontWeight: FontWeight.bold,)
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: _colorFromHex("1a1d29"),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon:Icon(
                Icons.home,
                color: Color.fromARGB(255, 255, 255, 255)),
              title: new Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Color.fromARGB(255, 255, 255, 255)),
              title: new Text('Search'),
            ),
            BottomNavigationBarItem(
              icon:Icon(
                Icons.file_download,
                color: Color.fromARGB(255, 255, 255, 255)),
              title: new Text('Downloads'),
            ),
            BottomNavigationBarItem(
              icon:Icon(
                Icons.verified_user,
                color: Color.fromARGB(255, 255, 255, 255)),
              title: new Text('Profile'),
            ),
          ]
      )
    );
  }
}

