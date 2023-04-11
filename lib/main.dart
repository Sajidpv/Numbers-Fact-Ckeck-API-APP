import 'package:flutter/material.dart';
import 'package:web_functions/apis.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final numController = TextEditingController();

  String resultText = 'Enter a number to know the Fact';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Number Fact Check'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: numController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter the number'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () async {
                    if (numController.text.isNotEmpty) {
                      final result =
                          await getNumberFact(num: numController.text);
                      setState(() {
                        resultText = result.text!;
                      });
                    } else {
                      setState(() {
                        resultText = 'Enter a Valid Number to Find the Fact';
                      });
                    }
                  },
                  child: const Text('Get Fact')),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(resultText),
            ),
          ],
        ),
      ),
    );
  }
}
