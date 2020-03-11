class Schema {
  const Schema._();
}

const schema = Schema._();

class DocumentField {
  final bool isService;
  const DocumentField._(this.isService);
}

/// if service field has default value it will
/// be ommited from creator and updater
///
/// if service field has no default value it will
/// only be ommited by the updater
const serviceField = DocumentField._(true);

class Collection<T> {
  final String name;
  final Iterable<Collection> subcollections;
  const Collection({this.name = '', this.subcollections = const []});
}
