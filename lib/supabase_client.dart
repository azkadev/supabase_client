// ignore_for_file: non_constant_identifier_names, unused_local_variable

library supabase_client;

import 'package:supabase_client/storage/storage.dart';
import "database/database.dart";

export "database/database.dart";
export "storage/storage.dart";

class Supabase {
  Supabase();

  static Database database({
    required String supabase_id,
    required String supabase_key,
  }) {
    return Database(supabase_id, supabase_key);
  }

  static Storage storage({
    required String supabase_url,
    required String supabase_key,
  }) {
    return Storage(supabase_url, supabase_key);
  }
}
