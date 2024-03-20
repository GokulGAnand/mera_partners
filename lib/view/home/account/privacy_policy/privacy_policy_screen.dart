import 'package:evaluator_app/utils/dimens.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: MyStrings.privacyPolicy),
      body: SingleChildScrollView(
        child: Padding(
          padding: Dimens.padding16,
          child: Column(
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'What is Lorem Ipsum?\n\n',
                      style: MyStyles.grey14500,
                    ),
                    TextSpan(
                      text:
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\n',
                      style: MyStyles.subtitle12400,
                    ),
                    TextSpan(
                      text: 'Why do we use it?\n\n',
                      style: MyStyles.grey14500,
                    ),
                    TextSpan(
                      text:
                          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\n\n',
                      style: MyStyles.subtitle12400,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}