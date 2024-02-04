import 'package:flutter/material.dart';

class TitleHome extends StatelessWidget {
  final String title;
  const TitleHome({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Viwe All",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
