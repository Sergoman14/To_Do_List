import 'package:flutter/material.dart';
import 'new_task.dart';
import 'package:to_do_list/models/task.dart';

// StatefulWidget имеет состояние, с которым
// позже мы будем работать через функцию
// setState(VoidCallback fn);
// обратите внимание setState принимает другую функцию
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  // StatefulWidget должен возвращать класс,
  // которые наследуется от State
  @override
  _HomePageState createState() => _HomePageState();
}

// В треугольных скобках мы указываем наш StatefulWidget
// для которого будет создано состояние
// нижнее подчеркивание _ используется для того,
// чтобы скрыть доступ к _HomePageState  из других файлов
// нижнее подчеркивание аналогия private в Java / Kotlin
class _HomePageState extends State<HomePage> {
  List<Task> allTasks = [
    Task(
      id: 0,
      desc: "Надо делать",
      importance: true,
      completance: false,
      deadline: "18:02:2023",
    ),
    Task(
      id: 1,
      desc: "Надо делать",
      importance: true,
      completance: false,
      deadline: "18:02:2023",
    ),
    Task(
      id: 2,
      desc: "Надо делать",
      importance: true,
      completance: false,
      deadline: "18:02:2023",
    ),
    Task(
      id: 3,
      desc: "Надо делать",
      importance: true,
      completance: false,
      deadline: "18:02:2023",
    ),
    Task(
      id: 4,
      desc: "Надо делать",
      importance: true,
      completance: false,
      deadline: "18:02:2023",
    ),
    Task(
      id: 5,
      desc: "Надо делать",
      importance: true,
      completance: false,
      deadline: "18:02:2023",
    ),
    Task(
      id: 6,
      desc: "Надо делать",
      importance: true,
      completance: false,
      deadline: "18:02:2023",
    ),
    Task(
      id: 7,
      desc: "Надо делать",
      importance: true,
      completance: false,
      deadline: "18:02:2023",
    ),
    Task(
      id: 8,
      desc: "Надо делать",
      importance: true,
      completance: false,
      deadline: "18:02:2023",
    ),
    Task(
      id: 9,
      desc: "Надо делать",
      importance: true,
      completance: false,
      deadline: "18:02:2023",
    ),
    Task(
      id: 10,
      desc: "Надо делать",
      importance: true,
      completance: false,
      deadline: "18:02:2023",
    ),
    Task(
      id: 11,
      desc: "Надо делать",
      importance: true,
      completance: false,
      deadline: "18:02:2023",
    ),
    Task(
      id: 12,
      desc: "Надо делать",
      importance: true,
      completance: false,
      deadline: "18:02:2023",
    ),
    Task(
      id: 13,
      desc: "Надо делать",
      importance: true,
      completance: false,
      deadline: "18:02:2023",
    ),
    Task(
      id: 14,
      desc: "Надо делать",
      importance: true,
      completance: false,
      deadline: "18:02:2023",
    ),
    Task(
      id: 15,
      desc: "Надо делать",
      importance: true,
      completance: false,
      deadline: "18:02:2023",
    ),
    Task(
      id: 16,
      desc: "Надо делать",
      importance: true,
      completance: false,
      deadline: "18:02:2023",
    ),
    Task(
      id: 17,
      desc: "Надо делать",
      importance: true,
      completance: false,
      deadline: "18:02:2023",
    ),
  ];

  // функция build, как мы уже отметили, строит
  // иерархию наших любимых виджетов
  @override
  Widget build(BuildContext context) {
    // В большинстве случаев Scaffold используется,
    // как корневой виджет для страницы или экрана
    // Scaffold позволяет вам указать AppBar, BottomNavigationBar,
    // Drawer, FloatingActionButton и другие не менее важные
    // компоненты (виджеты).
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              pinned: true,
              expandedHeight: 250.0,
              backgroundColor: Color(0xfff7f6f2),
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                    style: TextStyle(
                        color: Colors.black, height: 1.171875, fontSize: 32),
                    'Мои дела'),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 28),
              sliver: SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 2,
                          offset: Offset(0, 2)),
                      BoxShadow(color: Color(0x0F000000), blurRadius: 2),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Dismissible(
                          background: Container(color: Colors.green),
                          secondaryBackground: Container(color: Colors.red),
                          key: ValueKey<int>(allTasks[index].id),
                          onDismissed: (DismissDirection direction) {
                            if (direction == DismissDirection.startToEnd) {
                              setState(() {
                                allTasks[index].completance = true;
                              });
                            } else {
                              setState(() {
                                allTasks.removeAt(index);
                              });
                            }
                          },
                          confirmDismiss: (DismissDirection direction) async {
                            if (direction == DismissDirection.startToEnd) {
                              return false;
                            } else {
                              return true;
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.only(top: 14, bottom: 14),
                            alignment: Alignment.center,
                            color: Colors.white,
                            child: Text(
                                style:
                                    const TextStyle(height: 1.25, fontSize: 16),
                                allTasks[index].desc),
                          ));
                    },
                    shrinkWrap: true,
                    primary: false,
                    itemCount: allTasks.length,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
