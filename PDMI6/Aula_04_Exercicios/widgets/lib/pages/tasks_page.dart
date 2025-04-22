import 'package:flutter/material.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('To-Do App')),
      body: TasksPageBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (_) => AddTaskDialog());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddTaskDialog extends StatefulWidget {
  @override
  _AddTaskDialogState createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Nova Tarefa"),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(hintText: "Digite o nome da tarefa"),
      ),
      actions: [
        TextButton(
          child: Text("Cancelar"),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          child: Text("Adicionar"),
          onPressed: () {
            if (_controller.text.isNotEmpty) {
              Navigator.pop(context, _controller.text);
            }
          },
        ),
      ],
    );
  }
}

class TasksPageBody extends StatefulWidget {
  const TasksPageBody({super.key});

  @override
  _TasksPageBodyState createState() => _TasksPageBodyState();
}

class _TasksPageBodyState extends State<TasksPageBody> {
  final List<bool> _taskCompleted = List.generate(5, (_) => false);
  final List<String> _tasks = List.generate(
    5,
    (index) => 'Task ${DateTime.now().add(Duration(seconds: index))}',
  );

  void _addTask(String task) {
    setState(() {
      _tasks.add(task);
      _taskCompleted.add(false);
    });
  }

  void _filterToOnlyCompletedTasks() {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: () {
              // Ação para ver tarefas completas
            },
            child: Text("View Completed Tasks"),
          ),
          SizedBox(height: 16),
          Text(
            "You have ${_taskCompleted.where((c) => !c).length} uncompleted tasks",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.yellow[700],
                  child: ListTile(
                    title: Text(_tasks[index]),
                    trailing: Checkbox(
                      value: _taskCompleted[index],
                      onChanged: (bool? value) {
                        setState(() {
                          _taskCompleted[index] = value ?? false;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
