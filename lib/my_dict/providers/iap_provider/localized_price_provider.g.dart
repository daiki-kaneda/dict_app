// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localized_price_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$localizedPriceHash() => r'2f0fe226087140dc68f28b61e3c379d88818c7ee';

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
    String productId,
  ) {
    return LocalizedPriceProvider(
      productId,
    );
  }

  @override
  LocalizedPriceProvider getProviderOverride(
    covariant LocalizedPriceProvider provider,
  ) {
    return call(
      provider.productId,
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
    String productId,
  ) : this._internal(
          (ref) => localizedPrice(
            ref as LocalizedPriceRef,
            productId,
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
          productId: productId,
        );

  LocalizedPriceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.productId,
  }) : super.internal();

  final String productId;

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
        productId: productId,
      ),
    );
  }

  @override
  FutureProviderElement<String?> createElement() {
    return _LocalizedPriceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LocalizedPriceProvider && other.productId == productId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, productId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LocalizedPriceRef on FutureProviderRef<String?> {
  /// The parameter `productId` of this provider.
  String get productId;
}

class _LocalizedPriceProviderElement extends FutureProviderElement<String?>
    with LocalizedPriceRef {
  _LocalizedPriceProviderElement(super.provider);

  @override
  String get productId => (origin as LocalizedPriceProvider).productId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
