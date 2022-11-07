library sb_crypto_stepper;

import 'package:flutter/material.dart';
import 'package:sb_crypto_stepper/enums/last_status_enum.dart';
import 'package:sb_crypto_stepper/models/stepper_model.dart';
import 'package:timelines/timelines.dart';

class SbCryptoStepper extends StatelessWidget {
  const SbCryptoStepper({
    Key? key,
    required this.title,
    required this.currentProgressIndex,
    required this.progressList,
    this.lastStatus = LastStatusEnum.completed,
  }) : super(key: key);

  final String title;
  final int currentProgressIndex;
  final List<StepperModel> progressList;
  final LastStatusEnum lastStatus;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Timeline.tileBuilder(
            theme: TimelineThemeData(
              indicatorPosition: 0,
              nodePosition: 0,
              nodeItemOverlap: true,
              connectorTheme: const ConnectorThemeData(
                color: Color(0xffe6e7e9),
                thickness: 20.0,
              ),
            ),
            padding: EdgeInsets.only(top: 20.0),
            builder: TimelineTileBuilder.connected(
              indicatorBuilder: (context, index) {
                var borderColor = Colors.transparent;
                var color = Colors.transparent;
                var connectorColor = Colors.transparent;

                if (index < currentProgressIndex) {
                  borderColor = Color.fromRGBO(23, 47, 40, 1);
                  color = Color.fromRGBO(11, 156, 110, 1);
                  connectorColor = borderColor;
                } else if (index == currentProgressIndex) {
                  borderColor = Color.fromRGBO(18, 80, 61, 1);
                  color = Color.fromRGBO(11, 156, 110, 1);
                  connectorColor = Color.fromRGBO(23, 47, 40, 1);
                } else {
                  if (lastStatus == LastStatusEnum.completed) {
                    borderColor = Color.fromRGBO(37, 37, 37, 1);
                    color = Color.fromRGBO(94, 94, 94, 1);
                    connectorColor = borderColor;
                  } else if (lastStatus == LastStatusEnum.withheld) {
                    borderColor = Color.fromRGBO(27, 93, 109, 1);
                    color = Color.fromRGBO(44, 171, 204, 1);
                    connectorColor = Color.fromRGBO(15, 40, 46, 1);
                  } else if (lastStatus == LastStatusEnum.failed) {
                    borderColor = Color.fromRGBO(46, 28, 28, 1);
                    color = Color.fromRGBO(204, 61, 61, 1);
                    connectorColor = borderColor;
                  }
                }

                return Stack(
                  children: [
                    Container(
                      width: 20,
                      height: 10,
                      color: index > 0 ? connectorColor : Colors.transparent,
                    ),
                    Container(
                      padding: EdgeInsets.all(6),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: borderColor,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                );
              },
              connectorBuilder: (context, index, connectorType) {
                var color;
                if (index < currentProgressIndex) {
                  color = Color.fromRGBO(23, 47, 40, 1);
                } else {
                  if (lastStatus == LastStatusEnum.completed) {
                    color = Color.fromRGBO(37, 37, 37, 1);
                  } else if (lastStatus == LastStatusEnum.withheld) {
                    color = Color.fromRGBO(15, 40, 46, 1);
                  } else if (lastStatus == LastStatusEnum.failed) {
                    color = Color.fromRGBO(46, 28, 28, 1);
                  }
                }
                return SolidLineConnector(
                  indent: 6,
                  color: color,
                );
              },
              contentsBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 17),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 2),
                      Text(
                        progressList[index].title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        progressList[index].description,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(170, 170, 170, 1),
                        ),
                      ),
                      progressList[index].link == null
                          ? Container()
                          : Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  progressList[index].link!.onTap();
                                },
                                child: Text(
                                  progressList[index].link!.caption,
                                  style: TextStyle(
                                    color: Color.fromRGBO(1, 244, 166, 1),
                                    decoration: TextDecoration.underline,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                      const SizedBox(height: 24),
                    ],
                  ),
                );
              },
              itemCount: progressList.length,
            ),
          ),
        ),
      ],
    );
  }
}
