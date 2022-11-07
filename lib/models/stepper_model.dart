import 'package:sb_crypto_stepper/models/stepper_link_model.dart';

class StepperModel {
  final String title;
  final String description;
  final StepperLinkModel? link;

  StepperModel({
    required this.title,
    required this.description,
    this.link,
  });
}
