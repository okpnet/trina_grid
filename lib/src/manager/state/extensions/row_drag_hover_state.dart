//Add
import 'package:flutter/material.dart';
import 'package:trina_grid/trina_grid.dart';

abstract class IRowDragHoverState {
  int? get rowHoverOffsetIdx;
  Offset? get rowHoverOffset;
  void setRowHoverOffset(int rowIdx, Offset offset);
  void leaveRowHoverOffset();
}

class _State {
  int? rowIdx;
  Offset? hoverOffset;

  void set({int? rowIdx, Offset? hoverOffset}) {
    this.rowIdx = rowIdx;
    this.hoverOffset = hoverOffset;
  }
}

mixin RowDragHoverState implements ITrinaGridState {
  final rowHoverNotifier = ValueNotifier<Offset?>(null);
  final _State _state = _State();
  @override
  int? get rowHoverOffsetIdx => _state.rowIdx;
  @override
  Offset? get rowHoverOffset => _state.hoverOffset;
  @override
  void setRowHoverOffset(int rowIdx, Offset offset) {
    _state.set(rowIdx: rowIdx, hoverOffset: offset);
    rowHoverNotifier.value = offset;
  }

  @override
  void leaveRowHoverOffset() {
    _state.set(rowIdx: null, hoverOffset: null);
    rowHoverNotifier.value = null;
  }
}
