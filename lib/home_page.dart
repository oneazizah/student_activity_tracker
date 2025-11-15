import 'package:flutter/material.dart';
import 'add_activity_page.dart';
import 'activity_detail_page.dart';
import 'model/activity_model.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Activity> activities = [];

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      _buildHomePage(),
      const ProfilePage(),
    ];

    return Scaffold(
      body: pages[_selectedIndex],

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newActivity = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddActivityPage()),
          );

          if (newActivity != null && newActivity is Activity) {
            setState(() {
              activities.add(newActivity);
            });
          }
        },
        child: const Icon(Icons.add),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  Widget _buildHomePage() {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Activity Tracker"),
        centerTitle: true,
      ),
      body: activities.isEmpty
          ? const Center(
              child: Text(
                "Belum ada aktivitas.\nTekan tombol + di bawah untuk menambah.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: activities.length,
              itemBuilder: (context, index) {
                final activity = activities[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  child: ListTile(
                    title: Text(activity.name),
                    subtitle: Text(
                      "${activity.category} • ${activity.duration.toStringAsFixed(1)} jam",
                    ),
                    trailing: Icon(
                      activity.isCompleted
                          ? Icons.check_circle
                          : Icons.radio_button_unchecked,
                      color: activity.isCompleted ? Colors.green : Colors.grey,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ActivityDetailPage(
                            activity: activity,
                            onDelete: () {
                              setState(() {
                                activities.remove(activity);
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
