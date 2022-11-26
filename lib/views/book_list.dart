import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/views/add_book.dart';
import 'package:flutterdemo/views/book_details.dart';

import '../controller/book_provider.dart';
import 'package:provider/provider.dart';

class BookList extends StatefulWidget {
  const BookList({Key? key}) : super(key: key);

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => context.read<BookProvider>().fetchBooks());
  }

  @override
  Widget build(BuildContext context) {
    var bookList = context.watch<BookProvider>().books;

    return Scaffold(
      body: ListView.builder(
          itemCount: bookList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BookInfo(book: bookList[index]),
                  ));
                },
                title: Text(bookList[index].authorName),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: bookList[index]
                      .bookAuthors
                      .map((element) => Text(element.trim()))
                      .toList(),
                ),
                leading: SizedBox(
                  height: 25,
                  width: 25,
                  child: CachedNetworkImage(
                    progressIndicatorBuilder: (context, url, progress) =>
                        Center(
                      child: CircularProgressIndicator(
                        value: progress.progress,
                      ),
                    ),
                    imageUrl: bookList[index].image,
                  ),
                ),
                trailing: InkWell(
                  child: Icon(
                    Icons.favorite,
                    color: bookList[index].fav ? Colors.red : Colors.grey,
                  ),
                  onTap: () {
                    context
                        .read<BookProvider>()
                        .isLiked(bookList[index].isbn, !bookList[index].fav);
                  },
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AddBook(),
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
