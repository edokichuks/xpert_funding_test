// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:xpert_funding_test/src/core/utils/app_utils_exports.dart';
import 'package:xpert_funding_test/src/features/bottom_nav/domain/models/app_bottom_nav_model.dart';
import 'package:xpert_funding_test/src/features/bottom_nav/domain/notifier/app_bottom_nav_notifier.dart';
import 'package:xpert_funding_test/src/general_widgets/general_widget_exports.dart';

class AppBottomNavScreen extends ConsumerStatefulWidget {
  const AppBottomNavScreen({super.key});
  @override
  ConsumerState createState() => _AppBottomNavScreenState();
}

class _AppBottomNavScreenState extends ConsumerState<AppBottomNavScreen> {
  final List<Widget> _pages = const [
    TodoScreen(),
    TodoScreen(),
    TodoScreen(),
    TodoScreen(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      //TO UPDATE THE LOCALY STORED PROFILE
      //IF THERE ARE ANY CHANGES

      //  final user = await UserStoreManager.getSavedUser();
      // if (!(user?.isLoggedIn ?? false)) {
      //   navigatorKey.currentState!
      //       .pushNamed(AppRoutes.welcomeBackScreen)
      //       .then((e) async {
      //     if (e == true) {
      //     Future.delayed(Duration(milliseconds: 0), (){
      //       navigatorKey.currentState!.
      //             pushNamedAndRemoveUntil(
      //              AppRoutes.bottomNavBar, (_) => false);
      //             return;
      //     });

      //     }
      //   });
      //   return;
      // }
      // await ref.read(profileProvider.notifier).getMyProfile();
      // await ref.read(cardProvider.notifier).getCardDetails();
    });
    // _listenForSignIn();
  }

  void _onItemTapped(int index) {
    ref.read(appBottomNavProdivder.notifier).moveToTab(index: index);
  }

  final tabs = [
    BottomTabItemModel(
      inActiveIcon: AppImages.homeInactive,
      icon: AppImages.homeActive,
      label: 'Home',
    ),
    BottomTabItemModel(
      inActiveIcon: AppImages.cardInactive,
      icon: AppImages.cardActive,
      label: 'Card',
    ),
    BottomTabItemModel(
      inActiveIcon: AppImages.historyInactive,
      icon: AppImages.historyActive,
      label: 'History',
    ),
    BottomTabItemModel(
      inActiveIcon: AppImages.profileInactive,
      icon: AppImages.profileActive,
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final tabIndex = ref.watch(appBottomNavProdivder).currentTabIndex;
    // _listenForSignIn();
    return AppScaffold(
      applySafeArea: false,
      // NOTE: REMOVE THIS BECAUSE EACH TAB USES [AppScaffold] AND IT HAS A DEFALUT PADDING
      padding: EdgeInsets.zero,
      body: _pages[tabIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: List.generate(tabs.length, (index) {
          final tabItem = tabs[index];
          final bool isSelected = tabIndex == index;
          return BottomNavigationBarItem(
            icon: AppContainer(
              padding: EdgeInsets.zero,
              height: 44.h,
              margin: EdgeInsets.only(left: 6.w, right: 6.w, top: 10.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary300 : null,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    isSelected ? tabItem.icon : tabItem.inActiveIcon,
                    width: 24.w,
                    height: 24.h,
                    fit: BoxFit.cover,
                  ),
                  if (isSelected) ...[
                    const Spacing.widthXS(),
                    const Spacing.widthXXS(),
                    Text(
                      tabItem.label,
                      style: AppTextStyle.titleSmall.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        //SET TO NULL SO IT WOULD FALLBACK TO THE THEME COLORS
                        color: isSelected ? AppColors.white : null,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            label: '',
          );
        }),
        currentIndex: tabIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  // _listenForSignIn() async {
  //   final auth = await UserStoreManager.getSavedAuthDetails();
  //   final userHasVerifiedNinPreviously = auth?.nin ?? false;
  //   // print('IS VERIFIFED VALUE IS ? $userHasVerifiedNinPreviously');
  //   //CHECK THE SCREEN IF USER HAS VERIFIED THERE NIN
  //   if (!userHasVerifiedNinPreviously) {
  //     navigatorKey.currentState!
  //         .pushReplacementNamed(AppRoutes.verifyNinScreen);
  //   }
  //   //CHECK THE SCREEN IF USER HAS CREATED A PASSCODE
  //   else if (!(auth?.passcode ?? false)) {
  //     navigatorKey.currentState!
  //         .pushReplacementNamed(AppRoutes.createPasscodeScreen);
  //   }
  //   //CHECK THE SCREEN IF USER HAS SET PIN
  //   else if (!(auth?.pin ?? false)) {
  //     navigatorKey.currentState!
  //         .pushReplacementNamed(AppRoutes.setTranscriptionPinScreen);
  //   } else {}
  //   //GO TO DASHBOARD IF AUTH IS COMPLETE
  // }
}
