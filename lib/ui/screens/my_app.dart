import 'package:flutter/material.dart';
import '../widgets/binary_decimal.dart';
import '../widgets/decimal_binary.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _switchWidget = true;

  void switchWgt() {
    if (_switchWidget == true) {
      setState(() {
        _switchWidget = false;
      });
    } else {
      setState(() {
        _switchWidget = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Converter',
        theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: const Color.fromARGB(255, 182, 238, 185),
        ),
        home: Scaffold(
            appBar: AppBar(
              title:  Text((_switchWidget
                            ? "Binary to Decimal Converter"
                            : "Decimal to Binary Converter")),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        key: const Key("switch"),
                        onPressed: () {
                          switchWgt();
                        },
                        child: Text(_switchWidget
                            ? "Binary -> Decimal"
                            : "Decimal -> Binary",style: const TextStyle(fontSize: 20)))),
                Expanded(
                    child:
                        _switchWidget ? const BinaryToDecimal() : const DecimalToBinary()),
              ],
            )));
  }
}
