import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          title: Text(mockTasks[index].title),
          subtitle: Text(mockTasks[index].subTitle),
        ),
        itemCount: mockTasks.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

final List<TodoTask> mockTasks = [
  TodoTask(title: 'Home work', subTitle: 'Doing home work for tomorrow'),
  TodoTask(title: 'Play Game', subTitle: 'Play game with bros'),
  TodoTask(title: 'Chore', subTitle: 'Complete housework'),
  TodoTask(title: 'Learning Japanese', subTitle: 'Learn Japanese'),
  TodoTask(title: 'Take motorcycle exam', subTitle: 'Try to get A2'),
];

class TodoTask {
  String title;
  String subTitle;

  TodoTask({required this.title, required this.subTitle});
}
