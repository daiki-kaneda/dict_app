// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_items_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$subItemsProviderHash() => r'9e96b4e9ce32f0d8cb77203f28308364a67237c5';

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

abstract class _$SubItemsProvider
    extends BuildlessAutoDisposeAsyncNotifier<List<Item>> {
  late final int? parentId;

  FutureOr<List<Item>> build(
    int? parentId,
  );
}

/// See also [SubItemsProvider].
@ProviderFor(SubItemsProvider)
const subItemsProviderProvider = SubItemsProviderFamily();

/// See also [SubItemsProvider].
class SubItemsProviderFamily extends Family<AsyncValue<List<Item>>> {
  /// See also [SubItemsProvider].
  const SubItemsProviderFamily();

  /// See also [SubItemsProvider].
  SubItemsProviderProvider call(
    int? parentId,
  ) {
    return SubItemsProviderProvider(
      parentId,
    );
  }

  @override
  SubItemsProviderProvider getProviderOverride(
    covariant SubItemsProviderProvider provider,
  ) {
    return call(
      provider.parentId,
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
  String? get name => r'subItemsProviderProvider';
}

/// See also [SubItemsProvider].
class SubItemsProviderProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SubItemsProvider, List<Item>> {
  /// See also [SubItemsProvider].
  SubItemsProviderProvider(
    int? parentId,
  ) : this._internal(
          () => SubItemsProvider()..parentId = parentId,
          from: subItemsProviderProvider,
          name: r'subItemsProviderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$subItemsProviderHash,
          dependencies: SubItemsProviderFamily._dependencies,
          allTransitiveDependencies:
              SubItemsProviderFamily._allTransitiveDependencies,
          parentId: parentId,
        );

  SubItemsProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parentId,
  }) : super.internal();

  final int? parentId;

  @override
  FutureOr<List<Item>> runNotifierBuild(
    covariant SubItemsProvider notifier,
  ) {
    return notifier.build(
      parentId,
    );
  }

  @override
  Override overrideWith(SubItemsProvider Function() create) {
    return ProviderOverride(
      origin: this,
      override: SubItemsProviderProvider._internal(
        () => create()..parentId = parentId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        parentId: parentId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<SubItemsProvider, List<Item>>
      createElement() {
    return _SubItemsProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SubItemsProviderProvider && other.parentId == parentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, parentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SubItemsProviderRef on AutoDisposeAsyncNotifierProviderRef<List<Item>> {
  /// The parameter `parentId` of this provider.
  int? get parentId;
}

class _SubItemsProviderProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SubItemsProvider,
        List<Item>> with SubItemsProviderRef {
  _SubItemsProviderProviderElement(super.provider);

  @override
  int? get parentId => (origin as SubItemsProviderProvider).parentId;
}

String _$inSessionHash() => r'0095784059bb09ee411462e8be545dfa8f5280e9';

/// See also [InSession].
@ProviderFor(InSession)
final inSessionProvider = NotifierProvider<InSession, bool>.internal(
  InSession.new,
  name: r'inSessionProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$inSessionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$InSession = Notifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
