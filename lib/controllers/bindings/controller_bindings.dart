import 'package:covid_19_worldwide/controllers/bindings/controller_dependency.dart';
import 'package:covid_19_worldwide/controllers/bindings/repository_dependency.dart';
import 'package:get/get.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    bindingCovidRepository();
    bindingGlobalController();
  }
}
