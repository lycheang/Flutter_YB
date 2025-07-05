import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'detail_screen.dart';
import 'photo_constant.dart'; // Assuming this file contains the imageList

class FbScreen extends StatefulWidget {
  const FbScreen({super.key});

  @override
  State<FbScreen> createState() => _FbScreenState();
}

class _FbScreenState extends State<FbScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _buildCategoryChips()),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final item = imageList[index];
                return _buildFeedItem(item);
              },
              childCount: imageList.length,
              
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChips() {
    final categories = ["All", "Music", "Gaming", "News", "Movies", "Learning", "Live"];
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Chip(
              label: Text(categories[index]),
              // backgroundColor: Colors.grey.shade200,
            ),
            
          );
        },
      ),
    );
  }

  Widget _buildFeedItem(String imageUrl) {
  return InkWell(
    onTap: () {
      Navigator.of(context).push(
        CupertinoPageRoute(
          builder: (context) => DetailScreen(imageUrl),
          fullscreenDialog: true,

        ),
      );
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Stack for image + duration overlay
        Stack(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                },
              ),
            ),
            // Duration text (bottom-right)
            Positioned(
              bottom: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                color: Colors.black87,
                child: const Text(
                  "12:34", // You can customize this per video if needed
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),

        ListTile(
          leading: const CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white),
          ),
          title: const Text(
            "Video Movie",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: const Text("Channel Name · 1M views · 1 day ago"),
          trailing: const Icon(Icons.more_vert),
        ),
      ],
    ),
  );
}
}
