import 'package:flutter/material.dart';
import 'package:square_in_app_payments/in_app_payments.dart';
import 'package:square_in_app_payments/models.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '0',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _payment,
        tooltip: 'Increment',
        child: Icon(Icons.monetization_on),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _payment() async {
    await InAppPayments.setSquareApplicationId("sandbox-sq0idb-NI9cnFXBSrYgbToUJlp9HA");
    await InAppPayments.startCardEntryFlow(
      onCardEntryCancel: () {},
      onCardNonceRequestSuccess: (CardDetails result) async {
        try {
          InAppPayments.completeCardEntry(onCardEntryComplete: () async {});
        } catch (ex) {
          InAppPayments.showCardNonceProcessingError(ex.toString());
        }
      },
    );
  }
}
