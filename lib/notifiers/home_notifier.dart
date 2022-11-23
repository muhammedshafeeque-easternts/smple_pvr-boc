import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampl/bloc/movie_events.dart';
import 'package:sampl/bloc/movie_states.dart';
import 'package:sampl/models/detail_movie_response_model.dart';
import 'package:sampl/models/top_rated_response_model.dart';
import 'package:sampl/constants/api_constants.dart';
import 'package:sampl/util/http.dart';

class MovieBloc extends Bloc<MovieEvent,MovieState>{

  MovieBloc():super(MovieLoadingState()){
    on<LoadMovieEvent>((event, emit)async {
      try {
        await getTopRatedMovie();
        emit(MovieLoadedState(listMovie));
      } catch (e) {
        emit(MovieErrorState(e.toString()));
      }
    });
  }

  Http client = Http();

   TopRatedResponse? topRatedResp;

  DetailMovie? detailMovieResp;

  bool isLoadingDetailMovie = true ;

  int currentPage=1;

  bool loadMore = true;



  Future<void> geDetailMovie(String id) async {
    try {
      detailMovieResp = DetailMovie.fromJson(await client.getRequest(url:
      '$kBaseUrl/movie/$id',queryParameters: {
        'api_key':kApiKey
      }
      ));
      isLoadingDetailMovie = false;
    } catch (e, s) {
      // logger.e('getDetailMovie', e, s);
      return Future.error(e);
    }
  }

  List<Result> listMovie=[];

  Future<void> getTopRatedMovie({bool refresh=false}) async {

    if(refresh==true){
      loadMore=true;
      currentPage=1;
      listMovie.clear();

    }
    await Future.delayed(const Duration(milliseconds: 300),(){});
    try {
     topRatedResp = TopRatedResponse.fromJson(await client.getRequest(url:
    '$kBaseUrl/movie/top_rated',
    queryParameters: {
    'page':'$currentPage',
    'api_key':kApiKey
    },
    ));
     listMovie.addAll(topRatedResp!.results!);
     currentPage++;
     if(topRatedResp!.results!.isEmpty){
       loadMore = false;
     }
    } catch (e, s) {
      return Future.error(e);
    }
  }
}
