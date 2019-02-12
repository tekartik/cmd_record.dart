import 'package:tekartik_cmd_record/src/utils.dart';
import 'package:dev_test/test.dart';

void main() {
  group('src_utils', () {
    test('durationToString', () {
      expect(durationToString(Duration(milliseconds: 900)), "00:00.900");
      expect(durationToString(Duration(milliseconds: 90)), "00:00.090");
      expect(durationToString(Duration(milliseconds: 61090)), "01:01.090");
      expect(durationToString(Duration()), "00:00.000");
    });
  });
}
