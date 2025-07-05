import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: SubscriptionScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black, 
      body: ListView(
        children: [
          _buildPostCard(
            channelName: 'Ly Bunchheang',
            avatarUrl: 'https://booleanstrings.com/wp-content/uploads/2021/10/profile-picture-circle-hd.png',
            timeAgo: '2 hours ago',
            videoTitle: 'Ly Bunchheang livestream replay',
            videoThumb: 'https://i.ytimg.com/vi/bTqVqk7FSmY/maxresdefault.jpg',
            description: 'A popular Cambodian YouTuber sharing daily vlogs and music videos.',
          ),
          _buildPostCard(
            channelName: 'Ghost Record Official',
            avatarUrl: 'https://www.kindpng.com/picc/m/78-786207_user-avatar-png-user-avatar-icon-png-transparent.png',
            timeAgo: '1 day ago',
            videoTitle: 'Ghost Record Official livestream replay',
            videoThumb: 'https://i.ytimg.com/vi/2kdkoMElaXA/maxresdefault.jpg',
            description: 'A trending Cambodian channel discussing mysterious and ghostly encounters with real people.',
          ),
          _buildPostCard(
            channelName: 'Cambodia Travel',
            avatarUrl: 'https://www.kindpng.com/picc/m/78-786207_user-avatar-png-user-avatar-icon-png-transparent.png',
            timeAgo: '3 days ago',
            videoTitle: 'Top 10 places to visit in Cambodia',
            videoThumb: 'https://nowboarding.changiairport.com/content/dam/canowboarding/homepage-carousel/travel-guide-cambodia-phnom-penh/aerial-view-royal-palace-of-phnom-penh-cambodia-1920x1080.jpg',
            description: 'Explore the most beautiful destinations in Cambodia with us!',
          ),
          _buildPostCard(
            channelName: 'Tech Reviews',
            avatarUrl: 'https://www.kindpng.com/picc/m/78-786207_user-avatar-png-user-avatar-icon-png-transparent.png',
            timeAgo: '5 days ago',
            videoTitle: 'Latest smartphone review',
            videoThumb: 'https://www.yugatech.com/wp-content/uploads/2023/09/TECNO-POVA-5-20.jpg',
            description: 'In-depth review of the latest smartphone features and performance.',
          ),
        ],
      ),
    );
  }

  Widget _buildPostCard({
    required String channelName,
    required String avatarUrl,
    required String timeAgo,
    required String videoTitle,
    required String videoThumb,
    required String description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(avatarUrl),
          ),
          title: Text(
            channelName,
            style: const TextStyle( fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            timeAgo,
            style: const TextStyle(fontSize: 12),
          ),
          trailing: const Icon(Icons.more_vert,),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Text(
            videoTitle,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Image.network(
          videoThumb,
          width: double.infinity,
          height: 220,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Text(
            description,
            style: const TextStyle(fontSize: 14),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Icon(Icons.thumb_up_alt_outlined),
              SizedBox(width: 16),
              Icon(Icons.comment_outlined),
              SizedBox(width: 16),
              Icon(Icons.share_outlined),
            ],
          ),
        ),
        const Divider(thickness: 0.5),
      ],
    );
  }
}
