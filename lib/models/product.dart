class Product {
  final int id, price;
  final String title, subTitle, description, image;

  Product(
      {required this.id,
      required this.price,
      required this.title,
      required this.subTitle,
      required this.description,
      required this.image});
}

// liste de produits
List<Product> products = [
  Product(
    id: 1,
    price: 59,
    title: "Ecouteurs sans fil.",
    subTitle: "Haute qualité sonore.",
    image: "assets/images/airpod.png",
    description:
        "Ce sont des écouteurs qui communiquent avec le smartphone ou le PC en mode radio. Ils n'ont donc pas de fil et fonctionnent à l'aide d'une batterie incorporée.",
  ),
  Product(
    id: 2,
    price: 1099,
    title: "Téléphone protable.",
    subTitle: "Le mobile est devenu puissant.",
    image: "assets/images/mobile.png",
    description:
        "C'est un petit appareil téléphonique sans fil avec lequel on peut faire des appels, envoyer des messages, prendre des photos, Il sert aussi de caméra…. Certaines personnes utilisent leurs téléphones portables pour se connecter à Internet.",
  ),
  Product(
    id: 3,
    price: 39,
    title: "Lunettes 3D.",
    subTitle: "Pour vous emmener dans le monde virtuel.",
    image: "assets/images/class.png",
    description:
        "Paire de lunettes permettant de voir la profondeur dans une vidéo filmée en trois dimensions.",
  ),
  Product(
    id: 4,
    price: 56,
    title: "Écouteurs.",
    subTitle: "Longues heures d'écoute.",
    image: "assets/images/headset.png",
    description:
        "Récepteur électro-acoustique que l'on porte à son oreille pour recevoir une communication ou écouter une émission.",
  ),
  Product(
    id: 5,
    price: 68,
    title: "Magnétophone.",
    subTitle: "Enregistrer les moments importants autour de vous.",
    image: "assets/images/speaker.png",
    description:
        "Appareil d'enregistrement et de lecture des sons utilisant comme support une bande magnétique (bande ou cassette).",
  ),
  Product(
    id: 6,
    price: 39,
    title: "Caméras informatiques.",
    subTitle: "Haute qualité d'image et résolution.",
    image: "assets/images/camera.png",
    description:
        "Une webcam est une caméra vidéo numérique connectée à un ordinateur et capable de capturer des vidéos et des photos, et de les transmettre sur Internet.",
  ),
];
