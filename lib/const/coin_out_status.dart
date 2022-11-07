import 'package:sb_crypto_stepper/models/stepper_model.dart';

class CoinOutStatus {
  static StepperModel requested() {
    return StepperModel(
      title: 'Requested',
      description: 'Verifying user\'s signature',
    );
  }

  static StepperModel queued() {
    return StepperModel(
      title: 'Queued',
      description: 'Waiting for approval by Stockbit Crypto',
    );
  }

  static StepperModel approved() {
    return StepperModel(
      title: 'Approved',
      description: 'Approved by Stockbit Crypto',
    );
  }

  static StepperModel rejected() {
    return StepperModel(
      title: 'Rejected',
      description: 'Approved by Stockbit Crypto',
    );
  }

  static StepperModel approvedRejected() {
    return StepperModel(
      title: 'Approved / Rejected',
      description: 'Approved by Stockbit Crypto',
    );
  }

  static StepperModel sent() {
    return StepperModel(
      title: 'Sent',
      description: 'In-pool (release-funds)',
    );
  }

  static StepperModel processing() {
    return StepperModel(
      title: 'Processing',
      description: 'The transaction is accepted in the blockchain',
    );
  }

  static StepperModel failed() {
    return StepperModel(
      title: 'Failed',
      description: 'Unsuccessfully to send USDT',
    );
  }

  static StepperModel completed() {
    return StepperModel(
      title: 'Completed',
      description: 'USDT successfully sent!',
    );
  }
}
