import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) {
        return ChangeNotifierProvider<MainPage>(
          create: (context) => MainPage(),
          child: widget,
        );
      },
      title: 'Homework Provider',
      theme: ThemeData(
        primaryColor: Colors.black,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<MainPage>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Homework Provider',
            style: TextStyle(
              color: model.appBarColor,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              width: 200,
              height: 200,
              duration: const Duration(milliseconds: 300),
              color: model.containerColor,
            ),
            const SizedBox(height: 10),
            Switch(
              value: model.isTrue,
              onChanged: (bool value) {
                model.isTrue = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MainPage with ChangeNotifier {
  Random randomColor = Random();
  bool _isTrue = false;
  Color titleColor = Colors.purple;
  Color blockColor = Colors.green;
  Color get appBarColor => titleColor;
  Color get containerColor => blockColor;
  bool get isTrue => _isTrue;
  set isTrue(bool value) {
    if (_isTrue != value) {
      _isTrue = value;
      titleColor = Color.fromRGBO(
        randomColor.nextInt(256),
        randomColor.nextInt(256),
        randomColor.nextInt(256),
        3,
      );
      blockColor = Color.fromRGBO(
        randomColor.nextInt(256),
        randomColor.nextInt(256),
        randomColor.nextInt(256),
        3,
      );
      notifyListeners();
    }
  }
}
