import 'package:dzikr_app/core/config/size_config.dart';
import 'package:dzikr_app/data/static_data/static_data_model/quran_example_model.dart';
import 'package:dzikr_app/pages/quran_page/quran_state.dart';
import 'package:dzikr_app/widgets/appbar_widget/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuranPage extends StatelessWidget {
  const QuranPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuranState>(
        create: (context) => QuranState(),
        builder: (context, child) {
          var state = Provider.of<QuranState>(context, listen: true);
          state.getPageData();

          return Scaffold(
            appBar: AppBarWidget.getAppbar(context, title: "AlQuran"),
            body: ListView(padding: SizeConfig.pagePadding, children: const []),
          );
        });
  }
}
