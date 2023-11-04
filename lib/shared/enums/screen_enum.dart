enum Screen {docView,homeView }
extension ParseToString on Screen {
  String toShortString() {
    return this.toString().split('.').last;
  }
}