import "dart:convert";
import "package:http/http.dart";
import "package:redux_thunk/redux_thunk.dart";
import "package:redux/redux.dart";
import "./interfaces.dart";
import "../../notifications.dart";
import "../../models/datarecord.dart";

ThunkAction fetch<T>(Uri url, T Function(Map<String, dynamic>) converter) {
  return (Store store) async {
    Client client = Client();
    store.dispatch(FetchRequestAction());
    try {
      Response response = await client.get(url);
      var decodedResponse = jsonDecode(response.body);
      List<DataRecord<T>> entries = decodedResponse
          .map<DataRecord<T>>((e) => DataRecord.make(converter(e)))
          .toList();
      store.dispatch(FetchSuccessAction(
          entries: entries, searchParams: url.queryParameters));
    } catch (error) {
      notifyError.notify(error);
      store.dispatch(FetchErrorAction(error: error));
    } finally {
      client.close();
    }
  };
}
