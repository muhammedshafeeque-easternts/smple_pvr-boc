import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sampl/bloc/movie_events.dart';
import 'package:sampl/bloc/movie_states.dart';
import 'package:sampl/constants/color.dart';
import 'package:sampl/constants/text.dart';
import 'package:sampl/notifiers/home_notifier.dart';
import 'package:sampl/ui/loading_view.dart';
import 'package:sampl/ui/movie_view.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<MovieBloc>().add(LoadMovieEvent());
    return Scaffold(
      backgroundColor:kColorDark,
      appBar: AppBar(
        backgroundColor: kColorBlack,
        title: const Text("Top Rated Movie",style: kTextAveHev16,),
      ),
      body:
          BlocBuilder<MovieBloc,MovieState>(
            builder: (context, state) {
              if(state is MovieLoadingState){
                return LoadingView();
              }
              if(state is MovieLoadedState){

                return NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollNotification){
                    if(scrollNotification.metrics.pixels==scrollNotification.metrics.maxScrollExtent){
                      /*if(notifier.loadMore&&notifier.isLoadingTopRatedMovie==false){
                        notifier.getTopRatedMovie();
                      }*/
                    }
                    return true;
                  },
                  child: RefreshIndicator(
                    onRefresh: ()async{
                      // notifier.getTopRatedMovie(refresh: true);
                    },
                    child: ListView.builder(
                        itemCount: state.listMovie.length+1,
                        itemBuilder: (BuildContext context,int index){
                          if(index<state.listMovie.length){
                            return MovieView(movie:state.listMovie[index]);
                          }else{
                            return LoadingView();
                          }
                        }
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            }
          ),
    );
  }
}
