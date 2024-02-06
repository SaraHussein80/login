import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/nav_bar_screens/nav_categories.dart';
import 'package:login/nav_bar_screens/nav_main.dart';
import 'package:login/nav_bar_screens/nav_setting.dart';
import 'package:login/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  final String disName;
  final String disPass;
  const HomeScreen({Key? key, required this.disName, required this.disPass})
      : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  List<Widget> pages = [
    MainScreen(),
    CategoreScreen(),
    SettingScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width / 2,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }));
              },
              child: Column(
                children: [
                  Text(
                    'Email : ${this.widget.disName}',
                    style: GoogleFonts.robotoCondensed(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Password: ${this.widget.disPass}',
                    style: GoogleFonts.robotoCondensed(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.exit_to_app),
                      Text(
                        "LogOut",
                        style: GoogleFonts.robotoCondensed(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue),
      ),
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: onnavBarTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Bookmarks"),
          BottomNavigationBarItem(
              icon: Icon(Icons.data_array), label: "Details"),
        ],
        backgroundColor: Colors.white,
      ),
    );
  }

  onnavBarTap(int index) {
    pageIndex = index;
    setState(() {});
  }
}



