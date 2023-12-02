
import 'package:first_task/features/home_feature/data/model/counter_model.dart';

class CounterEntity {
  final int value;

  const CounterEntity({required this.value});

  // A method that converts this entity to a model
  CounterModel toModel() {
    return CounterModel(value);
  }
}
