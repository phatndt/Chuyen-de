class Introduction {
  final String imagePath;
  final String title;
  final String description;

  Introduction(
    this.imagePath,
    this.title,
    this.description,
  );

  factory Introduction.fromMap(Map<dynamic, dynamic> map) {
    return Introduction(
      map["image_path"],
      map["title"],
      map["description"],
    );
  }
}
