import 'package:tekartik_cmd_record/src/utils.dart';
import 'package:dev_test/test.dart';
import 'package:tekartik_common_utils/common_utils_import.dart';

void main() {
  group('src_utils', () {
    test('durationToString', () {
      expect(durationToString(new Duration(milliseconds: 900)), "00:00.900");
      expect(durationToString(new Duration(milliseconds: 90)), "00:00.090");
      expect(durationToString(new Duration(milliseconds: 61090)), "01:01.090");
      expect(durationToString(new Duration()), "00:00.000");
    });
  });
}
