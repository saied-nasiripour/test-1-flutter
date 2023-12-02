import 'package:first_task/features/delete_feature/presentation/screens/delete_page.dart';
import 'package:first_task/features/home_feature/presentation/provider/home_provider.dart';
import 'package:first_task/features/home_feature/presentation/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({Key? key}) : super(key: key);

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const Border(
            bottom: BorderSide(
              color: Colors.black,
              width: 2,
            )),
        leadingWidth: 90,
        leading: Row(
          children: [
            SizedBox(
              width: 40,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
            ),
            const SizedBox(width: 5),
            const SizedBox(
                width: 40,
                child: Text("Home")
            ),
          ],
        ),
        actions: [
          const Text("Delete"),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => const DeletePage()));
            },
            icon: const Icon(Icons.arrow_forward_ios_rounded),
          )
        ],
      ),
      body: Consumer<HomeProvider>(
        builder: (BuildContext context, HomeProvider homeProvider, Widget? child) {
          final displayValue = homeProvider.counter > 0
              ? homeProvider.counter.toString()
              : 'There is no data in the Local Storage';
          return Center(
            child: Column(
              children: [
                Text(
                  displayValue,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    homeProvider.incrementCounter();
                  },
                  child: const Text("Update"),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
