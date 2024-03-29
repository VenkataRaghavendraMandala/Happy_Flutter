import 'package:flutter/material.dart';

class StateScreen extends StatefulWidget {
  const StateScreen({super.key});

  @override
  State<StateScreen> createState() => _StateScreenState();
}

class _StateScreenState extends State<StateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('States'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context, 'Raghava');
              },
              icon: const Icon(Icons.done))
        ],
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return const ListTile(
          title: Text('Raghava'),
        );
      }),
    );
  }
}
