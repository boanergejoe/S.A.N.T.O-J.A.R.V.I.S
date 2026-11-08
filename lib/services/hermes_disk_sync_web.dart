Future<void> syncHermesFilesToDisk({
  required String soulMd,
  required String userMd,
  required String agentMd,
}) async {
  // Web: skip local filesystem sync; SharedPreferences holds state.
}
