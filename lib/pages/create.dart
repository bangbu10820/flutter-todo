import 'package:flutter/material.dart';
import 'package:flutter_todo/router.dart';
import 'package:go_router/go_router.dart';

class CreateToDoPage extends StatefulWidget {
  const CreateToDoPage({super.key});
  @override
  State<CreateToDoPage> createState() => _CreateToDoState();
}

class _CreateToDoState extends State<CreateToDoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go(ScreenPaths.home);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const TextField(
                minLines: 5,
                maxLines: null,
                decoration: InputDecoration(
                  labelText: 'Description',
                  alignLabelWithHint: true,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: FloatingActionButton(
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const Text('Create'),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
