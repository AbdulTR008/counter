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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Counter'),
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
  String? result;

  TextEditingController number = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController limit = TextEditingController();

  iteration(n, q, l) {
    var total = n ~/ q;

    if (total <= l) {
      _counter++;
      setState(() {
        result = _counter.toString();
      });
      _counter = 0;
    } else if (total > l) {
      _counter += 1;
      iteration(total, q, l);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    number.clear();
    quantity.clear();
    limit.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: "number"),
                keyboardType: TextInputType.number,
                controller: number,
              ),
              TextField(
                decoration: InputDecoration(hintText: "quantity"),
                keyboardType: TextInputType.number,
                controller: quantity,
              ),
              TextField(
                decoration: InputDecoration(hintText: "limit"),
                keyboardType: TextInputType.number,
                controller: limit,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Iteration = ${result ?? 0}',
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    iteration(double.parse(number.text),
                        double.parse(quantity.text), double.parse(limit.text));
                  },
                  child: Text('Calculate')),
            ],
          ),
        ),
      ),
    );
  }
}
