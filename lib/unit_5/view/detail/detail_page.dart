import 'package:chuong4/unit_5/common/app_colors.dart';
import 'package:chuong4/unit_5/common/cast_item.dart';
import 'package:chuong4/unit_5/common/containText.dart';
import 'package:chuong4/unit_5/modal/movie_modal.dart';
import 'package:chuong4/unit_5/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailPage extends StatefulWidget {
  final num id;

  const DetailPage({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool showMore = false;
  Movie? movie;

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map agr = ModalRoute.of(context)!.settings.arguments as Map;
    movie = agr['movie'] as Movie;

    return Scaffold(
      body: movie != null
          ? Stack(
              children: [
                buildBackground(movie!),
                buildDetailMovie(context, movie!),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  void init() async {
    Movie? mv = await Services.getMovieDetail(id: widget.id);
    setState(() {
      movie = mv;
    });
  }

  Widget buildDetailMovie(BuildContext context, Movie mv) {
    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        buildAppBar(context),
        buildInformation(movie!),
      ],
    );
  }

  Widget buildInformation(Movie mv) {
    return SliverToBoxAdapter(
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
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  'assets/svgs/line.svg',
                  color: AppColors.lineColor.withOpacity(0.75),
                  colorBlendMode: BlendMode.srcIn,
                  width: 32,
                  height: 3,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.center,
                child: Text(
                  mv.title ?? '',
                  style: const TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              mv.originalTitle != mv.title
                  ? Align(
                      child: Text(
                        mv.originalTitle ?? '',
                        style: TextStyle(
                          color: AppColors.white.withOpacity(0.5),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    )
                  : const SizedBox(),
              const SizedBox(height: 29),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const ContainText(
                        title: 'Action',
                      ),
                      const SizedBox(width: 10),
                      mv.adult ?? false
                          ? const ContainText(title: '16+')
                          : const SizedBox(),
                      mv.adult ?? false ? SizedBox(width: 10) : SizedBox(),
                      ContainText(
                        title: '',
                        point: mv.voteAverage,
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
                      // maxLines: showMore ? null : 3,
                      // overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        text: '',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.75),
                          fontSize: 12,
                        ),
                        children: [
                          TextSpan(
                            text: mv.overview,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.75),
                              fontSize: 12,
                            ),
                          ),
                          const TextSpan(
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
                    children: const [
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
                    children: const [
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
              ),
              const SizedBox(height: 20),
              const Text(
                'Photo',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(0),
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  crossAxisCount: 3,
                  children: [
                    Image.network(
                      'https://m.media-amazon.com/images/M/MV5BNTAwNDg2NTc5MF5BMl5BanBnXkFtZTgwMTY1NDA0MDE@._V1_FMjpg_UX1280_.jpg',
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      'https://m.media-amazon.com/images/M/MV5BMTM5NjQ4NTA0NV5BMl5BanBnXkFtZTgwOTU1NDA0MDE@._V1_FMjpg_UX1024_.jpg',
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      'https://m.media-amazon.com/images/M/MV5BNTAwNDg2NTc5MF5BMl5BanBnXkFtZTgwMTY1NDA0MDE@._V1_FMjpg_UX1280_.jpg',
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      'https://m.media-amazon.com/images/M/MV5BMjI0MTAzODU3MF5BMl5BanBnXkFtZTgwMDQ3OTIxMDE@._V1_FMjpg_UX1280_.jpg',
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      'https://m.media-amazon.com/images/M/MV5BMTQ5MTA2MzQ5NV5BMl5BanBnXkFtZTgwNTQ3OTIxMDE@._V1_FMjpg_UX1280_.jpg',
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      'https://m.media-amazon.com/images/M/MV5BMTM3NzcxOTA2OF5BMl5BanBnXkFtZTgwNTc4OTIxMDE@._V1_FMjpg_UX1280_.jpg',
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      'https://m.media-amazon.com/images/M/MV5BMjMzMTk1ODY4NF5BMl5BanBnXkFtZTgwMjExMDMxMDE@._V1_FMjpg_UX1024_.jpg',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return SliverAppBar(
      title: const Text(''),
      leading: Padding(
        padding: const EdgeInsets.only(left: 53),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset(
            'assets/svgs/back.svg',
            width: 18,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      flexibleSpace: const FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
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
      pinned: false,
      expandedHeight: MediaQuery.of(context).size.height * 0.4,
      collapsedHeight: 56,
      floating: true,
      snap: true,
    );
  }

  SizedBox buildBackground(Movie mv) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Image.network(
        '${Services.baseImg}${mv.posterPath}',
        fit: BoxFit.fitWidth,
        alignment: Alignment.topCenter,
      ),
    );
  }
}
