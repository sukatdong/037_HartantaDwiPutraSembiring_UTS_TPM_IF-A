import 'package:flutter/material.dart';

class TrapesiumPage extends StatefulWidget {
  @override
  _TrapesiumPageState createState() => _TrapesiumPageState();
}

class _TrapesiumPageState extends State<TrapesiumPage> {
  final _sisiABController = TextEditingController();
  final _sisiBCController = TextEditingController();
  final _sisiCDController = TextEditingController();
  final _sisiDAController = TextEditingController();
  final _tinggiController = TextEditingController();

  double _luas = 0;
  double _keliling = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trapesium'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _sisiABController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Sisi AB',
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: _sisiBCController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Sisi BC',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _sisiCDController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Sisi CD',
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: _sisiDAController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Sisi DA',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _tinggiController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Tinggi',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text('Luas: $_luas'),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text('Keliling: $_keliling'),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                double sisiAB = double.tryParse(_sisiABController.text) ?? 0;
                double sisiBC = double.tryParse(_sisiBCController.text) ?? 0;
                double sisiCD = double.tryParse(_sisiCDController.text) ?? 0;
                double sisiDA = double.tryParse(_sisiDAController.text) ?? 0;
                double tinggi = double.tryParse(_tinggiController.text) ?? 0;
                double luas = ((sisiAB + sisiCD) / 2) * tinggi;
                double keliling = sisiAB + sisiBC + sisiCD + sisiDA;

                setState(() {
                  _luas = luas;
                  _keliling = keliling;
                });
              },
              child: Text('Hitung'),
            ),
          ],
        ),
      ),
    );
  }
}
