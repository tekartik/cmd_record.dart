@TestOn("vm")
import 'dart:convert';
import 'package:path/path.dart';
import 'package:tekartik_cmd_record/cmd_record.dart';
import 'package:dev_test/test.dart';
import 'package:process_run/cmd_run.dart';
import 'package:tekartik_common_utils/common_utils_import.dart';
import 'dart:io';

String get cmdRecordScriptPath => join('bin', 'cmd_record.dart');

String get echoScriptPath => join('example', 'echo.dart');

void main() {
  group('cmd_record', () {
    test('version', () async {
      ProcessResult result =
          await runCmd(dartCmd([cmdRecordScriptPath, '--version']));
      expect(result.stderr.toLowerCase(), contains("version"));
      // "Dart VM version: 1.7.0-dev.4.5 (Thu Oct  9 01:44:31 2014) on "linux_x64"\n"
    });

    test('out', () async {
      History history = new History();
      ProcessCmd cmd = dartCmd([echoScriptPath, '--stdout', 'out']);
      await record(cmd.executable, cmd.arguments,
          noStdOutput: true, history: history);
      //devPrint(JSON.encode(history));
      expect(history.outItems.first.line, "out");
    });

    test('err', () async {
      History history = new History();
      ProcessCmd cmd = dartCmd([echoScriptPath, '--stderr', 'err']);
      await record(cmd.executable, cmd.arguments,
          noStdOutput: true, history: history);
      //devPrint(JSON.encode(history));
      expect(history.errItems.first.line, "err");
    }, onPlatform: {"windows": new Skip("failing")});

    test('in', () async {
      History history = new History();
      ProcessCmd cmd = dartCmd([echoScriptPath, '--stdin']);
      var inController = new StreamController<List<int>>();
      Future future = record(cmd.executable, cmd.arguments,
          noStdOutput: true, inStream: inController.stream, history: history);
      inController.add(utf8.encode("in"));
      inController.close();
      await future;
      //devPrint(JSON.encode(history));
      expect(history.inItems.first.line, "in");
    });
  });
}
