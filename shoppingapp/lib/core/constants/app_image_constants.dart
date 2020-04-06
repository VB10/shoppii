class ImagePath {
  static ImagePath _instance = ImagePath._init();
  static ImagePath get instance => _instance;

  ImagePath._init();

  String get notFoundLottie => lottiePath("shopbag");

  String lottiePath(String text) => "assets/lottie/$text.json";
}
