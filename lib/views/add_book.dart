import 'package:flutter/material.dart';
import 'package:flutterdemo/controller/book_provider.dart';
import 'package:provider/provider.dart';

import '../model/book_model.dart';

class AddBook extends StatefulWidget {
  const AddBook({Key? key}) : super(key: key);

  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _publisherNameController =
      TextEditingController();
  final TextEditingController _isbnController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Book Name'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _nameController,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Author Names'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _authorController,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Publisher Name'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _publisherNameController,
                    ),
                  ),
                  const Text('ISBN'),
                  TextFormField(
                    controller: _isbnController,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Image URL'),
                  ),
                  TextFormField(
                    controller: _imageController,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Book newBook = Book(
                          authorName: _nameController.text,
                          bookAuthors: _authorController.text.split(","),
                          isbn: _isbnController.text,
                          publisherName: _publisherNameController.text,
                          image: _imageController.text,
                          fav: false,
                        );
                        context.read<BookProvider>().addNewBook(newBook);
                        Navigator.pop(context);
                      },
                      child: const Text('Add Book'),
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
