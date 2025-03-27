// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logs_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$logsSizeHash() => r'3ac925ed8c5a9511b973c7e2a1ef0968c72d08e8';

/// See also [logsSize].
@ProviderFor(logsSize)
final logsSizeProvider = Provider<int>.internal(
  logsSize,
  name: r'logsSizeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$logsSizeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LogsSizeRef = ProviderRef<int>;
String _$filteredLogsHash() => r'293c1d46662c4b02d08f9b13eb2cf8e939c4d78b';

/// See also [filteredLogs].
@ProviderFor(filteredLogs)
final filteredLogsProvider = AutoDisposeProvider<List<LogEntry>>.internal(
  filteredLogs,
  name: r'filteredLogsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$filteredLogsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FilteredLogsRef = AutoDisposeProviderRef<List<LogEntry>>;
String _$logsHash() => r'e72639f5932211b02312e0b102f37d12c5109611';

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
String _$logsFilterOptionHash() => r'37d09ba4814ddac687663ac93d1235d47ff41af8';

/// See also [LogsFilterOption].
@ProviderFor(LogsFilterOption)
final logsFilterOptionProvider =
    NotifierProvider<LogsFilterOption, LogPeriodType>.internal(
  LogsFilterOption.new,
  name: r'logsFilterOptionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$logsFilterOptionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LogsFilterOption = Notifier<LogPeriodType>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
