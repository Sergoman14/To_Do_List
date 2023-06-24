import 'package:flutter/material.dart';
import 'package:to_do_list/theme/app_text_styles.dart';
import '../storage/tasks.dart';
import '../theme/elements_color.dart';
import '../widgets/task_tile.dart';
import '../pages/new_task.dart';
import '../models/task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Task> allTasks;
  int newId = 18;

  @override
  void initState() {
    super.initState();
    allTasks = List<Task>.from(tasks);
  }

  @override
  Widget build(BuildContext context) {
    Future<void> catchTask(BuildContext context, int ind, Task task) async {
      // Navigator.push returns a Future that completes after calling
      // Navigator.pop on the Selection Screen.
      Task? result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TaskPage(
            isNew: ind == allTasks.length,
            task: task,
          ),
        ),
      );
      if (!mounted) return;
      // When a BuildContext is used from a StatefulWidget, the mounted property
      // must be checked after an asynchronous gap.
      if (result?.id == -2) {
        setState(
          () {
            allTasks.removeAt(ind);
          },
        );
      } else if (result?.id != -1) {
        if (ind < allTasks.length) {
          setState(
            () {
              allTasks[ind] = result!;
            },
          );
        } else {
          setState(
            () {
              allTasks.add(result!);
              newId += 1;
            },
          );
        }
      }
    }

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: 250.0,
              backgroundColor: TodoElementsColor.getBackPrimaryColor(context),
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  style: AppTextStyles.appBarTextStyle.copyWith(
                      color: TodoElementsColor.getLabelPrimaryColor(context)),
                  'Мои дела',
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 28),
              sliver: SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 2,
                          offset: Offset(0, 2)),
                      BoxShadow(color: Color(0x0F000000), blurRadius: 2),
                    ],
                    color: TodoElementsColor.getBackSecondaryColor(context),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Column(
                    children: [
                      ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return TaskTile(
                            task: allTasks[index],
                            onSwipeLeft: () {
                              setState(() {
                                allTasks.removeAt(index);
                              });
                            },
                            onSwipeRight: () {
                              setState(() {
                                allTasks[index].done = !allTasks[index].done;
                              });
                            },
                            onIconTap: () {
                              catchTask(context, index, allTasks[index]);
                            },
                            onTileTap: () {
                              setState(() {
                                allTasks[index].done = !allTasks[index].done;
                              });
                            },
                          );
                        },
                        shrinkWrap: true,
                        primary: false,
                        itemCount: allTasks.length,
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 14, bottom: 14),
                        alignment: Alignment.center,
                        color: TodoElementsColor.getBackSecondaryColor(context),
                        child: Text(
                          style: AppTextStyles.regylarBodyText.copyWith(
                              color: TodoElementsColor.getTertiaryColor(context)),
                          'Новое',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            catchTask(
              context,
              allTasks.length,
              Task(
                id: newId,
                desc: '',
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

/*
TextField(
                            keyboardType: TextInputType.multiline,
                            controller: controller,
                            maxLines: null,
                            onTapOutside: (tap) {
                              if (FocusManager.instance.primaryFocus == TextField)
                              setState(() {
                                allTasks.add(Task(id: newId, desc: controller.text));
                                controller.clear();
                              });
                              newId += 1;
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            style: AppTextStyles.regylarBodyText,
                            decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: 'Новое',
                              hintStyle: AppTextStyles.regylarBodyText.copyWith(
                                  color: TodoElementsColor.getTertiaryColor(context)),
                            ),
                          ),
 */