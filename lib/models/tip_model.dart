class TipModel {
  final int? id;
  final String? title;
  final String? url;
  final String? thubmnail;

  const TipModel({
    this.id,
    this.title,
    this.url,
    this.thubmnail,
  });

  factory TipModel.fromJson(Map<String, dynamic> json) => TipModel(
        id: json['id'],
        title: json['title'],
        url: json['url'],
        thubmnail: json['thumbnail'],
      );
}
