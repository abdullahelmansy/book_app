import 'package:flutter/material.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 400,
        height: 80,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey, offset: Offset(2, 4), blurRadius: 10)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 24,
                ))
          ],
        ),
      ),
    );
  }
}
