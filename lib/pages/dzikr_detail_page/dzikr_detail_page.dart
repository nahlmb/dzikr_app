import 'package:dzikr_app/package/dzikr/data/book_data/book_data_model/book_data_model.dart';
import 'package:dzikr_app/package/dzikr/widgets/dzikr_reader_widget/dzikr_reader_widget.dart';
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
