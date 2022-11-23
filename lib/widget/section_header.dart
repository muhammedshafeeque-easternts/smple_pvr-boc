import 'package:flutter/material.dart';
import 'package:sampl/constants/api_constants.dart';
import 'package:sampl/constants/color.dart';
import 'package:sampl/constants/text.dart';


class SectionHeader extends StatelessWidget {
  const SectionHeader({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: kColorBlack,
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(children: [
          InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.arrow_back_ios,
              color: kColorWhite,
            ),
          ),
          const SizedBox(
            width: 2,
          ),
          Text(
            name,style: kTextAveHev16,
            maxLines: 1,
          )
        ]),
      ),
    );
  }
}
