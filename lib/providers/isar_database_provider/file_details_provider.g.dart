// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_details_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentSentenceHash() => r'f440749dbd7b7b1a6d624aa8319fec65acd57fc6';

/// See also [currentSentence].
@ProviderFor(currentSentence)
final currentSentenceProvider =
    AutoDisposeProvider<DictationSentence?>.internal(
  currentSentence,
  name: r'currentSentenceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentSentenceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentSentenceRef = AutoDisposeProviderRef<DictationSentence?>;
String _$currentDurationHash() => r'09f5c8b1cec6fc6d7d64b566ffdaac4c102c1da3';

/// See also [currentDuration].
@ProviderFor(currentDuration)
final currentDurationProvider = AutoDisposeProvider<(double, double)?>.internal(
  currentDuration,
  name: r'currentDurationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentDurationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentDurationRef = AutoDisposeProviderRef<(double, double)?>;
String _$currentAudioPathHash() => r'b91d1f60f05f6cdf70fbdd624217a09393412c66';

/// See also [currentAudioPath].
@ProviderFor(currentAudioPath)
final currentAudioPathProvider = AutoDisposeProvider<String?>.internal(
  currentAudioPath,
  name: r'currentAudioPathProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentAudioPathHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentAudioPathRef = AutoDisposeProviderRef<String?>;
String _$sentencePageControllerHash() =>
    r'a8b79db0ecb597ff4694f6b19ca12caa7803c017';

/// See also [SentencePageController].
@ProviderFor(SentencePageController)
final sentencePageControllerProvider = AutoDisposeNotifierProvider<
    SentencePageController, PageController>.internal(
  SentencePageController.new,
  name: r'sentencePageControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sentencePageControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SentencePageController = AutoDisposeNotifier<PageController>;
String _$currentSentenceIndexHash() =>
    r'47cbcc1043e9a8dbb96065dd3cc9b0a3000ed15a';

/// See also [CurrentSentenceIndex].
@ProviderFor(CurrentSentenceIndex)
final currentSentenceIndexProvider =
    AutoDisposeNotifierProvider<CurrentSentenceIndex, int>.internal(
  CurrentSentenceIndex.new,
  name: r'currentSentenceIndexProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentSentenceIndexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentSentenceIndex = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
