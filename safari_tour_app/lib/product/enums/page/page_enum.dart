enum NetworkQuery { page }

extension NetworkQueryExtension on NetworkQuery {
  MapEntry<String, int> pageQuery(int pageNumber) =>
      MapEntry(NetworkQuery.page.name, pageNumber);
}
