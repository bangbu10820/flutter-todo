import 'package:flutter/material.dart';
import 'package:flutter_todo/models/todo.dart';
import 'package:flutter_todo/provider_models/todo_list_model.dart';
import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';


// ignore: must_be_immutable
class AddNote extends StatelessWidget {
  AddNote({super.key});


  String? userTypedTitle;
  String? userTypedDescription;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TodoListModel>(context, listen: false);

    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Add note"),

      ),

      
      // A fab button to save the todo
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.save),
          onPressed: () {
            try {
             
              //user can't simple save the note if the title is empty or null --- You can change or modify according to your needs!! :)
              //feel free to change the below logic based on your needs :)
              if (userTypedTitle == null) {
                context.pop();
              } else {
                // if the title is not null- add note to the list and pops out to the home page!
                var data = Todo(
                    title: userTypedTitle.toString(),
                    descriptions: userTypedDescription.toString());
                provider.add(data);
                debugPrint(provider.todos.toString());
                 context.pop();
              }
            } catch (e) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(e.toString())));
            }
          }),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              //* Title

              TextField(
                minLines: 1,
                autofocus: true,
                //here assigning the value to the userTypedTtile after filed changed
                onChanged: (value) => userTypedTitle = value,
                //the default maxlines for title section is set to 7, feel free to modify
                maxLines: 7,
                // expands: true,
                enableInteractiveSelection: true,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    
                    hintText: 'Title',
                    hintStyle: TextStyle(
                      color: Color(0xFF9A9A9A),
                      fontSize: 28,
                    )),
                style: const TextStyle(
                    
                    fontSize: 28),
              ),

              const SizedBox(
                height: 5,
              ),

              //* Description section.....

              TextField(
                minLines: 1,
                 //here assigning the value to the userTypedDescription after filed changed
                onChanged: (value) => userTypedDescription = value,
               //the default maxlines for description section is set to 20, feel free to modify
                maxLines: 20,
                // expands: true,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'description..',
                    hintStyle: TextStyle(
                      color: Color(0xFF9A9A9A),
                      fontSize: 24,
                    )),
                style: const TextStyle(
              
                    fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
