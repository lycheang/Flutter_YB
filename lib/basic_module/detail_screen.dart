import 'package:flutter/material.dart';
import 'package:my_app/basic_module/photo_constant.dart'; // Assuming this contains imageList

// A simple model to hold video details
class VideoDetails {
  final String title;
  final String channelName;
  final String channelAvatarUrl;
  final String views;
  final String uploadDate;
  final String description;
  final int likes;
  final int dislikes;

  VideoDetails({
    required this.title,
    required this.channelName,
    required this.channelAvatarUrl,
    required this.views,
    required this.uploadDate,
    required this.description,
    this.likes = 0,
    this.dislikes = 0,
  });
}

class DetailScreen extends StatefulWidget {
  final String item; // This 'item' will now represent the video thumbnail URL
  const DetailScreen(this.item, {super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // Placeholder video details based on the selected item
  late VideoDetails _currentVideoDetails;
  bool _isPlaying = false;
  int _currentVideoIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentVideoDetails = _getVideoDetails(widget.item);
    _currentVideoIndex = imageList.indexOf(widget.item);
  }

  // Helper function to get video details based on the item (thumbnail URL)
  VideoDetails _getVideoDetails(String itemUrl) {
    // In a real app, you would fetch this from an API or a more robust data source
    // For demonstration, we'll use a switch or if-else based on the itemUrl
    if (itemUrl == imageList[0]) {
      return VideoDetails(
        title: "Final Destination: Bloodlines - Official Trailer",
        channelName: "Movie Trailers",
        channelAvatarUrl: "https://www.kindpng.com/picc/m/78-786207_user-avatar-png-user-avatar-icon-png-transparent.png",
        views: "12M views",
        uploadDate: "1 month ago",
        description: "The official trailer for the highly anticipated horror film, Final Destination: Bloodlines. Get ready for more thrilling and unexpected deaths!",
        likes: 500000,
        dislikes: 15000,
      );
    } else if (itemUrl == imageList[1]) {
      return VideoDetails(
        title: "The Matrix Resurrections - Official Trailer 2",
        channelName: "Warner Bros. Pictures",
        channelAvatarUrl: "https://www.kindpng.com/picc/m/78-786207_user-avatar-png-user-avatar-icon-png-transparent.png",
        views: "8M views",
        uploadDate: "3 months ago",
        description: "Return to the source. The Matrix Resurrections in theaters and on HBO Max.",
        likes: 300000,
        dislikes: 10000,
      );
    } else if (itemUrl == imageList[2]) {
      return VideoDetails(
        title: "Spider-Man: No Way Home - Official Trailer",
        channelName: "Sony Pictures Entertainment",
        channelAvatarUrl: "https://www.kindpng.com/picc/m/78-786207_user-avatar-png-user-avatar-icon-png-transparent.png",
        views: "25M views",
        uploadDate: "6 months ago",
        description: "For the first time in the cinematic history of Spider-Man, our friendly neighborhood hero is unmasked and no longer able to separate his normal life from the high-stakes of being a Super Hero.",
        likes: 1200000,
        dislikes: 20000,
      );
    } else if (itemUrl == imageList[3]) {
      return VideoDetails(
        title: "Dune: Part Two - Official Trailer",
        channelName: "Legendary",
        channelAvatarUrl: "https://www.kindpng.com/picc/m/78-786207_user-avatar-png-user-avatar-icon-png-transparent.png",
        views: "10M views",
        uploadDate: "2 weeks ago",
        description: "Dune: Part Two will explore the mythic journey of Paul Atreides as he unites with Chani and the Fremen while on a warpath of revenge against the conspirators who destroyed his family.",
        likes: 600000,
        dislikes: 8000,
      );
    }
    // Default details if no match is found
    return VideoDetails(
      title: "Unknown Video",
      channelName: "Unknown Channel",
      channelAvatarUrl: "https://www.kindpng.com/picc/m/78-786207_user-avatar-png-user-avatar-icon-png-transparent.png",
      views: "0 views",
      uploadDate: "N/A",
      description: "No description available.",
    );
  }

  void _playNextVideo() {
    if (_currentVideoIndex < imageList.length - 1) {
      setState(() {
        _currentVideoIndex++;
        _currentVideoDetails = _getVideoDetails(imageList[_currentVideoIndex]);
        _isPlaying = true;
      });
    }
  }

  void _playPreviousVideo() {
    if (_currentVideoIndex > 0) {
      setState(() {
        _currentVideoIndex--;
        _currentVideoDetails = _getVideoDetails(imageList[_currentVideoIndex]);
        _isPlaying = true;
      });
    }
  }

  void _togglePlayPause() {
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      title: Text(_currentVideoDetails.title),
      centerTitle: false, // YouTube app usually has title left-aligned
      actions: [
        IconButton(icon: const Icon(Icons.cast), onPressed: () {}),
        IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Video Player Placeholder with controls
          Stack(
            alignment: Alignment.center,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  imageList[_currentVideoIndex],
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
              // Video Controls Overlay
              Positioned.fill(
                child: AnimatedOpacity(
                  opacity: _isPlaying ? 0.0 : 1.0,
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    color: const Color.fromARGB(187, 0, 0, 0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Previous Button
                          IconButton(
                            icon: const Icon(Icons.skip_previous, size: 36),
                            color: Colors.white,
                            onPressed: _playPreviousVideo,
                          ),
                          // Play/Pause Button
                          IconButton(
                            icon: Icon(
                              _isPlaying ? Icons.pause : Icons.play_arrow,

                              size: 48,
                            ),
                            color: Colors.white,
                            onPressed: _togglePlayPause,

                          ),
                          // Next Button
                          IconButton(
                            icon: const Icon(Icons.skip_next, size: 36),
                            color: Colors.white,
                            onPressed: _playNextVideo,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Bottom controls bar
              Positioned(
  bottom: 0,
  left: 0,
  right: 0,
  child: AnimatedOpacity(
    opacity: _isPlaying ? 0.0 : 1.0,  // Fade out when playing
    duration: const Duration(milliseconds: 300),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.black.withOpacity(0.5),  // Keep this opacity constant
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              _isPlaying ? Icons.pause : Icons.play_arrow,
              color: Colors.white,
            ),
            onPressed: _togglePlayPause,
          ),
          Expanded(
            child: Slider(
              value: 0.3,
              onChanged: (value) {
                // Handle seek
              },
              activeColor: Colors.red,
              inactiveColor: Colors.grey,
            ),
          ),
          const Text(
            "3:45 / 12:30",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          IconButton(
            icon: const Icon(Icons.fullscreen, color: Colors.white),
            onPressed: () {
              // Handle fullscreen
            },
          ),
        ],
      ),
    ),
  ),
),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Video Title
                Text(
                  _currentVideoDetails.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                // Views and Upload Date
                Text(
                  '${_currentVideoDetails.views} • ${_currentVideoDetails.uploadDate}',
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
                const SizedBox(height: 16),
                // Action Buttons (Like, Dislike, Share, Download, Save)
                _buildActionButtons(),
                const Divider(height: 32),
                // Channel Info
                _buildChannelInfo(),
                const Divider(height: 32),
                // Description
                _buildDescription(),
                const Divider(height: 32),
                // Comments Section Placeholder
                _buildCommentsSectionPlaceholder(),
                const SizedBox(height: 20),
                // Up Next/Related Videos Placeholder
                _buildUpNextPlaceholder(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildActionButton(Icons.thumb_up_alt_outlined, _currentVideoDetails.likes.toString()),
        _buildActionButton(Icons.thumb_down_alt_outlined, _currentVideoDetails.dislikes.toString()),
        _buildActionButton(Icons.share, 'Share'),
        _buildActionButton(Icons.download, 'Download'),
        _buildActionButton(Icons.playlist_add, 'Save'),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 24),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildChannelInfo() {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(_currentVideoDetails.channelAvatarUrl),
          radius: 20,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _currentVideoDetails.channelName,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                '${_currentVideoDetails.views.split(' ')[0]} subscribers', // Simplified for demo
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Handle subscribe action
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red, // YouTube subscribe button color
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: const Text('Subscribe'),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 8),
        Text(
          _currentVideoDetails.description,
          style: const TextStyle(fontSize: 14),
          maxLines: 3, // Limit lines for initial view
          overflow: TextOverflow.ellipsis,
        ),
        TextButton(
          onPressed: () {
            // Expand description or navigate to full description page
          },
          child: const Text('...more'),
        ),
      ],
    );
  }

  Widget _buildCommentsSectionPlaceholder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Comments',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              '${_currentVideoDetails.likes ~/ 1000}K', // Placeholder for comment count
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://booleanstrings.com/wp-content/uploads/2021/10/profile-picture-circle-hd.png', // User's avatar
              ),
              radius: 16,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'Add a public comment...',
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildUpNextPlaceholder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Up next',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 10),
        // Example of a suggested video
        _buildSuggestedVideoItem(
          thumbnailUrl: imageList[0], // Using another image from imageList
          title: "Another Great Movie Trailer",
          channelName: "Trailers Hub",
          views: "5M views",
          uploadDate: "2 weeks ago",
        ),
        const SizedBox(height: 10),
        _buildSuggestedVideoItem(
          thumbnailUrl: imageList[1], // Using another image from imageList
          title: "Behind the Scenes: Making of a Blockbuster",
          channelName: "Film Buff",
          views: "1M views",
          uploadDate: "1 month ago",
        ),
        const SizedBox(height: 10),
        _buildSuggestedVideoItem(
          thumbnailUrl: imageList[2], // Using another image from imageList
          title: "Top 10 Movie Moments of the Year",
          channelName: "Cinema Highlights",
          views: "3M views",
          uploadDate: "3 weeks ago",
        ),
        const SizedBox(height: 10),
        _buildSuggestedVideoItem(
          thumbnailUrl: imageList[3], // Using another image from imageList
          title: "Upcoming Movies to Watch",
          channelName: "Movie News",
          views: "2M views",
          uploadDate: "1 week ago",
        ),
        // Add more suggested videos as needed
      ],
    );
  }

  Widget _buildSuggestedVideoItem({
    required String thumbnailUrl,
    required String title,
    required String channelName,
    required String views,
    required String uploadDate,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          _currentVideoIndex = imageList.indexOf(thumbnailUrl);
          _currentVideoDetails = _getVideoDetails(thumbnailUrl);
          _isPlaying = true;
        });
      },
      child: Row(
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
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '$channelName • $views • $uploadDate',
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, size: 20),
            onPressed: () {
              // Handle options for suggested video
            },
          ),
        ],
      ),
    );
  }
}