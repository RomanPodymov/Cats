import 'package:flutter/material.dart';
import 'cats.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cats',
      theme: ThemeData(
        colorScheme: ColorScheme.dark(),
      ),
      home: const MyHomePage(title: 'Cats'),
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
  late Future<List<Cat>> futureCats;

  @override
  void initState() {
    super.initState();
    futureCats = fetchCats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text(widget.title),
      ),
      body: Center(
          child: FutureBuilder<List<Cat>>(
            future: futureCats,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  padding: const EdgeInsets.all(8),
                  children: snapshot.data!.map((item) => Container(
                    height: 50,
                    color: Colors.amber[600],
                    child: Center(child: Image.network(item.url ?? ''))
                  )).toList()
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            }, 
          ),
      )
    );
  }
}