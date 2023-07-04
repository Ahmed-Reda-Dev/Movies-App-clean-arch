import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failure.dart';

abstract class BaseUseCase<T, Prams> {
  Future<Either<Failure, T>> call(Prams prams);
}

class NoPrams extends Equatable {
  @override
  List<Object?> get props => [];
}
