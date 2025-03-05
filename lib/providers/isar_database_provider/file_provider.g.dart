// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fileHash() => r'a055d321d9ee121ed8ae6b82c522311d6ff5732d';

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

/// See also [file].
@ProviderFor(file)
const fileProvider = FileFamily();

/// See also [file].
class FileFamily extends Family<File?> {
  /// See also [file].
  const FileFamily();

  /// See also [file].
  FileProvider call(
    int id,
  ) {
    return FileProvider(
      id,
    );
  }

  @override
  FileProvider getProviderOverride(
    covariant FileProvider provider,
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
  String? get name => r'fileProvider';
}

/// See also [file].
class FileProvider extends AutoDisposeProvider<File?> {
  /// See also [file].
  FileProvider(
    int id,
  ) : this._internal(
          (ref) => file(
            ref as FileRef,
            id,
          ),
          from: fileProvider,
          name: r'fileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$fileHash,
          dependencies: FileFamily._dependencies,
          allTransitiveDependencies: FileFamily._allTransitiveDependencies,
          id: id,
        );

  FileProvider._internal(
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
  Override overrideWith(
    File? Function(FileRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FileProvider._internal(
        (ref) => create(ref as FileRef),
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
  AutoDisposeProviderElement<File?> createElement() {
    return _FileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FileProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FileRef on AutoDisposeProviderRef<File?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _FileProviderElement extends AutoDisposeProviderElement<File?>
    with FileRef {
  _FileProviderElement(super.provider);

  @override
  int get id => (origin as FileProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
