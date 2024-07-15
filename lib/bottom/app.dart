import 'package:flutter/material.dart';
import 'package:my_theme/bottom/bottom_nav_bar.dart';

class App extends StatefulWidget {
  const App({super.key, required this.child});
  final Widget child;


  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

