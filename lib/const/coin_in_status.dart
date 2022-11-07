import 'package:sb_crypto_stepper/models/stepper_link_model.dart';
import 'package:sb_crypto_stepper/models/stepper_model.dart';

class CoinInStatus {
  static StepperModel pending() {
    return StepperModel(
      title: 'Pending',
      description: 'In-pool',
    );
  }

  static StepperModel success() {
    return StepperModel(
      title: 'Success',
      description: 'The transaction is accepted in the blockchain',
      link: StepperLinkModel(
          caption: 'View on Explorer',
          onTap: () {
            print('tes');
          }),
    );
  }

  static StepperModel confirming() {
    return StepperModel(
      title: 'Confirming',
      description: 'Waiting for 128 block confirmations to finalize it',
    );
  }

  static StepperModel processing() {
    return StepperModel(
      title: 'Processing',
      description: 'Crediting USDT to your portfolio',
    );
  }

  static StepperModel witheldCompletedFailed() {
    return StepperModel(
      title: 'Withheld / Completed / Failed',
      description: 'USDT successfully received!',
    );
  }

  static StepperModel withheld() {
    return StepperModel(
      title: 'Withheld',
      description: 'Pending due to suspicious activity',
      link: StepperLinkModel(
          caption: 'Contact our customer service for troubleshooting',
          onTap: () {
            print('tes');
          }),
    );
  }

  static StepperModel completed() {
    return StepperModel(
      title: 'Completed',
      description: 'USDT successfully received!',
    );
  }

  static StepperModel failed() {
    return StepperModel(
      title: 'Failed',
      description: 'Unsuccessfully receiving USDT',
    );
  }
}
