import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Form Demo')),
      body: FormDemo(),
    );
  }
}

class FormDemo extends StatefulWidget {
  @override
  _FormDemoState createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            buildTextFieldRow(Icons.person, "Name", _nameController),
            buildTextFieldRow(Icons.phone, "Phone", _phoneController),
            buildTextFieldRow(Icons.calendar_today, "Dob", _dobController),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final name = _nameController.text;
                  final phone = _phoneController.text;
                  final dob = _dobController.text;

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Name: $name, Phone: $phone, DOB: $dob"),
                    ),
                  );
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextFieldRow(
    IconData icon,
    String label,
    TextEditingController controller,
  ) {
    return Row(
      children: [
        Padding(padding: const EdgeInsets.all(8.0), child: Icon(icon)),
        Expanded(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(labelText: label),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter $label';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
