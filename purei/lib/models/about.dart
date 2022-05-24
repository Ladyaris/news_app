class About {
  final String name;
  final String images;
  final double rating;
  final String genre;

  About({required this.name, required this.images, required this.rating, required this.genre});

  factory About.fromJson(dynamic json) {
    return About(
        name: json['name'] as String,
        images: json['images'][0]['hostedLargeUrl'] as String,
        rating: json['rating'] as double,
        genre: json['genre'] as String);
  }

  static List<About> aboutFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return About.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'About {name: $name, image: $images, rating: $rating, genre: $genre}';
  }
}