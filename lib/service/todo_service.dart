//const baseUrl = 'https://';

import 'package:practice_app/service/model/todo.dart';

class TodoService {
  //final dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future<List<Todo>?> getTodos() async {
    return Future.delayed(const Duration(seconds: 2), () {
      return <Todo>[
        Todo(
          id: 1,
          name: 'jefdf',
          description: 'fnejnfvennfdlcknswk;ms;qmsl;qmelnv',
        ),
        Todo(
          id: 2,
          name: 'vfdwev',
          description: 'fnejnfvfvebvefvebennfdlcknelnv',
        ),
        Todo(
          id: 3,
          name: 'vwdqk fw',
          description: 'vfdmqklwdklsq  klsmqklsmwk;  ms w',
        ),
        Todo(
          id: 4,
          name: 'jeffmr3klngdf',
          description: 'fnejskq nfvennfdlcknelnv',
        ),
        Todo(
          id: 5,
          name: 'mdkfw;qm',
          description: 'fnejf eklnlnfvennfdlcknelnv',
        ),
      ];
    });
  }
}
