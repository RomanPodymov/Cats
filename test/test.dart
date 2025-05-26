import 'package:cats/cats.dart';
import 'package:test/test.dart';

void main() {
  group('Tests', () {
    test('Parse cat', () {
      final expectedId = 'some id';
      final expectedUrl = 'some url';
      final expectedWidth = 200;
      final expectedHeight = 100;
      final raw = <String, dynamic>{
        'id': expectedId,
        'url': expectedUrl,
        'width': expectedWidth,
        'height': expectedHeight
      };
      final cat = Cat.fromJson(raw);
      expect(cat.id, expectedId);
      expect(cat.url, expectedUrl);
      expect(cat.width, expectedWidth);
      expect(cat.height, expectedHeight);
    });
  });
}