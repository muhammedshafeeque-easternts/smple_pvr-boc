import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sampl/constants/api_constants.dart';
import 'package:sampl/constants/color.dart';
import 'package:sampl/constants/text.dart';

class FieldSection extends StatelessWidget {
  const FieldSection({Key? key, required this.field, required this.value}) : super(key: key);
  final String field;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(field,style: kTextAveHev14.copyWith(
          color: kColorWhite
        ),),
        const SizedBox(height: kDefaultPadding/5,),
        Text(value,style: kTextAveRom12.copyWith(
          color: kColorWhite
        ),)
      ],
    );
  }
}
