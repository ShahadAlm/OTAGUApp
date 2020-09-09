

class Category {
  final int categoryId;
  final String name;

  Category({this.categoryId, this.name});
}

final firstCategory = Category(
  categoryId: 0,
  name: "New Releases",
);

final secondCategory = Category(
  categoryId: 1,
  name: "Just Added",
);

final thirdCategory = Category(
  categoryId: 2,
  name: "Coming Soon",
);


final categories = [
  firstCategory,
  secondCategory,
  thirdCategory,
];
