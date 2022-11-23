import 'package:equatable/equatable.dart';
import 'package:sampl/models/top_rated_response_model.dart';


abstract class  MovieState extends Equatable{}

class MovieLoadingState extends MovieState{
  @override
  List<Object?> get props => [];
}

class MovieLoadedState extends MovieState{
  List<Result> listMovie;
  MovieLoadedState(this.listMovie);


  @override
  List<Object?> get props => [listMovie];
}

class MovieErrorState extends MovieState{
  String errorMsg;
  MovieErrorState(this.errorMsg);
  @override
  List<Object?> get props => [errorMsg];
}