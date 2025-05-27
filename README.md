# Form Validation Package

A Flutter package that provides beautiful and customizable form validation widgets with built-in validation rules. This package simplifies form validation in Flutter applications by providing pre-built validators and a customizable text field widget.

[![pub package](https://img.shields.io/pub/v/validation_package.svg)](https://pub.dev/packages/validation_package)

## Features

✨ **Beautiful Form Fields**
- Pre-styled text fields with modern design
- Customizable appearance
- Floating labels
- Error message styling

🔍 **Built-in Validators**
- Required field validation
- Email validation
- Phone number validation
- Password complexity validation
- Minimum length validation
- Combinable validators

🎨 **Customization**
- Custom error messages
- Custom validation rules
- Flexible styling options

## Screenshots

### Password Validation
![Password Validation](assets/images/validation1.jpg)

### Form Input States
![Form States](assets/images/validation2.jpg)

### Save Password Dialog
![Save Dialog](assets/images/validation3.jpg)

## Getting Started

### Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  validation_package: ^0.0.1
```

Then run:
```bash
flutter pub get
```

### Basic Usage

```dart
import 'package:validation_package/validation_package.dart';

// Simple required field
ValidatedTextField(
  label: 'Username',
  controller: _usernameController,
  validator: Validators.required(),
);

// Email validation
ValidatedTextField(
  label: 'Email',
  controller: _emailController,
  validator: Validators.email(),
);

// Password with multiple validations
ValidatedTextField(
  label: 'Password',
  controller: _passwordController,
  obscureText: true,
  validator: Validators.combine([
    Validators.required(),
    Validators.minLength(6),
    Validators.passwordComplexity(),
  ]),
);
```

## Available Validators

### Required Field
```dart
Validators.required(message: 'Custom error message')
```

### Email
```dart
Validators.email(message: 'Please enter a valid email')
```

### Minimum Length
```dart
Validators.minLength(8, message: 'Must be at least 8 characters')
```

### Phone Number
```dart
Validators.phone(message: 'Enter a valid phone number')
```

### Password Complexity
```dart
Validators.passwordComplexity(
  message: 'Password must contain both letters and numbers'
)
```

### Combining Validators
```dart
Validators.combine([
  Validators.required(),
  Validators.minLength(6),
  Validators.passwordComplexity(),
])
```

## Customizing TextField

```dart
ValidatedTextField(
  label: 'Custom Field',
  controller: _controller,
  validator: Validators.required(),
  obscureText: false, // For password fields
);
```

## Contributing

We welcome contributions! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.