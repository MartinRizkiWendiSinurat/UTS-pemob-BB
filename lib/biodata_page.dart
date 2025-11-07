import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // ✅ Tambahkan ini!

class BiodataScreen extends StatefulWidget {
  const BiodataScreen({Key? key}) : super(key: key);

  @override
  State<BiodataScreen> createState() => _BiodataScreenState();
}

class _BiodataScreenState extends State<BiodataScreen> {
  // Data utama
  String _name = 'Martin';
  String _class = 'PEMOB BB';
  String _address = 'Dimana Saja';
  String _medsos = '@martin.instagram';
  String _gender = 'Laki-laki';
  DateTime? _birthDate;

  // Controller input
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _medsosController = TextEditingController();

  // Dropdown pilihan kelas
  final List<String> _kelasList = [
    'PEMOB AA',
    'PEMOB BB',
    'PEMOB CC',
    'PEMOB DD',
  ];
  String? _selectedClass;

  // Update data
  void _updateData() {
    setState(() {
      if (_nameController.text.isNotEmpty) _name = _nameController.text;
      if (_selectedClass != null) _class = _selectedClass!;
      if (_addressController.text.isNotEmpty) _address = _addressController.text;
      if (_medsosController.text.isNotEmpty) _medsos = _medsosController.text;

      _nameController.clear();
      _addressController.clear();
      _medsosController.clear();
      _selectedClass = null;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Data berhasil diperbarui!'),
        backgroundColor: Color(0xFF1E3A8A),
        duration: Duration(seconds: 2),
      ),
    );
  }

  // Date picker
  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _birthDate ?? DateTime(2000),
      firstDate: DateTime(1980),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF1E3A8A),
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _birthDate) {
      setState(() {
        _birthDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('Biodata Saya'),
        backgroundColor: const Color(0xFF1E3A8A),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Header biodata
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1E3A8A), Color(0xFF3B82F6)],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  // Foto Profil
                  Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 3),
                      borderRadius: BorderRadius.circular(55),
                      image: const DecorationImage(
                        image: AssetImage('assets/profile.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildDataRow('Nama', _name),
                  const Divider(color: Colors.white24, height: 20),
                  _buildDataRow('Kelas', _class),
                  const Divider(color: Colors.white24, height: 20),
                  _buildDataRow('Alamat', _address),
                  const Divider(color: Colors.white24, height: 20),
                  _buildDataRow('Medsos', _medsos),
                  const Divider(color: Colors.white24, height: 20),
                  _buildDataRow('Gender', _gender),
                  const Divider(color: Colors.white24, height: 20),
                  _buildDataRow(
                    'Tanggal Lahir',
                    _birthDate != null
                        ? DateFormat('dd MMMM yyyy').format(_birthDate!)
                        : '-',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Form Update
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Update Biodata',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E3A8A),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Nama
                    _buildTextField(_nameController, 'Nama', Icons.person),
                    const SizedBox(height: 16),

                    // Dropdown kelas
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Kelas',
                        prefixIcon: const Icon(Icons.school, color: Color(0xFF3B82F6)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      value: _selectedClass,
                      items: _kelasList
                          .map((kelas) => DropdownMenuItem(
                                value: kelas,
                                child: Text(kelas),
                              ))
                          .toList(),
                      onChanged: (val) => setState(() => _selectedClass = val),
                    ),
                    const SizedBox(height: 16),

                    // Alamat
                    _buildTextField(
                      _addressController,
                      'Alamat',
                      Icons.location_on,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 16),

                    // Medsos
                    _buildTextField(
                      _medsosController,
                      'Medsos',
                      FontAwesomeIcons.instagram, // ✅ Sudah benar sekarang
                    ),
                    const SizedBox(height: 16),

                    // Gender (radio button)
                    const Text(
                      'Jenis Kelamin',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text('Laki-laki'),
                            value: 'Laki-laki',
                            groupValue: _gender,
                            onChanged: (val) => setState(() => _gender = val!),
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text('Perempuan'),
                            value: 'Perempuan',
                            groupValue: _gender,
                            onChanged: (val) => setState(() => _gender = val!),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Date Picker
                    Row(
                      children: [
                        const Icon(Icons.calendar_today, color: Color(0xFF3B82F6)),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            _birthDate == null
                                ? 'Pilih Tanggal Lahir'
                                : DateFormat('dd MMMM yyyy').format(_birthDate!),
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        TextButton(
                          onPressed: _selectDate,
                          child: const Text(
                            'Pilih',
                            style: TextStyle(color: Color(0xFF1E3A8A)),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Tombol Update
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _updateData,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1E3A8A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Simpan Perubahan',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable widget
  Widget _buildDataRow(String label, String value) {
    return Row(
      children: [
        SizedBox(width: 120, child: Text('$label :', style: const TextStyle(color: Colors.white70))),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(TextEditingController c, String label, IconData icon, {int maxLines = 1}) {
    return TextField(
      controller: c,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: const Color(0xFF3B82F6)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF3B82F6), width: 2),
        ),
      ),
    );
  }
}
