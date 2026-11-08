import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<void> syncHermesFilesToDisk({
  required String soulMd,
  required String userMd,
  required String agentMd,
}) async {
  final dir = await getApplicationDocumentsDirectory();
  final hermesDir = Directory('${dir.path}/hermes');
  if (!await hermesDir.exists()) {
    await hermesDir.create(recursive: true);
  }
  await File('${hermesDir.path}/soul.md').writeAsString(soulMd);
  await File('${hermesDir.path}/user.md').writeAsString(userMd);
  await File('${hermesDir.path}/agent.md').writeAsString(agentMd);
}
