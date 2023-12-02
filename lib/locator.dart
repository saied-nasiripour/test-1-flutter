// locator = dependency injection container

import 'package:first_task/features/home_feature/data/data_sourse/local/local_data_source.dart';
import 'package:first_task/features/home_feature/data/repositories_implementation/counter_repository_implementation.dart';
import 'package:first_task/features/home_feature/domain/repositories_abstract/counter_repository_abstract.dart';
import 'package:first_task/features/home_feature/domain/use_cases/delete_counter_use_case.dart';
import 'package:first_task/features/home_feature/domain/use_cases/get_counter_use_case.dart';
import 'package:first_task/features/home_feature/domain/use_cases/save_counter_use_case.dart';
import 'package:first_task/features/home_feature/presentation/provider/home_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt locator = GetIt.instance;

setup() async{

  final prefs = await SharedPreferences.getInstance();
  final dataSource = LocalDataSource(prefs);
  locator.registerSingleton<LocalDataSource>(dataSource);


  // repositories
  final repository = CounterRepositoryImplementation(dataSource);
  locator.registerSingleton<CounterRepositoryAbstract>(repository);

  // use-case
  locator.registerSingleton<SaveCounterUseCase>(SaveCounterUseCase());
  locator.registerSingleton<GetCounterUseCase>(GetCounterUseCase());
  locator.registerSingleton<DeleteCounterUseCase>(DeleteCounterUseCase());

  // Provider
  locator.registerSingleton<HomeProvider>(HomeProvider(locator(),locator(),locator()));
}