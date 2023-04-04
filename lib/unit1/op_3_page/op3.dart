import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SVGPage extends StatelessWidget {
  const SVGPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 5,
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
                    SvgPicture.asset(
                      'assets/svgs/FAQ.svg',
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
                    SvgPicture.asset(
                      'assets/svgs/Contact.svg',
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
                    SvgPicture.asset(
                      'assets/svgs/terms.svg',
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
