library sb_crypto_stepper;

import 'package:flutter/material.dart';
import 'package:sb_crypto_stepper/const/coin_out_status.dart';
import 'package:sb_crypto_stepper/enums/last_status_enum.dart';
import 'package:sb_crypto_stepper/models/stepper_model.dart';
import 'package:sb_crypto_stepper/sb_crypto_stepper.dart';

class StepperCoinOut extends StatelessWidget {
  final String coinOutStatus;
  StepperCoinOut({
    Key? key,
    required this.coinOutStatus,
  }) : super(key: key);

  StepperModel _approveOrReject() {
    if (coinOutStatus == 'Approved') {
      return CoinOutStatus.approved();
    } else if (coinOutStatus == 'Rejected') {
      return CoinOutStatus.rejected();
    } else if (coinOutStatus == 'Sent' ||
        coinOutStatus == 'Processing' ||
        coinOutStatus == 'Completed' ||
        coinOutStatus == 'Failed') {
      return CoinOutStatus.approved();
    }
    return CoinOutStatus.approvedRejected();
  }

  StepperModel _completeOrFail() {
    if (coinOutStatus == 'Failed' || coinOutStatus == 'Rejected') {
      return CoinOutStatus.failed();
    } else {
      return CoinOutStatus.completed();
    }
  }

  List<StepperModel> _stepper() {
    return [
      CoinOutStatus.requested(),
      CoinOutStatus.queued(),
      _approveOrReject(),
      CoinOutStatus.sent(),
      CoinOutStatus.processing(),
      _completeOrFail(),
    ];
  }

  LastStatusEnum _lastStatus() {
    if (coinOutStatus == 'Failed' || coinOutStatus == 'Rejected') {
      return LastStatusEnum.failed;
    }
    return LastStatusEnum.completed;
  }

  int _currentIndex() {
    if (coinOutStatus == 'Requested') {
      return 0;
    } else if (coinOutStatus == 'Queued') {
      return 1;
    } else if (coinOutStatus == 'Approved' || coinOutStatus == 'Rejected') {
      return 2;
    } else if (coinOutStatus == 'Sent') {
      return 3;
    } else if (coinOutStatus == 'Processing') {
      return 4;
    } else if (coinOutStatus == 'Completed') {
      return 5;
    } else if (coinOutStatus == 'Failed') {
      return 4;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SbCryptoStepper(
      title: 'Proses Transaksi',
      currentProgressIndex: _currentIndex(),
      progressList: _stepper(),
      lastStatus: _lastStatus(),
    );
  }
}
