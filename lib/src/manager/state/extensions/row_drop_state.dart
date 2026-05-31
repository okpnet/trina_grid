import 'dart:ui';

import 'package:trina_grid/trina_grid.dart';

abstract class IRowDropState {
  int? get rowDropOffsetIdx;
  Offset? get rowDropOffset;
  Size? get rowSize;
  void setRowDrop({int? rowIdx, Offset? dropOffset, Size? targetRowSize});
}

class _State {
  int? rowIdx;
  Offset? dropOffset;
  Size? targetRowSize;
  void set({int? rowIdx, Offset? dropOffset, Size? targetRowSize}) {
    this.rowIdx = rowIdx ?? this.rowIdx;
    this.dropOffset = dropOffset ?? this.dropOffset;
    this.targetRowSize = targetRowSize ?? this.targetRowSize;
  }
}

mixin RowDropState implements ITrinaGridState {
  final _State _state = _State();
  @override
  int? get rowDropOffsetIdx => _state.rowIdx;
  @override
  Offset? get rowDropOffset => _state.dropOffset;
  @override
  Size? get rowSize => _state.targetRowSize;
  @override
  void setRowDrop({int? rowIdx, Offset? dropOffset, Size? targetRowSize}) {
    _state.set(
      rowIdx: rowIdx,
      dropOffset: dropOffset,
      targetRowSize: targetRowSize,
    );
  }
}
