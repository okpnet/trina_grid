import 'package:flutter/material.dart';
import 'package:trina_grid/trina_grid.dart';

class DropEvent extends TrinaGridDragRowsEvent {
  final Offset localPosition;
  final Size dropRowSize;
  DropEvent({
    required super.rows,
    required super.targetIdx,
    required this.localPosition,
    required this.dropRowSize,
  });
  @override
  void handler(TrinaGridStateManager stateManager) async {
    stateManager.moveRowsByIndex(
      rows,
      targetIdx,
      localPosition: localPosition,
      rowSize: dropRowSize,
    );
  }
}
