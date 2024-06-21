import 'package:flutter/material.dart';

import '../../../domain/entities/home_entity.dart';

class HomeWebLayout extends StatelessWidget {
  final Map<String, List<HomeEntity>> data;

  const HomeWebLayout({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildSection(context, 'Best Selling', data['bestSelling']!),
          buildSection(context, 'New Arrival', data['newArrival']!),
          buildSection(
              context, 'Recommended for You', data['recommendedForYou']!),
        ],
      ),
    );
  }

  Widget buildSection(
      BuildContext context, String title, List<HomeEntity> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title)
        ),
        SizedBox(
          height: 100,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  children: [
                    Image.asset(
                      items[index].image,
                    ), // Placeholder image
                    Text(items[index].name),
                    Text('\$${items[index].price.toString()}'),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
