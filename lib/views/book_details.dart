import 'package:flutter/material.dart';

import '../model/book_model.dart';

class BookInfo extends StatelessWidget {
  const BookInfo({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 115,
                width: 115,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(book.image),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text("Name: ${book.authorName}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text('Authors: '),
                  Row(
                    children: book.bookAuthors
                        .map((element) => Text("$element, "))
                        .toList(),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Publisher Name: ${book.publisherName}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("ISBN: ${book.isbn}"),
            ),
          ],
        ),
      ),
    );
  }
}
