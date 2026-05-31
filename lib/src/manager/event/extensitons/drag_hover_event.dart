import 'package:flutter/material.dart';
import 'package:trina_grid/src/manager/event/trina_grid_row_hover_event.dart';

class DragHoverEvent extends TrinaGridRowHoverEvent {
  final Offset localPostion;
  DragHoverEvent({
    required super.rowIdx,
    required super.isHovered,
    required this.localPostion,
  });
}
