import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../feature/cart/presentation/views/cart_view.dart';
import '../../feature/home/presentation/views/home_view.dart';
import '../../feature/profile/presentation/views/profile_view.dart';
import '../../feature/wishlist/presentation/views/wishlist_view.dart';
import '../utils/colors.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  int currentIndex = 0;
  List<Widget> views = [
    const HomeView(),
    const CartView(),
    const WishListView(),
    const ProfileView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.whiteColor,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/Home.svg'),
              label: '',
              activeIcon: SvgPicture.asset(
                'assets/icons/Home.svg',
                colorFilter: const ColorFilter.mode(
                    AppColors.primaryColor, BlendMode.srcIn),
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/Category.svg'),
              label: '',
              activeIcon: SvgPicture.asset(
                'assets/icons/Category.svg',
                colorFilter: const ColorFilter.mode(
                    AppColors.primaryColor, BlendMode.srcIn),
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/Bookmark.svg'),
              label: '',
              activeIcon: SvgPicture.asset(
                'assets/icons/Bookmark.svg',
                colorFilter: const ColorFilter.mode(
                    AppColors.primaryColor, BlendMode.srcIn),
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/Profile.svg'),
              label: '',
              activeIcon: SvgPicture.asset(
                'assets/icons/Profile.svg',
                colorFilter: const ColorFilter.mode(
                    AppColors.primaryColor, BlendMode.srcIn),
              ),
            ),
          ]),
    );
  }
}
