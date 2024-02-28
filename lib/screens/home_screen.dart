import 'package:arkpedia/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:arkpedia/data/operator_data.dart';
import 'package:arkpedia/models/operator.dart';
import 'package:arkpedia/screens/favorite_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Operator> favoriteOperatorList = [];

  void _toggleFavorite(int index) {
    setState(() {
      final Operator operator = operatorList[index];
      if (operator.isFavorite) {
        favoriteOperatorList.remove(operator);
      } else {
        favoriteOperatorList.add(operator);
      }
      operator.isFavorite = !operator.isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 54, 54, 54),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 34, 34, 34),
        automaticallyImplyLeading: false,
        title: Text(
          'ARKPEDIA',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoriteScreen(
                    favoriteOperatorList: favoriteOperatorList,
                  ),
                ),
              );
            },
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 15.0,
          ),
          itemBuilder: (context, index) {
            final Operator operator = operatorList[index];
            final bool isFavorite = favoriteOperatorList.contains(operator);

            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(operator: operator),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 102, 0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Image.network(
                        operator.gambar,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        color: const Color.fromARGB(255, 255, 102, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                _toggleFavorite(index);
                              },
                              icon: Icon(
                                isFavorite ? Icons.favorite : Icons.favorite_border,
                                color: isFavorite ? const Color.fromARGB(255, 0, 0, 0) : Colors.grey,
                              ),
                            ),
                            Text(
                              operator.name,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: operatorList.length,
        ),
      ),
    );
  }
}