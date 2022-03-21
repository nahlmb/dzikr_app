import 'package:dzikr_app/core/config/size_config.dart';
import 'package:dzikr_app/core/config/theme_config.dart';
import 'package:dzikr_app/core/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: Column(
            children: [
              MediaQuery.of(context).platformBrightness == Brightness.dark
                  ? Image.asset(
                      'assets/images/im_dzikr_logo_white.png',
                      height: 47,
                    )
                  : Image.asset(
                      'assets/images/im_dzikr_logo.png',
                      height: 47,
                    ),
              const SizedBox(
                height: SizeConfig.s12,
              )
            ],
          ),
          flexibleSpace: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 1,
                          color: Theme.of(context).colorScheme.surface)))),
          elevation: 0,
        ),
        body: SafeArea(
          child: ListView(
            padding: SizeConfig.pagePadding,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const SizedBox(
                  width: SizeConfig.s4,
                ),
                Expanded(flex: 2, child: getHeadlineIconItem(context)),
                const Flexible(
                  flex: 1,
                  child: SizedBox(
                    width: SizeConfig.s16,
                  ),
                ),
                Expanded(flex: 2, child: getHeadlineIconItem(context)),
                const Flexible(
                  flex: 1,
                  child: SizedBox(
                    width: SizeConfig.s16,
                  ),
                ),
                Expanded(flex: 2, child: getHeadlineIconItem(context)),
                const Flexible(
                  flex: 1,
                  child: SizedBox(
                    width: SizeConfig.s16,
                  ),
                ),
                Expanded(flex: 2, child: getHeadlineIconItem(context)),
                const SizedBox(
                  width: SizeConfig.s4,
                ),
              ]),
            ],
          ),
        ));
  }

  Widget getHeadlineIconItem(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
                color: colorSchame(context).surface.withOpacity(0.05),
                borderRadius: SizeConfig.radius),
            child: Center(
              child: Icon(
                Icons.auto_stories_rounded,
                size: SizeConfig.s32,
                color: ThemeConfig.sweetGreen,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: SizeConfig.s10,
        ),
        const Text("Quran")
      ],
    );
  }
}
