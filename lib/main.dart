import 'package:akademix_student/ui/calendar_page.dart';
import 'package:akademix_student/ui/home_page.dart';
import 'package:akademix_student/ui/nested/child_page.dart';
import 'package:akademix_student/ui/nested/second_child_page.dart';
import 'package:akademix_student/ui/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_selectedIndex].currentState.maybePop();
        print(isFirstRouteInCurrentTab.toString());
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          items: [
            /// first
            BottomNavigationBarItem(
                title: Text('home'),
                activeIcon: Icon(
                  Icons.home,
                ),
                icon: Icon(
                  Icons.home,
                )),

            /// two
            BottomNavigationBarItem(
                title: Text('profile'),
                activeIcon: Icon(
                  Icons.ac_unit,
                ),
                icon: Icon(
                  Icons.ac_unit,
                )),

            /// three
            BottomNavigationBarItem(
                title: Text('home'),
                activeIcon: Icon(
                  Icons.accessibility,
                ),
                icon: Icon(
                  Icons.accessibility,
                )),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        appBar: AppBar(
          toolbarHeight: 150,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Aji Syahroni'),
              Image.network(
                'https://semantic-ui.com/images/avatar2/large/elyse.png',
                height: 70,
              ),
            ],
          ),
        ),
        body: Stack(
          children: [for (int i = 0; i < 3; i++) _buildOffstageNavigator(i)],
        ),
      ),
    );
  }

  void _next() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return SecondChildPage();
      },
    ));
  }

  Map<String, WidgetBuilder> _routeBuilder(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          HomePage(),
          CalendarPage(
            onNext: _next,
          ),
          ProfilePage()
        ].elementAt(index);
      }
    };
  }

  Widget _buildOffstageNavigator(int index) {
    var routeBuilder = _routeBuilder(context, index);
    print(routeBuilder);

    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSetting) {
          return MaterialPageRoute(
            builder: (context) => routeBuilder[routeSetting.name](context),
          );
        },
      ),
    );
  }
}
