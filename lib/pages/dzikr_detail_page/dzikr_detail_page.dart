import 'package:dzikr/dzikr.dart';
import 'package:dzikr_app/widgets/appbar_widget/appbar_widget.dart';
import 'package:flutter/material.dart';

class DzikrDetailPage extends StatelessWidget {
  const DzikrDetailPage({Key? key, required this.book}) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget.getAppbar(context, title: book.title!),
      body: DzikrReaderWidget(book: book),
    );
  }
}
