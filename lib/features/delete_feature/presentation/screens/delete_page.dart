import 'package:first_task/features/home_feature/presentation/provider/home_provider.dart';
import 'package:first_task/features/update_feature/presentation/screens/update_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeletePage extends StatefulWidget {
  const DeletePage({Key? key}) : super(key: key);

  @override
  _DeletePageState createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const Border(
            bottom: BorderSide(
              color: Colors.black,
              width: 2,
            )),
        leadingWidth: 100,
        leading: Row(
          children: [
            SizedBox(
              width: 40,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context,
                      MaterialPageRoute(
                          builder: (context) => const UpdatePage()));
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
            ),
            const SizedBox(width: 5),
            const SizedBox(
                width: 50,
                child: Text("Update")
            ),
          ],
        ),
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
                    homeProvider.resetCounter();
                  },
                  child: const Text("Delete"),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
