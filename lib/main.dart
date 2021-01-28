import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _likesCounter = 0;
  bool _isLikePressed = false, _isDislikePressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tarea 2'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'images/iteso.jpg',
              ),
              Padding(
                padding: EdgeInsets.all(18.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text.rich(TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: 'El ITESO, Universidad Jesuita de Guadalajara\n',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: 'San Pedro Tlaquepaque, Jal.',
                            style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ])),
                      IconButton(
                        icon: Icon(Icons.thumb_up),
                        color: _isLikePressed ? Colors.blueAccent[700]: Colors.grey,
                        onPressed: () {
                          _isLikePressed = !_isLikePressed;
                          _likesCounter++;
                          print("Click $_likesCounter");
                          setState(() {});
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.thumb_down),
                        color: _isDislikePressed ? Colors.red: Colors.grey,
                        onPressed: () {
                          _likesCounter--;
                          _isDislikePressed = !_isDislikePressed;
                          print("Click $_likesCounter");
                          setState(() {});
                        },
                      ),
                      Text('$_likesCounter'),
                    ]),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.email),
                      iconSize: 54,
                      onPressed: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Enviar correo electronico'),
                          ),
                        );
                      },
                    ),
                    Text('Correo')
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.call),
                      iconSize: 54,
                      onPressed: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Hacer una llamada'),
                          ),
                        );
                      },
                    ),
                    Text('Llamada')
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.directions),
                      iconSize: 54,
                      onPressed: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Ruta sugerida enviada'),
                          ),
                        );
                      },
                    ),
                    Text('Ruta')
                  ],
                ),
              ]),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Text(
                  'El ITESO, Universidad Jesuita de Guadalajara, es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957. La institución forma parte del Sistema Universitario Jesuita  que integra a ocho universidades en México. Fundada en el año de 1957 por el ingeniero José Fernández del Valle y Ancira, entre otros, la universidad ha tenido una larga trayectoria. A continuación se presenta la historia de la institución en periodos de décadas.',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.thumb_up),
          onPressed: () {
            if (_likesCounter % 2 == 0) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Text('El contador de likes es par'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('OK')),
                  ],
                ),
              );
            } else {
              DateTime _date = new DateTime.now();
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Fecha actual'),
                  content: Text('${_date.day}-${_date.month}-${_date.year} ${_date.hour}:${_date.minute}'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('OK')),
                  ],
                ),
              );
            }
          },
        ));
  }
}
