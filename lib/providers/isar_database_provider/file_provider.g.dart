// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fileNotifierHash() => r'5021d71e3158b6a3ed58dfe3347ece88d4340964';

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

abstract class _$FileNotifier extends BuildlessAutoDisposeNotifier<File?> {
  late final int id;

  File? build(
    int id,
  );
}

/// See also [FileNotifier].
@ProviderFor(FileNotifier)
const fileNotifierProvider = FileNotifierFamily();

/// See also [FileNotifier].
class FileNotifierFamily extends Family<File?> {
  /// See also [FileNotifier].
  const FileNotifierFamily();

  /// See also [FileNotifier].
  FileNotifierProvider call(
    int id,
  ) {
    return FileNotifierProvider(
      id,
    );
  }

  @override
  FileNotifierProvider getProviderOverride(
    covariant FileNotifierProvider provider,
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
  String? get name => r'fileNotifierProvider';
}

/// See also [FileNotifier].
class FileNotifierProvider
    extends AutoDisposeNotifierProviderImpl<FileNotifier, File?> {
  /// See also [FileNotifier].
  FileNotifierProvider(
    int id,
  ) : this._internal(
          () => FileNotifier()..id = id,
          from: fileNotifierProvider,
          name: r'fileNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fileNotifierHash,
          dependencies: FileNotifierFamily._dependencies,
          allTransitiveDependencies:
              FileNotifierFamily._allTransitiveDependencies,
          id: id,
        );

  FileNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  File? runNotifierBuild(
    covariant FileNotifier notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(FileNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: FileNotifierProvider._internal(
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
  AutoDisposeNotifierProviderElement<FileNotifier, File?> createElement() {
    return _FileNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FileNotifierProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FileNotifierRef on AutoDisposeNotifierProviderRef<File?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _FileNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<FileNotifier, File?>
    with FileNotifierRef {
  _FileNotifierProviderElement(super.provider);

  @override
  int get id => (origin as FileNotifierProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
