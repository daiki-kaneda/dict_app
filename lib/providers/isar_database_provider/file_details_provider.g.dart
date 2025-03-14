// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_details_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sentencePageControllerHash() =>
    r'53bc6df170074d6a8a1b07c7516a69761a1f29c0';

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

abstract class _$SentencePageController
    extends BuildlessAutoDisposeNotifier<PageController> {
  late final int fileId;

  PageController build(
    int fileId,
  );
}

/// See also [SentencePageController].
@ProviderFor(SentencePageController)
const sentencePageControllerProvider = SentencePageControllerFamily();

/// See also [SentencePageController].
class SentencePageControllerFamily extends Family<PageController> {
  /// See also [SentencePageController].
  const SentencePageControllerFamily();

  /// See also [SentencePageController].
  SentencePageControllerProvider call(
    int fileId,
  ) {
    return SentencePageControllerProvider(
      fileId,
    );
  }

  @override
  SentencePageControllerProvider getProviderOverride(
    covariant SentencePageControllerProvider provider,
  ) {
    return call(
      provider.fileId,
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
  String? get name => r'sentencePageControllerProvider';
}

/// See also [SentencePageController].
class SentencePageControllerProvider extends AutoDisposeNotifierProviderImpl<
    SentencePageController, PageController> {
  /// See also [SentencePageController].
  SentencePageControllerProvider(
    int fileId,
  ) : this._internal(
          () => SentencePageController()..fileId = fileId,
          from: sentencePageControllerProvider,
          name: r'sentencePageControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sentencePageControllerHash,
          dependencies: SentencePageControllerFamily._dependencies,
          allTransitiveDependencies:
              SentencePageControllerFamily._allTransitiveDependencies,
          fileId: fileId,
        );

  SentencePageControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.fileId,
  }) : super.internal();

  final int fileId;

  @override
  PageController runNotifierBuild(
    covariant SentencePageController notifier,
  ) {
    return notifier.build(
      fileId,
    );
  }

