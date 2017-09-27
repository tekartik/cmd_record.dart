String durationToString(Duration duration) {
  String threeDigits(int n) {
    if (n >= 100) return "$n";
    if (n >= 10) return "0$n";
    return "00$n";
  }

  String twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }

  String twoDigitMinutes =
      twoDigits(duration.inMinutes.remainder(Duration.MINUTES_PER_HOUR));
  String twoDigitSeconds =
      twoDigits(duration.inSeconds.remainder(Duration.SECONDS_PER_MINUTE));
  String threeDigitMillis = threeDigits(
      duration.inMilliseconds.remainder(Duration.MILLISECONDS_PER_SECOND));
  return "$twoDigitMinutes:$twoDigitSeconds.$threeDigitMillis";
}
