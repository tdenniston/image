import 'dart:io';
import 'package:image/image.dart';
import 'package:test/test.dart';

import '../test_util.dart';

void trimTest() {
  test('trim', () {
    final image = decodePng(File('test/_data/png/trim.png').readAsBytesSync())!;
    var trimmed = trim(image);
    File('$testOutputPath/transform/trim.png')
      ..createSync(recursive: true)
      ..writeAsBytesSync(encodePng(trimmed));
    expect(trimmed.width, equals(64));
    expect(trimmed.height, equals(56));

    trimmed = trim(image, mode: TrimMode.topLeftColor);
    File('$testOutputPath/transform/trim_topLeftColor.png')
      ..createSync(recursive: true)
      ..writeAsBytesSync(encodePng(trimmed));
    expect(trimmed.width, equals(64));
    expect(trimmed.height, equals(56));

    trimmed = trim(image, mode: TrimMode.bottomRightColor);
    File('$testOutputPath/transform/trim_bottomRightColor.png')
      ..createSync(recursive: true)
      ..writeAsBytesSync(encodePng(trimmed));
    expect(trimmed.width, equals(64));
    expect(trimmed.height, equals(56));
  });
}
