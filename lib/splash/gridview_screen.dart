import 'package:flutter/material.dart';

class GridViewScreen extends StatefulWidget {
  const GridViewScreen({super.key});

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Grid View',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: GridView.builder(
          itemCount: 80,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4),
          itemBuilder: (context, index) {
            return ListTile(
              title: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                    'https://randomuser.me/api/portraits/thumb/men/81.jpg'),
              ),
              subtitle: const Text('Happy'),
            );
          }),
    );
  }
}
