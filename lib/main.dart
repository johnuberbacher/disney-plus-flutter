import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'profile.dart';
import 'downloads.dart';
import 'search.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // Application Root
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: _colorFromHex("1a1d29"),
      statusBarColor: _colorFromHex("2d3045"),
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();

}
// Highlighted Movies Widget
Container Highlighted(String imagePath) {
  return Container(
    width: 350.0,
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
// Categories List Widget
Container Categories(String imagePath) {
  return Container(
    width: 65.0,
    //width: MediaQuery.of(context).size.width * 0.18,
    margin: const EdgeInsets.symmetric(horizontal: 1.0),
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
// Star Wars Movies Widget
Container StarWarsMovies(String imagePath) {
  return Container(
    width: 105.0,
    margin: const EdgeInsets.only(left: 15.0,),
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
// Marvel Movies Widget
Container MarvelMovies(String imagePath) {
  return Container(
    width: 105.0,
    margin: const EdgeInsets.only(left: 15.0,),
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

class _MyHomePageState extends State<MyHomePage> {

  int bottomSelectedIndex = 0;

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          title: new Text('Home')
      ),
      BottomNavigationBarItem(
        icon: new Icon(Icons.search),
        title: new Text('Search'),
      ),
      BottomNavigationBarItem(
        icon: new Icon(Icons.file_download),
        title: new Text('Downloads'),
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.account_circle ),
          title: Text('Profile')
      )
    ];
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        Home(),
        Search(),
        Downloads(),
        Profile(),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
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
      body: buildPageView(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: _colorFromHex("1a1d29"),
        type: BottomNavigationBarType.fixed,
        currentIndex: bottomSelectedIndex,
        onTap: (index) {
          bottomTapped(index);
        },
        items: buildBottomNavBarItems(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            stops: [0.0, 1.0],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [_colorFromHex("2d3045"), _colorFromHex("1a1d29")]
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            new Container(
              margin: const EdgeInsets.only(bottom: 20.0, top: 1.0,),
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              height: MediaQuery.of(context).size.height * 0.25,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Highlighted("assets/images/posters/highlighted/1.jpg"),
                  Highlighted("assets/images/posters/highlighted/2.jpg"),
                  Highlighted("assets/images/posters/highlighted/3.jpg"),
                  Highlighted("assets/images/posters/highlighted/4.jpg"),
                  Highlighted("assets/images/posters/highlighted/5.jpg"),
                  Highlighted("assets/images/posters/highlighted/6.jpg"),
                ],
              ),
            ),
            new Container(
              height: MediaQuery.of(context).size.width * 0.15,
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
              height: 160.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  StarWarsMovies("assets/images/posters/starwars/1.jpg"),
                  StarWarsMovies("assets/images/posters/starwars/2.jpg"),
                  StarWarsMovies("assets/images/posters/starwars/3.jpg"),
                  StarWarsMovies("assets/images/posters/starwars/4.jpg"),
                  StarWarsMovies("assets/images/posters/starwars/5.jpg"),
                  StarWarsMovies("assets/images/posters/starwars/6.jpg"),
                  StarWarsMovies("assets/images/posters/starwars/7.jpg"),
                  StarWarsMovies("assets/images/posters/starwars/8.jpg"),
                  StarWarsMovies("assets/images/posters/starwars/9.jpg"),
                  StarWarsMovies("assets/images/posters/starwars/10.jpg"),
                  StarWarsMovies("assets/images/posters/starwars/11.jpg"),
                ],
              ),
            ),
            new Container(
              margin: const EdgeInsets.only(left: 15.0,),
              alignment: Alignment.centerLeft, // Align however you like (i.e .centerRight, centerLeft)
              child: Text("Marvel Cinematic Universe",
                  style: TextStyle(color: Colors.white.withOpacity(0.8), fontWeight: FontWeight.bold,)
              ),
            ),
            new Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              height: 160.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  MarvelMovies("assets/images/posters/marvel/1.jpg"),
                  MarvelMovies("assets/images/posters/marvel/2.jpg"),
                  MarvelMovies("assets/images/posters/marvel/3.jpg"),
                  MarvelMovies("assets/images/posters/marvel/4.jpg"),
                  MarvelMovies("assets/images/posters/marvel/5.jpg"),
                  MarvelMovies("assets/images/posters/marvel/6.jpg"),
                  MarvelMovies("assets/images/posters/marvel/7.jpg"),
                  MarvelMovies("assets/images/posters/marvel/8.jpg"),
                  MarvelMovies("assets/images/posters/marvel/9.jpg"),
                  MarvelMovies("assets/images/posters/marvel/10.jpg"),
                  MarvelMovies("assets/images/posters/marvel/11.jpg"),
                ],
              ),
            ),
            new Container(
              margin: const EdgeInsets.only(left: 15.0,),
              alignment: Alignment.centerLeft, // Align however you like (i.e .centerRight, centerLeft)
              child: Text("Pixar Animation",
                  style: TextStyle(color: Colors.white.withOpacity(0.8), fontWeight: FontWeight.bold,)
              ),
            ),
            new Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              height: 160.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  MarvelMovies("assets/images/posters/marvel/1.jpg"),
                  MarvelMovies("assets/images/posters/marvel/2.jpg"),
                  MarvelMovies("assets/images/posters/marvel/3.jpg"),
                  MarvelMovies("assets/images/posters/marvel/4.jpg"),
                  MarvelMovies("assets/images/posters/marvel/5.jpg"),
                  MarvelMovies("assets/images/posters/marvel/6.jpg"),
                  MarvelMovies("assets/images/posters/marvel/7.jpg"),
                  MarvelMovies("assets/images/posters/marvel/8.jpg"),
                  MarvelMovies("assets/images/posters/marvel/9.jpg"),
                  MarvelMovies("assets/images/posters/marvel/10.jpg"),
                  MarvelMovies("assets/images/posters/marvel/11.jpg"),
                ],
              ),
            ),
            new Container(
              margin: const EdgeInsets.only(left: 15.0,),
              alignment: Alignment.centerLeft, // Align however you like (i.e .centerRight, centerLeft)
              child: Text("National Geographic",
                  style: TextStyle(color: Colors.white.withOpacity(0.8), fontWeight: FontWeight.bold,)
              ),
            ),
          ],
        ),
      ),
    );
  }
}

