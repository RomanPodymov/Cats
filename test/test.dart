import 'package:cats/main.dart';
import 'package:test/test.dart';

void main() {
  group('Tests', () {
    test('Parse cat', () {
      final raw = <String, dynamic>{
        'id': 'some id'
      };
      final cat = Cat.fromJson(raw);
      expect(cat.id, 'some id');
    });
  });
}