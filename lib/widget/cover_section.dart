import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sampl/constants/api_constants.dart';
import 'package:sampl/constants/color.dart';
import 'package:sampl/constants/text.dart';
import 'package:sampl/models/detail_movie_response_model.dart';

class CoverSection extends StatelessWidget {
  const CoverSection({Key? key,required this.movie}) : super(key: key);
  final DetailMovie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      child: Stack(
        children: [
          CachedNetworkImage(
            width: double.infinity,
            height: 250,
            imageUrl: kImageAddress+movie.backdropPath!,
            imageBuilder: (context,imageProvider)=>Image(image: imageProvider,),
            placeholder: (context, url) => Container(
                color: kColorBlack,
                child: const Center(child: CircularProgressIndicator())
            ),
            errorWidget: (context, url, error) => Container(
                color: kColorBlack,
                child: const Center(child: CircularProgressIndicator())
            ),
          ),
          // Image.network(kImageAddress+movie.backdropPath!,height: 250,),
          Positioned(
              top: kDefaultPadding/4*6,
              left: kDefaultPadding/2,
              child: InkWell(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.7)
                  ),
                  padding: const EdgeInsets.all(kDefaultPadding/2),
                  child: const Icon(Icons.arrow_back,color: Colors.black,),
                ),
              )
          ),
          Positioned(
              left: kDefaultPadding/2,
              bottom: 0,
              child: CachedNetworkImage(
                width: 80,
                height: 150,
                imageUrl: kImageAddress+movie.posterPath!,
                imageBuilder: (context,imageProvider)=>Image(image: imageProvider,),
                placeholder: (context, url) => Container(
                    color: kColorBlack,
                    child: const Center(child: CircularProgressIndicator())
                ),
                errorWidget: (context, url, error) => Container(
                    color: kColorBlack,
                    child: const Center(child: CircularProgressIndicator())
                ),
              )
          ),
          Positioned(
             left:90+(kDefaultPadding/5) ,
             bottom: 30,
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title!,style: kTextAveHev14.copyWith(
                    color: kColorWhite
                  ),maxLines: 2,overflow: TextOverflow.ellipsis,),
                 const SizedBox(height: kDefaultPadding/10,),
                 Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.star,color: Colors.yellow,size: 15,),
                      Text(" (${(movie.voteAverage!/10)*5})",style: kTextAveRom12.copyWith(
                          color: kColorWhite
                      ),),
                    ],
                  ),
                  const SizedBox(height: kDefaultPadding/4,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Release Date :",style: kTextAveHev14.copyWith(
                          color: kColorWhite,
                        fontSize: 12
                      ),),
                      const SizedBox(width: kDefaultPadding/5,),
                      Text(movie.releaseDate!,style: kTextAveRom12.copyWith(
                        color: kColorWhite
                      ),),
                    ],
                  ),
                  const SizedBox(height: kDefaultPadding/4,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Runtime :",style: kTextAveHev14.copyWith(
                          color: kColorWhite,
                          fontSize: 12
                      ),),
                      const SizedBox(width: kDefaultPadding/5,),
                      Text("${movie.runtime!} min",style: kTextAveRom12.copyWith(
                          color: kColorWhite
                      ),),
                    ],
                  ),
                ],
          ))
        ]
      ),
    );
  }
}
