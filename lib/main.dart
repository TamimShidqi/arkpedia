import 'package:arkpedia/models/operator.dart';
import 'package:arkpedia/screens/favorite_screen.dart';
import 'package:flutter/material.dart';
import 'package:arkpedia/data/operator_data.dart';
import 'package:arkpedia/screens/detail_screen.dart';
import 'package:arkpedia/screens/profile_screen.dart';
import 'package:arkpedia/screens/home_screen.dart';
import 'package:arkpedia/screens/search_screen.dart';
import 'package:arkpedia/screens/singin_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key}) ;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ARKPEDIA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.indigoAccent),
          titleTextStyle: TextStyle(
            color:Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent).copyWith(
          primary: Colors.indigoAccent,
          surface: Colors.indigoAccent[100],
        ),
        useMaterial3: true
      ),
      home:  SignInScreen(),
    );
  }
}

class MainScreen extends StatefulWidget{
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreen();
  
}

class _MainScreen extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget>_children = [
    HomeScreen(),
    SearchScreen(allOperator: operatorList),
    ProfileScreen(),
    FavoriteScreen(favoriteOperatorList: operatorList),
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color.fromARGB(255, 34, 34, 34),
      ),
      child: Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.favorite_border),
            //   label: 'Favorite',
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          showSelectedLabels: true,
        ),
      ),
    );
  }
}