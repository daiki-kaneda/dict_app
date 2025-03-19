// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_instruction_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$systemInstructionHash() => r'487ebbfaabbad4f22319632cde07f04f1c14873b';

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

abstract class _$SystemInstruction
    extends BuildlessAutoDisposeAsyncNotifier<String> {
  late final LLMRole role;

  FutureOr<String> build({
    required LLMRole role,
  });
}

/// See also [SystemInstruction].
@ProviderFor(SystemInstruction)
const systemInstructionProvider = SystemInstructionFamily();

/// See also [SystemInstruction].
class SystemInstructionFamily extends Family<AsyncValue<String>> {
  /// See also [SystemInstruction].
  const SystemInstructionFamily();

  /// See also [SystemInstruction].
  SystemInstructionProvider call({
    required LLMRole role,
  }) {
    return SystemInstructionProvider(
      role: role,
    );
  }

  @override
  SystemInstructionProvider getProviderOverride(
    covariant SystemInstructionProvider provider,
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
  String? get name => r'systemInstructionProvider';
}

/// See also [SystemInstruction].
class SystemInstructionProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SystemInstruction, String> {
  /// See also [SystemInstruction].
  SystemInstructionProvider({
    required LLMRole role,
  }) : this._internal(
          () => SystemInstruction()..role = role,
          from: systemInstructionProvider,
          name: r'systemInstructionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$systemInstructionHash,
          dependencies: SystemInstructionFamily._dependencies,
          allTransitiveDependencies:
              SystemInstructionFamily._allTransitiveDependencies,
          role: role,
        );

  SystemInstructionProvider._internal(
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
  FutureOr<String> runNotifierBuild(
    covariant SystemInstruction notifier,
  ) {
    return notifier.build(
      role: role,
    );
  }

  @override
  Override overrideWith(SystemInstruction Function() create) {
    return ProviderOverride(
      origin: this,
      override: SystemInstructionProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<SystemInstruction, String>
      createElement() {
    return _SystemInstructionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SystemInstructionProvider && other.role == role;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, role.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SystemInstructionRef on AutoDisposeAsyncNotifierProviderRef<String> {
  /// The parameter `role` of this provider.
  LLMRole get role;
}

class _SystemInstructionProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SystemInstruction, String>
    with SystemInstructionRef {
  _SystemInstructionProviderElement(super.provider);

  @override
  LLMRole get role => (origin as SystemInstructionProvider).role;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
