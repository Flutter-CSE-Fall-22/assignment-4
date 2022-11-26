class Book {
  final String authorName;
  final List<String> bookAuthors;
  final String publisherName;
  final String isbn;
  final String image;
  bool fav;

  Book(
      {required this.authorName,
      required this.bookAuthors,
      required this.publisherName,
      required this.isbn,
      required this.image,
      required this.fav});

  static Book fromJson(Map<String, dynamic> json, String id) {
    return Book(
        authorName: json['authorName'],
        bookAuthors:
            List<String>.from(json['bookAuthors'].map((element) => element)),
        publisherName: json['publisherName'],
        isbn: id,
        image: json['image'],
        fav: json['fav']);
  }

  Map<String, dynamic> toJson() => {
        "authorName": authorName,
        "bookAuthors":
            List<dynamic>.from(bookAuthors.map((element) => element)),
        "publisherName": publisherName,
        "image": image,
        "fav": fav
      };
}
