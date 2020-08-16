class Item {
  final int id, year, numOfRatings, criticsReview, metascoreRating;
  final double rating;
  final List<String> category;
  final String plot, title, poster, backdrop;
  final List<Map> cast;

  Item({
    this.poster,
    this.backdrop,
    this.title,
    this.id,
    this.year,
    this.numOfRatings,
    this.criticsReview,
    this.metascoreRating,
    this.rating,
    this.category,
    this.plot,
    this.cast,
  });
}

// our demo data movie data
List<Item> items = [
  Item(
    id: 1,
    title: "With an e",
    year: 2020,
    poster: "assets/img/joker.jpg",
    backdrop: "",
    numOfRatings: 150212,
    rating: 7.3,
    criticsReview: 50,
    metascoreRating: 76,
    category: ["Action", "Drama"],
    plot: plotText,
    cast: [
      {
        "orginalName": "LaLa",
        "movieName": "Anne",
        "image": "assets/img/WallPaper.jpg",
      },
      {
        "orginalName": "Matt Damon",
        "movieName": "Carroll",
        "image": "assets/img/joker.jpg",
      },
      {
        "orginalName": "Christian Bale",
        "movieName": "Ken Miles",
        "image": "assets/img/joker.jpg",
      },
      {
        "orginalName": "Caitriona Balfe",
        "movieName": "Mollie",
        "image": "assets/img/joker.jpg",
      },
    ],
  ),
  Item(
    id: 2,
    title: "Ford v Ferrari",
    year: 2019,
    poster: "assets/img/joker.jpg",
    backdrop: "assets/img/joker.jpg",
    numOfRatings: 150212,
    rating: 8.2,
    criticsReview: 50,
    metascoreRating: 76,
    category: ["Action", "Biography", "Drama"],
    plot: plotText,
    cast: [
      {
        "orginalName": "James Mangold",
        "movieName": "Director",
        "image": "assets/img/joker.jpg",
      },
      {
        "orginalName": "Matt Damon",
        "movieName": "Carroll",
        "image": "assets/img/joker.jpg",
      },
      {
        "orginalName": "Christian Bale",
        "movieName": "Ken Miles",
        "image": "assets/img/joker.jpg",
      },
      {
        "orginalName": "Caitriona Balfe",
        "movieName": "Mollie",
        "image": "assets/img/joker.jpg",
      },
    ],
  ),
  Item(
    id: 1,
    title: "Onward",
    year: 2020,
    poster: "assets/img/joker.jpg",
    backdrop: "assets/img/WallPaper.jpg",
    numOfRatings: 150212,
    rating: 7.6,
    criticsReview: 50,
    metascoreRating: 79,
    category: ["Action", "Drama"],
    plot: plotText,
    cast: [
      {
        "orginalName": "James Mangold",
        "movieName": "Director",
        "image": "assets/img/joker.jpg",
      },
      {
        "orginalName": "Matt Damon",
        "movieName": "Carroll",
        "image": "assets/img/joker.jpg",
      },
      {
        "orginalName": "Christian Bale",
        "movieName": "Ken Miles",
        "image": "assets/img/joker.jpg",
      },
      {
        "orginalName": "Caitriona Balfe",
        "movieName": "Mollie",
        "image": "assets/img/joker.jpg",
      },
    ],
  ),
];

String plotText =
    "American car designer Carroll Shelby and driver Kn Miles battle corporate interference and the laws of physics to build a revolutionary race car for Ford in order.";
