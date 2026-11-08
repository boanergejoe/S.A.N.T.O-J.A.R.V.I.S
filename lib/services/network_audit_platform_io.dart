import 'dart:io';

Future<String?> getLocalIpv4() async {
  try {
    final interfaces = await NetworkInterface.list(
      type: InternetAddressType.IPv4,
      includeLoopback: false,
    );
    for (final iface in interfaces) {
      for (final addr in iface.addresses) {
        if (!addr.isLoopback && !addr.address.startsWith('10.0.2.')) {
          return addr.address;
        }
      }
    }
  } catch (_) {}
  return null;
}

Future<List<int>> scanOpenPorts(String ip, List<int> ports) async {
  final open = <int>[];
  final probes = ports.map((port) async {
    try {
      final socket = await Socket.connect(
        ip,
        port,
        timeout: const Duration(milliseconds: 250),
      );
      socket.destroy();
      open.add(port);
    } catch (_) {}
  });
  await Future.wait(probes);
  return open;
}
