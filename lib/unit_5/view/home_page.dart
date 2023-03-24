import 'package:chuong4/unit_5/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
            SizedBox(
              height: heightDimen * (160 / 926),
              child: buildSwiper(),
            ),
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
            Expanded(child: buildSwiper2()),
          ],
        ),
      ),
    );
  }

  Widget buildSwiper2() {
    return Swiper(
      itemCount: 4,
      layout: SwiperLayout.DEFAULT,
      customLayoutOption: new CustomLayoutOption(startIndex: 0, stateCount: 3)
          .addScale([1, 0.6], Alignment(-1, 0)),
      itemBuilder: (BuildContext context, int index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset(
            'assets/imgs/merric.png',
            width: 145,
            fit: BoxFit.fitWidth,
          ),
        );
      },
      pagination: SwiperPagination(
        builder: SwiperCustomPagination(
          builder: (context, config) => buildPagination(config),
        ),
      ),
      outer: true,
      fade: 0.2,
      viewportFraction: 0.4,
      scale: 0.9,
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
            widthDimen: widthDimen),
        const SizedBox(width: 18),
        buildMenuItem(
            icon: 'assets/svgs/tv_series.svg',
            title: 'TV Series',
            iconSize: 34.0,
            heightDimen: heightDimen,
            widthDimen: widthDimen),
        const SizedBox(width: 18),
        buildMenuItem(
            icon: 'assets/svgs/movies.svg',
            title: 'Movies',
            iconSize: 42.0,
            heightDimen: heightDimen,
            widthDimen: widthDimen),
        const SizedBox(width: 18),
        buildMenuItem(
            icon: 'assets/svgs/theatre.svg',
            title: 'In Theatre',
            iconSize: 36.0,
            heightDimen: heightDimen,
            widthDimen: widthDimen)
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

  Widget buildSwiper() {
    return Swiper(
      itemCount: 4,
      customLayoutOption: CustomLayoutOption(startIndex: 0, stateCount: 4)
          .addScale([1, 0.6], Alignment.center),
      itemBuilder: (BuildContext context, int index) {
        return ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                "assets/imgs/deadpool.png",
                fit: BoxFit.cover,
              ),
              Container(
                decoration: const BoxDecoration(gradient: AppColors.blurBlack),
              ),
            ],
          ),
        );
      },
      pagination: SwiperPagination(
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
        itemCount: 4,
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
        // textAlignVertical: TextAlignVertical.center,
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
            color: Colors.white.withOpacity(0.9),
            fontSize: 18,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 14.0,
            horizontal: 16,
          ),
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
    );
  }
}
