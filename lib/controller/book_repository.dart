import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/book_model.dart';

class BookRepo {
  final db = FirebaseFirestore.instance;

  Future<List<Book>> fetchBookList() async {
    List<Book> booklist = [];

    await db.collection("books").get().then(
          (event) => booklist = event.docs
              .map((element) => Book.fromJson(element.data(), element.id))
              .toList(),
          onError: (err) => print("Error completing: $err"),
        );

    return booklist;
  }

  addBook(Book newBook) async {
    await db.collection("books").doc(newBook.isbn).set(newBook.toJson());
  }

  isLiked(String isbn, bool fav) async {
    await db.collection("books").doc(isbn).set({
      "fav": fav,
    }, SetOptions(merge: true));
  }
}
