import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sampl/constants/color.dart';
import 'package:sampl/notifiers/home_notifier.dart';
import 'package:sampl/widget/content_section.dart';
import 'package:sampl/widget/cover_section.dart';
import 'package:sampl/widget/section_header.dart';

class DetailScreen extends StatelessWidget {
  String movieId;
  DetailScreen({Key? key,required this.movieId}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    context.read<HomeNotifier>().geDetailMovie(movieId);
    return SafeArea(
      child: Scaffold(
        backgroundColor: kColorDark,
        body: Consumer<HomeNotifier>(
            builder: (context, notifier,_) {
          if(notifier.isLoadingDetailMovie){
            return Container(
              width: double.infinity,
              height: double.infinity,
              color: kColorBlack,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return NestedScrollView(
              headerSliverBuilder:  (BuildContext context, bool innerBoxIsScrolled){
                return <Widget>[
                  SliverLayoutBuilder(
                    builder: (context, constraint) {
                      return SliverAppBar(
                        elevation: 0,
                        floating: true,
                        backgroundColor: kColorDark,
                        expandedHeight: 340,
                        pinned: true,
                        title: constraint.scrollOffset > 10
                            ? SectionHeader(
                          name: notifier.detailMovieResp!.title!,
                        )
                            : Container(),
                        centerTitle: false,
                        automaticallyImplyLeading: false,
                        titleSpacing: 0,
                        flexibleSpace: FlexibleSpaceBar(
                          background: CoverSection(
                             movie: notifier.detailMovieResp!,
                          ),
                        ),
                      );
                    },
                  )
                ];
              }, 
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContentSection(movie: notifier.detailMovieResp!)
                ],
              )
          );
        }),
      ),
    );
  }
}
