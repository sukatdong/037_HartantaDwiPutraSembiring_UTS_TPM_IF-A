import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class KalenderPage extends StatefulWidget {
  const KalenderPage({Key? key}) : super(key: key);

  @override
  _KalenderPage createState() => _KalenderPage();
}

class _KalenderPage extends State<KalenderPage> {
  late DateTime _selectedDate;
  late TimeOfDay _selectedTime;
  String _selectedZone = 'WIB';
  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _selectedTime = TimeOfDay.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: _selectedTime);
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  Widget _buildZonePicker() {
    return DropdownButton<String>(
      value: _selectedZone,
      items: ['WIB', 'WITA', 'WIT']
          .map((zone) => DropdownMenuItem<String>(
                value: zone,
                child: Text(zone),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          _selectedZone = value!;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate =
        DateFormat.yMMMMd('en_US').format(_selectedDate.toLocal());
    final zoneOffset = _selectedZone == 'WIB'
        ? '+7'
        : _selectedZone == 'WITA'
            ? '+8'
            : '+9';
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalender'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Zona Waktu:',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(width: 16),
                _buildZonePicker(),
              ],
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text('Pilih Tanggal'),
            ),
            SizedBox(height: 16),
            Text(
              'Tanggal: $formattedDate',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: Text('Pilih Waktu'),
            ),
            SizedBox(height: 16),
            StreamBuilder(
              stream: Stream.periodic(Duration(seconds: 1)),
              builder: (context, snapshot) {
                final now = DateTime.now().toLocal();
                final formattedTime =
                    DateFormat('hh:mm:ss', 'en_US').format(now);
                return Text(
                  'Waktu: $formattedTime $zoneOffset',
                  style: TextStyle(fontSize: 20),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
