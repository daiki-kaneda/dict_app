// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logs_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$logsSizeHash() => r'39e4c6018a754842a7a560f2f18ba372d289040d';

/// See also [logsSize].
@ProviderFor(logsSize)
final logsSizeProvider = AutoDisposeProvider<int>.internal(
  logsSize,
  name: r'logsSizeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$logsSizeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LogsSizeRef = AutoDisposeProviderRef<int>;
String _$logsHash() => r'a9e6fa53f1cfce3e7ecaa05b06ec647f1d4a5001';

/// See also [Logs].
@ProviderFor(Logs)
final logsProvider = AutoDisposeNotifierProvider<Logs, List<LogEntry>>.internal(
  Logs.new,
  name: r'logsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$logsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Logs = AutoDisposeNotifier<List<LogEntry>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
