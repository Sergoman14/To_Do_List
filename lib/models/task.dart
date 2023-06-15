enum Importance { none, low, high }

extension ImportanceExtension on Importance {
  String get text {
    switch (this) {
      case Importance.none:
        return 'Нет';
      case Importance.low:
        return 'Низкий';
      case Importance.high:
        return 'Высокий';
    }
  }
}

class Task {
  late int id;
  late String desc;
  late Importance importance;
  late bool done;
  late String deadline;

  Task(
      {required this.id,
      required this.desc,
      required this.importance,
      required this.done,
      required this.deadline});
}
