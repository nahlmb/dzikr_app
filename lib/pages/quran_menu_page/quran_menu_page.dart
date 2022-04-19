import 'package:dzikr_app/core/config/size_config.dart';
import 'package:dzikr_app/core/config/theme_config.dart';
import 'package:dzikr_app/core/utils/theme_utils.dart';
import 'package:dzikr_app/pages/quran_menu_page/quran_menu_state.dart';
import 'package:dzikr_app/pages/quran_page/quran_page.dart';
import 'package:dzikr_app/widgets/appbar_widget/appbar_widget.dart';
import 'package:dzikr_app/widgets/list_tile_widget/list_tile_widget.dart';
import 'package:dzikr_app/widgets/next_button_widget/next_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuranMenuPage extends StatelessWidget {
  const QuranMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => QuranMenuState(),
        builder: (context, child) {
          var state = Provider.of<QuranMenuState>(context);
          state.init();
          return Scaffold(
            appBar: AppBarWidget.getAppbar(context, title: "AlQuran"),
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(SizeConfig.pagePaddingNum),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Surah List",
                        style: textTheme(context).headline3,
                      ),
                      const Text("Open Quran by begining of surah"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: paddingS,
                ),
                Consumer<QuranMenuState>(
                  builder: ((context, state, child) {
                    return Container(
                      decoration:
                          BoxDecoration(color: colorSchame(context).surface),
                      child: ListView.builder(
                        padding: SizeConfig.pageHorizontalPadding,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: state.surah.chapters!.length,
                        itemBuilder: (context, index) => ListTileWidget(
                          onClick: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QuranPage(
                                          initialPage: (state.surah
                                                  .chapters![index].pages![0]) -
                                              1,
                                        )));
                          },
                          content: Row(
                            children: [
                              Container(
                                height: 34,
                                width: 34,
                                decoration: BoxDecoration(
                                    // color: colorSchame(context).primary,
                                    border: Border.all(
                                        color: colorSchame(context).primary),
                                    borderRadius: BorderRadius.circular(100)),
                                child: Center(
                                    child: Text(
                                  '${index + 1}',
                                  style: textTheme(context).headline6?.copyWith(
                                        color:
                                            colorSchame(context).onBackground,
                                      ),
                                )),
                              ),
                              const SizedBox(
                                width: paddingL,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.surah.chapters![index].nameSimple!,
                                      style: textTheme(context).headline5,
                                    ),
                                    Text(
                                        "${state.surah.chapters![index].revelationPlace!}, ${state.surah.chapters![index].versesCount} verses")
                                  ],
                                ),
                              ),
                              NextButtonWidget(
                                onPress: () {},
                                isSmall: true,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                )
              ],
            ),
          );
        });
  }
}
