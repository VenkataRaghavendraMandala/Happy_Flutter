import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:happy/src/connectivity_services/connectivity_service.dart';
import 'package:happy/src/connectivity_services/connectivity_status.dart';
//import 'package:happy/connectivityservices/connectivity_status.dart';
//import 'package:happy/connectivityservices/connectivity_status';
//import 'package:happy/connectivityservices/connectivity_status';
//import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

//import '../connectivityservices/connectivity_status';

class ConnectivityScreen extends StatefulWidget {
  const ConnectivityScreen({super.key});

  @override
  State<ConnectivityScreen> createState() => _ConnectivityScreenState();
}

class _ConnectivityScreenState extends State<ConnectivityScreen> {
  var _connectionStatus = 'Unknown';
  late Connectivity connectivity;
  late StreamSubscription<ConnectivityResult> subscription;

  @override
  void initState() {
    super.initState();
    connectivity = Connectivity();
    subscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      _connectionStatus = result.toString();
      if (kDebugMode) {
        print(_connectionStatus);
      }
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        setState(() {});
      }
    });
    // var connectionStatus = Provider.of<ConnectivityStatus>(context);
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   var connectionStatus =
    //       Provider.of<ConnectivityStatus>(context, listen: false);
    //   if (kDebugMode) {
    //     print(connectionStatus);
    //   }
    //   if (connectionStatus == ConnectivityResult.wifi ||
    //       connectionStatus == ConnectivityResult.mobile) {
    //     setState(() {});
    //   }
    // });

    //var connectionStatus = Provider.of<ConnectivityStatus>(context);
    //   if (ConnectivityServices.isWifi() == ConnectivityResult.wifi ||
    //       ConnectivityServices.isMobile() == ConnectivityResult.mobile) {
    //     setState(() {});
    //   }
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  Future getData() async {
    http.Response response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/posts/"));
    if (response.statusCode == HttpStatus.OK) {
      var result = jsonDecode(response.body);
      return result;
    }
  }

  Future<void> refresh() async {
    // Simulate a time-consuming operation
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      //getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Connectivy")),
        body: RefreshIndicator(
          onRefresh: () => getData(),
          child: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var mydata = snapshot.data;
                return ListView.builder(
                  itemBuilder: (context, i) => ListTile(
                    title: Text(mydata[i]['title']),
                    subtitle: Text(mydata[i]['body']),
                  ),
                  itemCount: mydata.length,
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ));
  }
}
