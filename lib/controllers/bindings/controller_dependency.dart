import 'package:covid_19_worldwide/controllers/bindings/global_controller.dart';
import 'package:covid_19_worldwide/repositories/covid_repository.dart';
import 'package:get/get.dart';

void bindingGlobalController() => Get.lazyPut<GlobalController>(
    () => GlobalController(repository: Get.find<CovidRepository>()));
