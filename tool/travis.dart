import 'package:process_run/shell.dart';

Future main() async {
  var shell = Shell();

  await shell.run('''

  dartanalyzer --fatal-warnings --fatal-infos lib test tool bin example
  dartfmt -w lib test tool bin example --set-exit-if-changed

  pub run test -p vm
  
  ''');
}