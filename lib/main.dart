import 'package:flutter/material.dart';

import 'Contato.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ListPage(),
    );
  }
}

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  int contadorFav = 0;
  List<Contato> contatos = [
    Contato('jimmy@gmail.com', 'Jimmy Buttler', false),
    Contato('Stephen@gmail.com', 'Stephen Curry', false),
    Contato('Lebron@gmail.com', 'Lebron James', false),
    Contato('Luka@gmail.com', 'Luka Doncic', false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Contador de Favoritos $contadorFav'),
      ),
      body: ListView.builder(
        itemCount: contatos.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            trailing: IconButton(
              icon: Icon(
                  contatos[index].favorito
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.red),
              onPressed: () {
                setState(() {
                  contatos[index].favorito = !contatos[index].favorito;
                  if (contatos[index].favorito)
                    contadorFav++;
                  else
                    contadorFav--;
                  print(contatos[index].favorito);
                });
              },
            ),
            leading: CircleAvatar(
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=1'),
            ),
            title: Text(contatos[index].nome),
            subtitle: Text(contatos[index].email),
          );
        },
      ),
    );
  }
}