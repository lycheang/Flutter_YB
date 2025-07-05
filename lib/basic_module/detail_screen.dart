import 'package:flutter/material.dart';
import 'package:my_app/basic_module/photo_constant.dart';

class DetailScreen extends StatefulWidget {
  final String item;
  const DetailScreen(this.item, {super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      centerTitle: true,
      title: const Text("YouTube Video"),
      // backgroundColor: Colors.black,
      // foregroundColor: Colors.white,
    );
  }

  Widget _buildBody() {
    // Return content widget here, for example:
    return Center(
      child: Text(
        'Selected item: ${imageList.indexOf(widget.item) + 1}',
        // style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
