import 'package:chuong4/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Unit5 extends StatelessWidget {
  const Unit5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.background),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: 66,
                    right: 66,
                    top: 78 - MediaQuery.of(context).padding.top),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: const TextSpan(
                        text: 'Hello, ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Jane!',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/svgs/notices.svg',
                      height: 20,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 21),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: AppColors.search,
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      child: SvgPicture.asset(
                        'assets/svgs/search.svg',
                        height: 22,
                        width: 22,
                        fit: BoxFit.fill,
                      ),
                    ),
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 18,
                      textBaseline: TextBaseline.alphabetic,
                    ),
                    contentPadding: const EdgeInsets.all(14.0),
                    suffixIcon: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 35,
                          width: 1,
                          color: Colors.white.withOpacity(0.5),
                          margin: const EdgeInsets.only(right: 17),
                        ),
                        SvgPicture.asset(
                          'assets/svgs/void.svg',
                          height: 22,
                          width: 22,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(width: 17),
                      ],
                    ),
                  ),
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
