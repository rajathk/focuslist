import 'package:flutter_test/flutter_test.dart';
import 'package:focuslist/models/todo.dart';
import 'package:focuslist/view_models/todo_view_model.dart';
import 'package:mockito/mockito.dart';
import 'mocks/mock_todo_service.mocks.dart';

void main(){
  group('TodoViewModel Tests', (){
   late TodoViewModel todoViewModel;
   late MockTodoService mockTodoService;

    setUp((){
      mockTodoService = MockTodoService();
      when(mockTodoService.getTodos()).thenReturn([]);
      todoViewModel = TodoViewModel(mockTodoService);
    });

    test('should start with empty todo list', (){
      expect(todoViewModel.todos, isEmpty);
    });

    test('should add a new todo', (){
      when(mockTodoService.getTodos()).thenReturn(
        [
          Todo('1', 'Buy Milk', false)
        ]
      );
      todoViewModel.addTodo('Buy Milk');
      expect(todoViewModel.todos.length, 1);
      expect(todoViewModel.todos.first.title, 'Buy Milk');
      expect(todoViewModel.todos.first.isDone, false);
    });

    test('should toggle todo status', (){
      final testTodo = Todo('1', 'Test Task', false);
      when(mockTodoService.getTodos()).thenReturn([testTodo]);
      todoViewModel.toggleTodoStatus(testTodo.id);
      verify(mockTodoService.toggleTodo(testTodo.id)).called(1);
      verify(mockTodoService.getTodos()).called(greaterThanOrEqualTo(1));
    });

  }
  );
}