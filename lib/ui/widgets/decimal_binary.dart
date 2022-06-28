import 'package:flutter/material.dart';

class DecimalToBinary extends StatefulWidget {
  const DecimalToBinary({Key? key}) : super(key: key);

  @override
  State<DecimalToBinary> createState() => _DecimalToBinaryState();
}

class _DecimalToBinaryState extends State<DecimalToBinary> {
  String _decimal = "0";
  String _binary = "0";
  final Color _color1 = const Color.fromARGB(255, 118, 210, 117); 
  final Color _color2 = const Color.fromARGB(255, 37, 114, 42);

  void _onPressed() {
    setState(() {
      _binary = int.parse(_decimal).toRadixString(2);
    });
  }

  void resetPressed() {
    setState(() {
      _decimal = "0";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, 
    children: 
    <Widget>[
      Expanded(
        flex: 1,
        child: Container(
            padding: const EdgeInsets.only(right: 18,left: 18),
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
        flex: 1,
        child: Container(
            padding: const EdgeInsets.only(right: 18,left: 18),
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
        flex: 4,
        child: 
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Expanded(flex: 1,
                child: Row(mainAxisAlignment: MainAxisAlignment.center,children: 
                  <Widget>[
                    Expanded(flex: 1,child:keyNumber(7)),
                    Expanded(flex: 1,child:keyNumber(8)), 
                    Expanded(flex: 1,child:keyNumber(9))]),
              ),
              Expanded(flex: 1,
                child: Row(mainAxisAlignment: MainAxisAlignment.center,children: 
                  <Widget>[
                    Expanded(flex: 1,child:keyNumber(4)),
                    Expanded(flex: 1,child:keyNumber(5)), 
                    Expanded(flex: 1,child:keyNumber(6))]),
              ),
              Expanded(flex: 1,
                child: Row(mainAxisAlignment: MainAxisAlignment.center,children: 
                  <Widget>[
                    Expanded(flex: 1,child:keyNumber(1)),
                    Expanded(flex: 1,child:keyNumber(2)), 
                    Expanded(flex: 1,child:keyNumber(3))]),
              ),
              Expanded(flex: 1,
                child: Row(mainAxisAlignment: MainAxisAlignment.center,children: 
                <Widget>[
                  Expanded(
                    flex: 1,
                    child: keyNumber(0)),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(1.0),
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
                                fontSize: 20,
                                color: Colors.white,
                              ))),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    ]);
  }

  Widget keyNumber(number) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: MaterialButton(
        key: Key(number.toString()),
        color: _color1,
        highlightColor: _color2,
        height: 100,
        child: Text(number.toString(),style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
        onPressed: () {
          if (_decimal == "0") {
            setState(() {
              _decimal = "";
              _decimal = _decimal + number.toString();
              _onPressed();
            });
          } else {
            setState(() {
              _decimal = _decimal + number.toString();
              _onPressed();
            });
          }
        },
      ),
    );
  }
}
