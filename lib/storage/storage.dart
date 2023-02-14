// ignore_for_file: non_constant_identifier_names

import 'package:supabase/supabase.dart';

class Storage {
  late SupabaseClient supabase_client;

  /// database db
  Storage(String url, String key) {
    supabase_client = SupabaseClient(url, key);
  }

  SupabaseClient client({
    required SupabaseClient? supabaseClient,
  }) {
    supabaseClient ??= supabase_client;

    return supabaseClient;
  }

  Future<String> createBucket({
    required String id,
    BucketOptions bucketOptions = const BucketOptions(public: false),
    SupabaseClient? supabaseClient,
  }) async {
    return await client(
      supabaseClient: supabaseClient,
    ).storage.createBucket(id, bucketOptions);
  }

  Future<String> deleteBucket({
    required String id,
    SupabaseClient? supabaseClient,
  }) async {
    return await client(
      supabaseClient: supabaseClient,
    ).storage.deleteBucket(id);
  }

  Future<String> emptyBucket({
    required String id,
    SupabaseClient? supabaseClient,
  }) async {
    return await client(
      supabaseClient: supabaseClient,
    ).storage.emptyBucket(id);
  }

  Future<String> updateBucket({
    required String id,
    BucketOptions bucketOptions = const BucketOptions(public: false),
    SupabaseClient? supabaseClient,
  }) async {
    return await client(
      supabaseClient: supabaseClient,
    ).storage.updateBucket(id, bucketOptions);
  }

  Future<Bucket> getBucket({
    required String id,
    SupabaseClient? supabaseClient,
  }) async {
    return await client(
      supabaseClient: supabaseClient,
    ).storage.getBucket(id);
  }

  Future<List<Bucket>> listBuckets({
    SupabaseClient? supabaseClient,
  }) async {
    return await client(
      supabaseClient: supabaseClient,
    ).storage.listBuckets();
  }

  StorageFileApi get({
    required String id,
    SupabaseClient? supabaseClient,
  }) {
    return client(
      supabaseClient: supabaseClient,
    ).storage.from(id);
  }
}
