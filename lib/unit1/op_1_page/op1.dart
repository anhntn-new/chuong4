import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 8,
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white38,
                  border: Border.all(
                    color: Colors.black26,
                    width: 2,
                  ),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/imgs/FAQ.png',
                      height: 28,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      'FAQ',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black38,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white38,
                  border: Border.all(
                    color: Colors.black26,
                    width: 2,
                  ),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/imgs/Group.png',
                      height: 28,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      'Contact Us',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black38,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white38,
                  border: Border.all(
                    color: Colors.black26,
                    width: 2,
                  ),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/imgs/terms.png',
                      height: 28,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      'Term & Conditions',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black38,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
