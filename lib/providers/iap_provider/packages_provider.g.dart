// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'packages_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$packagesHash() => r'0af597dcb897d0ae800a7e1872400db3845e34f2';

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

/// See also [packages].
@ProviderFor(packages)
const packagesProvider = PackagesFamily();

/// See also [packages].
class PackagesFamily extends Family<AsyncValue<List<Package>>> {
  /// See also [packages].
  const PackagesFamily();

  /// See also [packages].
  PackagesProvider call(
    String identifier,
  ) {
    return PackagesProvider(
      identifier,
    );
  }

  @override
  PackagesProvider getProviderOverride(
    covariant PackagesProvider provider,
  ) {
    return call(
      provider.identifier,
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
  String? get name => r'packagesProvider';
}

/// See also [packages].
class PackagesProvider extends FutureProvider<List<Package>> {
  /// See also [packages].
  PackagesProvider(
    String identifier,
  ) : this._internal(
          (ref) => packages(
            ref as PackagesRef,
            identifier,
          ),
          from: packagesProvider,
          name: r'packagesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$packagesHash,
          dependencies: PackagesFamily._dependencies,
          allTransitiveDependencies: PackagesFamily._allTransitiveDependencies,
          identifier: identifier,
        );

  PackagesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.identifier,
  }) : super.internal();

  final String identifier;

  @override
  Override overrideWith(
    FutureOr<List<Package>> Function(PackagesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PackagesProvider._internal(
        (ref) => create(ref as PackagesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        identifier: identifier,
      ),
    );
  }

  @override
  FutureProviderElement<List<Package>> createElement() {
    return _PackagesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PackagesProvider && other.identifier == identifier;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, identifier.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PackagesRef on FutureProviderRef<List<Package>> {
  /// The parameter `identifier` of this provider.
  String get identifier;
}

class _PackagesProviderElement extends FutureProviderElement<List<Package>>
    with PackagesRef {
  _PackagesProviderElement(super.provider);

  @override
  String get identifier => (origin as PackagesProvider).identifier;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
