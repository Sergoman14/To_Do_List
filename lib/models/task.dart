enum Importance { basic, low, high }

extension ImportanceExtension on Importance {
  String get text {
    switch (this) {
      case Importance.basic:
        return 'Нет';
      case Importance.low:
        return 'Низкий';
      case Importance.high:
        return '!!Высокий';
    }
  }
}

class Task {
  late int id;
  late String desc;
  late Importance importance;
  late bool done;
  late DateTime? deadline;

  Task(
      {required this.id,
      required this.desc,
      this.importance = Importance.basic,
      this.done = false,
      this.deadline});
}
