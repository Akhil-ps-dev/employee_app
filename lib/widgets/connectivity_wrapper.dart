import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import '../core/network_prblm.dart';
import '../presentation/pages/no_network_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ConnectivityWrapper extends ConsumerWidget {
  final Widget child;
  const ConnectivityWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connectivity = ref.watch(connectivityStreamProvider);

    return connectivity.when(
      data: (result) {
        final isOffline = result.contains(ConnectivityResult.none);
        if (isOffline) {
          return const NoNetworkPage();
        }
        return child;
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
    );
  }
}