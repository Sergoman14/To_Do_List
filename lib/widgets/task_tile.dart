import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/icon_generator.dart';
import '../models/task.dart';
import '../theme/app_text_styles.dart';
import '../theme/elements_color.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
    required this.onSwipeLeft,
    required this.onSwipeRight,
    required this.onIconTap,
    required this.onTileTap,
  });

  final Task task;
  final VoidCallback onSwipeLeft;
  final VoidCallback onSwipeRight;
  final VoidCallback onIconTap;
  final VoidCallback onTileTap;

  @override
  Widget build(BuildContext context) {
    final tileTextStyle = task.done
        ? AppTextStyles.listTextStyle.copyWith(
            color: TodoElementsColor.getTertiaryColor(context),
            decoration: TextDecoration.lineThrough,
            decorationColor: TodoElementsColor.getTertiaryColor(context),
          )
        : AppTextStyles.listTextStyle;

    return Dismissible(
      background: Container(
        color: TodoElementsColor.getGreenColor(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 20),
            Icon(
              Icons.check,
              color: TodoElementsColor.getWhiteColor(context),
            ),
          ],
        ),
      ),
      secondaryBackground: Container(
        color: TodoElementsColor.getRedColor(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.delete,
              color: TodoElementsColor.getWhiteColor(context),
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
      key: ValueKey<int>(task.id),
      onDismissed: (DismissDirection direction) {
        if (direction == DismissDirection.endToStart) {
          onSwipeLeft();
        }
      },
      onUpdate: (DismissUpdateDetails direction) {
        if (direction.direction == DismissDirection.startToEnd &&
            direction.progress > 0.5) {
          onSwipeRight();
        }
      },
      confirmDismiss: (DismissDirection direction) async {
        if (direction == DismissDirection.startToEnd) {
          return false;
        } else {
          return true;
        }
      },
      child: GestureDetector(
        onTap: () {
          onTileTap();
        },
        child: Container(
          padding: const EdgeInsets.only(top: 2),
          alignment: Alignment.center,
          color: TodoElementsColor.getBackSecondaryColor(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 5),
                child: Checkbox(
                  activeColor: TodoElementsColor.getGreenColor(context),
                  value: task.done,
                  onChanged: (bool? value) {
                    onTileTap();
                  },
                ),
              ),
              IconGenerator(importance: task.importance),
              Container(
                padding: const EdgeInsets.only(top: 12, bottom: 14),
                child: SizedBox(
                  width: 244,
                  child: Text(
                    style: tileTextStyle,
                    textCutter(task.desc),
                    softWrap: true,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 3, right: 5),
                child: IconButton(
                    onPressed: () {
                      onIconTap();
                    },
                    icon: const Icon(Icons.info_outline),
                    color: TodoElementsColor.getTertiaryColor(context)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String textCutter(String desc) {
    if (desc.length > 79) {
      return '${desc.substring(0, 79)}...';
    } else {
      return desc;
    }
  }
}
