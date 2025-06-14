import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:product_project/core/constants/app_wrapper.dart';
import 'package:product_project/core/constants/img_paths.dart';
import 'package:product_project/core/constants/responsivness.dart';
import 'package:product_project/core/constants/text_style.dart';
import 'package:product_project/features/auth/presentation/widgets/custom_textfield.dart';
import 'package:product_project/features/home/presentation/widgets/see_all_button.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    return AppWrapper(builder: (colors) {
      return Scaffold(
          drawer: Drawer(),
          appBar: AppBar(
            bottom: PreferredSize(
                preferredSize: Size(
                  double.infinity,
                  appH(70),
                ),
                child: Padding(
                  padding: EdgeInsets.all(
                    appW(12),
                  ),
                  child: CustomTextfield(
                      prefixIcon: Icon(
                        IconsaxPlusBroken.search_normal_1,
                        size: appW(24),
                      ),
                      controller: controller,
                      colors: colors,
                      hint: 'search..',
                      backgroundColor: colors.lightGreen4),
                )),
            // leading: GestureDetector(
            //   onTap: () {},
            //   child: Icon(
            //     IconsaxPlusLinear.home,
            //     size: 24,
            //   ),
            // ),
            title: Text(
              'Home',
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  IconsaxPlusLinear.search_normal_1,
                  size: 30,
                ),
              )
            ],
          ),
          body: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: appW(18), vertical: appW(10)),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Categories',
                        style: Manserrat.medium(color: colors.darkGreen1, size: appW(18)),
                      ),
                      ViewAll(
                        func: () {},
                        colors: colors,
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                  child: SizedBox(
                height: appH(50),
                width: double.infinity,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: appW(10)),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(left: appW(4)),
                    child: Container(
                      width: appW(50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000),
                        color: colors.greenMid,
                      ),
                    ),
                  ),
                ),
              )),
              SliverPadding(
                padding: EdgeInsets.symmetric(
                  vertical: appH(10),
                ),
                sliver: SliverToBoxAdapter(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 100.0,
                      autoPlay: true,
                      autoPlayCurve: Curves.linear,
                      autoPlayAnimationDuration: Duration(
                        milliseconds: 300,
                      ),
                    ),
                    items: [1, 2, 3, 4, 5].map(
                      (i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(color: colors.darkGreen1, borderRadius: BorderRadius.circular(10) ),
                              child: Image.asset(
                                ImgPaths.customProdImage,
                              ),
                            );
                          },
                        );
                      },
                    ).toList(),
                  ),
                ),
              )
            ],
          ));
    });
  }
}
