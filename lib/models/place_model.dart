class PlaceModel {
  int? placeId;
  int? categoryId;
  String? placeName;

  PlaceModel({this.placeId, this.categoryId, this.placeName});

  PlaceModel.fromJson(Map<String, dynamic> json) {
    placeId = json['placeId'];
    categoryId = json['categoryId'];
    placeName = json['placeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['placeId'] = placeId;
    data['categoryId'] = categoryId;
    data['placeName'] = placeName;
    return data;
  }
}
