import 'package:flutter/material.dart';

class BinaryToDecimal extends StatefulWidget {
  const BinaryToDecimal({Key? key}) : super(key: key);

  @override
  _BinaryToDecimalState createState() => _BinaryToDecimalState();
}

class _BinaryToDecimalState extends State<BinaryToDecimal> {
  String _binary = "0";
  String _decimal = "0";
  final Color _color1 = const Color.fromARGB(255, 118, 210, 117); 
  final Color _color2 = const Color.fromARGB(255, 37, 114, 42);
  //int.parse(_binary, radix: 2).toRadixString(10);

  void _onPressed() {
    setState(() {
      _decimal = int.parse(_binary, radix: 2).toRadixString(10);
    });
  }

  void resetPressed() {
    setState(() {
      _binary = "0";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
        Widget>[
      Expanded(
        flex: 1,
        child: Container(
            padding: const EdgeInsets.only(right: 18, left: 18),
            alignment: Alignment.centerRight,
            child: Text(
              _binary,
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(int.parse("#000000".replaceAll('#', '0xff'))),
                  fontSize: 35),
            )),
      ),
      Expanded(
        flex: 1,
        child: Container(
            padding: const EdgeInsets.only(right: 18, left: 18),
            alignment: Alignment.centerRight,
            child: Text(
              _decimal,
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(int.parse("#000000".replaceAll('#', '0xff'))),
                  fontSize: 35),
            )),
      ),
      Expanded(
        flex: 3,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child:
                        SizedBox(height: double.infinity, child: keyNumber(1)),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child:
                        SizedBox(height: double.infinity, child: keyNumber(0)),
                  ),
                ),
              ]),
        ),
      ),
      Expanded(
        flex: 1,
        child: Container(
          padding: const EdgeInsets.all(12.0),
          child: MaterialButton(
              key: const Key("reset"),
              height: 100,
              color: Color(int.parse("#43a047".replaceAll('#', '0xff'))),
              onPressed: () {
                resetPressed();
                _onPressed();
              },
              child: const Text("Reset",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ))),
        ),
      ),
    ]);
  }

  Widget keyNumber(number) {
    return MaterialButton(
      key: Key(number.toString()),
      color: _color1,
      highlightColor: _color2,
      child: Text(
        number.toString(),
        style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        if (_decimal == "0") {
          setState(() {
            _binary = "";
            _binary = _binary + number.toString();
            _onPressed();
          });
        } else {
          setState(() {
            _binary = _binary + number.toString();
            _onPressed();
          });
        }
      },
    );
  }
}
