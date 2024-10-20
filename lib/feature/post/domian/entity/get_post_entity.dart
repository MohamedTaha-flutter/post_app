import 'package:equatable/equatable.dart';

class GetPostEntity extends Equatable {
  final int id;

  final String title;

  final String body;

  const GetPostEntity({

    required this.id,
    required this.title,
    required this.body,
  });

  @override

  List<Object?> get props => [ id, title, body];
}
