import 'package:flutter/material.dart';
import 'package:study_corner/drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' The Study Corner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Study Corner Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // This navigator state will be used to navigate different pages
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Study Corner",
              style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
        ),
        drawer: DrawerWidget(),
        body: Navigator(key: _navigatorKey, onGenerateRoute: generateRoute),
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("Home"),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.school), title: Text("My Exams")),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          title: Text("Explore"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more),
          title: Text("Learn"),
        )
      ],
      onTap: _onTap,
      currentIndex: _currentTabIndex,
    );
  }

  _onTap(int tabIndex) {
    switch (tabIndex) {
      case 0:
        _navigatorKey.currentState.pushReplacementNamed("Home");
        break;
      case 1:
        _navigatorKey.currentState.pushReplacementNamed("My Exams");
        break;
      case 2:
        _navigatorKey.currentState.pushReplacementNamed("Explore");
        break;
      case 2:
        _navigatorKey.currentState.pushReplacementNamed("Learn");
        break;
    }
    setState(() {
      _currentTabIndex = tabIndex;
    });
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "My Exams":
        return MaterialPageRoute(
            builder: (context) => Container(
                color: Colors.blue, child: Center(child: Text("My Exams"))));
      case "Explore":
        return MaterialPageRoute(
            builder: (context) => Container(
                color: Colors.green, child: Center(child: Text("Explore"))));
      case "Learn":
        return MaterialPageRoute(
            builder: (context) => Container(
                color: Colors.pink, child: Center(child: Text("Learn"))));          
      default:
        return MaterialPageRoute(
            builder: (context) => Container(
                color: Colors.white, child: Center(child: Text("Home"))));
    }
  }
}
