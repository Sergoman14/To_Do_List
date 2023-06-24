import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list/models/task.dart';
import 'package:to_do_list/widgets/delete_button.dart';

import '../theme/app_text_styles.dart';
import '../theme/elements_color.dart';
import '../theme/elements_text_styles.dart';

class TaskPage extends StatefulWidget {
  final Task task;
  final bool isNew;

  const TaskPage({super.key, required this.task, required this.isNew});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late TextEditingController controller;
  late Importance importance;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.task.desc);
    importance = widget.task.importance;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 0.0,
            backgroundColor: TodoElementsColor.getBackPrimaryColor(context),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(
                    context,
                    Task(
                      id: -1,
                      desc: '',
                    ));
              },
              icon: Icon(
                Icons.close,
                color: TodoElementsColor.getLabelPrimaryColor(context),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 9),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                      Task(
                          id: widget.task.id,
                          desc: controller.text,
                          importance: importance,
                          deadline: widget.task.deadline,
                          done: widget.task.done),
                    );
                  },
                  child: Text('СОХРАНИТЬ',
                      style: AppElementsTextStyles.textButtonStyle(context)),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 2,
                            offset: Offset(0, 2)),
                        BoxShadow(color: Color(0x0F000000), blurRadius: 2),
                      ],
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      color: TodoElementsColor.getBackSecondaryColor(context),
                    ),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      controller: controller,
                      maxLines: null,
                      onTapOutside: (tap) {
                        widget.task.desc = controller.text;
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      style: AppTextStyles.regylarBodyText,
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: 'Что надо сделать...',
                        hintStyle: AppTextStyles.regylarBodyText.copyWith(
                            color: TodoElementsColor.getTertiaryColor(context)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Важность', style: AppTextStyles.regylarBodyText),
                      Padding(
                        padding: const EdgeInsets.only(right: 200),
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton<Importance>(
                            items: Importance.values
                                .map<DropdownMenuItem<Importance>>(
                                    (Importance value) {
                              return DropdownMenuItem<Importance>(
                                value: value,
                                child: Text(value.text,
                                    style: value == Importance.high
                                        ? AppTextStyles.regylarBodyText
                                            .copyWith(
                                                color: TodoElementsColor
                                                    .getRedColor(context))
                                        : AppTextStyles.regylarBodyText),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                importance = value!;
                              });
                            },
                            //style: importance == Importance.high
                            //                                 ? AppElementsTextStyles.highValueStyle(context)
                            //                                 : AppElementsTextStyles.lowValueStyle(context),
                            borderRadius: BorderRadius.circular(2),
                            value: importance,
                            underline: Container(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Divider(
                    height: 1,
                    thickness: 0.5,
                    color: TodoElementsColor.getSeparatorColor(context),
                  ),
                ),
                Divider(
                  height: 1,
                  thickness: 0.5,
                  color: TodoElementsColor.getSeparatorColor(context),
                ),
                Padding(
                    padding: const EdgeInsets.all(16),
                    child: DeleteButton(isNew: widget.isNew)),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
