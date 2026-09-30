import 'package:flutter/material.dart';

import 'food_item.dart';
import 'detail_page.dart';


class HomePage extends StatelessWidget {
  final List<FoodItem> foods;
  final VoidCallback onChanged;

  const HomePage({super.key, required this.foods, required this.onChanged});

  Future<void> _openDetail(BuildContext context, FoodItem food) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => DetailPage(food: food)),
    );
    onChanged(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menu Resto')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: foods.length,
        itemBuilder: (context, index) {
          final food = foods[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: InkWell(
              onTap: () => _openDetail(context, food),
              child: SizedBox(
                height: 130,
                child: Row(
                  children: [
                    Image.network(
                      food.imageUrl,
                      width: 110,
                      height: 130,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        width: 110,
                        color: Colors.orange.shade100,
                        child: const Icon(Icons.fastfood, color: Colors.orange),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              food.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              food.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.grey),
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '${food.quantity} porsi',
                                      style: const TextStyle(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Rp ${food.formattedPrice} / porsi',
                                      style: const TextStyle(
                                          fontSize: 11, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Rp ${food.formattedTotal}',
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
