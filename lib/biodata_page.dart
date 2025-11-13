import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BiodataScreen extends StatefulWidget {
  const BiodataScreen({super.key});

  @override
  State<BiodataScreen> createState() => _BiodataScreenState();
}

class _BiodataScreenState extends State<BiodataScreen> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _medsosController = TextEditingController();
  final TextEditingController _tanggalController = TextEditingController();

  String? _selectedClass;
  String? _selectedGender;
  DateTime? _birthDate;

  final List<String> _kelasList = [
    'PEMOB AA',
    'PEMOB BB',
    'PEMOB CC',
    'PEMOB DD',
  ];

  // Fungsi pilih tanggal
  void _pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _birthDate ?? DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        _birthDate = pickedDate;
        _tanggalController.text =
            DateFormat('dd/MM/yyyy').format(pickedDate);
      });
    }
  }

  // Tombol simpan data (dummy)
  void _saveData() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Data biodata tersimpan!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FB),
      appBar: AppBar(
        title: const Text('Biodata Mahasiswa'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bagian atas (foto profil dan nama)
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Martin',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'NIM: 152023999',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            const Divider(),
            const SizedBox(height: 10),

            const Text(
              'Lengkapi Informasi:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Input nama
            TextField(
              controller: _namaController,
              decoration: InputDecoration(
                labelText: 'Nama Lengkap',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 16),

            // Dropdown kelas
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Kelas',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.school),
              ),
              value: _selectedClass,
              items: _kelasList.map((String kelas) {
                return DropdownMenuItem(value: kelas, child: Text(kelas));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedClass = value;
                });
              },
            ),
            const SizedBox(height: 16),

            // Alamat
            TextField(
              controller: _alamatController,
              decoration: InputDecoration(
                labelText: 'Alamat',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.location_on),
              ),
            ),
            const SizedBox(height: 16),

            // Medsos
            TextField(
              controller: _medsosController,
              decoration: InputDecoration(
                labelText: 'Medsos',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.alternate_email),
              ),
            ),
            const SizedBox(height: 16),

            // Gender
            const Text(
              'Jenis Kelamin:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Laki-laki'),
                    value: 'Laki-laki',
                    groupValue: _selectedGender,
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Perempuan'),
                    value: 'Perempuan',
                    groupValue: _selectedGender,
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Tanggal lahir
            TextField(
              controller: _tanggalController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Tanggal Lahir',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.calendar_today),
              ),
              onTap: _pickDate,
            ),
            const SizedBox(height: 24),

            // Tombol simpan
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.check_circle_outline),
                label: const Text('Simpan Data'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: _saveData,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
