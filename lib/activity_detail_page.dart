import 'package:flutter/material.dart';
import 'model/activity_model.dart';

class ActivityDetailPage extends StatelessWidget {
  final Activity activity;
  final VoidCallback onDelete;

  const ActivityDetailPage({
    super.key,
    required this.activity,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Aktivitas"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text("Kategori: ${activity.category}"),
                Text("Durasi: ${activity.duration.toStringAsFixed(0)} jam"),
                Text(
                  "Status: ${activity.isCompleted ? "Selesai" : "Belum Selesai"}",
                  style: TextStyle(
                    color: activity.isCompleted ? Colors.green : Colors.red,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Catatan Tambahan:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(activity.notes.isEmpty ? "-" : activity.notes),
                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                      label: const Text("Kembali"),
                    ),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.delete),
                      label: const Text("Hapus Aktivitas"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () => _showDeleteDialog(context),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Hapus Aktivitas"),
          content: const Text("Apakah Anda yakin ingin menghapus aktivitas ini?"),
          actions: [
            TextButton(
              child: const Text("Batal"),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: const Text("Hapus", style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                onDelete();
              },
            ),
          ],
        );
      },
    );
  }
}
