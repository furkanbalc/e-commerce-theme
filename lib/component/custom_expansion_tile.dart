import 'package:flutter/material.dart';

class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile({super.key, required this.title});

  final String title;

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent,splashFactory: NoSplash.splashFactory),
      child: ExpansionTile(
        title: Text(widget.title, style: const TextStyle(fontSize: 18)),
        onExpansionChanged: (value) {
          setState(() {
            _isExpanded = value;
          });
        },
        trailing: Icon(_isExpanded ? Icons.keyboard_arrow_down_outlined : Icons.chevron_right),
        children: [
          ListTile(
            splashColor: Colors.transparent,
            title: Text('${widget.title} details go here'),
          ),
        ],
      ),
    );
  }
}
