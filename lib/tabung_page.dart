import 'package:flutter/material.dart';

class TabungPage extends StatefulWidget {
  @override
  _TabungPage createState() => _TabungPage();
}

class _TabungPage extends State<TabungPage> {
  final _formKey = GlobalKey<FormState>();
  final _radiusController = TextEditingController();
  final _tinggiController = TextEditingController();
  double _volume = 0;
  double _luasPermukaan = 0;

  @override
  void dispose() {
    _radiusController.dispose();
    _tinggiController.dispose();
    super.dispose();
  }

  void _hitungVolumeLuas() {
    final isFormValid = _formKey.currentState!.validate();

    if (!isFormValid) {
      return;
    }

    final radius = double.parse(_radiusController.text);
    final tinggi = double.parse(_tinggiController.text);

    setState(() {
      _volume = 3.14 * radius * radius * tinggi;
      _luasPermukaan = 2 * 3.14 * radius * (radius + tinggi);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabung'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _radiusController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Radius tidak boleh kosong';
                  }

                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Radius (cm)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _tinggiController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Tinggi tidak boleh kosong';
                  }

                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Tinggi (cm)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(height: 16),
              Text(
                'Volume: $_volume cm3',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                'Luas Permukaan: $_luasPermukaan cm2',
                style: TextStyle(fontSize: 18),
              ),
              ElevatedButton(
                onPressed: _hitungVolumeLuas,
                child: Text('Hitung'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
