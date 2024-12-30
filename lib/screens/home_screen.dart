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
        "image": "https://lartbr.com.br/wp-content/uploads/2024/01/IMG_8557.jpg"
      },
      {
        "title": "Ford Mustang 1967",
        "image": "https://thegarage.com.br/wp-content/uploads/2018/03/IMG_9791.jpg"
      },
    ],
    "Luxo": [
      {
        "title": "Rolls Royce Phantom",
        "image": "https://www.agoramotors.com.br/wp-content/uploads/2024/11/rolls-royce-phantom-2025-na-diagonal-preto.jpg"
      },
      {
        "title": "Bentley Continental",
        "image": "https://soveiculos.com.br/wp-content/uploads/2024/06/Bentley-Continental-2025.jpg"
      },
    ],
    "Esportivos": [
      {
        "title": "Ferrari F8",
        "image": "https://s2-autoesporte.glbimg.com/PJVx-woD-SAuruWKPoO1KvmeTfg=/0x0:620x413/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_cf9d035bf26b4646b105bd958f32089d/internal_photos/bs/2020/8/g/Sux9niQ3AYKbeLGaHiAg/2019-02-28-ferrari-f8-tributo-2020-1600-01.jpg"
      },
      {
        "title": "Lamborghini Huracan",
        "image": "https://www.lamborghini.com/sites/it-en/files/DAM/lamborghini/facelift_2019/model_gw/huracan/2023/09_18_refresh/s/gw_hura_s_02_m.jpg"
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
