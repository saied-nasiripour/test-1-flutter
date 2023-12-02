
import 'package:first_task/features/home_feature/domain/entities/counter_entity.dart';

class CounterModel {
  final int value;

  CounterModel(this.value);

  CounterEntity toEntity() {
    return CounterEntity(value: value);
  }
}