  @override
  Override overrideWith(SentencePageController Function() create) {
    return ProviderOverride(
      origin: this,
      override: SentencePageControllerProvider._internal(
        () => create()..fileId = fileId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        fileId: fileId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<SentencePageController, PageController>
      createElement() {
    return _SentencePageControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SentencePageControllerProvider && other.fileId == fileId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fileId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SentencePageControllerRef
    on AutoDisposeNotifierProviderRef<PageController> {
  /// The parameter `fileId` of this provider.
  int get fileId;
}

class _SentencePageControllerProviderElement
    extends AutoDisposeNotifierProviderElement<SentencePageController,
        PageController> with SentencePageControllerRef {
  _SentencePageControllerProviderElement(super.provider);

  @override
  int get fileId => (origin as SentencePageControllerProvider).fileId;
}

String _$currentSentenceIndexInAllSentencesHash() =>
    r'bc1732b33dbe6266fba2a4cfd2e0d77c117918b9';

abstract class _$CurrentSentenceIndexInAllSentences
    extends BuildlessAutoDisposeNotifier<int> {
  late final int fileId;

  int build(
    int fileId,
  );
}

/// See also [CurrentSentenceIndexInAllSentences].
@ProviderFor(CurrentSentenceIndexInAllSentences)
const currentSentenceIndexInAllSentencesProvider =
    CurrentSentenceIndexInAllSentencesFamily();

/// See also [CurrentSentenceIndexInAllSentences].
class CurrentSentenceIndexInAllSentencesFamily extends Family<int> {
  /// See also [CurrentSentenceIndexInAllSentences].
  const CurrentSentenceIndexInAllSentencesFamily();

  /// See also [CurrentSentenceIndexInAllSentences].
  CurrentSentenceIndexInAllSentencesProvider call(
    int fileId,
  ) {
    return CurrentSentenceIndexInAllSentencesProvider(
      fileId,
    );
  }

  @override
  CurrentSentenceIndexInAllSentencesProvider getProviderOverride(
    covariant CurrentSentenceIndexInAllSentencesProvider provider,
  ) {
    return call(
      provider.fileId,
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
  String? get name => r'currentSentenceIndexInAllSentencesProvider';
}

/// See also [CurrentSentenceIndexInAllSentences].
class CurrentSentenceIndexInAllSentencesProvider
    extends AutoDisposeNotifierProviderImpl<CurrentSentenceIndexInAllSentences,
        int> {
  /// See also [CurrentSentenceIndexInAllSentences].
  CurrentSentenceIndexInAllSentencesProvider(
    int fileId,
  ) : this._internal(
          () => CurrentSentenceIndexInAllSentences()..fileId = fileId,
          from: currentSentenceIndexInAllSentencesProvider,
          name: r'currentSentenceIndexInAllSentencesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$currentSentenceIndexInAllSentencesHash,
          dependencies: CurrentSentenceIndexInAllSentencesFamily._dependencies,
          allTransitiveDependencies: CurrentSentenceIndexInAllSentencesFamily
              ._allTransitiveDependencies,
          fileId: fileId,
        );

  CurrentSentenceIndexInAllSentencesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.fileId,
  }) : super.internal();

  final int fileId;

  @override
  int runNotifierBuild(
    covariant CurrentSentenceIndexInAllSentences notifier,
  ) {
    return notifier.build(
      fileId,
    );
  }

  @override
  Override overrideWith(CurrentSentenceIndexInAllSentences Function() create) {
    return ProviderOverride(
      origin: this,
      override: CurrentSentenceIndexInAllSentencesProvider._internal(
        () => create()..fileId = fileId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        fileId: fileId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CurrentSentenceIndexInAllSentences, int>
      createElement() {
    return _CurrentSentenceIndexInAllSentencesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CurrentSentenceIndexInAllSentencesProvider &&
        other.fileId == fileId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fileId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CurrentSentenceIndexInAllSentencesRef
    on AutoDisposeNotifierProviderRef<int> {
  /// The parameter `fileId` of this provider.
  int get fileId;
}

class _CurrentSentenceIndexInAllSentencesProviderElement
    extends AutoDisposeNotifierProviderElement<
        CurrentSentenceIndexInAllSentences,
        int> with CurrentSentenceIndexInAllSentencesRef {
  _CurrentSentenceIndexInAllSentencesProviderElement(super.provider);

  @override
  int get fileId =>
      (origin as CurrentSentenceIndexInAllSentencesProvider).fileId;
}

String _$currentWordIndexHash() => r'39bfd2e4b3e230693c168c82fd70f021121471fe';

abstract class _$CurrentWordIndex extends BuildlessAutoDisposeNotifier<int> {
  late final int fileId;

  int build(
    int fileId,
  );
}

/// See also [CurrentWordIndex].
@ProviderFor(CurrentWordIndex)
const currentWordIndexProvider = CurrentWordIndexFamily();

/// See also [CurrentWordIndex].
class CurrentWordIndexFamily extends Family<int> {
  /// See also [CurrentWordIndex].
  const CurrentWordIndexFamily();

  /// See also [CurrentWordIndex].
  CurrentWordIndexProvider call(
    int fileId,
  ) {
    return CurrentWordIndexProvider(
      fileId,
    );
  }

  @override
  CurrentWordIndexProvider getProviderOverride(
    covariant CurrentWordIndexProvider provider,
  ) {
    return call(
      provider.fileId,
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
  String? get name => r'currentWordIndexProvider';
}

/// See also [CurrentWordIndex].
class CurrentWordIndexProvider
    extends AutoDisposeNotifierProviderImpl<CurrentWordIndex, int> {
  /// See also [CurrentWordIndex].
  CurrentWordIndexProvider(
    int fileId,
  ) : this._internal(
          () => CurrentWordIndex()..fileId = fileId,
          from: currentWordIndexProvider,
          name: r'currentWordIndexProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$currentWordIndexHash,
          dependencies: CurrentWordIndexFamily._dependencies,
          allTransitiveDependencies:
              CurrentWordIndexFamily._allTransitiveDependencies,
          fileId: fileId,
        );

  CurrentWordIndexProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.fileId,
  }) : super.internal();

  final int fileId;

  @override
  int runNotifierBuild(
    covariant CurrentWordIndex notifier,
  ) {
    return notifier.build(
      fileId,
    );
  }

  @override
  Override overrideWith(CurrentWordIndex Function() create) {
    return ProviderOverride(
      origin: this,
      override: CurrentWordIndexProvider._internal(
        () => create()..fileId = fileId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        fileId: fileId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CurrentWordIndex, int> createElement() {
    return _CurrentWordIndexProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CurrentWordIndexProvider && other.fileId == fileId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fileId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CurrentWordIndexRef on AutoDisposeNotifierProviderRef<int> {
  /// The parameter `fileId` of this provider.
  int get fileId;
}

class _CurrentWordIndexProviderElement
    extends AutoDisposeNotifierProviderElement<CurrentWordIndex, int>
    with CurrentWordIndexRef {
  _CurrentWordIndexProviderElement(super.provider);

  @override
  int get fileId => (origin as CurrentWordIndexProvider).fileId;
}

String _$currentSentenceIndexHash() =>
    r'e81d6504ce4fc2c99fb2a562538ce388b850061d';

abstract class _$CurrentSentenceIndex
    extends BuildlessAutoDisposeNotifier<int> {
  late final int fileId;

  int build(
    int fileId,
  );
}

/// See also [CurrentSentenceIndex].
@ProviderFor(CurrentSentenceIndex)
const currentSentenceIndexProvider = CurrentSentenceIndexFamily();

/// See also [CurrentSentenceIndex].
class CurrentSentenceIndexFamily extends Family<int> {
  /// See also [CurrentSentenceIndex].
  const CurrentSentenceIndexFamily();

  /// See also [CurrentSentenceIndex].
  CurrentSentenceIndexProvider call(
    int fileId,
  ) {
    return CurrentSentenceIndexProvider(
      fileId,
    );
  }

  @override
  CurrentSentenceIndexProvider getProviderOverride(
    covariant CurrentSentenceIndexProvider provider,
  ) {
    return call(
      provider.fileId,
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
  String? get name => r'currentSentenceIndexProvider';
}

/// See also [CurrentSentenceIndex].
class CurrentSentenceIndexProvider
    extends AutoDisposeNotifierProviderImpl<CurrentSentenceIndex, int> {
  /// See also [CurrentSentenceIndex].
  CurrentSentenceIndexProvider(
    int fileId,
  ) : this._internal(
          () => CurrentSentenceIndex()..fileId = fileId,
          from: currentSentenceIndexProvider,
          name: r'currentSentenceIndexProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$currentSentenceIndexHash,
          dependencies: CurrentSentenceIndexFamily._dependencies,
          allTransitiveDependencies:
              CurrentSentenceIndexFamily._allTransitiveDependencies,
          fileId: fileId,
        );

  CurrentSentenceIndexProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.fileId,
  }) : super.internal();

  final int fileId;

  @override
  int runNotifierBuild(
    covariant CurrentSentenceIndex notifier,
  ) {
    return notifier.build(
      fileId,
    );
  }

  @override
  Override overrideWith(CurrentSentenceIndex Function() create) {
    return ProviderOverride(
      origin: this,
      override: CurrentSentenceIndexProvider._internal(
        () => create()..fileId = fileId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        fileId: fileId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CurrentSentenceIndex, int>
      createElement() {
    return _CurrentSentenceIndexProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CurrentSentenceIndexProvider && other.fileId == fileId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fileId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CurrentSentenceIndexRef on AutoDisposeNotifierProviderRef<int> {
  /// The parameter `fileId` of this provider.
  int get fileId;
}

class _CurrentSentenceIndexProviderElement
    extends AutoDisposeNotifierProviderElement<CurrentSentenceIndex, int>
    with CurrentSentenceIndexRef {
  _CurrentSentenceIndexProviderElement(super.provider);

  @override
  int get fileId => (origin as CurrentSentenceIndexProvider).fileId;
}

String _$currentParagraphIndexHash() =>
    r'a71b003f8bca769a307f34d40b3d97047b9dde6b';

abstract class _$CurrentParagraphIndex
    extends BuildlessAutoDisposeNotifier<int> {
  late final int fileId;

  int build(
    int fileId,
  );
}

/// See also [CurrentParagraphIndex].
@ProviderFor(CurrentParagraphIndex)
const currentParagraphIndexProvider = CurrentParagraphIndexFamily();

/// See also [CurrentParagraphIndex].
class CurrentParagraphIndexFamily extends Family<int> {
  /// See also [CurrentParagraphIndex].
  const CurrentParagraphIndexFamily();

  /// See also [CurrentParagraphIndex].
  CurrentParagraphIndexProvider call(
    int fileId,
  ) {
    return CurrentParagraphIndexProvider(
      fileId,
    );
  }

  @override
  CurrentParagraphIndexProvider getProviderOverride(
    covariant CurrentParagraphIndexProvider provider,
  ) {
    return call(
      provider.fileId,
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
  String? get name => r'currentParagraphIndexProvider';
}

/// See also [CurrentParagraphIndex].
class CurrentParagraphIndexProvider
    extends AutoDisposeNotifierProviderImpl<CurrentParagraphIndex, int> {
  /// See also [CurrentParagraphIndex].
  CurrentParagraphIndexProvider(
    int fileId,
  ) : this._internal(
          () => CurrentParagraphIndex()..fileId = fileId,
          from: currentParagraphIndexProvider,
          name: r'currentParagraphIndexProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$currentParagraphIndexHash,
          dependencies: CurrentParagraphIndexFamily._dependencies,
          allTransitiveDependencies:
              CurrentParagraphIndexFamily._allTransitiveDependencies,
          fileId: fileId,
        );

  CurrentParagraphIndexProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.fileId,
  }) : super.internal();

  final int fileId;

  @override
  int runNotifierBuild(
    covariant CurrentParagraphIndex notifier,
  ) {
    return notifier.build(
      fileId,
    );
  }

  @override
  Override overrideWith(CurrentParagraphIndex Function() create) {
    return ProviderOverride(
      origin: this,
      override: CurrentParagraphIndexProvider._internal(
        () => create()..fileId = fileId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        fileId: fileId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CurrentParagraphIndex, int>
      createElement() {
    return _CurrentParagraphIndexProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CurrentParagraphIndexProvider && other.fileId == fileId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fileId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CurrentParagraphIndexRef on AutoDisposeNotifierProviderRef<int> {
  /// The parameter `fileId` of this provider.
  int get fileId;
}

class _CurrentParagraphIndexProviderElement
    extends AutoDisposeNotifierProviderElement<CurrentParagraphIndex, int>
    with CurrentParagraphIndexRef {
  _CurrentParagraphIndexProviderElement(super.provider);

  @override
  int get fileId => (origin as CurrentParagraphIndexProvider).fileId;
}

String _$typedTextNotifierHash() => r'9966afc86933025bb3659fc5b74cc87f165de3e0';

abstract class _$TypedTextNotifier
    extends BuildlessAutoDisposeStreamNotifier<String> {
  late final int fileId;

  Stream<String> build(
    int fileId,
  );
}

/// See also [TypedTextNotifier].
@ProviderFor(TypedTextNotifier)
const typedTextNotifierProvider = TypedTextNotifierFamily();

/// See also [TypedTextNotifier].
class TypedTextNotifierFamily extends Family<AsyncValue<String>> {
  /// See also [TypedTextNotifier].
  const TypedTextNotifierFamily();

  /// See also [TypedTextNotifier].
  TypedTextNotifierProvider call(
    int fileId,
  ) {
    return TypedTextNotifierProvider(
      fileId,
    );
  }

  @override
  TypedTextNotifierProvider getProviderOverride(
    covariant TypedTextNotifierProvider provider,
  ) {
    return call(
      provider.fileId,
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
  String? get name => r'typedTextNotifierProvider';
}

/// See also [TypedTextNotifier].
class TypedTextNotifierProvider
    extends AutoDisposeStreamNotifierProviderImpl<TypedTextNotifier, String> {
  /// See also [TypedTextNotifier].
  TypedTextNotifierProvider(
    int fileId,
  ) : this._internal(
          () => TypedTextNotifier()..fileId = fileId,
          from: typedTextNotifierProvider,
          name: r'typedTextNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$typedTextNotifierHash,
          dependencies: TypedTextNotifierFamily._dependencies,
          allTransitiveDependencies:
              TypedTextNotifierFamily._allTransitiveDependencies,
          fileId: fileId,
        );

  TypedTextNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.fileId,
  }) : super.internal();

  final int fileId;

  @override
  Stream<String> runNotifierBuild(
    covariant TypedTextNotifier notifier,
  ) {
    return notifier.build(
      fileId,
    );
  }

  @override
  Override overrideWith(TypedTextNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: TypedTextNotifierProvider._internal(
        () => create()..fileId = fileId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        fileId: fileId,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<TypedTextNotifier, String>
      createElement() {
    return _TypedTextNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TypedTextNotifierProvider && other.fileId == fileId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fileId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TypedTextNotifierRef on AutoDisposeStreamNotifierProviderRef<String> {
  /// The parameter `fileId` of this provider.
  int get fileId;
}

class _TypedTextNotifierProviderElement
    extends AutoDisposeStreamNotifierProviderElement<TypedTextNotifier, String>
    with TypedTextNotifierRef {
  _TypedTextNotifierProviderElement(super.provider);

  @override
  int get fileId => (origin as TypedTextNotifierProvider).fileId;
}

String _$currentTabIndexHash() => r'273ad7f6e402e1baa8246dc8449a3f48eb8f95a3';

/// See also [CurrentTabIndex].
@ProviderFor(CurrentTabIndex)
final currentTabIndexProvider =
    AutoDisposeNotifierProvider<CurrentTabIndex, int>.internal(
  CurrentTabIndex.new,
  name: r'currentTabIndexProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentTabIndexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentTabIndex = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
