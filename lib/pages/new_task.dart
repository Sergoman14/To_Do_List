import 'package:flutter/material.dart';
import 'package:to_do_list/models/task.dart';
import 'package:to_do_list/widgets/delete_button.dart';

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
            backgroundColor: const Color(0xfff7f6f2),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(
                    context,
                    Task(
                        id: -1,
                        desc: '',
                        importance: Importance.none,
                        done: false,
                        deadline: ''));
              },
              icon: const Icon(
                Icons.close,
                color: Colors.black,
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
                  child: const Text(
                    'СОХРАНИТЬ',
                    style: TextStyle(
                        color: Color(0xff007aff), height: 1.7, fontSize: 14),
                  ),
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
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 2,
                            offset: Offset(0, 2)),
                        BoxShadow(color: Color(0x0F000000), blurRadius: 2),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      // цвет Container'а мы указываем в BoxDecoration
                      color: Colors.white,
                    ),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      controller: controller,
                      maxLines: null,
                      onTapOutside: (tap) {
                        widget.task.desc = controller.text;
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: Colors.black),
                      decoration: const InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: 'Что надо сделать...',
                          hintStyle: TextStyle(color: Color(0x4d000000))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: DropdownButton<Importance>(
                    items: Importance.values
                        .map<DropdownMenuItem<Importance>>((Importance value) {
                      return DropdownMenuItem<Importance>(
                        value: value,
                        child: Text(value.text),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        importance = value!;
                      });
                    },
                    value: importance,
                    underline: Container(),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Divider(
                    height: 1,
                    thickness: 0.5,
                    color: Color(0x33000000),
                  ),
                ),
                const Divider(
                  height: 1,
                  thickness: 0.5,
                  color: Color(0x33000000),
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
