import 'package:chuong4/unit_5/common/app_colors.dart';
import 'package:chuong4/unit_5/common/cast_item.dart';
import 'package:chuong4/unit_5/common/containText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool showMore = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/imgs/thor.png',
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text(''),
                leading: Padding(
                  padding: EdgeInsets.only(left: 53),
                  child: SvgPicture.asset(
                    'assets/svgs/back.svg',
                    width: 18,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                shadowColor: Colors.transparent,
                leadingWidth: 18 + 53,
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                foregroundColor: Colors.white,
                backgroundColor: Colors.transparent,
                pinned: true,
                expandedHeight: MediaQuery.of(context).size.height * 0.4,
                collapsedHeight: 56,
                floating: true,
                snap: true,
              ),
              SliverToBoxAdapter(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: AppColors.background,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                    ),
                  ),
                  height: 1000,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 50,
                      right: 50,
                      top: 34,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Thor',
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 64,
                          ),
                        ),
                        Text(
                          'The Dark World',
                          style: TextStyle(
                            color: AppColors.white.withOpacity(0.5),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 29),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ContainText(
                                  title: 'Action',
                                ),
                                SizedBox(width: 10),
                                ContainText(title: '16+'),
                                SizedBox(width: 10),
                                ContainText(
                                  title: '',
                                  isPoint: true,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/svgs/share.svg',
                                  width: 20,
                                  color: Colors.white.withOpacity(0.75),
                                ),
                                const SizedBox(width: 10),
                                SvgPicture.asset(
                                  'assets/svgs/heart.svg',
                                  width: 20,
                                  color: Colors.white.withOpacity(0.75),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 17),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: RichText(
                                maxLines: showMore ? null : 3,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  text:
                                      'When the Dark Elves attempt to plunge the universe into darkness, Thor must embark on a perilous and personal journey that will reunite him with doctor Jane Foster. ',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.75),
                                    fontSize: 12,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'More',
                                      style: TextStyle(
                                        color: AppColors.lightBlue,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Cast',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  'See All',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                CastItem(
                                  realName: 'Chris Hemsworth',
                                  characterName: 'Thor',
                                ),
                                Spacer(),
                                CastItem(
                                  realName: 'Chris Hemsworth',
                                  characterName: 'Thor',
                                ),
                                Spacer(),
                                CastItem(
                                  realName: 'Chris Hemsworth',
                                  characterName: 'Thor',
                                ),
                                Spacer(),
                                CastItem(
                                  realName: 'Chris Hemsworth',
                                  characterName: 'Thor',
                                ),
                                Spacer(),
                                CastItem(
                                  realName: 'Chris Hemsworth',
                                  characterName: 'Thor',
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
    //   Stack(
    //   children: [
    //     Image.asset(
    //       'assets/imgs/thor.png',
    //       fit: BoxFit.fitWidth,
    //       width: double.infinity,
    //     ),
    //     Container(
    //       width: double.infinity,
    //       height: double.infinity,
    //       alignment: Alignment.bottomCenter,
    //       color: Colors.transparent,
    //       child: Container(
    //         decoration: BoxDecoration(
    //           gradient: AppColors.background,
    //           borderRadius: BorderRadius.only(
    //             topRight: Radius.circular(50),
    //             topLeft: Radius.circular(50),
    //           ),
    //         ),
    //         height: (431 / 926) * MediaQuery.of(context).size.height,
    //         width: double.infinity,
    //       ),
    //     )
    //   ],
    // );
  }
}
