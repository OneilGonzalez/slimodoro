class Task {
  final String name;
  bool completed; // Add completed property

  Task({required this.name, this.completed = false}); // Set default value for completed

  void toggleCompletion() {
    completed = !completed;
  }
}