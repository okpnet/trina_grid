import 'package:trina_grid/trina_grid.dart';

///Added.
///if tree widget then take into account move to parent.
mixin TreeBaseRow {
  TrinaGridStateManager get stateManager;

  bool shouldDrop(int rowIdx) {
    final row = stateManager.getRowByIdx(rowIdx);
    final isHover = stateManager.isRowIdxHovered(rowIdx);
    final isDrag = stateManager.isDraggingRow;

    if (row == null || !row.enableDrop || !isHover || !isDrag) {
      return false;
    }

    return !stateManager.dragRows.contains(row);
  }

  bool shouldSlide(int rowIdx) {
    if (!stateManager.isTreeDragMode) {
      return false;
    }

    if (!shouldDrop(rowIdx)) {
      return false;
    }

    final isInTreeIndentArea =
        stateManager.rowHoverOffset != null &&
        stateManager.rowHoverOffset!.dx <= 20;

    return stateManager.rowHoverOffsetIdx == rowIdx && //hovered row
        isInTreeIndentArea;
  }
}
