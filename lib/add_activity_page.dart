import 'package:flutter/material.dart';
import 'model/activity_model.dart';

class AddActivityPage extends StatefulWidget {
  const AddActivityPage({super.key});

  @override
  State<AddActivityPage> createState() => _AddActivityPageState();
}

class _AddActivityPageState extends State<AddActivityPage> {
  final _formKey = GlobalKey<FormState>();

  String name = "";
  String category = "Belajar";
  double duration = 1;
  bool isCompleted = false;
  String notes = "";

  final List<String> categories = [
    "Belajar",
    "Ibadah",
    "Olahraga",
    "Hiburan",
    "Lainnya"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Aktivitas Baru"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Nama Aktivitas",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => name = value,
                validator: (value) =>
                    value == null || value.isEmpty ? "Nama wajib diisi" : null,
              ),

              const SizedBox(height: 16),

              // ✅ Perbaikan: gunakan initialValue bukan value
              DropdownButtonFormField<String>(
                initialValue: category,
                decoration: const InputDecoration(
                  labelText: "Kategori",
                  border: OutlineInputBorder(),
                ),
                items: categories
                    .map((c) => DropdownMenuItem(
                          value: c,
                          child: Text(c),
                        ))
                    .toList(),
                onChanged: (value) => setState(() => category = value!),
                validator: (value) =>
                    value == null || value.isEmpty ? "Kategori wajib dipilih" : null,
              ),

              const SizedBox(height: 16),

              Text("Durasi (Jam): ${duration.toStringAsFixed(0)}"),
              Slider(
                value: duration,
                min: 1,
                max: 8,
                divisions: 7,
                label: "${duration.toStringAsFixed(0)} jam",
                onChanged: (value) => setState(() => duration = value),
              ),

              SwitchListTile(
                title: const Text("Sudah Selesai"),
                value: isCompleted,
                onChanged: (value) => setState(() => isCompleted = value),
              ),

              const SizedBox(height: 16),

              TextField(
                decoration: const InputDecoration(
                  labelText: "Catatan",
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                onChanged: (value) => notes = value,
              ),

              const SizedBox(height: 24),

              ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text("Simpan Aktivitas"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(
                      context,
                      Activity(
                        name: name,
                        category: category,
                        duration: duration,
                        isCompleted: isCompleted,
                        notes: notes,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
