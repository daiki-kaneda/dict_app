// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localized_price_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$localizedPriceHash() => r'7d8f82db9199d716cf700acb793a399993fd7352';

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

/// See also [localizedPrice].
@ProviderFor(localizedPrice)
const localizedPriceProvider = LocalizedPriceFamily();

/// See also [localizedPrice].
class LocalizedPriceFamily extends Family<AsyncValue<String?>> {
  /// See also [localizedPrice].
  const LocalizedPriceFamily();

  /// See also [localizedPrice].
  LocalizedPriceProvider call(
    ProductStatus status,
  ) {
    return LocalizedPriceProvider(
      status,
    );
  }

  @override
  LocalizedPriceProvider getProviderOverride(
    covariant LocalizedPriceProvider provider,
  ) {
    return call(
      provider.status,
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
  String? get name => r'localizedPriceProvider';
}

/// See also [localizedPrice].
class LocalizedPriceProvider extends FutureProvider<String?> {
  /// See also [localizedPrice].
  LocalizedPriceProvider(
    ProductStatus status,
  ) : this._internal(
          (ref) => localizedPrice(
            ref as LocalizedPriceRef,
            status,
          ),
          from: localizedPriceProvider,
          name: r'localizedPriceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$localizedPriceHash,
          dependencies: LocalizedPriceFamily._dependencies,
          allTransitiveDependencies:
              LocalizedPriceFamily._allTransitiveDependencies,
          status: status,
        );

  LocalizedPriceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.status,
  }) : super.internal();

  final ProductStatus status;

  @override
  Override overrideWith(
    FutureOr<String?> Function(LocalizedPriceRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LocalizedPriceProvider._internal(
        (ref) => create(ref as LocalizedPriceRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        status: status,
      ),
    );
  }

  @override
  FutureProviderElement<String?> createElement() {
    return _LocalizedPriceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LocalizedPriceProvider && other.status == status;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, status.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LocalizedPriceRef on FutureProviderRef<String?> {
  /// The parameter `status` of this provider.
  ProductStatus get status;
}

class _LocalizedPriceProviderElement extends FutureProviderElement<String?>
    with LocalizedPriceRef {
  _LocalizedPriceProviderElement(super.provider);

  @override
  ProductStatus get status => (origin as LocalizedPriceProvider).status;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
