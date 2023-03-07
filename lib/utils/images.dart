class CustomImages {
  static String defaultImg = "assets/icons/currency.png";

  static images({required String category}) => category.contains(" ")
      ? "assets/icons/${category.split(" ")[0].toLowerCase()}_${category.split(" ")[1].toLowerCase()}.png"
      : "assets/icons/${category.toLowerCase()}.png";
}
