// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$modelNotifierHash() => r'8f802205898601775ad8bc2a90f3dc5409f9ac74';

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

abstract class _$ModelNotifier
    extends BuildlessAutoDisposeAsyncNotifier<ModelRepository> {
  late final LLMRole role;

  FutureOr<ModelRepository> build({
    required LLMRole role,
  });
}

/// See also [ModelNotifier].
@ProviderFor(ModelNotifier)
const modelNotifierProvider = ModelNotifierFamily();

/// See also [ModelNotifier].
class ModelNotifierFamily extends Family<AsyncValue<ModelRepository>> {
  /// See also [ModelNotifier].
  const ModelNotifierFamily();

  /// See also [ModelNotifier].
  ModelNotifierProvider call({
    required LLMRole role,
  }) {
    return ModelNotifierProvider(
      role: role,
    );
  }

  @override
  ModelNotifierProvider getProviderOverride(
    covariant ModelNotifierProvider provider,
  ) {
    return call(
      role: provider.role,
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
  String? get name => r'modelNotifierProvider';
}

/// See also [ModelNotifier].
class ModelNotifierProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ModelNotifier, ModelRepository> {
  /// See also [ModelNotifier].
  ModelNotifierProvider({
    required LLMRole role,
  }) : this._internal(
          () => ModelNotifier()..role = role,
          from: modelNotifierProvider,
          name: r'modelNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$modelNotifierHash,
          dependencies: ModelNotifierFamily._dependencies,
          allTransitiveDependencies:
              ModelNotifierFamily._allTransitiveDependencies,
          role: role,
        );

  ModelNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.role,
  }) : super.internal();

  final LLMRole role;

  @override
  FutureOr<ModelRepository> runNotifierBuild(
    covariant ModelNotifier notifier,
  ) {
    return notifier.build(
      role: role,
    );
  }

  @override
  Override overrideWith(ModelNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ModelNotifierProvider._internal(
        () => create()..role = role,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        role: role,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ModelNotifier, ModelRepository>
      createElement() {
    return _ModelNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ModelNotifierProvider && other.role == role;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, role.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ModelNotifierRef on AutoDisposeAsyncNotifierProviderRef<ModelRepository> {
  /// The parameter `role` of this provider.
  LLMRole get role;
}

class _ModelNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ModelNotifier,
        ModelRepository> with ModelNotifierRef {
  _ModelNotifierProviderElement(super.provider);

  @override
  LLMRole get role => (origin as ModelNotifierProvider).role;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
