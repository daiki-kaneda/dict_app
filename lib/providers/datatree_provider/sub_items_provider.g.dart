// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_items_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$subItemsProviderHash() => r'eb3b181486c53e9ac1aec2ed200d4e6953e84e3a';

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

String _$inSessionHash() => r'710e58ac0db8a246114e99a039ecfcbc9fbf1fae';

abstract class _$InSession extends BuildlessNotifier<bool> {
  late final SessionStatus status;

  bool build({
    SessionStatus status = SessionStatus.createNewFile,
  });
}

/// See also [InSession].
@ProviderFor(InSession)
const inSessionProvider = InSessionFamily();

/// See also [InSession].
class InSessionFamily extends Family<bool> {
  /// See also [InSession].
  const InSessionFamily();

  /// See also [InSession].
  InSessionProvider call({
    SessionStatus status = SessionStatus.createNewFile,
  }) {
    return InSessionProvider(
      status: status,
    );
  }

  @override
  InSessionProvider getProviderOverride(
    covariant InSessionProvider provider,
  ) {
    return call(
      status: provider.status,
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
  String? get name => r'inSessionProvider';
}

/// See also [InSession].
class InSessionProvider extends NotifierProviderImpl<InSession, bool> {
  /// See also [InSession].
  InSessionProvider({
    SessionStatus status = SessionStatus.createNewFile,
  }) : this._internal(
          () => InSession()..status = status,
          from: inSessionProvider,
          name: r'inSessionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$inSessionHash,
          dependencies: InSessionFamily._dependencies,
          allTransitiveDependencies: InSessionFamily._allTransitiveDependencies,
          status: status,
        );

  InSessionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.status,
  }) : super.internal();

  final SessionStatus status;

  @override
  bool runNotifierBuild(
    covariant InSession notifier,
  ) {
    return notifier.build(
      status: status,
    );
  }

  @override
  Override overrideWith(InSession Function() create) {
    return ProviderOverride(
      origin: this,
      override: InSessionProvider._internal(
        () => create()..status = status,
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
  NotifierProviderElement<InSession, bool> createElement() {
    return _InSessionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is InSessionProvider && other.status == status;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, status.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin InSessionRef on NotifierProviderRef<bool> {
  /// The parameter `status` of this provider.
  SessionStatus get status;
}

class _InSessionProviderElement extends NotifierProviderElement<InSession, bool>
    with InSessionRef {
  _InSessionProviderElement(super.provider);

  @override
  SessionStatus get status => (origin as InSessionProvider).status;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
