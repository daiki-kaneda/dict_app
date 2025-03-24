// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_expansion_tile.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$expansionNotifierHash() => r'b4c57c683bedb4e59eadb8fdd7f9804f44885bf7';

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
