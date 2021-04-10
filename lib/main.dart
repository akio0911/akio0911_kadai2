import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _number1Controller = TextEditingController();
  var _number2Controller = TextEditingController();

  var _groupValue = '+';

  var _resultText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _number1TextFieldWidget(),
            SizedBox(height: 44),
            _number2TextFieldWidget(),
            SizedBox(height: 44),
            _segmentedControlWidget(),
            SizedBox(height: 22),
            _calculatingButtonWidget(),
            SizedBox(height: 22),
            _resultTextWidget(),
          ],
        ),
      ),
    );
  }

  Widget _number1TextFieldWidget() {
    return TextField(
      controller: _number1Controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: '数値1',
      ),
    );
  }

  Widget _number2TextFieldWidget() {
    return TextField(
      controller: _number2Controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: '数値2',
      ),
    );
  }

  Widget _segmentedControlWidget() {
    return CupertinoSegmentedControl(
      children: {
        '+': Container(
          alignment: Alignment.center,
          width: 44,
          child: Text('+'),
        ),
        '-': Text('-'),
        '*': Text('*'),
        '/': Text('/'),
      },
      groupValue: _groupValue,
      onValueChanged: (value) {
        setState(() {
          _groupValue = value;
        });
      }
    );
  }

  Widget _calculatingButtonWidget() {
    return TextButton(
      child: Text('Button'),
      onPressed: () {
        final number1 = int.parse(_number1Controller.text);
        final number2 = int.parse(_number2Controller.text);

        double result;

        switch (_groupValue) {
          case '+':
            result = (number1 + number2).toDouble();
            break;
          case '-':
            result = (number1 - number2).toDouble();
            break;
          case '*':
            result = (number1 * number2).toDouble();
            break;
          case '/':
            result = number1 / number2;
            break;
        }

        setState(() {
          _resultText = result.toString();
        });
      },
    );
  }

  Widget _resultTextWidget() {
    return Text(_resultText);

  }
}
