//const baseUrl = 'https://';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:practice_app/service/model/todo.dart';

class TodoService {
  //final dio = Dio(BaseOptions(baseUrl: baseUrl));
  final GraphQLClient client;
  TodoService(this.client);

  Future<List<Todo>?> getTodos() async {
    const query = '''
    query {
      posts {
        data {
          id
          title
          body
        }
      }
    }
  ''';
    final result = await client.query(QueryOptions(document: gql(query)));
    if (result.hasException) {
      throw result.exception!;
    }
    final List data = result.data!['posts']['data'];

    try {
      return data.map<Todo>((json) => Todo.fromJson(json)).toList();
    } catch (e, st) {
      debugPrint('Ошибка парсинга Todo: $e\n$st');
      throw Exception('Ошибка при обработке полученных данных');
    }
  }

  Future<Todo> fetchPostById(String id) async {
    const query = r'''
    query GetPost($id: ID!) {
      post(id: $id) {
        id
        title
        body
      }
    }
  ''';

    final result = await client.query(
      QueryOptions(document: gql(query), variables: {'id': id}),
    );

    if (result.hasException) {
      throw result.exception!;
    }

    final data = result.data!['post'];
    return Todo.fromJson(data);
  }

  // return Future.delayed(const Duration(seconds: 2), () {
  //   return <Todo>[
  //     Todo(
  //       id: 1,
  //       name: 'jefdf',
  //       description: 'fnejnfvennfdlcknswk;ms;qmsl;qmelnv',
  //     ),
  //     Todo(
  //       id: 2,
  //       name: 'vfdwev',
  //       description: 'fnejnfvfvebvefvebennfdlcknelnv',
  //     ),
  //     Todo(
  //       id: 3,
  //       name: 'vwdqk fw',
  //       description: 'vfdmqklwdklsq  klsmqklsmwk;  ms w',
  //     ),
  //     Todo(
  //       id: 4,
  //       name: 'jeffmr3klngdf',
  //       description: 'fnejskq nfvennfdlcknelnv',
  //     ),
  //     Todo(
  //       id: 5,
  //       name: 'mdkfw;qm',
  //       description: 'fnejf eklnlnfvennfdlcknelnv',
  //     ),
  //   ];
  // });
  //}
}
