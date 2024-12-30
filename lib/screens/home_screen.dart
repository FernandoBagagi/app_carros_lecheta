import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final Map<String, List<Map<String, String>>> carData = {
    "Clássicos": [
      {
        "title": "Chevrolet Bel Air",
        "image": "https://quatrorodas.abril.com.br/wp-content/uploads/2024/02/FiatMobiLikeMY245.jpg"
      },
      {
        "title": "Ford Mustang 1967",
        "image": "https://quatrorodas.abril.com.br/wp-content/uploads/2024/02/FiatMobiLikeMY245.jpg"
      },
    ],
    "Luxo": [
      {
        "title": "Rolls Royce Phantom",
        "image": "https://quatrorodas.abril.com.br/wp-content/uploads/2024/02/FiatMobiLikeMY245.jpg"
      },
      {
        "title": "Bentley Continental",
        "image": "https://quatrorodas.abril.com.br/wp-content/uploads/2024/02/FiatMobiLikeMY245.jpg"
      },
    ],
    "Esportivos": [
      {
        "title": "Ferrari F8",
        "image": "https://quatrorodas.abril.com.br/wp-content/uploads/2024/02/FiatMobiLikeMY245.jpg"
      },
      {
        "title": "Lamborghini Huracan",
        "image": "https://quatrorodas.abril.com.br/wp-content/uploads/2024/02/FiatMobiLikeMY245.jpg"
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Carros"),
          bottom: TabBar(
            tabs: [
              Tab(text: "Clássicos"),
              Tab(text: "Luxo"),
              Tab(text: "Esportivos"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildListView("Clássicos"),
            buildListView("Luxo"),
            buildListView("Esportivos"),
          ],
        ),
      ),
    );
  }

  Widget buildListView(String category) {
    final items = carData[category]!;
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Card(
          margin: EdgeInsets.all(10),
          child: ListTile(
            leading: Image.network(
              item["image"]!,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(item["title"]!),
          ),
        );
      },
    );
  }

}
