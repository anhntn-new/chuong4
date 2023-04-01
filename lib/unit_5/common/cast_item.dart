import 'package:flutter/material.dart';

class CastItem extends StatelessWidget {
  final String realName;
  final String characterName;

  const CastItem({
    Key? key,
    required this.realName,
    required this.characterName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      child: Column(
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Image.asset(
                'assets/imgs/chris.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 9),
          Text(
            realName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 8,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4),
          Text(
            characterName,
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 8,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
