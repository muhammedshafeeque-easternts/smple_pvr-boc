import 'package:equatable/equatable.dart';

abstract class MovieEvent extends Equatable{}

class LoadMovieEvent extends MovieEvent{
  @override
  List<Object?> get props => [];

}