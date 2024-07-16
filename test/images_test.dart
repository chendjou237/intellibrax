import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:intellibra/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.articleNobgPlaceholder).existsSync(), isTrue);
    expect(File(Images.articlePlaceholder).existsSync(), isTrue);
    expect(File(Images.leftBreast).existsSync(), isTrue);
    expect(File(Images.rightBreast).existsSync(), isTrue);
  });
}
