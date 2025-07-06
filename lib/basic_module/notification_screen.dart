import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_logic.dart';
import 'main_screen.dart'; // Assuming MainScreen is the home screen

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeIndex = context.watch<ThemeLogic>().themeIndex;
    final isDarkMode = themeIndex == 1;
    final backgroundColor = isDarkMode ? Colors.grey[850] : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black87;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: textColor),
          onPressed: () {
            Navigator.pop(context); // Go back to previous screen

          },
        ),
        title: const Text("Notifications"),
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _NotificationTile(
            title: "New video from Men Kim Hour!",
            subtitle: "1 hour ago",
            isDarkMode: isDarkMode,
          ),
          _NotificationTile(
            title: "Your channel @lybunchheang23 got a new subscriber",
            subtitle: "2 hours ago",
            isDarkMode: isDarkMode,
          ),
          _NotificationTile(
            title: "Update: YouTube Premium offer available",
            subtitle: "Today, 03:15 PM",
            isDarkMode: isDarkMode,
          ),
          _NotificationTile(
            title: "Comment on your video 'HS អ្នករៀបការក...'",
            subtitle: "Today, 12:30 PM",
            isDarkMode: isDarkMode,
          ),
          _NotificationTile(
            title: "Security alert: Login from new device",
            subtitle: "Yesterday, 09:45 PM",
            isDarkMode: isDarkMode,
          ),
        ],
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isDarkMode;

  const _NotificationTile({
    required this.title,
    required this.subtitle,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = isDarkMode ? Colors.white70 : Colors.black54;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
      leading: const CircleAvatar(
        backgroundColor: Colors.grey,
        child: Icon(Icons.notifications, color: Colors.white),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: isDarkMode ? Colors.white : Colors.black87,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 12,
          color: textColor,
        ),
      ),
      onTap: () {
        // Handle notification tap (e.g., navigate to related content)
      },
    );
  }
}