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
     Task(id: 0, desc: "Надо делать", importance: true, completance: false, deadline: "18:02:2023"),
     Task(id: 1, desc: "Надо делать", importance: true, completance: false, deadline: "18:02:2023"),
     Task(id: 2, desc: "Надо делать", importance: true, completance: false, deadline: "18:02:2023"),
     Task(id: 3, desc: "Надо делать", importance: true, completance: false, deadline: "18:02:2023"),
     Task(id: 4, desc: "Надо делать", importance: true, completance: false, deadline: "18:02:2023"),
     Task(id: 5, desc: "Надо делать", importance: true, completance: false, deadline: "18:02:2023"),
     Task(id: 6, desc: "Надо делать", importance: true, completance: false, deadline: "18:02:2023"),
     Task(id: 7, desc: "Надо делать", importance: true, completance: false, deadline: "18:02:2023"),
     Task(id: 8, desc: "Надо делать", importance: true, completance: false, deadline: "18:02:2023"),
     Task(id: 9, desc: "Надо делать", importance: true, completance: false, deadline: "18:02:2023"),
     Task(id: 10, desc: "Надо делать", importance: true, completance: false, deadline: "18:02:2023"),
     Task(id: 11, desc: "Надо делать", importance: true, completance: false, deadline: "18:02:2023"),
     Task(id: 12, desc: "Надо делать", importance: true, completance: false, deadline: "18:02:2023"),
     Task(id: 13, desc: "Надо делать", importance: true, completance: false, deadline: "18:02:2023"),
     Task(id: 14, desc: "Надо делать", importance: true, completance: false, deadline: "18:02:2023"),
     Task(id: 15, desc: "Надо делать", importance: true, completance: false, deadline: "18:02:2023"),
     Task(id: 16, desc: "Надо делать", importance: true, completance: false, deadline: "18:02:2023"),
     Task(id: 17, desc: "Надо делать", importance: true, completance: false, deadline: "18:02:2023"),
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
    return Scaffold(
      body:
      CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            backgroundColor: Color(0xfff7f6f2),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                  style: TextStyle(color: Colors.black,height: 1.171875,fontSize: 32),
                  'Мои дела'
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            sliver: SliverToBoxAdapter(
                child:
                  Container(
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)
                      )
                    ),
                  )
              )
          ),
          SliverPadding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return Dismissible(
                      background: Container(
                          color: Colors.green
                      ),
                      secondaryBackground :
                        Container(
                        color: Colors.red
                        ),
                        key: ValueKey<int>(allTasks[index].id),
                        onDismissed: (DismissDirection direction) {
                          if (direction == DismissDirection.startToEnd) {
                            setState(() {
                              allTasks[index].completance = true;
                            });
                          }
                          else {
                            setState(() {
                              allTasks.removeAt(index);
                            });
                          }
                        },
                        confirmDismiss: (DismissDirection direction) async {
                          if (direction == DismissDirection.startToEnd)
                            {
                              return false;
                            }
                          else
                            {
                              return true;
                            }
                        },
                      child:
                        Container(
                          padding: const EdgeInsets.only(top: 14, bottom: 14),
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Text(
                              style: const TextStyle(height: 1.25,fontSize: 16),
                              allTasks[index].desc
                          ),
                        )
                      );
                  },
                  childCount: allTasks.length,
                ),
              ),
          ),
          SliverPadding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 28),
              sliver: SliverToBoxAdapter(
                  child:
                  Container(
                    height: 8,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8)
                        )
                    ),
                  )
              )
          ),
        ],
      )
/*
          child: Container(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              decoration: const BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: ListView(
                  // map принимает другую функцию, которая
                  // будет выполняться над каждым элементом
                  // списка и возвращать новый элемент (виджет Material).
                  // Результатом map является новый список
                  // с новыми элементами, в данном случае
                  // это Material виджеты
                  children: tasks.map<Widget>((task) {
                    // Material используется для того,
                    // чтобы указать цвет элементу списка
                    // и применить ripple эффект при нажатии на него
                    return Material(
                    color: Colors.white,
                    // InkWell позволяет отслеживать
                    // различные события, например: нажатие
                    child: InkWell(
                      // splashColor - цвет ripple эффекта
                      splashColor: Colors.white70,
                      // нажатие на элемент списка
                      onTap: () {
                      // Здесь мы используем сокращенную форму:
                      // Navigator.of(context).push(route)
                      // PonyDetailPage принимает pony id,
                      // который мы и передали
                      Navigator.push(context, MaterialPageRoute<void>(
                      builder: (context) => TaskPage(task.id)
                      ));
                      },
                        // добавим немного позже
                      // далее указываем в качестве
                      // элемента Container с вложенным Text
                      // Container позволяет указать внутренние (padding)
                      // и внешние отступы (margin),
                      // а также тень, закругление углов,
                      // цвет и размеры вложенного виджета
                      child: Container(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                              task.desc,
                              style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.black)
                          ),
                      ),
                    ),
                      );
                    // map возвращает Iterable объект, который необходимо
                    // преобразовать в список с помощью toList() функции
                  }).toList(),

              )
          ),
         )

 */
    );
  }

}
