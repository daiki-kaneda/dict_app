// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'utility_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$canPopHash() => r'78b0ff59f979c8957474e6bb8b175138a7f753f2';

/// See also [canPop].
@ProviderFor(canPop)
final canPopProvider = AutoDisposeFutureProvider<bool>.internal(
  canPop,
  name: r'canPopProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$canPopHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CanPopRef = AutoDisposeFutureProviderRef<bool>;
String _$isDictShowingHash() => r'a7a8c73bf2d384a5f12fda665ccde1ee491954f5';

/// See also [isDictShowing].
@ProviderFor(isDictShowing)
final isDictShowingProvider = AutoDisposeFutureProvider<bool>.internal(
  isDictShowing,
  name: r'isDictShowingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isDictShowingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IsDictShowingRef = AutoDisposeFutureProviderRef<bool>;
String _$selectedWordHash() => r'6554c13bcbe2f767d7d1fbe6a73c76a3722fddba';

/// See also [selectedWord].
@ProviderFor(selectedWord)
final selectedWordProvider = AutoDisposeFutureProvider<DictationWord?>.internal(
  selectedWord,
  name: r'selectedWordProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$selectedWordHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SelectedWordRef = AutoDisposeFutureProviderRef<DictationWord?>;
String _$selectedSentenceHash() => r'f64adf549e3d57e60ee4d58375a91e4755b69f7d';

/// See also [selectedSentence].
@ProviderFor(selectedSentence)
final selectedSentenceProvider =
    AutoDisposeFutureProvider<DictationSentence?>.internal(
  selectedSentence,
  name: r'selectedSentenceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedSentenceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SelectedSentenceRef = AutoDisposeFutureProviderRef<DictationSentence?>;
String _$selectedParagraphHash() => r'9d1889e3e762c5f4ba5d641357e6af3f924dabb6';

/// See also [selectedParagraph].
@ProviderFor(selectedParagraph)
final selectedParagraphProvider =
    AutoDisposeFutureProvider<DictationParagraph?>.internal(
  selectedParagraph,
  name: r'selectedParagraphProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedParagraphHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SelectedParagraphRef
    = AutoDisposeFutureProviderRef<DictationParagraph?>;
String _$currentTreeIdNotifierHash() =>
    r'9b903e5903f2d89f1ab64c41a0d13611a264e214';

/// See also [CurrentTreeIdNotifier].
@ProviderFor(CurrentTreeIdNotifier)
final currentTreeIdNotifierProvider =
    AutoDisposeAsyncNotifierProvider<CurrentTreeIdNotifier, String>.internal(
  CurrentTreeIdNotifier.new,
  name: r'currentTreeIdNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentTreeIdNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentTreeIdNotifier = AutoDisposeAsyncNotifier<String>;
String _$isEditingNotifierHash() => r'8ebf90ec89d26e4acbb188ede51822c4597309c0';

/// See also [IsEditingNotifier].
@ProviderFor(IsEditingNotifier)
final isEditingNotifierProvider =
    AutoDisposeNotifierProvider<IsEditingNotifier, bool>.internal(
  IsEditingNotifier.new,
  name: r'isEditingNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isEditingNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$IsEditingNotifier = AutoDisposeNotifier<bool>;
String _$selectedIdsHash() => r'b6edf5eca70d6ea4e364570ec5618d06a7c684eb';

/// See also [SelectedIds].
@ProviderFor(SelectedIds)
final selectedIdsProvider =
    AutoDisposeNotifierProvider<SelectedIds, Set<String>>.internal(
  SelectedIds.new,
  name: r'selectedIdsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$selectedIdsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedIds = AutoDisposeNotifier<Set<String>>;
String _$isSheetShowingHash() => r'7c37bf10739465bcf7630d9c3d131a95f8377595';

/// See also [IsSheetShowing].
@ProviderFor(IsSheetShowing)
final isSheetShowingProvider =
    AutoDisposeNotifierProvider<IsSheetShowing, bool>.internal(
  IsSheetShowing.new,
  name: r'isSheetShowingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isSheetShowingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$IsSheetShowing = AutoDisposeNotifier<bool>;
String _$expansionNotifierHash() => r'b4c57c683bedb4e59eadb8fdd7f9804f44885bf7';

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

abstract class _$ExpansionNotifier extends BuildlessAutoDisposeNotifier<bool> {
  late final String id;

  bool build(
    String id,
  );
}

/// See also [ExpansionNotifier].
@ProviderFor(ExpansionNotifier)
const expansionNotifierProvider = ExpansionNotifierFamily();

/// See also [ExpansionNotifier].
class ExpansionNotifierFamily extends Family<bool> {
  /// See also [ExpansionNotifier].
  const ExpansionNotifierFamily();

  /// See also [ExpansionNotifier].
  ExpansionNotifierProvider call(
    String id,
  ) {
    return ExpansionNotifierProvider(
      id,
    );
  }

  @override
  ExpansionNotifierProvider getProviderOverride(
    covariant ExpansionNotifierProvider provider,
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
  String? get name => r'expansionNotifierProvider';
}

/// See also [ExpansionNotifier].
class ExpansionNotifierProvider
    extends AutoDisposeNotifierProviderImpl<ExpansionNotifier, bool> {
  /// See also [ExpansionNotifier].
  ExpansionNotifierProvider(
    String id,
  ) : this._internal(
          () => ExpansionNotifier()..id = id,
          from: expansionNotifierProvider,
          name: r'expansionNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$expansionNotifierHash,
          dependencies: ExpansionNotifierFamily._dependencies,
          allTransitiveDependencies:
              ExpansionNotifierFamily._allTransitiveDependencies,
          id: id,
        );

  ExpansionNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  bool runNotifierBuild(
    covariant ExpansionNotifier notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(ExpansionNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ExpansionNotifierProvider._internal(
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
  AutoDisposeNotifierProviderElement<ExpansionNotifier, bool> createElement() {
    return _ExpansionNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ExpansionNotifierProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ExpansionNotifierRef on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ExpansionNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<ExpansionNotifier, bool>
    with ExpansionNotifierRef {
  _ExpansionNotifierProviderElement(super.provider);

  @override
  String get id => (origin as ExpansionNotifierProvider).id;
}

String _$paragraphIndexNotifierHash() =>
    r'be70cc068a27e151b6ecdb55eec1e7c7e879a21b';

/// See also [ParagraphIndexNotifier].
@ProviderFor(ParagraphIndexNotifier)
final paragraphIndexNotifierProvider =
    AutoDisposeNotifierProvider<ParagraphIndexNotifier, int>.internal(
  ParagraphIndexNotifier.new,
  name: r'paragraphIndexNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$paragraphIndexNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ParagraphIndexNotifier = AutoDisposeNotifier<int>;
String _$sentenceIndexNotifierHash() =>
    r'21a64c3ebe3d621ec6a8d5ed9b7ec623dc2f7496';

/// See also [SentenceIndexNotifier].
@ProviderFor(SentenceIndexNotifier)
final sentenceIndexNotifierProvider =
    AutoDisposeNotifierProvider<SentenceIndexNotifier, int>.internal(
  SentenceIndexNotifier.new,
  name: r'sentenceIndexNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sentenceIndexNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SentenceIndexNotifier = AutoDisposeNotifier<int>;
String _$wordIndexNotifierHash() => r'828099c523d0beb58e406f12b7ad15ad735ffcd4';

/// See also [WordIndexNotifier].
@ProviderFor(WordIndexNotifier)
final wordIndexNotifierProvider =
    AutoDisposeNotifierProvider<WordIndexNotifier, int>.internal(
  WordIndexNotifier.new,
  name: r'wordIndexNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$wordIndexNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$WordIndexNotifier = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
