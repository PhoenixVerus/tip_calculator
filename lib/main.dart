import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final billTextField = TextEditingController();
  double _bill = 0;
  double _tipRate = 0.15;
  double _tip = 0;
  bool greatService = false;

  void _calculateTip() {
    setState(() {
      _bill = double.parse(billTextField.text);
      if(greatService) {
        _tip = _bill + (_bill * 0.2);
      } else {
        _tip = _bill + (_bill * _tipRate);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Tip Calculator"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Tip Calculator',
              style: Theme.of(context).textTheme.headlineLarge
            ),
            SizedBox(height:50),
            Text(
              'Bill Amount',
              style: TextStyle(fontWeight: FontWeight.bold)
            ),
            SizedBox(
              width: 300,
              child: TextField(controller: billTextField),
            ),
            SizedBox(height:20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(
                  value: greatService,
                  onChanged: (value) {
                    setState(() {
                      greatService = value;
                    });
                  },
                ),
                Text("Great service?"),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {
              _calculateTip();
              }, child: Text("Calculate Tip")),
            SizedBox(height:40),
            Text("Tip: \$" + _tip.toString()),
          ],
        ),
      ),
    );
  }
}
