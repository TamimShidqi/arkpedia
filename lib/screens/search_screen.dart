import 'package:flutter/material.dart';
import 'package:arkpedia/data/operator_data.dart';
import 'package:arkpedia/models/operator.dart';
import 'package:arkpedia/screens/detail_screen.dart';

class SearchScreen extends StatefulWidget {
  final List<Operator> allOperator;

  SearchScreen({required this.allOperator});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<Operator> _searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 34, 34, 34),
        automaticallyImplyLeading: false,
        title: Text(
          'Search',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration:const InputDecoration(
                labelText: 'Type in operator name. .',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: _performSearch,
            ),
          ),
          Expanded(
            child: _buildSearchResults(),
          ),
        ],
      ),
    );
  }

  void _performSearch(String query) {
    setState(() {
      _searchResults = widget.allOperator
          .where((Operator) =>
              Operator.kelas.toLowerCase().contains(query.toLowerCase()) ||
              Operator.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  Widget _buildSearchResults() {
    return ListView.builder(
      itemCount: _searchResults.length,
      itemBuilder: (context, index) {
        final Operator result = _searchResults[index];
        return ListTile(
          title: Text(result.name),
          subtitle: Text(result.kelas),
          onTap: () {
            print("Tapped on: ${result.name}");
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailScreen(operator: result)),
            );
          },
        );
      },
    );
  }
}
