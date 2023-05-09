import 'package:chuong4/unit_5/app_provider.dart';
import 'package:chuong4/unit_5/common/app_colors.dart';
import 'package:chuong4/unit_5/common/containText.dart';
import 'package:chuong4/unit_5/services/services.dart';
import 'package:chuong4/unit_5/view/detail/detail_page.dart';
import 'package:chuong4/unit_5/view/home/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    double widthDimen = MediaQuery.of(context).size.width;
    double heightDimen = MediaQuery.of(context).size.height;

    return Container(
      decoration: const BoxDecoration(gradient: AppColors.background),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeader(context, widthDimen, heightDimen),
            const SizedBox(height: 21),
            buildSearchField(widthDimen, heightDimen),
            const SizedBox(height: 26),
            const Padding(
              padding: EdgeInsets.only(left: 50),
              child: Text(
                'Most Popular',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Consumer<HomeProvider>(
              builder: (context, provider, child) {
                return SizedBox(
                  height: heightDimen * (160 / 926),
                  child: provider.isLoadingPopular
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : buildListMoviePopular(provider),
                );
              },
            ),
            const SizedBox(height: 20),
            buildMenu(widthDimen, heightDimen),
            SizedBox(height: 35 * (heightDimen / 926)),
            const Padding(
              padding: EdgeInsets.only(left: 50),
              child: Text(
                'Upcoming releases',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Consumer<HomeProvider>(
              builder: (context, provider, child) {
                return Expanded(
                  child: provider.isLoadingUp
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : buildListMovieUpComing(provider),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildListMovieUpComing(HomeProvider provider) {
    return Swiper(
      itemCount: 6,
      layout: SwiperLayout.DEFAULT,
      itemHeight: 215, //using with SwiperLayout.CUSTOM
      itemWidth: 145,
      transformer: ScaleAndFadeTransformer(),
      customLayoutOption: CustomLayoutOption(
        startIndex: 0,
        stateCount: 3,
      ).addScale(
        [0.9, 1, 0.9],
        const Alignment(0, 0),
      ).addTranslate([
        const Offset(-170.0, 0.0),
        const Offset(0.0, 0.0),
        const Offset(170.0, 0.0)
      ]).addOpacity([0.5, 1.0, 0.5]),
      itemBuilder: (BuildContext context, int index) {
        return buildItemPopular(index, provider);
      },
      pagination: SwiperPagination(
        margin: const EdgeInsets.only(top: 17),
        builder: SwiperCustomPagination(
          builder: (context, config) => buildPagination(config),
        ),
      ),
      outer: true,
      fade: 0.2,
      viewportFraction: 0.4,
      scale: 0.7,
    );
  }

  Widget buildItemPopular(int index, HomeProvider provider) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 15,
            offset: const Offset(4, 4), // changes position of shadow
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.network(
          '${Services.baseImg}${provider.listMoviePopular?[index].posterPath}',
          width: 145,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress)
          {
            if (loadingProgress == null) return child;
            return Center(
              child:
              Shimmer.fromColors(
                baseColor: Colors.white30,
                highlightColor: Colors.white,
                child: Container(
                  color: Colors.grey,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildMenu(double widthDimen, double heightDimen) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildMenuItem(
          icon: 'assets/svgs/genres.svg',
          title: 'Genres',
          iconSize: 31.0,
          heightDimen: heightDimen,
          widthDimen: widthDimen,
        ),
        const SizedBox(width: 18),
        buildMenuItem(
          icon: 'assets/svgs/tv_series.svg',
          title: 'TV Series',
          iconSize: 34.0,
          heightDimen: heightDimen,
          widthDimen: widthDimen,
        ),
        const SizedBox(width: 18),
        buildMenuItem(
          icon: 'assets/svgs/movies.svg',
          title: 'Movies',
          iconSize: 42.0,
          heightDimen: heightDimen,
          widthDimen: widthDimen,
        ),
        const SizedBox(width: 18),
        buildMenuItem(
          icon: 'assets/svgs/theatre.svg',
          title: 'In Theatre',
          iconSize: 36.0,
          heightDimen: heightDimen,
          widthDimen: widthDimen,
        )
      ],
    );
  }

  Widget buildMenuItem({
    required String icon,
    required String title,
    required double iconSize,
    required double heightDimen,
    required double widthDimen,
  }) {
    return Container(
      height: 95 * (heightDimen / 926),
      width: 69 * (widthDimen / 428),
      decoration: BoxDecoration(
        gradient: AppColors.menuOpa,
        border: Border.all(
          color: AppColors.white.withOpacity(0.2),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            height: iconSize,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 11),
          Text(
            title,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 9,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListMoviePopular(HomeProvider provider) {
    return Swiper(
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) =>  DetailPage(id: provider.listMoviePopular?[index].id ?? 758323),
                settings: RouteSettings(
                  arguments: {'id': provider.listMoviePopular?[index].id},
                ),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  // spreadRadius: 30,
                  blurRadius: 15,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    '${Services.baseImg}${provider.listMoviePopular?[index].backdropPath}',
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress)
                        {
                      if (loadingProgress == null) return child;
                      return Center(
                        child:
                              Shimmer.fromColors(
                              baseColor: Colors.white30,
                              highlightColor: Colors.white,
                              child: Container(
                              color: Colors.grey,
                          ),
                        ),
                      );
                    },
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: AppColors.blurBlack,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 26,
                        right: 26,
                        bottom: 15,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Text(
                              provider.listMoviePopular?[index].title ?? '',
                              style: const TextStyle(
                                color: AppColors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          ContainText(
                            title: '',
                            point:
                                provider.listMoviePopular?[index].voteAverage,
                            isPoint: true,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      pagination: SwiperPagination(
        margin: const EdgeInsets.only(top: 17),
        builder: SwiperCustomPagination(
          builder: (context, config) => buildPagination(config),
        ),
      ),
      outer: true,
      fade: 0.5,
      viewportFraction: 0.75,
      scale: 0.8,
    );
  }

  Widget buildPagination(SwiperPluginConfig config) {
    return SizedBox(
      height: 8,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 6,
        itemBuilder: (context, index) => Container(
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            gradient: index == config.activeIndex
                ? AppColors.dotIndicator
                : AppColors.dotIndicatorOpa,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 4);
        },
      ),
    );
  }

  Widget buildSearchField(
    double? widthDimen,
    double? heightDimen,
  ) {
    return Container(
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
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          constraints: const BoxConstraints(minHeight: 50, maxHeight: 50),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.white.withOpacity(0.2), width: 0.5),
              borderRadius: const BorderRadius.all(Radius.circular(15.0))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(14),
            child: SvgPicture.asset(
              'assets/svgs/search.svg',
              height: 22,
            ),
          ),
          suffixIcon: Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            // color: Colors.black,
            width: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  color: const Color.fromRGBO(255, 255, 255, 0.5),
                  width: 1,
                  height: 35,
                ),
                const SizedBox(width: 17),
                SvgPicture.asset(
                  'assets/svgs/void.svg',
                  height: 22,
                ),
                const SizedBox(width: 14),
              ],
            ),
          ),
          hintText: 'Search',
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontSize: 18,
          ),
          alignLabelWithHint: false,
        ),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        onTap: () => {},
      ),
    );
  }

  Widget buildHeader(
    BuildContext context,
    double widthDimen,
    double heightDimen,
  ) {
    return Padding(
      padding: EdgeInsets.only(
        left: 66,
        right: 66,
        top: (78 / 926) * heightDimen - MediaQuery.of(context).padding.top,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              text: 'Hello, ',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: context.read<AppProvider>().userName,
                  style: const TextStyle(
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
    );
  }

  void init() async {
    context.read<HomeProvider>().getListInit();
  }
}
