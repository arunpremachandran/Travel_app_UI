class PopularModel{
  String? image;
  int? color;
  
  PopularModel(this.image, this.color);
}


List<PopularModel> populars = popularsData
    .map((item) => PopularModel(item['image'].toString(),item['color'] as int))
    .toList();


var popularsData = [
  {"image": "assests/images/img_beach.png", "color": 0xFFFEF1ED},
  {"image": "assests/images/img_mountain.png", "color": 0xFFEDF6FE},
  {"image": "assests/images/img_lake.png", "color": 0xFFFEF6E8},
  {"image": "assests/images/img_river.png", "color": 0xFFEAF8E8},
];