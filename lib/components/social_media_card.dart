import 'package:flutter/material.dart';

class SocialMediaCard extends StatelessWidget {
  const SocialMediaCard({
    required this.socialImage,
    Key? key, this.onTap,
  }) : super(key: key);

  final ImageProvider socialImage;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(blurRadius: 25.0, color: Color.fromRGBO(0, 0, 0, 0.1)),
            ],
            image: DecorationImage(
              image: socialImage,
            ),
            color: Colors.white10,
          ),
        ),
      ),
    );
  }
}
