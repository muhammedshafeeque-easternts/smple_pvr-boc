import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sampl/constants/api_constants.dart';
import 'package:sampl/constants/color.dart';
import 'package:sampl/constants/text.dart';
import 'package:sampl/models/top_rated_response_model.dart';
import 'package:sampl/routes/routes.dart';

class MovieView extends StatelessWidget {
  late Result movie;
  MovieView({
    required this.movie
  });


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, AppRoutes.detailScreen,arguments: movie.id.toString());
      },
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding/2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              width: 80,
              height: 120,
              imageUrl: kImageAddress+movie.posterPath!,
              imageBuilder: (context,imageProvider)=>Image(image: imageProvider,),
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(width: kDefaultPadding/2,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title!,style: kTextAveHev14.copyWith(
                    color: kColorWhite
                  ),),
                  const SizedBox(height: kDefaultPadding/4,),
                  Text(movie.releaseDate.toString(),style: kTextAveRom12.copyWith(
                    color: kColorWhite
                  ),),
                 const SizedBox(height: kDefaultPadding/10,),
                 Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Icon(Icons.star,color: Colors.yellow,size: 16,),
                      const SizedBox(width: kDefaultPadding/4,),
                      Text(movie.voteAverage!.toString(),style: kTextAveHev14.copyWith(
                          color: kColorWhite,
                           fontSize: 12
                      )),
                    ],
                  ),
                  const SizedBox(height: kDefaultPadding/4,),
                  Text(movie.overview!,style: kTextAveRom12.copyWith(
                    color: kColorWhite
                  ),
                    maxLines: 4,overflow: TextOverflow.ellipsis,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
