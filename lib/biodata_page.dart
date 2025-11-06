import 'package:flutter/material.dart';

class BiodataScreen extends StatefulWidget {
  const BiodataScreen({Key? key}) : super(key: key);

  @override
  State<BiodataScreen> createState() => _BiodataScreenState();
}

class _BiodataScreenState extends State<BiodataScreen> {
  String _name = 'Martin';
  String _class = 'PEMOB BB';
  String _address = 'Dimana Saja';
  String _medsos = '@martin.instagram';

  final _nameController = TextEditingController();
  final _classController = TextEditingController();
  final _addressController = TextEditingController();
  final _medsosController = TextEditingController();

  void _updateData() {
    setState(() {
      if (_nameController.text.isNotEmpty) _name = _nameController.text;
      if (_classController.text.isNotEmpty) _class = _classController.text;
      if (_addressController.text.isNotEmpty) _address = _addressController.text;
      if (_medsosController.text.isNotEmpty) _medsos = _medsosController.text;
      _nameController.clear();
      _classController.clear();
      _addressController.clear();
      _medsosController.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Data berhasil diperbarui!'),
        backgroundColor: Color(0xFF1E3A8A),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
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
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Center(
                    child: Text(
                      'MAR',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E3A8A),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                _buildDataRow('Nama', _name),
                const Divider(color: Colors.white24, height: 20),
                _buildDataRow('Kelas', _class),
                const Divider(color: Colors.white24, height: 20),
                _buildDataRow('Alamat', _address),
                const Divider(color: Colors.white24, height: 20),
                _buildDataRow('Medsos', _medsos),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Update Data Biodata',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E3A8A),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(_nameController, 'Nama', Icons.person),
                  const SizedBox(height: 16),
                  _buildTextField(_classController, 'Kelas', Icons.school),
                  const SizedBox(height: 16),
                  _buildTextField(_addressController, 'Alamat', Icons.location_on, maxLines: 2),
                  const SizedBox(height: 16),
                  _buildTextField(_medsosController, 'Medsos', Icons.camera_alt),
                  const SizedBox(height: 20),
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
                        'Update Data',
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
    );
  }

  Widget _buildDataRow(String label, String value) {
    return Row(
      children: [
        SizedBox(width: 80, child: Text('$label :', style: const TextStyle(color: Colors.white70))),
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
