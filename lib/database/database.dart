// ignore_for_file: non_constant_identifier_names

import 'package:supabase/supabase.dart';

/// database db
class Database {
  late SupabaseClient supabase_client;

  /// database db
  Database(String url, String key) {
    supabase_client = SupabaseClient(url, key);
  }

  SupabaseClient client({
    required SupabaseClient? supabaseClient,
  }) {
    supabaseClient ??= supabase_client;

    return supabaseClient;
  }

  String parseColumns(List<String>? columns) {
    columns ??= ["*"];
    return columns.join(", ");
  }

  /// add database data
  Future<bool> add({
    required String from,
    required Map data,
    SupabaseClient? supabaseClient,
  }) async {
    await client(supabaseClient: supabaseClient).from(from).insert(data);
    return true;
  }

  /// delete data
  dynamic delete({
    required String from,
    required Map datas,
    SupabaseClient? supabaseClient,
  }) async {
    var response = await client(supabaseClient: supabaseClient)
        .from(from)
        .delete()
        .match(datas);
    return response;
  }

  /// get data
  Future<Map?> get({
    required String from,
    required String dataId,
    required String searchData,
    List<String>? columns,
    SupabaseClient? supabaseClient,
  }) async {
    List response = await client(supabaseClient: supabaseClient)
        .from(from)
        .select(parseColumns(columns));
    for (var index = 0; index < response.length; index++) {
      var loopData = response[index];
      if (RegExp(searchData, caseSensitive: false)
          .hasMatch(loopData[dataId.toString()].toString())) {
        return loopData;
      }
    }
    return null;
  }

  /// get data
  Future<Map?> getMatch({
    required String from,
    required Map query,
    List<String>? columns,
    SupabaseClient? supabaseClient,
  }) async {
    var response = await client(supabaseClient: supabaseClient)
        .from(from)
        .select(parseColumns(columns))
        .match(query);
    if (response is List == false) {
      return null;
    }
    List<Map> data = (response as List).cast<Map>();
    if (data.isEmpty) {
      return null;
    }
    return data.first;
  }

  /// get all datas
  Future<List<Map>> getAll({
    required String from,
    List<String>? columns,
    SupabaseClient? supabaseClient,
  }) async {
    var response = await client(supabaseClient: supabaseClient)
        .from(from)
        .select(parseColumns(columns));
    return (response as List).cast<Map>();
  }

  /// get data
  Future<Map?> searchData({
    required String from,
    required String column,
    required String query,
    List<String>? columns,
    SupabaseClient? supabaseClient,
  }) async {
    var response = await client(supabaseClient: supabaseClient)
        .from(from)
        .select(parseColumns(columns))
        .textSearch(column, query);
    if (response is List == false) {
      return null;
    }
    List<Map> data = (response as List).cast<Map>();
    if (data.isEmpty) {
      return null;
    }
    return data.first;
  }

  /// insert data
  Future<bool> insert({
    required String from,
    required Map data,
    SupabaseClient? supabaseClient,
  }) async {
    await client(supabaseClient: supabaseClient).from(from).insert(data);
    return true;
  }

  /// update data
  update({
    required String from,
    required Map dataOrigin,
    required Map dataUpdate,
    SupabaseClient? supabaseClient,
  }) async {
    var response = await client(supabaseClient: supabaseClient)
        .from(from)
        .update(dataUpdate)
        .match(dataOrigin);
    return response;
  }

  /// on data
  void on(String from, void Function(dynamic data) callback) {
    if (from.isEmpty) {
      throw {"message": "Tolong isi from ya !"};
    }

    // client(supabaseClient: supabaseClient).from(from);.on(SupabaseEventTypes.all, (update) {
    //   Map json_data = {};
    //   json_data["type"] = update.eventType.toLowerCase();
    //   json_data["new_data"] = update.newRecord;
    //   json_data["old_data"] = update.oldRecord;
    //   return callback(json_data);
    // }).subscribe();
  }
}
