// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'average_vote.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$averageVoteHash() => r'764ed2b7661d09728cd75e3d8f038e45ccdebcc6';

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

/// See also [averageVote].
@ProviderFor(averageVote)
const averageVoteProvider = AverageVoteFamily();

/// See also [averageVote].
class AverageVoteFamily extends Family<AsyncValue<double>> {
  /// See also [averageVote].
  const AverageVoteFamily();

  /// See also [averageVote].
  AverageVoteProvider call({required int storyId}) {
    return AverageVoteProvider(storyId: storyId);
  }

  @override
  AverageVoteProvider getProviderOverride(
    covariant AverageVoteProvider provider,
  ) {
    return call(storyId: provider.storyId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'averageVoteProvider';
}

/// See also [averageVote].
class AverageVoteProvider extends FutureProvider<double> {
  /// See also [averageVote].
  AverageVoteProvider({required int storyId})
    : this._internal(
        (ref) => averageVote(ref as AverageVoteRef, storyId: storyId),
        from: averageVoteProvider,
        name: r'averageVoteProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$averageVoteHash,
        dependencies: AverageVoteFamily._dependencies,
        allTransitiveDependencies: AverageVoteFamily._allTransitiveDependencies,
        storyId: storyId,
      );

  AverageVoteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.storyId,
  }) : super.internal();

  final int storyId;

  @override
  Override overrideWith(
    FutureOr<double> Function(AverageVoteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AverageVoteProvider._internal(
        (ref) => create(ref as AverageVoteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        storyId: storyId,
      ),
    );
  }

  @override
  FutureProviderElement<double> createElement() {
    return _AverageVoteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AverageVoteProvider && other.storyId == storyId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, storyId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AverageVoteRef on FutureProviderRef<double> {
  /// The parameter `storyId` of this provider.
  int get storyId;
}

class _AverageVoteProviderElement extends FutureProviderElement<double>
    with AverageVoteRef {
  _AverageVoteProviderElement(super.provider);

  @override
  int get storyId => (origin as AverageVoteProvider).storyId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
