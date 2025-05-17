// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_vote_checker.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$localVoteCheckerHash() => r'5d7abf613e99f195e3373a45d6b14e5b77515222';

/// This provider is used to check if the user has already voted for a story but it's local so
/// it doesn't persist the data if the session is refreshed.
///
/// Copied from [LocalVoteChecker].
@ProviderFor(LocalVoteChecker)
final localVoteCheckerProvider =
    NotifierProvider<LocalVoteChecker, List<Vote>>.internal(
      LocalVoteChecker.new,
      name: r'localVoteCheckerProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$localVoteCheckerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$LocalVoteChecker = Notifier<List<Vote>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
