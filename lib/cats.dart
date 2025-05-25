import 'dart:convert';
import 'package:http/http.dart' as http;

class Cat {
  final String? id;
  final String? url;
  final int? width;
  final int? height;

  const Cat({required this.id, required this.url, required this.width, required this.height});

  factory Cat.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {'id': String? id, 'url': String? url, 'width': int? width, 'height': int? height} => Cat(
        id: id,
        url: url,
        width: width,
        height: height
      ),
      _ => throw const FormatException('Failed to load cats'),
    };
  }
}

Future<List<Cat>> fetchCats() async {
  final response = await http.get(
    Uri.parse('https://api.thecatapi.com/v1/images/search'),
  );

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    return data.map((cat) => Cat.fromJson(cat)).toList();
  } else {
    throw Exception('Failed to load cats');
  }
}