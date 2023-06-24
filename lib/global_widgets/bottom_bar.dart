import 'package:flutter/material.dart';
import '../view/diagnostic/diagonstic_center.dart';
import '../view/doctor_screen/doctor_screen.dart';
import '../view/home/home.dart';
import '../view/more_screen/more_screen.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: SizedBox(
        height: 60,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedFontSize: 10,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Image.asset(
                  "assets/images/home.png",
                  height: 20,
                  width: 30,
                ),
              ),
              activeIcon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(12)),
                child: Image.asset(
                  "assets/images/home.png",
                  height: 20,
                  width: 30,
                ),
              ),
              label: 'হোম',
            ),
            BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Image.asset(
                    "assets/images/stetho.png",
                    height: 20,
                    width: 30,
                  ),
                ),
                activeIcon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(12)),
                  child: Image.asset(
                    "assets/images/stetho.png",
                    height: 20,
                    width: 30,
                  ),
                ),
                label: "ডাক্তার"),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Image.asset(
                  "assets/images/diagnostic.png",
                  height: 20,
                  width: 30,
                ),
              ),
              activeIcon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(12)),
                child: Image.asset(
                  "assets/images/diagnostic.png",
                  height: 20,
                  width: 30,
                ),
              ),
              label: 'ডায়গনস্টিক',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Image.asset(
                  "assets/images/more.png",
                  height: 20,
                  width: 30,
                ),
              ),
              activeIcon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(12)),
                child: Image.asset(
                  "assets/images/more.png",
                  height: 20,
                  width: 30,
                ),
              ),
              label: 'আরও',
            )
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
      body: Stack(
        children: [
          _buildOffstageNavigator(0),
          _buildOffstageNavigator(1),
          _buildOffstageNavigator(2),
          _buildOffstageNavigator(3)
        ],
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          const HomePage(),
           const DoctorScreen(),
          const Diagnostic(),
          const MoreScreen()
        ].elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);

    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name]!(context),
          );
        },
      ),
    );
  }
}
