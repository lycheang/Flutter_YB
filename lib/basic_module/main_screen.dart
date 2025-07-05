import 'package:flutter/material.dart';
import 'package:my_app/basic_module/info_screen.dart';
import 'package:my_app/basic_module/layout_screen.dart';
import 'package:my_app/basic_module/log_in_screen.dart';


import 'package:my_app/basic_module/subsciption_screen.dart';
import 'package:provider/provider.dart';

import 'home_creen.dart';
import 'font_logic.dart';
import 'post_screen.dart';
import 'theme_logic.dart';
import 'short_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _screens = [
    
    FbScreen(),
    tik_tok_screen(),
    post_screen(),
    SubscriptionScreen(),
    InfoScreen() 
    // Center(child: Text("Post Screen")),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,  // Attach the key to Scaffold
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
 
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.play_arrow_outlined), label: "Shorts"),
          BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), label: "Post"),
          BottomNavigationBarItem(icon: Icon(Icons.subscriptions_outlined), label: "Subscriptions"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "You"),
        ],
      ),
      endDrawer: _buildDrawer(context),
    );
  }

 Widget _buildDrawer(BuildContext context) {
  int themeIndex = context.watch<ThemeLogic>().themeIndex;

  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          accountName: const Text("lb_chheang"),
          accountEmail: const Text("chheang23@example.com"),
          currentAccountPicture: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => LayoutScreen()),
              );
            },
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.account_circle, size: 50, color: Colors.grey),
            ),
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text("Settings"),
          onTap: () {
            Navigator.of(context).pop();
            // Navigate to settings screen if needed
          },
        ),
        
        ListTile(
          leading: Icon(
            themeIndex == 1
                ? Icons.dark_mode
                : themeIndex == 2
                    ? Icons.light_mode
                    : Icons.phone_android,
          ),
          title: const Text("Appearance"),
          subtitle: Text(
            themeIndex == 0
                ? "System default"
                : themeIndex == 1
                    ? "Dark theme"
                    : "Light theme",
          ),
          onTap: () {
            // Open theme selection dialog or screen
            showModalBottomSheet(
              context: context,
              builder: (ctx) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.phone_android),
                      title: const Text("System default"),
                      onTap: () {
                        context.read<ThemeLogic>().changeToSystem();
                        Navigator.of(ctx).pop();
                      },
                      trailing: themeIndex == 0
                          ? const Icon(Icons.check_circle)
                          : null,
                    ),
                    ListTile(
                      leading: const Icon(Icons.dark_mode),
                      title: const Text("Dark theme"),
                      onTap: () {
                        context.read<ThemeLogic>().changeToDark();
                        Navigator.of(ctx).pop();
                      },
                      trailing: themeIndex == 1
                          ? const Icon(Icons.check_circle)
                          : null,
                    ),
                    ListTile(
                      leading: const Icon(Icons.light_mode),
                      title: const Text("Light theme"),
                      onTap: () {
                        context.read<ThemeLogic>().changeToLight();
                        Navigator.of(ctx).pop();
                      },
                      trailing: themeIndex == 2
                          ? const Icon(Icons.check_circle)
                          : null,
                    ),
                  ],
                );
              },
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.help_outline),
          title: const Text("Help & feedback"),
          onTap: () {
            Navigator.of(context).pop();
            // Navigate to help screen if you have one
          },
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: const Text(
            "Text Size",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () => context.read<FontLogic>().decrease(),
              icon: const Icon(Icons.text_decrease_rounded),
            ),
            IconButton(
              onPressed: () => context.read<FontLogic>().increase(),
              icon: const Icon(Icons.text_increase_rounded),
            ),
          ],
        ),
      ],
    ),
  );
}


AppBar _buildAppBar() {
    return AppBar(
      // backgroundColor: Colors.red,
      // foregroundColor: Colors.white,
      title: const Text("YouTube"),
      centerTitle: false,
      // iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(icon: const Icon(Icons.cast), onPressed: () {}),
          IconButton(icon: const Icon(Icons.notifications_none), onPressed: () {}),
          IconButton(
  icon: const Icon(Icons.search),
  onPressed: () {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => const SearchScreen(),
    ));
  },
),

          IconButton(
            icon: const Icon(Icons.account_circle_outlined),
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
    );
  }
}
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: 'Search YouTube',
            hintStyle: TextStyle(color: Colors.white70),
            border: InputBorder.none,
          ),
        ),
        // backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      // backgroundColor: Colors.black,
      body: const Center(
        child: Text(
          "Type to search...",
          style: TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
}
