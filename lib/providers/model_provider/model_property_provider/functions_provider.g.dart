// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'functions_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$functionsHash() => r'58b2af4fc819f6ffa920449581fc79860c25584e';

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

/// See also [functions].
@ProviderFor(functions)
const functionsProvider = FunctionsFamily();

/// See also [functions].
class FunctionsFamily extends Family<
    ({
      List<String> names,
      Map<String, Function> functions,
      List<FunctionDeclaration> declartions
    })> {
  /// See also [functions].
  const FunctionsFamily();

  /// See also [functions].
  FunctionsProvider call({
    required LLMRole role,
  }) {
    return FunctionsProvider(
      role: role,
    );
  }

  @override
  FunctionsProvider getProviderOverride(
    covariant FunctionsProvider provider,
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
  String? get name => r'functionsProvider';
}

/// See also [functions].
class FunctionsProvider extends AutoDisposeProvider<
    ({
      List<String> names,
      Map<String, Function> functions,
      List<FunctionDeclaration> declartions
    })> {
  /// See also [functions].
  FunctionsProvider({
    required LLMRole role,
  }) : this._internal(
          (ref) => functions(
            ref as FunctionsRef,
            role: role,
          ),
          from: functionsProvider,
          name: r'functionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$functionsHash,
          dependencies: FunctionsFamily._dependencies,
          allTransitiveDependencies: FunctionsFamily._allTransitiveDependencies,
          role: role,
        );

  FunctionsProvider._internal(
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
  Override overrideWith(
    ({
      List<String> names,
      Map<String, Function> functions,
      List<FunctionDeclaration> declartions
    })
            Function(FunctionsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FunctionsProvider._internal(
        (ref) => create(ref as FunctionsRef),
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
  AutoDisposeProviderElement<
      ({
        List<String> names,
        Map<String, Function> functions,
        List<FunctionDeclaration> declartions
      })> createElement() {
    return _FunctionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FunctionsProvider && other.role == role;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, role.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FunctionsRef on AutoDisposeProviderRef<
    ({
      List<String> names,
      Map<String, Function> functions,
      List<FunctionDeclaration> declartions
    })> {
  /// The parameter `role` of this provider.
  LLMRole get role;
}

class _FunctionsProviderElement extends AutoDisposeProviderElement<
    ({
      List<String> names,
      Map<String, Function> functions,
      List<FunctionDeclaration> declartions
    })> with FunctionsRef {
  _FunctionsProviderElement(super.provider);

  @override
  LLMRole get role => (origin as FunctionsProvider).role;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
