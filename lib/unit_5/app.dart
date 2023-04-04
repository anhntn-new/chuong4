import 'package:chuong4/unit_5/common/app_colors.dart';
import 'package:chuong4/widget/tab_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int selectedItem = 0;

  final Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>(),
    3: GlobalKey<NavigatorState>(),
    4: GlobalKey<NavigatorState>(),
  };

  final Map<int, IconData> items = const {
    0: Icons.home,
    1: Icons.add,
    2: Icons.account_circle,
    3: Icons.account_circle,
    4: Icons.account_circle,
  };

  void _onItemTapped(int index) {
    setState(() {
      selectedItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        primary: false,
        body: WillPopScope(
          onWillPop: () async {
            // This is when you want to remove all the pages from the
            // stack for the specific BottomNav item.
            navigatorKeys[selectedItem]
                ?.currentState
                ?.popUntil((route) => route.isFirst);

            return false;
          },
          child: Stack(
            children: items
                .map(
                  (item, _) => MapEntry(
                    item,
                    _buildOffstageNavigator(item, item == (selectedItem)),
                  ),
                )
                .values
                .toList(),
          ),
        ),
        // _widgetOptions.elementAt(_selectedIndex),
        // extendBody: true,
        bottomNavigationBar: SizedBox(
          height: 64,
          child: Stack(
            fit: StackFit.loose,
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: AppColors.background,
                  border: Border(
                    top: BorderSide(
                      color: Colors.white.withOpacity(0.2),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: AppColors.search,
                ),
                child: MediaQuery(
                  data: const MediaQueryData(
                      padding: EdgeInsets.only(
                    bottom: 10,
                    top: 10,
                  ) // here is the padding
                      ),
                  child: BottomNavigationBar(
                    elevation: 0.0,
                    unselectedLabelStyle: const TextStyle(fontSize: 0),
                    selectedLabelStyle: const TextStyle(fontSize: 0),
                    backgroundColor: Colors.transparent,
                    type: BottomNavigationBarType.shifting,
                    selectedFontSize: 0.0,
                    unselectedFontSize: 0.0,
                    items: [
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset('assets/svgs/home.svg'),
                        label: 'home',
                        backgroundColor: Colors.transparent,
                        activeIcon: Column(
                          children: [
                            SvgPicture.asset(
                              'assets/svgs/home_shadow.svg',
                            ),
                            SvgPicture.asset('assets/svgs/dot.svg'),
                          ],
                        ),
                      ),
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset('assets/svgs/heart.svg'),
                        label: 'Home',
                        activeIcon: Column(
                          children: [
                            SvgPicture.asset('assets/svgs/heart_shadow.svg'),
                            SvgPicture.asset('assets/svgs/dot.svg'),
                          ],
                        ),
                      ),
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset('assets/svgs/ticket.svg'),
                        label: 'Home',
                        activeIcon: Column(
                          children: [
                            SvgPicture.asset('assets/svgs/ticket_shadow.svg'),
                            SvgPicture.asset('assets/svgs/dot.svg'),
                          ],
                        ),
                      ),
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset('assets/svgs/user.svg'),
                        label: 'Home',
                        activeIcon: Column(
                          children: [
                            SvgPicture.asset('assets/svgs/user_shadow.svg'),
                            SvgPicture.asset('assets/svgs/dot.svg'),
                          ],
                        ),
                      ),
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset('assets/svgs/shuffle.svg'),
                        label: 'Home',
                        activeIcon: Column(
                          children: [
                            SvgPicture.asset('assets/svgs/shuffle_shadow.svg'),
                            SvgPicture.asset('assets/svgs/dot.svg'),
                          ],
                        ),
                      ),
                    ],
                    onTap: (int index) {
                      _onItemTapped(index);
                    },
                    currentIndex: selectedItem,
                    showSelectedLabels: false,
                  ),
                ),
              ),
            ],
          ),
        )
        // SizedBox(
        //   height: 64,
        //   child: Stack(
        //     fit: StackFit.loose,
        //     alignment: Alignment.bottomCenter,
        //     children: [
        //       Container(
        //         decoration: BoxDecoration(
        //           gradient: AppColors.background,
        //           border: Border(
        //             top: BorderSide(
        //               color: Colors.white.withOpacity(0.2),
        //             ),
        //           ),
        //         ),
        //       ),
        //       Container(
        //         decoration: const BoxDecoration(
        //           gradient: AppColors.search,
        //         ),
        //         child: MediaQuery(
        //           data: const MediaQueryData(
        //               padding: EdgeInsets.only(
        //             bottom: 10,
        //             top: 10,
        //           ) // here is the padding
        //               ),
        //           child: BottomNavigationBar(
        //             elevation: 0.0,
        //             unselectedLabelStyle: const TextStyle(fontSize: 0),
        //             selectedLabelStyle: const TextStyle(fontSize: 0),
        //             backgroundColor: Colors.transparent,
        //             type: BottomNavigationBarType.shifting,
        //             selectedFontSize: 0.0,
        //             unselectedFontSize: 0.0,
        //             items: [
        //               BottomNavigationBarItem(
        //                 icon: SvgPicture.asset('assets/svgs/home.svg'),
        //                 label: 'home',
        //                 backgroundColor: Colors.transparent,
        //                 activeIcon: Column(
        //                   children: [
        //                     SvgPicture.asset(
        //                       'assets/svgs/home_shadow.svg',
        //                     ),
        //                     SvgPicture.asset('assets/svgs/dot.svg'),
        //                   ],
        //                 ),
        //               ),
        //               BottomNavigationBarItem(
        //                 icon: SvgPicture.asset('assets/svgs/heart.svg'),
        //                 label: 'Home',
        //                 activeIcon: Column(
        //                   children: [
        //                     SvgPicture.asset('assets/svgs/heart_shadow.svg'),
        //                     SvgPicture.asset('assets/svgs/dot.svg'),
        //                   ],
        //                 ),
        //               ),
        //               BottomNavigationBarItem(
        //                 icon: SvgPicture.asset('assets/svgs/ticket.svg'),
        //                 label: 'Home',
        //                 activeIcon: Column(
        //                   children: [
        //                     SvgPicture.asset('assets/svgs/ticket_shadow.svg'),
        //                     SvgPicture.asset('assets/svgs/dot.svg'),
        //                   ],
        //                 ),
        //               ),
        //               BottomNavigationBarItem(
        //                 icon: SvgPicture.asset('assets/svgs/user.svg'),
        //                 label: 'Home',
        //                 activeIcon: Column(
        //                   children: [
        //                     SvgPicture.asset('assets/svgs/user_shadow.svg'),
        //                     SvgPicture.asset('assets/svgs/dot.svg'),
        //                   ],
        //                 ),
        //               ),
        //               BottomNavigationBarItem(
        //                 icon: SvgPicture.asset('assets/svgs/shuffle.svg'),
        //                 label: 'Home',
        //                 activeIcon: Column(
        //                   children: [
        //                     SvgPicture.asset('assets/svgs/shuffle_shadow.svg'),
        //                     SvgPicture.asset('assets/svgs/dot.svg'),
        //                   ],
        //                 ),
        //               ),
        //             ],
        //             onTap: (int index) {
        //               _onItemTapped(index + 1);
        //             },
        //             currentIndex: selectedItem,
        //             showSelectedLabels: false,
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        );
  }

  Widget _buildOffstageNavigator(int currentItem, bool isSelected) {
    return Offstage(
      offstage: !isSelected,
      child: TabNavigator(
        navigatorKey: navigatorKeys[currentItem]!,
        index: currentItem,
      ),
    );
  }
}
