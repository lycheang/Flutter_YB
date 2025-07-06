import 'package:flutter/material.dart';
import 'photo_constant.dart';
class tik_tok_screen extends StatelessWidget {
  const tik_tok_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: TikTokMainPage(),
    );
  }
}

class TikTokMainPage extends StatefulWidget {
  const TikTokMainPage({super.key});

  @override
  State<TikTokMainPage> createState() => _TikTokMainPageState();
}

class _TikTokMainPageState extends State<TikTokMainPage> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          onPageChanged: (index) {
            setState(() {
              selectedTab = index;
            });
          },
          children: [
            _buildShortsFeed(actorList, "For You"),
            _buildShortsFeed(actorList, "Following"),
          ],
        ),
        Positioned(
          top: 40,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTab(String title, int index) {
    final isSelected = selectedTab == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = index;
        });
      },
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildShortsFeed(List<String> list, String label) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: list.length,
      itemBuilder: (context, index) {
        final item = list[index];
        return Stack(
          fit: StackFit.expand,
          children: [
            Image.network(item, fit: BoxFit.cover),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Positioned(
              bottom: 80,
              left: 16,
              right: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '@ShortVideoChannel',
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'This is a Superstar of the short video.',
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 150,
              right: 16,
              child: Column(
                children: const [
                  Icon(Icons.favorite_border, color: Colors.white),
                  SizedBox(height: 20),
                  Icon(Icons.comment_outlined, color: Colors.white),
                  SizedBox(height: 20),
                  Icon(Icons.reply, color: Colors.white),
                  SizedBox(height: 20),
                  Icon(Icons.more_vert, color: Colors.white),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
