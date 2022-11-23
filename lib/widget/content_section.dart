import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sampl/constants/api_constants.dart';
import 'package:sampl/models/detail_movie_response_model.dart';
import 'package:sampl/widget/field_section.dart';


class ContentSection extends StatelessWidget {
  const ContentSection({Key? key, required this.movie}) : super(key: key);
  final DetailMovie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding/2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FieldSection(field: "Original Title", value: movie.originalTitle!+" (${movie.title!}) "),
          const SizedBox(height: kDefaultPadding/2,),
          FieldSection(field: "Genres", value: movie.genresString),
          const SizedBox(height: kDefaultPadding/2,),
          FieldSection(field: "Tagline", value: movie.tagline==""?"N/A":movie.tagline!),
          const SizedBox(height: kDefaultPadding/2,),
          FieldSection(field: "Synopsis", value: movie.overview!),
          const SizedBox(height: kDefaultPadding/2,)
        ],
      ),
    );
  }
}
