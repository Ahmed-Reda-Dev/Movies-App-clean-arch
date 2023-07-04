import 'package:equatable/equatable.dart';

class Recommendations extends Equatable {
  final int id;
  final String? backdropPath;

  const Recommendations({
    required this.id,
    this.backdropPath,
  });

  @override
  List<Object?> get props {
    return [
      id,
      backdropPath,
    ];
  }
}
