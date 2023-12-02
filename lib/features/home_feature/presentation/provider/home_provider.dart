
import 'package:first_task/features/home_feature/domain/entities/counter_entity.dart';
import 'package:first_task/features/home_feature/domain/use_cases/delete_counter_use_case.dart';
import 'package:first_task/features/home_feature/domain/use_cases/get_counter_use_case.dart';
import 'package:first_task/features/home_feature/domain/use_cases/save_counter_use_case.dart';
import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  GetCounterUseCase getCounterUseCase;
  SaveCounterUseCase saveCounterUseCase;
  DeleteCounterUseCase deleteCounterUseCase;

  HomeProvider(this.saveCounterUseCase, this.getCounterUseCase, this.deleteCounterUseCase);

  int _counter = 0;
  CounterEntity _counterEntity = const CounterEntity(value: 0);
  int get counter => _counter;

  Future<void> loadCounter() async {
    _counterEntity = await getCounterUseCase.execute();
    _counter = _counterEntity.value;
    notifyListeners();
  }

  Future<void> incrementCounter() async {
    await saveCounterUseCase.execute(CounterEntity(value: _counter + 1));
    await loadCounter();
  }

  Future<void> decrementCounter() async {
    await saveCounterUseCase.execute(CounterEntity(value: _counter -1));
    await loadCounter();
  }

  Future<void> resetCounter() async {
    await deleteCounterUseCase.execute();
    await loadCounter();
  }

}