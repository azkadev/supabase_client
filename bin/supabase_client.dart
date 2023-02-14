// import 'package:supabase/supabase.dart';

import 'package:supabase_client/supabase_client.dart';

void main(List<String> arguments) async {
  var supabase = Database("id", "key");
  await supabase.add(from: "from", data: {"id": DateTime.now()});
  await supabase.get(from: "from", dataId: "id", searchData: r"^5$");
  await supabase.getAll(from: "data");
  await supabase
      .update(from: "from", dataOrigin: {"id": 5}, dataUpdate: {"id": 10});
  await supabase.delete(from: "from", datas: {"id": 10});
}
