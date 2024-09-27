import 'package:book_app/core/functions/navigation.dart';
import 'package:book_app/feature/search/presentation/view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../widgets/banner_home_widget.dart';
import '../../widgets/Best_seller_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Row(
          children: [
            SvgPicture.asset(
              'assets/image/logo.svg',
              width: 100,
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/notification.svg'),
            ),
            IconButton(
              onPressed: () {
                push(context, const SearchView());
              },
              icon: SvgPicture.asset('assets/icons/search-normal.svg'),
            ),
          ],
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [BannerHomeWidget(), Gap(20), PopularBookWidget()],
        ),
      ),
    );
  }
}
