import 'package:equatable/equatable.dart';

class Qoute extends Equatable {
  final String author;
  final String id;
  final String content;
  final String authorSlug;

  const Qoute({
    required this.author,
    required this.id,
    required this.content,
    required this.authorSlug,
  });
  @override
  List<Object?> get props => [
        author,
        id,
        content,
        authorSlug,
      ];
}
