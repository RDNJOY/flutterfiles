import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> dishes = const [
    {
      "name": "Chicken Biryani",
      "price": "\$7.99",
      "image": "assets/images/food.png"
    },
    {
      "name": "Beef Curry",
      "price": "\$8.49",
      "image": "assets/images/food.png"
    },
    {
      "name": "Veg Thali",
      "price": "\$5.99",
      "image": "assets/images/food.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("🍽️ Rudra Restaurant"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dishes.length,
          itemBuilder: (context, index) {
            final dish = dishes[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      dish["image"],
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      dish["name"],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      dish["price"],
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.deepOrange,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Ordering ${dish["name"]}")),
                        );
                      },
                      child: const Text("Order Now"),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
