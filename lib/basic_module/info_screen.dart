import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "LB Chheang",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "@lybunchheang23 · View channel",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const _ActionButton(icon: Icons.switch_account, label: "Switch account"),
                _ActionButton(
                  icon: Icons.account_circle,
                  label: "Google Account",
                  onTap: () {
                    _showGoogleAccountDetails(context);
                  },
                ),
                const _ActionButton(icon: Icons.visibility_off_outlined, label: "Incognito"),
              ],
            ),
            const SizedBox(height: 30),

            // History Section
            const Text(
              "History",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _VideoThumbnail(
                    title: "HS អ្នករៀបការក...",
                    thumbnailUrl: "https://lp-cms-production.imgix.net/2019-06/iStock_000031715564Medium.jpg?sharp=10&vib=20&w=1200&w=600&h=400",
                  ),
                  _VideoThumbnail(
                    title: "ច្បាស់ដូចថ្ងៃពេញសឹ្លង...",
                    thumbnailUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCIBxH1TY3v4hMWUnecu_-Iz-7qUMjQUguow&s",
                  ),
                  _VideoThumbnail(
                    title: "Men Kim Hour...",
                    thumbnailUrl: "https://azuro-republic.com/cdn/shop/articles/How_to_Speak_Like_a_Gentleman-_Accurate_Confident_Bold-1_d965e9bf-2d25-4131-8283-5dd7c62f3c39.jpg?v=1544095585&width=2048",
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
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text("View all", style: TextStyle(color: Colors.blueAccent)),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _PlaylistThumbnail(
                    title: "Liked videos",
                    subtitle: "1,807 videos",
                    date: "Created: Jun 10, 2023",
                    thumbnailUrl: "https://www.indiewire.com/wp-content/uploads/2019/07/maxresdefault-12.jpg",
                  ),
                  _PlaylistThumbnail(
                    title: "song korean",
                    subtitle: "201 videos",
                    date: "Created: Mar 15, 2024",
                    thumbnailUrl: "https://www.rollingstone.com/wp-content/uploads/2023/07/kpop100-list-taegeuk.jpg?w=1581&h=1054&crop=1",
                  ),
                  _PlaylistThumbnail(
                    title: "Favorites",
                    subtitle: "Public · 50 videos",
                    date: "Created: Jan 01, 2023",
                    thumbnailUrl: "https://www.pacifichotel.asia/wp-content/uploads/2018/11/Learn-Khmer-Basics.jpg",
                  ),
                  _PlaylistThumbnail(
                    title: "Watch later",
                    subtitle: "Private · 10 videos",
                    date: "Created: Jul 01, 2025",
                    thumbnailUrl: "https://science4fun.info/wp-content/uploads/2016/11/Earth-planet.jpg",
                  ),
                  _PlaylistThumbnail(
                    title: "My Playlist",
                    subtitle: "Private · 5 videos",
                    date: "Created: May 20, 2025",
                    thumbnailUrl: "https://lh7-us.googleusercontent.com/M6nlRWf0_BH3gXlm0RY9HPTLyudJNP25mLwxkN5pGCYKkttnzg1wopxpEJ9Xs4IjieokayCYj4IOleT7gYktSXz3aNjQmhO_qX0D7V-ET14Nd3is6cOFKqG-Cfi1JLUUU8H7HuI37ls6gEWf246fybo",
                  ),

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
            // Footer Section
            const Divider(),
            ListTile(
              leading: const Icon(Icons.star_border_sharp),
              title: const Text("Badges"),
              onTap: () {
                // Handle Terms of Service tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.download),
              title: const Text("Downloads"),
              onTap: () {
                // Handle Terms of Service tap
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.movie_filter_sharp),
              title: const Text("Your Movies"),
              onTap: () {
                // Handle Settings tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.tv),
              title: const Text("Your TV"),
              onTap: () {
                // Handle Settings tap
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.stacked_bar_chart),
              title: const Text("Time watched"),
              onTap: () {
                // Handle Settings tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text("History"),
              onTap: () {
                // Handle History tap
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const _ActionButton({required this.icon, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, size: 30),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
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
  final String date;
  final String thumbnailUrl;

  const _PlaylistThumbnail({
    required this.title,
    required this.subtitle,
    required this.date,
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
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 2),
          Text(
            date,
            style: const TextStyle(fontSize: 10, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

void _showGoogleAccountDetails(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Google Account Details",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              "Email: chheang23@example.com",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              "Signed in: 05:06 PM +07, Jul 05, 2025",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            const Text(
              "Security Status: Secure (Last updated: Jul 05, 2025)",
              style: TextStyle(fontSize: 14, color: Colors.green),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the modal
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Text("Manage Account"),
            ),
          ],
        ),
      );
    },
  );
}