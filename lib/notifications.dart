typedef Listener<T> = Function(T event);

class Notification<T> {
  List<Listener<T>> _listeners;

  Notification() : _listeners = [];

  registerListener(Listener<T> listener) {
    _listeners.add(listener);
  }

  unregisterListener(Listener<T> listener) {
    _listeners.remove(listener);
  }

  notify(T event) {
    for (var listener in _listeners) {
      try {
        listener(event);
      } catch (exc) {
        // ignore
      }
    }
  }
}

final Notification notifyError = Notification();
