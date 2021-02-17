import 'package:covid_19_worldwide/repositories/covid_repository.dart';
import 'package:get/get.dart';

void bindingCovidRepository() =>
    Get.lazyPut<CovidRepository>(() => CovidRepository());
