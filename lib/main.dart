import 'package:flutter/material.dart';
import 'dart:developer' as developer;

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
                final imageData = snapshot.data?.first.url ?? '';
                developer.log(imageData);
                return Image.network(
                  imageData,
                  errorBuilder: (context, error, stackTrace) {
                    developer.log(error.toString());
                    return Image.asset('');
                  }
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