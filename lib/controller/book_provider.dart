import 'package:flutter/material.dart';
import 'package:flutterdemo/controller/book_repository.dart';

import '../model/book_model.dart';

class BookProvider with ChangeNotifier {
  List<Book> books = [];

  final BookRepo _bookRepository = BookRepo();

  void fetchBooks() async {
    books = await _bookRepository.fetchBookList();
    print(books.first.authorName);
    notifyListeners();
  }

  void addNewBook(Book newBook) async {
    await _bookRepository.addBook(newBook);
    fetchBooks();
    notifyListeners();
  }

  void isLiked(String isbn, bool isFav) async {
    await _bookRepository.isLiked(isbn, isFav);
    fetchBooks();
    notifyListeners();
  }
}
