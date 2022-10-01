import 'package:flutter/material.dart';

class ModalButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function() action;

  const ModalButton(
      {Key? key, required this.icon, required this.title, required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 72.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            splashRadius: 0.1,
            padding: EdgeInsets.zero,
            onPressed: action,
            icon: Icon(icon),
            iconSize: 32,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 16,
                color: Colors.deepOrange.shade50.withOpacity(0.5)),
          ),
        ],
      ),
    );
  }
}
