import 'package:energy/app/data/resources/assets/string_assets.dart';
import 'package:energy/app/data/resources/color_resources.dart';
import 'package:energy/app/modules/home/views/parallax.dart';
import 'package:energy/app/views/animations/scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import '../../../data/resources/constant_resources.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => NestedScrollView(
        controller: controller.scrollController,
        floatHeaderSlivers: true,
        headerSliverBuilder: ((context, innerBoxIsScrolled) => [
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: APP_MID_GREEN.withOpacity(0.9),
                expandedHeight: 150,
                centerTitle: true,
                titleSpacing: 0,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: const EdgeInsetsDirectional.only(
                    start: 0.0,
                    bottom: 0.0,
                  ),
                  title: Image.asset(
                    StringAsset.logo,
                    fit: BoxFit.fill,
                  ),
                  background: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      colors: [APP_MID_GREEN, WHITE],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )),
                  ),
                ),
                floating: true,
                // snap: true,
                pinned: true,
              ),
            ]),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SPACING_MEDIUM_HEIGHT,
            const HomeAppBar(),
            SPACING_SMALL_HEIGHT,
            const VisitDash(),
            SPACING_SMALL_HEIGHT,
            EnergyTypes(scrollController: controller.scrollController),
          ],
        ),
      );
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          FadedScaleAnimation(
            CircleAvatar(
              radius: 50,
              backgroundColor: APP_MID_GREEN.withOpacity(0.3),
              child: CircleAvatar(
                  radius: 48,
                  backgroundImage: NetworkImage(
                    'https://i.imgur.com/q9rhg0n.jpg',
                  )),
            ),
            durationInMilliseconds: 800,
          ),
          SPACING_SMALL_HEIGHT,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                RichText(
                    text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: 'Hello, ',
                    style: h3_dark(context),
                  ),
                  TextSpan(
                    text: 'Braglath',
                    style: h1(context),
                  )
                ])),
                SPACER,
                SizedBox(
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: FaIcon(FontAwesomeIcons.bell)),
                      IconButton(
                          onPressed: () {},
                          icon: const FaIcon(FontAwesomeIcons.gripLines)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}

class VisitDash extends GetView<HomeController> {
  const VisitDash({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GlassmorphicContainer(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        width: DEVICE_WIDTH,
        height: 170,
        borderRadius: 15,
        linearGradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              APP_MAIN_BLUE,
              WHITE,
            ],
            stops: [
              0.1,
              1
            ]),
        border: 0,
        blur: 20,
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFffffff).withOpacity(0.5),
            Color((0xFFFFFFFF)).withOpacity(0.5),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MIN,
            crossAxisAlignment: CROSS_AXIS_START,
            children: [
              SizedBox(
                width: DEVICE_WIDTH / 2,
                child: Text(
                  'Now you can customize your Dashboard',
                  style: h2_dark(context),
                ),
              ),
              SPACER,
              Row(
                children: [
                  SPACER,
                  GestureDetector(
                    onTap: () => controller.pageController.animateToPage(1,
                        duration: 200.milliseconds,
                        curve: Curves.fastOutSlowIn),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                          color: APP_MAIN_BLUE.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        'visit Dashboard >',
                        style: h3_dark(context)?.copyWith(color: WHITE),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
}
