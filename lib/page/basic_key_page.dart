import 'package:flutter/material.dart';
import 'package:key_value_example/main.dart';
import 'package:key_value_example/utils.dart';

class BasicKeyPage extends StatefulWidget {
  @override
  _BasicKeyPageState createState() => _BasicKeyPageState();
}

class _BasicKeyPageState extends State<BasicKeyPage> {
  bool showEmail = true;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: Utils.heightBetween(
                [
                  if (showEmail)
                    TextField(
                      key: ValueKey(MyObject(1)),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                  TextField(
                    key: ValueKey(MyObject(2)),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                    ),
                  ),
                ],
                height: 16,
              ),
            ),
          ),
        ),
        floatingActionButton: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
          ),
          icon: Icon(Icons.visibility_off),
          label: Text('Remove Email'),
          onPressed: () => setState(() => showEmail = false),
        ),
      );
}

class MyObject {
  final int number;

  const MyObject(this.number);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyObject &&
          runtimeType == other.runtimeType &&
          number == other.number;

  @override
  int get hashCode => number.hashCode;
}
