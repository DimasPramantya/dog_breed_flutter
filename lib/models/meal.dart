class PostDate {
  int? iSeconds;
  int? iNanoseconds;

  PostDate({this.iSeconds, this.iNanoseconds});

  PostDate.fromJson(Map<String, dynamic> json) {
    iSeconds = json['_seconds'];
    iNanoseconds = json['_nanoseconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_seconds'] = iSeconds;
    data['_nanoseconds'] = iNanoseconds;
    return data;
  }
}

class Meal {
  String? content;
  String? title;
  PostDate? postDate;
  String? id;
  String? imageUrl;
  double? calorie;
  double? carbs;
  double? fats;
  double? glycemicIndex;
  double? glycemicLoad;
  double? protein;

  Meal(
    {
      this.content,
      this.title,
      this.postDate,
      this.id,
      this.imageUrl,
      this.calorie,
      this.carbs,
      this.fats,
      this.glycemicIndex,
      this.glycemicLoad,
      this.protein
    }
  ); 

   factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['_id'],
      title: json['title'],
      postDate: json['postDate'] != null ? PostDate.fromJson(json['postDate']) : null,
      imageUrl: json['imageUrl'],
      calorie: json['calorie']?.toDouble(),
      carbs: json['carbs']?.toDouble(),
      fats: json['fats']?.toDouble(),
      glycemicIndex: json['glycemicIndex']?.toDouble(),
      glycemicLoad: json['glycemicLoad']?.toDouble(),
      protein: json['protein']?.toDouble(),
    );
  }
}