import 'package:flutter/material.dart';
import 'package:future_ex/constants/todo_enum.dart';
import 'package:future_ex/data_models/todo_model.dart';
import 'package:future_ex/service/todo_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<TodoModel>> futureTodo;

  @override
  void initState() {
    super.initState();
    futureTodo = TodoService.fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: FutureBuilder<List<TodoModel>>(
            future: futureTodo,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.blueAccent[100]),
                      child: ListTile(
                        title: Text(
                          snapshot.data![index].name,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Colors.white),
                        ),
                        subtitle: (() {
                          switch (snapshot.data![index].priority) {
                            case 'HIGH':
                              return Row(
                                children: [
                                  const Text('priority: '),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    snapshot.data![index].priority,
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              );
                            case 'MEDIUM':
                              return Row(
                                children: [
                                  const Text('priority: '),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    snapshot.data![index].priority,
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                          color: Colors.yellow,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              );
                            case 'LOW':
                              return Row(
                                children: [
                                  const Text('priority: '),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    snapshot.data![index].priority,
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              );
                          }
                        }()),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      color: Colors.transparent,
                      height: 3,
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
