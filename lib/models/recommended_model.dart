class RecommendedModel{
  String? name;
  String? image;

  RecommendedModel(this.name, this.image);
}

List<RecommendedModel> recommendations = recommendationsData
    .map((item) => RecommendedModel(item['name'],item['image']))
    .toList();

var recommendationsData = [
  {
    "name": "Bali, Indonesia",
    "image": "https://images.unsplash.com/photo-1607355739828-0bf365440db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1444&q=80"
  },
  {
    "name": "Yogyakrta, Indonesia",
    "image": "https://images.unsplash.com/photo-1577791465485-b80039b4d69a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80"
  },
  {
    "name": "Bali, Indonesia",
    "image": "https://images.unsplash.com/photo-1539367628448-4bc5c9d171c8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80"
  },
  {
    "name": "Wiang Kum Kam, Thailand",
    "image": "https://images.unsplash.com/photo-1561100344-0cce8621ca6c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"
  },
];