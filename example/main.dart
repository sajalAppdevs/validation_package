import 'package:flutter/material.dart';
import 'package:validation_package/src/validated_text_field.dart';
import 'package:validation_package/validation_package.dart';

void main() => runApp(const ValidationExampleApp());

class ValidationExampleApp extends StatelessWidget {
  const ValidationExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Validation Package Demo',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const ValidationFormPage(),
    );
  }
}

class ValidationFormPage extends StatefulWidget {
  const ValidationFormPage({super.key});

  @override
  State<ValidationFormPage> createState() => _ValidationFormPageState();
}

class _ValidationFormPageState extends State<ValidationFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Form Validated ✅")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Form Validation UI")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ValidatedTextField(
                label: "Email",
                controller: _emailController,
                validator: Validators.combine([
                  Validators.required(),
                  Validators.email(),
                ]),
              ),
              const SizedBox(height: 16),
              ValidatedTextField(
                label: "Password",
                controller: _passwordController,
                obscureText: true,
                validator: Validators.combine([
                  Validators.required(),
                  Validators.passwordComplexity(),
                  Validators.minLength(6),
                ]),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text("Submit"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: _submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
