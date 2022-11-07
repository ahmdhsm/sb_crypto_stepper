library sb_crypto_stepper;

import 'package:flutter/material.dart';
import 'package:sb_crypto_stepper/const/coin_in_status.dart';
import 'package:sb_crypto_stepper/const/coin_out_status.dart';
import 'package:sb_crypto_stepper/enums/last_status_enum.dart';
import 'package:sb_crypto_stepper/models/stepper_model.dart';
import 'package:sb_crypto_stepper/sb_crypto_stepper.dart';

class StepperCoinIn extends StatelessWidget {
  final String coinInStatus;
  StepperCoinIn({
    Key? key,
    required this.coinInStatus,
  }) : super(key: key);

  StepperModel _approveOrReject() {
    if (coinInStatus == 'Approved') {
      return CoinOutStatus.approved();
    } else if (coinInStatus == 'Rejected') {
      return CoinOutStatus.rejected();
    } else if (coinInStatus == 'Sent' ||
        coinInStatus == 'Processing' ||
        coinInStatus == 'Completed' ||
        coinInStatus == 'Failed') {
      return CoinOutStatus.approved();
    }
    return CoinOutStatus.approvedRejected();
  }

  StepperModel _withheldCompleteFailed() {
    if (coinInStatus == 'Withheld1' || coinInStatus == 'Withheld2') {
      return CoinInStatus.withheld();
    } else if (coinInStatus == 'Completed') {
      return CoinInStatus.completed();
    } else if (coinInStatus == 'Failed') {
      return CoinInStatus.failed();
    } else {
      return CoinInStatus.witheldCompletedFailed();
    }
  }

  List<StepperModel> _stepper() {
    return [
      CoinInStatus.pending(),
      CoinInStatus.success(),
      CoinInStatus.confirming(),
      CoinInStatus.processing(),
      _withheldCompleteFailed(),
    ];
  }

  LastStatusEnum _lastStatus() {
    if (coinInStatus == 'Failed') {
      return LastStatusEnum.failed;
    } else if (coinInStatus == 'Withheld1' || coinInStatus == 'Withheld2') {
      return LastStatusEnum.withheld;
    }
    return LastStatusEnum.completed;
  }

  int _currentIndex() {
    if (coinInStatus == 'Pending') {
      return 0;
    } else if (coinInStatus == 'Success') {
      return 1;
    } else if (coinInStatus == 'Confirmed') {
      return 2;
    } else if (coinInStatus == 'Processing') {
      return 3;
    } else if (coinInStatus == 'Withheld1' || coinInStatus == 'Withheld2') {
      return 3;
    } else if (coinInStatus == 'Completed') {
      return 4;
    } else if (coinInStatus == 'Failed') {
      return 3;
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
