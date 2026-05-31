import 'package:flutter/material.dart';
import 'package:trina_grid/src/manager/event/extensitons/drag_hover_event.dart';
import 'package:trina_grid/src/manager/event/extensitons/drop_event.dart';
import 'package:trina_grid/src/manager/event/trina_grid_row_hover_event.dart';
import 'package:trina_grid/src/ui/ui.dart';
import 'package:trina_grid/trina_grid.dart';

extension BaseRowExtension on TrinaBaseRow {
  ///An event called during dragging adds to the mouse position of the row being hovered over.
  void handleOnMove(
    DragTargetDetails<TrinaRow<dynamic>> details,
    RenderBox? box,
  ) {
    final rowIdx = stateManager.dragTargetRowIdx;
    if (box != null && rowIdx != null && rowIdx == this.rowIdx) {
      final localPos = box.globalToLocal(details.offset);
      stateManager.setRowHoverOffset(rowIdx, localPos); //add
      stateManager.setRowDrop(targetRowSize: box.size);
      stateManager.eventManager!.addEvent(
        DragHoverEvent(rowIdx: rowIdx, isHovered: true, localPostion: localPos),
      );
      // debugPrint(
      //   'rIdx=${stateManager.dragTargetRowIdx} dx ${localPos.dx} dy ${localPos.dy}',
      // );
    } else {
      stateManager.leaveRowHoverOffset();
      stateManager.eventManager!.addEvent(
        TrinaGridRowHoverEvent(rowIdx: this.rowIdx, isHovered: false),
      );
    }
  }

  ///An event called when a drop occurs, with the position where the drop was placed on the row and the size of the row added.
  void handleOnAcceptExt(
    DragTargetDetails<TrinaRow> draggingRow,
    RenderBox box,
  ) async {
    final draggingRows = stateManager.dragRows.isNotEmpty
        ? stateManager.dragRows
        : [draggingRow.data];
    stateManager.setRowDrop(
      rowIdx: rowIdx,
      dropOffset: draggingRow.offset,
    ); //add
    final localPos = box.globalToLocal(draggingRow.offset);
    stateManager.eventManager!.addEvent(
      DropEvent(
        rows: draggingRows,
        targetIdx: rowIdx,
        localPosition: localPos,
        dropRowSize: stateManager.rowSize!,
      ), //add
    );
  }
}
