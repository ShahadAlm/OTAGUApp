List<String> images = [
  "assets/img/joker.jpg",
  "assets/img/joker.jpg",
  "assets/img/joker.jpg",
  "assets/img/joker.jpg",
];

List<String> title = [
  "La la land",
  "Fallen In Love",
  "The Dreaming Moon",
  "Joker",
];


class MovieData {
  String name;
  String url;

  MovieData(this.name, this.url);

  static List<MovieData> generate() {
    return [
      MovieData("Joker", "assets/img/joker.jpg"),
      MovieData("Grassland", "assets/img/joker.jpg"),
      MovieData("Starry sky", "assets/img/joker.jpg"),
      MovieData("Beauty Pic", "assets/img/joker.jpg"),
    ];
  }

 
}
