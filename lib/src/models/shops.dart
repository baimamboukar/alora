import 'package:grnagain/src/app/assets.dart';

class Shop {
  final String name;
  final String location;
  final String imageUrl;
  final String desc;
  final String infos;
  final String contact;

  Shop({
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.desc,
    required this.infos,
    required this.contact,
  });
}

List<Shop> shops = [
  Shop(
    name: 'GrnAgain Store',
    location: 'Messassi, Dispensaire',
    imageUrl: Assets.assetsImagesGrnagain,
    desc: 'Open from 9am to 9pm',
    infos: 'Find all your gardening needs here',
    contact: '675622404 | store@greeagain.io',
  ),
  Shop(
    name: 'BioAgric Market',
    location: 'Mokolo, Market Square',
    imageUrl: Assets.assetsImagesOrangeDetails,
    desc: 'Open from 8am to 8pm',
    infos: 'Organic seeds and tools available',
    contact: '699223344 | info@bioagric.cm',
  ),
  Shop(
    name: 'Yaoundé Agro Hub',
    location: 'Bastos, Near Embassy',
    imageUrl: Assets.assetsImagesTomatoDetails,
    desc: 'Open from 7am to 7pm',
    infos: 'Specializing in farm equipment',
    contact: '674556677 | support@yaoundeagrohub.com',
  ),
  Shop(
    name: 'Green Oasis',
    location: 'Nlongkak, Main Road',
    imageUrl: Assets.assetsImagesLoginBg,
    desc: 'Open from 9am to 6pm',
    infos: 'Eco-friendly products for your farm',
    contact: '672334455 | sales@greenoasis.cm',
  ),
  Shop(
    name: 'AgriTech Solutions',
    location: 'Essos, Boulevard du 20 Mai',
    imageUrl: Assets.assetsImagesGrnagain,
    desc: 'Open from 8am to 5pm',
    infos: 'Advanced farming technologies',
    contact: '677889900 | info@agritechsolutions.cm',
  ),
  Shop(
    name: 'Farmers First',
    location: 'Melen, Rue du Stade',
    imageUrl: Assets.assetsImagesPomme,
    desc: 'Open from 7am to 7pm',
    infos: 'Affordable tools for small-scale farmers',
    contact: '676667788 | contact@farmersfirst.cm',
  ),
  Shop(
    name: 'AgroSupplies Yaoundé',
    location: 'Biyem-Assi, Carrefour',
    imageUrl: Assets.assetsImagesOranges,
    desc: 'Open from 8am to 6pm',
    infos: 'Wide range of agrochemical products',
    contact: '678998877 | info@agrosupplies.cm',
  ),
  Shop(
    name: 'EcoFarm Center',
    location: 'Ngousso, Behind Hospital',
    imageUrl: Assets.assetsImagesBroccoli,
    desc: 'Open from 9am to 7pm',
    infos: 'Organic and eco-friendly farming solutions',
    contact: '679001122 | ecofarm@contact.cm',
  ),
];
