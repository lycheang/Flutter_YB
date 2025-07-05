import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        // backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Info Row
            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    'https://booleanstrings.com/wp-content/uploads/2021/10/profile-picture-circle-hd.png',
                  ),
                  // backgroundColor: Colors.grey,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "LB Chheang",
                      style: TextStyle(
                          fontSize: 18,
                          // color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "@lybunchheang23 · View channel",
                      style: TextStyle(fontSize: 14,),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                _ActionButton(icon: Icons.switch_account, label: "Switch account",),
                _ActionButton(icon: Icons.account_circle, label: "Google Account"),
                _ActionButton(icon: Icons.visibility_off_outlined, label: "Incognito"),
              ],
            ),
            const SizedBox(height: 30),

            // History Section
            const Text(
              "History",
              style: TextStyle(
                  fontSize: 18,fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _VideoThumbnail(
                    title: "HS អ្នករៀបការក...",
                    thumbnailUrl: "https://img.youtube.com/vi/BBAyRBTfsOU/0.jpg",
                  ),
                  _VideoThumbnail(
                    title: "ច្បាស់ដូចថ្ងៃពេញសឹ្លង...",
                    thumbnailUrl: "https://img.youtube.com/vi/ScMzIvxBSi4/0.jpg",
                  ),
                  _VideoThumbnail(
                    title: "Men Kim Hour...",
                    thumbnailUrl: "https://img.youtube.com/vi/bTqVqk7FSmY/0.jpg",
                  ),
                  _VideoThumbnail(
                    title: "សូមមើលវីដេអូនេះ...",
                    thumbnailUrl: "https://img.youtube.com/vi/2kdkoMElaXA/0.jpg",
                  ),
                  
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Playlists Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Playlists",
                  style: TextStyle(
                      fontSize: 18,fontWeight: FontWeight.bold),
                ),

                Text("View all", style: TextStyle(color: Colors.blueAccent)),
                
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _PlaylistThumbnail(title: "Liked videos", subtitle: "1,807"),
                  _PlaylistThumbnail(title: "song korean", subtitle: "201"),
                  _PlaylistThumbnail(title: "Favorites", subtitle: "Public"),
                  _PlaylistThumbnail(title: "Watch later", subtitle: "Private"),
                  _PlaylistThumbnail(title: "My Playlist", subtitle: "Private"),
                ],
              ),
            ),

            const SizedBox(height: 20),
            const Text("Your videos", style: TextStyle()),
            const SizedBox(height: 30),
            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                _ActionButton(icon: Icons.video_call, label: "Create"),
                _ActionButton(icon: Icons.upload_file, label: "Upload"),
                _ActionButton(icon: Icons.playlist_add, label: "Playlist"),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ActionButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon,size: 30),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class _VideoThumbnail extends StatelessWidget {
  final String title;
  final String thumbnailUrl;

  const _VideoThumbnail({
    required this.title,
    required this.thumbnailUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              thumbnailUrl,
              width: 160,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 4),
          // Title
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _PlaylistThumbnail extends StatelessWidget {
  final String title;
  final String subtitle;

  const _PlaylistThumbnail({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      color: Colors.grey[850],
      child: Column(
        children: [
          Container(height: 60,),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              title,
              style: const TextStyle(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
