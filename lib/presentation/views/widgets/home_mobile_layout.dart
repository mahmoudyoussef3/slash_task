import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../domain/entities/home_entity.dart';

class HomeMobileLayout extends StatefulWidget {
  final Map<String, List<HomeEntity>> data;

  const HomeMobileLayout({super.key, required this.data});

  @override
  State<HomeMobileLayout> createState() => _HomeMobileLayoutState();
}

class _HomeMobileLayoutState extends State<HomeMobileLayout> {
  List<String> bestSellingImgIconsPath = [
    'assets/other_icons/sec_icon.png',
    'assets/other_icons/help_icon.png',
    'assets/other_icons/sec_icon.png',
    'assets/other_icons/help_icon.png',
    'assets/other_icons/sec_icon.png'
  ];
  List<String> newArrivalImgIconsPath = [
    'assets/other_icons/google_icon.png',
    'assets/other_icons/sec_icon.png',
    'assets/other_icons/google_icon.png',
    'assets/other_icons/sec_icon.png',
    'assets/other_icons/google_icon.png'
  ];
  List<String> recommendedForUImgIconsPath = [
    'assets/other_icons/google_icon.png',
    'assets/other_icons/sec_icon.png',
    'assets/other_icons/google_icon.png',
    'assets/other_icons/sec_icon.png',
    'assets/other_icons/google_icon.png'
  ];

  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<String> imagesSlider =
      List.generate(2, (index) => 'assets/images/5959002 1@2x.png');
  final List<String> categoryIcons = [
    'assets/category_icons/Shirt.png',
    'assets/category_icons/Dice.png',
    'assets/category_icons/Glasses.png',
    'assets/category_icons/Book Blank.png',
    'assets/category_icons/Shirt.png',
  ];
  final List<String> categoryNames = [
    'Fashion',
    'Games',
    'Accessories',
    'Books',
    'Arts',
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true);

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeader(),
            SizedBox(height: 12.h),
            buildSearchBar(context),
            SizedBox(height: 24.h),
            buildImageSlider(),
            buildIndicator(),
            SizedBox(height: 24.h),
            buildSectionHeader('Categories', () {}),
            SizedBox(height: 18.h),
            buildCategories(categoryIcons, categoryNames),
            SizedBox(height: 18.h),
            buildSectionHeader('Best Selling', () {}),
            SizedBox(height: 18.h),
            buildProductSection(
                widget.data['bestSelling']!, bestSellingImgIconsPath),
            SizedBox(height: 18.h),
            buildSectionHeader('New Arrival', () {}),
            SizedBox(height: 18.h),
            buildProductSection(
                widget.data['newArrival']!, newArrivalImgIconsPath),
            SizedBox(height: 18.h),
            buildSectionHeader('Recommended for you', () {}),
            SizedBox(height: 18.h),
            buildProductSection(
                widget.data['recommendedForYou']!, recommendedForUImgIconsPath),
            SizedBox(height: 18.h),
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Slash',
          style: GoogleFonts.urbanist(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xff292929),
          ),
        ),
        Row(
          children: [
            Image.asset('assets/other_icons/location.png'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nasr City',
                  style: GoogleFonts.urbanist(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff313131),
                  ),
                ),
                Text(
                  'Cairo',
                  style: GoogleFonts.urbanist(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff313131),
                  ),
                ),
              ],
            ),
            Icon(Icons.keyboard_arrow_down_outlined),
          ],
        ),
        Image.asset('assets/other_icons/Notifcation Icon.png'),
      ],
    );
  }

  Widget buildSearchBar(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SearchBar(
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0.r),
              ),
            ),
            elevation: const MaterialStatePropertyAll(0),
            backgroundColor: const MaterialStatePropertyAll(Color(0xffECECEC)),
            leading: Image.asset('assets/other_icons/search-normal.png'),
            hintStyle: MaterialStatePropertyAll(
              GoogleFonts.urbanist(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xff969696),
              ),
            ),
            autoFocus: false,
            hintText: 'Search here..',
          ),
        ),
        SizedBox(width: 12.w),
        Container(
          height: 55.h,
          width: 55.w,
          decoration: BoxDecoration(
            color: const Color(0xffECECEC),
            borderRadius: BorderRadius.circular(8.0.r),
          ),
          child: Center(
            child: Image.asset(
                'assets/other_icons/Horizontal-Slider-2--Streamline-Flex.svg.png'),
          ),
        ),
      ],
    );
  }

  Widget buildImageSlider() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider(
        items: imagesSlider.map((imagePath) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          );
        }).toList(),
        carouselController: _controller,
        options: CarouselOptions(
          viewportFraction: 1,
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 2.8,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          },
        ),
      ),
    );
  }

  Widget buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: imagesSlider.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () => _controller.animateToPage(entry.key),
          child: Container(
            width: 8.0.w,
            height: 8.0.h,
            margin: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 4.0.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black)
                  .withOpacity(
                _current == entry.key ? 0.9 : 0.4,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget buildSectionHeader(String title, VoidCallback onPressed) {
    return Row(
      children: [
        Text(
          title,
          style: GoogleFonts.urbanist(
            fontSize: 22.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xff292929),
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: onPressed,
          child: Row(
            children: [
              Text(
                'See all',
                style: GoogleFonts.urbanist(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff292929),
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                padding: EdgeInsets.all(3.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: const Color(0xffE4E4E4),
                ),
                child: const Center(
                  child: Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildCategories(List<String> icons, List<String> names) {
    return SizedBox(
      height: 120.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: icons.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 6.0.w),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xff292929),
                  radius: 40.r,
                  child: Center(
                    child: Image.asset(icons[index]),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  names[index],
                  style: GoogleFonts.urbanist(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff292929),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildProductSection(
      List<HomeEntity> items, List<String> imageIconPath) {
    return SizedBox(
      height: 213.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 8.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 130.w,
                      height: 130.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        image: DecorationImage(
                          image: AssetImage(items[index].image),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10.h,
                      right: 10.w,
                      child: Image.asset('assets/other_icons/fav_icon.png'),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Text(
                  items[index].name,
                  style: GoogleFonts.urbanist(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff292929),
                  ),
                ),
                SizedBox(
                  width: 120.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "EGP ${items[index].price}",
                        style: GoogleFonts.urbanist(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff292929),
                        ),
                      ),
                      const Spacer(),
                      Image.asset(imageIconPath[index]),
                      SizedBox(width: 5.w),
                      Image.asset('assets/other_icons/plus_icon.png'),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
