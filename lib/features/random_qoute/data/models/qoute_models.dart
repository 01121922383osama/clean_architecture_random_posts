import '../../domain/entities/qoute.dart';

class QouteModels extends Qoute {
  const QouteModels({
    required String id,
    required String content,
    required String author,
    required String authorSlug,
  }) : super(
          author: author,
          content: content,
          id: id,
          authorSlug: authorSlug,
        );

  factory QouteModels.fromJson(Map<String, dynamic> json) => QouteModels(
        id: json["_id"],
        content: json["content"],
        author: json["author"],
        authorSlug: json["authorSlug"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "content": content,
        "author": author,
        "authorSlug": authorSlug,
      };
}
