typedef Validator = String? Function(String? value);

class Validators {
  static Validator required({String message = 'This field is required'}) {
    return (value) => (value == null || value.isEmpty) ? message : null;
  }

  static Validator email({String message = 'Invalid email address'}) {
    return (value) =>
    RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value ?? '') ? null : message;
  }

  static Validator minLength(int length, {String? message}) {
    return (value) =>
    (value ?? '').length >= length ? null : message ?? 'Minimum $length characters required';
  }

  static Validator phone({String message = 'Invalid phone number'}) {
    return (value) =>
    RegExp(r'^\+?[0-9]{7,15}$').hasMatch(value ?? '') ? null : message;
  }

  static Validator passwordComplexity({
    String message = 'Password must contain letter and number',
  }) {
    return (value) => RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$').hasMatch(value ?? '')
        ? null
        : message;
  }

  static Validator combine(List<Validator> validators) {
    return (value) {
      for (final validator in validators) {
        final result = validator(value);
        if (result != null) return result;
      }
      return null;
    };
  }
}
