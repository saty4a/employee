import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String?> errors;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => formErrorText(error: errors[index]!,Context: context)),
    );
  }

  Row formErrorText({required String error, required BuildContext Context}) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/Error.svg",
          height: MediaQuery.of(Context).size.height * 0.03,
          width: MediaQuery.of(Context).size.height * 0.03,
        ),
        SizedBox(
          width: MediaQuery.of(Context).size.height * 0.03,
        ),
        Text(error),
      ],
    );
  }
}
