import 'package:pedometer/pedometer.dart';
import 'package:touch/store/sharedpreferences/sharedpreferences.dart';

Future<int> totalStep() async {
  var dailyStep = await Pref().loadInt("dailystep");
  var step = await Pref().loadInt("step");
  var oldStep = await Pref().loadInt("oldstep");
  int currentStep = step - oldStep + dailyStep;
  print(step.toString());
  print(oldStep.toString());
  print(dailyStep.toString());

  return currentStep;
}

Future<int> availableStep() async {
  int totalPaid = await Pref().loadInt("paid");
  return await totalStep() - totalPaid;
}

Future<void> stepCheck(int pedostep) async {
  int dailyStep = await Pref().loadInt("dailystep");
  int step = await Pref().loadInt("step");
  int oldStep = await Pref().loadInt("oldstep");

  if (pedostep < step) {
    Pref().saveInt("dailystep", step - oldStep);
    Pref().saveInt("oldstep", 0);
  }

  Pref().saveInt("step", pedostep);
}
