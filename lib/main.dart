import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Geolocalização Unidade RFB - Flutter Android',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const platform = const MethodChannel("unidades_rfb");

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Unidades RFB"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text('Toque no botão para ver o Mapa',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              RaisedButton(
                child: Icon(Icons.map, color: Colors.blue, size: 30),
                onPressed: () {
                  platform.invokeMethod("openMap").then((value) => print(value));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
