// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'utility_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$canPopHash() => r'78b0ff59f979c8957474e6bb8b175138a7f753f2';

/// See also [canPop].
@ProviderFor(canPop)
final canPopProvider = AutoDisposeFutureProvider<bool>.internal(
  canPop,
  name: r'canPopProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$canPopHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CanPopRef = AutoDisposeFutureProviderRef<bool>;
String _$isDictShowingHash() => r'a7a8c73bf2d384a5f12fda665ccde1ee491954f5';

/// See also [isDictShowing].
@ProviderFor(isDictShowing)
final isDictShowingProvider = AutoDisposeFutureProvider<bool>.internal(
  isDictShowing,
  name: r'isDictShowingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isDictShowingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IsDictShowingRef = AutoDisposeFutureProviderRef<bool>;
String _$currentTreeIdNotifierHash() =>
    r'b8ed9c925948aae762e2f9f2d5ddcd35f3f6bd60';

/// See also [CurrentTreeIdNotifier].
@ProviderFor(CurrentTreeIdNotifier)
final currentTreeIdNotifierProvider =
    AutoDisposeAsyncNotifierProvider<CurrentTreeIdNotifier, String>.internal(
  CurrentTreeIdNotifier.new,
  name: r'currentTreeIdNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentTreeIdNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentTreeIdNotifier = AutoDisposeAsyncNotifier<String>;
String _$isEditingNotifierHash() => r'8ebf90ec89d26e4acbb188ede51822c4597309c0';

/// See also [IsEditingNotifier].
@ProviderFor(IsEditingNotifier)
final isEditingNotifierProvider =
    AutoDisposeNotifierProvider<IsEditingNotifier, bool>.internal(
  IsEditingNotifier.new,
  name: r'isEditingNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isEditingNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$IsEditingNotifier = AutoDisposeNotifier<bool>;
String _$selectedIdsHash() => r'b6edf5eca70d6ea4e364570ec5618d06a7c684eb';

/// See also [SelectedIds].
@ProviderFor(SelectedIds)
final selectedIdsProvider =
    AutoDisposeNotifierProvider<SelectedIds, Set<String>>.internal(
  SelectedIds.new,
  name: r'selectedIdsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$selectedIdsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedIds = AutoDisposeNotifier<Set<String>>;
String _$isSheetShowingHash() => r'7c37bf10739465bcf7630d9c3d131a95f8377595';

/// See also [IsSheetShowing].
@ProviderFor(IsSheetShowing)
final isSheetShowingProvider =
    AutoDisposeNotifierProvider<IsSheetShowing, bool>.internal(
  IsSheetShowing.new,
  name: r'isSheetShowingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isSheetShowingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$IsSheetShowing = AutoDisposeNotifier<bool>;
String _$expansionNotifierHash() => r'39eb93bc2a86fdff65bc40b969f7be3a206b4caa';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ExpansionNotifier extends BuildlessAutoDisposeNotifier<bool> {
  late final String id;

  bool build(
    String id,
  );
}

/// See also [ExpansionNotifier].
@ProviderFor(ExpansionNotifier)
const expansionNotifierProvider = ExpansionNotifierFamily();

/// See also [ExpansionNotifier].
class ExpansionNotifierFamily extends Family<bool> {
  /// See also [ExpansionNotifier].
  const ExpansionNotifierFamily();

  /// See also [ExpansionNotifier].
  ExpansionNotifierProvider call(
    String id,
  ) {
    return ExpansionNotifierProvider(
      id,
    );
  }

  @override
  ExpansionNotifierProvider getProviderOverride(
    covariant ExpansionNotifierProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'expansionNotifierProvider';
}

/// See also [ExpansionNotifier].
class ExpansionNotifierProvider
    extends AutoDisposeNotifierProviderImpl<ExpansionNotifier, bool> {
  /// See also [ExpansionNotifier].
  ExpansionNotifierProvider(
    String id,
  ) : this._internal(
          () => ExpansionNotifier()..id = id,
          from: expansionNotifierProvider,
          name: r'expansionNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$expansionNotifierHash,
          dependencies: ExpansionNotifierFamily._dependencies,
          allTransitiveDependencies:
              ExpansionNotifierFamily._allTransitiveDependencies,
          id: id,
        );

  ExpansionNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  bool runNotifierBuild(
    covariant ExpansionNotifier notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(ExpansionNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ExpansionNotifierProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ExpansionNotifier, bool> createElement() {
    return _ExpansionNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ExpansionNotifierProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ExpansionNotifierRef on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ExpansionNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<ExpansionNotifier, bool>
    with ExpansionNotifierRef {
  _ExpansionNotifierProviderElement(super.provider);

  @override
  String get id => (origin as ExpansionNotifierProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
