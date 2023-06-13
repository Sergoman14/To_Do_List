import 'package:flutter/material.dart';
import 'new_task.dart';

class Task {
  late int id;
  late String desc;
  late bool importance;
  late bool completance;
  late String deadline;

  Task(this.id, this.desc, this.importance, this.completance, this.deadline);
}

List<Task> tasks = [
  Task(0, "Надо делать", true, false, "18:02:2023"),
  Task(1, "Дедлайн близко", false, false, "18:02:2023"),
  Task(2, "Надо делать", true, false, "18:02:2023"),
  Task(3, "Надо делать", true, false, "18:02:2023"),
  Task(4, "Надо делать", true, false, "18:02:2023"),
  Task(5, "Надо делать", true, false, "18:02:2023"),
  Task(6, "Надо делать", true, false, "18:02:2023"),
  Task(7, "Надо делать", true, false, "18:02:2023"),
  Task(8, "Надо делать", true, false, "18:02:2023"),
  Task(9, "Надо делать", true, false, "18:02:2023"),
  Task(10, "Надо делать", true, false, "18:02:2023"),
  Task(11, "Надо делать", true, false, "18:02:2023"),
  Task(12, "Надо делать", true, false, "18:02:2023"),
  Task(13, "Надо делать", true, false, "18:02:2023")
];
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

   Map<String, Task> allTasks = {};

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

      // мы создаем AppBar с текстом "Home Page"
      appBar: AppBar(title: const Text("Мои дела")),
        // указываем текст в качестве тела Scaffold
        // текст предварительно вложен в Center виджет,
        // чтобы выровнять его по центру
      body: Padding(
        // объект EdgeInsets хранит четыре важные double переменные:
        // left, top, right, bottom - отступ слева, сверху, справа и снизу
        // EdgeInsets.all(10) - задает одинаковый отступ со всех сторон
        // EdgeInsets.only(left: 10, right: 15) - задает отступ для
        // определенной стороны или сторон
        // EdgeInsets.symmetric - позволяет указать одинаковые
        // отступы по горизонтали (left и right) и по вертикали (top и bottom)
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          // создаем наш список
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
    );
  }

}
