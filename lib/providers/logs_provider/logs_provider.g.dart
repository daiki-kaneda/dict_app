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
String _$filteredLogsHash() => r'05f0635b6101073451a9d631c1b3cb84b8374c62';

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
String _$logsHash() => r'5d51cb1b5914bff591e6fea8f324d9b80ebbbaec';

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
String _$logsFilterOptionHash() => r'ca0c580eff0361f4c5ef38794aa7dfaf9eda55b6';

/// See also [LogsFilterOption].
@ProviderFor(LogsFilterOption)
final logsFilterOptionProvider =
    NotifierProvider<LogsFilterOption, LogPeriod>.internal(
  LogsFilterOption.new,
  name: r'logsFilterOptionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$logsFilterOptionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LogsFilterOption = Notifier<LogPeriod>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
