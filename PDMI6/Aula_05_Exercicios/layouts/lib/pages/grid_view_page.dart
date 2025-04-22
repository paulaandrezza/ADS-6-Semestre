import 'package:flutter/material.dart';
import 'dart:math';

class GridViewPage extends StatelessWidget {
  final List<int> imageIds = List.generate(
    20,
    (index) => Random().nextInt(1000) + 1,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GridView com Imagens')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: imageIds.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // duas colunas
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemBuilder: (context, index) {
            final imageUrl =
                'https://picsum.photos/id/${imageIds[index]}/200/200';

            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GridTile(
                footer: Container(
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(
                    'Lorem Ipsum',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                child: Image.network(imageUrl, fit: BoxFit.cover),
              ),
            );
          },
        ),
      ),
    );
  }
}
