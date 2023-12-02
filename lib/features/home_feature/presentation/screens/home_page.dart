import 'package:first_task/features/home_feature/presentation/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const Border(
            bottom: BorderSide(
          color: Colors.black,
          width: 2,
        )),
        actions: [
          const Text("Update"),
          IconButton(
            onPressed: () {
              /*Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const UpdatePage()));*/
              Navigator.pushNamed(context, '/second');
            },
            icon: const Icon(Icons.arrow_forward_ios_rounded),
          )
        ],
      ),
      body: Consumer<HomeProvider>(
        builder: (context, counterProvider, _) {
          final displayValue = counterProvider.counter > 0
              ? counterProvider.counter.toString()
              : 'There is no data in the Local Storage';
          return Center(
            child: Text(
              displayValue,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
            ),
          );
        },
      ),
    );
  }
}
