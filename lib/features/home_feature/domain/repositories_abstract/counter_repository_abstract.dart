

import 'package:first_task/features/home_feature/data/model/counter_model.dart';

abstract class CounterRepositoryAbstract {

  Future<void> saveCounter(CounterModel counterModel);

  Future<CounterModel> getCounter();

  Future<void> deleteCounter();

}