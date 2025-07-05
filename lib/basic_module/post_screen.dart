import 'package:flutter/material.dart';

class post_screen extends StatefulWidget {
  const post_screen({super.key});

  @override
  State<post_screen> createState() => post_screenState();
}

class post_screenState extends State<post_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Post"),
      // ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPostHeader(),
          const SizedBox(height: 12),
          const Text(
            "Cambodia is a Southeast Asian nation whose landscape spans low-lying plains, the Mekong Delta, mountains and Gulf of Thailand coastline. Phnom Penh, its capital, is home to the art deco Central Market, glittering Royal Palace and the National Museum's historical and archaeological exhibits. In the country's northwest are the ruins of Angkor Wat, a massive stone temple complex built during the Khmer Empire.",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          _buildPostActions(),
        ],
      ),
    );
  }

  Widget _buildPostHeader() {
    return Row(
      children: [
        const CircleAvatar(
          backgroundImage: NetworkImage(
            'https://www.kindpng.com/picc/m/78-786207_user-avatar-png-user-avatar-icon-png-transparent.png',
          ),
          radius: 20,
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Khmer Travel',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '2 hours ago',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPostActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        Icon(Icons.thumb_up_alt_outlined, color: Colors.grey),
        Icon(Icons.comment_outlined, color: Colors.grey),
        Icon(Icons.share_outlined, color: Colors.grey),
      ],
    );
  }
}
