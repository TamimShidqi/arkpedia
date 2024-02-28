import 'package:flutter/material.dart';
import 'package:arkpedia/models/operator.dart';
import 'package:arkpedia/screens/detail_screen.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Operator> favoriteOperatorList;

  const FavoriteScreen({Key? key, required this.favoriteOperatorList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 54, 54, 54),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 34, 34, 34),
        title: Text(
          'Favorite',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: favoriteOperatorList.length,
        itemBuilder: (context, index) {
          final Operator operator = favoriteOperatorList[index];
          return ListTile(
            leading: Image.network(
              operator.gambar,
              fit: BoxFit.cover,
              width: 50,
              height: 50,
            ),
            title: Text(
              operator.name,
              style: TextStyle(color: Colors.white),
            ),onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(operator: operator),
                ),
              );
            },
          );
        },
      ),
    );
  }
}