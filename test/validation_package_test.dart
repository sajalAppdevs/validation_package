import 'package:flutter_test/flutter_test.dart';
import 'package:validation_package/validation_package.dart';

void main() {
  test('Email Validator', () {
    final validator = Validators.email();
    expect(validator("user@example.com"), null);
    expect(validator("invalid_email"), isNotNull);
  });

  test('Required Validator', () {
    final validator = Validators.required();
    expect(validator("hello"), null);
    expect(validator(""), isNotNull);
  });

  test('Combined Validator', () {
    final validator = Validators.combine([
      Validators.required(),
      Validators.minLength(4),
    ]);
    expect(validator(""), isNotNull);
    expect(validator("hi"), isNotNull);
    expect(validator("hello"), null);
  });
}
