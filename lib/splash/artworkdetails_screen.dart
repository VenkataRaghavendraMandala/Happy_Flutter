import 'package:flutter/material.dart';
import 'package:happy/model/art_works_model.dart';

class ArtWorkDetails extends StatelessWidget {
  const ArtWorkDetails({super.key, required this.artWork});

  final ArtWorksModel artWork;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Notification Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: <Widget>[
          Text(artWork.title),
        ],
      ),
    );
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
