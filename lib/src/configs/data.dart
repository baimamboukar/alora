import 'package:uuid/uuid.dart';

import '../models/crop_model.dart';

List<Crop> crops = [
  Crop(
    id: const Uuid().v4(),
    bookMarked: false,
    name: "Orange",
    description:
        " Melanose disease is one the most widely distributed and economically important fungal diseases of citrus worldwide. The causative agent isthe filamentous fungus Diaporthe citri (syn. Phomopsis citri).",
    scienticName: "Melanose Diaporthe citri",
    imageURL: PhotoThumbails(
      caption: "assets/images/oranges.png",
      details: "assets/images/orange_details.png",
    ),
    treatment: Treatment(
        intro:
            "The following control measures have all been proven effective against scab in potatoes. However, in most cases a combination of these techniques will be required.",
        steps: [
          "Plant certified, disease-free seed potatoes and resistant varieties whenever possible. We suggest using the russet-skinned varieties since they have more resistance to the disease.",
          "Rotate root crops by planting in alternate locations to limit the disease.",
          "Potato scab is most prevalent in dry, alkaline soils. Decrease soil pH by adding elemental sulfur. The disease is controlled or greatly suppressed at soil pH levels of 5.2 or lower. Simple and affordable soil test kits are available to check pH often.",
          "Tilling in a cover crop — mustard, canola, alfalfa — prior to planting potatoes will help reduce infection.",
          "Some growers report success spreading agricultural gypsum prior to planting at a rate of 25 lbs per 2,000 sq ft. This will raise the calcium content of your soil and help build strong cell walls in plants. (Note: S. scabies disrupts the development of cell walls resulting in lesions.)",
          "Adequate irrigation during early tuber development may have a dramatic effect on common scab infection, but you will need to keep the soil damp for 2-6 weeks. This technique is effective because high soil moisture promotes growth of a bacteria that can crowd out S. scabies on the potato surface.",
          "Do NOT overwater."
        ],
        outtro:
            " If you will be planting in soil where tubers have not been grown before, or where the area is known to be scab-free, treat seed potatoes with sulfur fungicides to reduce scab introduction."),
  ),
  Crop(
    id: const Uuid().v4(),
    bookMarked: false,
    name: "Potato",
    description:
        " Melanose disease is one the most widely distributed and economically important fungal diseases of citrus worldwide. The causative agent isthe filamentous fungus Diaporthe citri (syn. Phomopsis citri).",
    scienticName: "Common Scab",
    imageURL: PhotoThumbails(
        caption: "assets/images/potato.png",
        details: "assets/images/potato_details.png"),
    treatment: Treatment(
        intro:
            "The following control measures have all been proven effective against scab in potatoes. However, in most cases a combination of these techniques will be required.",
        steps: [
          "Plant certified, disease-free seed potatoes and resistant varieties whenever possible. We suggest using the russet-skinned varieties since they have more resistance to the disease.",
          "Rotate root crops by planting in alternate locations to limit the disease.",
          "Potato scab is most prevalent in dry, alkaline soils. Decrease soil pH by adding elemental sulfur. The disease is controlled or greatly suppressed at soil pH levels of 5.2 or lower. Simple and affordable soil test kits are available to check pH often.",
          "Tilling in a cover crop — mustard, canola, alfalfa — prior to planting potatoes will help reduce infection.",
          "Some growers report success spreading agricultural gypsum prior to planting at a rate of 25 lbs per 2,000 sq ft. This will raise the calcium content of your soil and help build strong cell walls in plants. (Note: S. scabies disrupts the development of cell walls resulting in lesions.)",
          "Adequate irrigation during early tuber development may have a dramatic effect on common scab infection, but you will need to keep the soil damp for 2-6 weeks. This technique is effective because high soil moisture promotes growth of a bacteria that can crowd out S. scabies on the potato surface.",
          "Do NOT overwater."
        ],
        outtro:
            " If you will be planting in soil where tubers have not been grown before, or where the area is known to be scab-free, treat seed potatoes with sulfur fungicides to reduce scab introduction."),
  ),
  Crop(
    id: const Uuid().v4(),
    bookMarked: true,
    name: "Tomato",
    description:
        " Melanose disease is one the most widely distributed and economically important fungal diseases of citrus worldwide. The causative agent isthe filamentous fungus Diaporthe citri (syn. Phomopsis citri).",
    scienticName: "Rust Fungus",
    imageURL: PhotoThumbails(
        caption: "assets/images/tomato.png",
        details: "assets/images/tomato_details.png"),
    treatment: Treatment(
        intro:
            "The following control measures have all been proven effective against scab in potatoes. However, in most cases a combination of these techniques will be required.",
        steps: [
          "Plant certified, disease-free seed potatoes and resistant varieties whenever possible. We suggest using the russet-skinned varieties since they have more resistance to the disease.",
          "Rotate root crops by planting in alternate locations to limit the disease.",
          "Potato scab is most prevalent in dry, alkaline soils. Decrease soil pH by adding elemental sulfur. The disease is controlled or greatly suppressed at soil pH levels of 5.2 or lower. Simple and affordable soil test kits are available to check pH often.",
          "Tilling in a cover crop — mustard, canola, alfalfa — prior to planting potatoes will help reduce infection.",
          "Some growers report success spreading agricultural gypsum prior to planting at a rate of 25 lbs per 2,000 sq ft. This will raise the calcium content of your soil and help build strong cell walls in plants. (Note: S. scabies disrupts the development of cell walls resulting in lesions.)",
          "Adequate irrigation during early tuber development may have a dramatic effect on common scab infection, but you will need to keep the soil damp for 2-6 weeks. This technique is effective because high soil moisture promotes growth of a bacteria that can crowd out S. scabies on the potato surface.",
          "Do NOT overwater."
        ],
        outtro:
            " If you will be planting in soil where tubers have not been grown before, or where the area is known to be scab-free, treat seed potatoes with sulfur fungicides to reduce scab introduction."),
  ),
  Crop(
    id: const Uuid().v4(),
    bookMarked: true,
    name: "Broccoli",
    description:
        " Melanose disease is one the most widely distributed and economically important fungal diseases of citrus worldwide. The causative agent isthe filamentous fungus Diaporthe citri (syn. Phomopsis citri).",
    scienticName: "Mosaic Virus, Blackleg",
    imageURL: PhotoThumbails(
        caption: "assets/images/broccoli.png",
        details: "assets/images/broccoli_details.png"),
    treatment: Treatment(
        intro:
            "The following control measures have all been proven effective against scab in potatoes. However, in most cases a combination of these techniques will be required.",
        steps: [
          "Plant certified, disease-free seed potatoes and resistant varieties whenever possible. We suggest using the russet-skinned varieties since they have more resistance to the disease.",
          "Rotate root crops by planting in alternate locations to limit the disease.",
          "Potato scab is most prevalent in dry, alkaline soils. Decrease soil pH by adding elemental sulfur. The disease is controlled or greatly suppressed at soil pH levels of 5.2 or lower. Simple and affordable soil test kits are available to check pH often.",
          "Tilling in a cover crop — mustard, canola, alfalfa — prior to planting potatoes will help reduce infection.",
          "Some growers report success spreading agricultural gypsum prior to planting at a rate of 25 lbs per 2,000 sq ft. This will raise the calcium content of your soil and help build strong cell walls in plants. (Note: S. scabies disrupts the development of cell walls resulting in lesions.)",
          "Adequate irrigation during early tuber development may have a dramatic effect on common scab infection, but you will need to keep the soil damp for 2-6 weeks. This technique is effective because high soil moisture promotes growth of a bacteria that can crowd out S. scabies on the potato surface.",
          "Do NOT overwater."
        ],
        outtro:
            " If you will be planting in soil where tubers have not been grown before, or where the area is known to be scab-free, treat seed potatoes with sulfur fungicides to reduce scab introduction."),
  ),
  Crop(
    id: const Uuid().v4(),
    bookMarked: true,
    name: "Potato",
    description:
        " Melanose disease is one the most widely distributed and economically important fungal diseases of citrus worldwide. The causative agent isthe filamentous fungus Diaporthe citri (syn. Phomopsis citri).",
    scienticName: "Common Scab",
    imageURL: PhotoThumbails(
        caption: "assets/images/potato.png",
        details: "assets/images/potato_details.png"),
    treatment: Treatment(
        intro:
            "The following control measures have all been proven effective against scab in potatoes. However, in most cases a combination of these techniques will be required.",
        steps: [
          "Plant certified, disease-free seed potatoes and resistant varieties whenever possible. We suggest using the russet-skinned varieties since they have more resistance to the disease.",
          "Rotate root crops by planting in alternate locations to limit the disease.",
          "Potato scab is most prevalent in dry, alkaline soils. Decrease soil pH by adding elemental sulfur. The disease is controlled or greatly suppressed at soil pH levels of 5.2 or lower. Simple and affordable soil test kits are available to check pH often.",
          "Tilling in a cover crop — mustard, canola, alfalfa — prior to planting potatoes will help reduce infection.",
          "Some growers report success spreading agricultural gypsum prior to planting at a rate of 25 lbs per 2,000 sq ft. This will raise the calcium content of your soil and help build strong cell walls in plants. (Note: S. scabies disrupts the development of cell walls resulting in lesions.)",
          "Adequate irrigation during early tuber development may have a dramatic effect on common scab infection, but you will need to keep the soil damp for 2-6 weeks. This technique is effective because high soil moisture promotes growth of a bacteria that can crowd out S. scabies on the potato surface.",
          "Do NOT overwater."
        ],
        outtro:
            " If you will be planting in soil where tubers have not been grown before, or where the area is known to be scab-free, treat seed potatoes with sulfur fungicides to reduce scab introduction."),
  ),
  Crop(
    id: const Uuid().v4(),
    bookMarked: false,
    name: "Orange",
    description:
        " Melanose disease is one the most widely distributed and economically important fungal diseases of citrus worldwide. The causative agent isthe filamentous fungus Diaporthe citri (syn. Phomopsis citri).",
    scienticName: "Melanose Diaporthe citri",
    imageURL: PhotoThumbails(
        caption: "assets/images/oranges.png",
        details: "assets/images/orange_details.png"),
    treatment: Treatment(
        intro:
            "The following control measures have all been proven effective against scab in potatoes. However, in most cases a combination of these techniques will be required.",
        steps: [
          "Plant certified, disease-free seed potatoes and resistant varieties whenever possible. We suggest using the russet-skinned varieties since they have more resistance to the disease.",
          "Rotate root crops by planting in alternate locations to limit the disease.",
          "Potato scab is most prevalent in dry, alkaline soils. Decrease soil pH by adding elemental sulfur. The disease is controlled or greatly suppressed at soil pH levels of 5.2 or lower. Simple and affordable soil test kits are available to check pH often.",
          "Tilling in a cover crop — mustard, canola, alfalfa — prior to planting potatoes will help reduce infection.",
          "Some growers report success spreading agricultural gypsum prior to planting at a rate of 25 lbs per 2,000 sq ft. This will raise the calcium content of your soil and help build strong cell walls in plants. (Note: S. scabies disrupts the development of cell walls resulting in lesions.)",
          "Adequate irrigation during early tuber development may have a dramatic effect on common scab infection, but you will need to keep the soil damp for 2-6 weeks. This technique is effective because high soil moisture promotes growth of a bacteria that can crowd out S. scabies on the potato surface.",
          "Do NOT overwater."
        ],
        outtro:
            " If you will be planting in soil where tubers have not been grown before, or where the area is known to be scab-free, treat seed potatoes with sulfur fungicides to reduce scab introduction."),
  ),
  Crop(
    id: const Uuid().v4(),
    bookMarked: true,
    name: "Pomme",
    description:
        " Melanose disease is one the most widely distributed and economically important fungal diseases of citrus worldwide. The causative agent isthe filamentous fungus Diaporthe citri (syn. Phomopsis citri).",
    scienticName: "Rust Fungus",
    imageURL: PhotoThumbails(
        caption: "assets/images/pomme.png",
        details: "assets/images/potato_details.png"),
    treatment: Treatment(
        intro:
            "The following control measures have all been proven effective against scab in potatoes. However, in most cases a combination of these techniques will be required.",
        steps: [
          "Plant certified, disease-free seed potatoes and resistant varieties whenever possible. We suggest using the russet-skinned varieties since they have more resistance to the disease.",
          "Rotate root crops by planting in alternate locations to limit the disease.",
          "Potato scab is most prevalent in dry, alkaline soils. Decrease soil pH by adding elemental sulfur. The disease is controlled or greatly suppressed at soil pH levels of 5.2 or lower. Simple and affordable soil test kits are available to check pH often.",
          "Tilling in a cover crop — mustard, canola, alfalfa — prior to planting potatoes will help reduce infection.",
          "Some growers report success spreading agricultural gypsum prior to planting at a rate of 25 lbs per 2,000 sq ft. This will raise the calcium content of your soil and help build strong cell walls in plants. (Note: S. scabies disrupts the development of cell walls resulting in lesions.)",
          "Adequate irrigation during early tuber development may have a dramatic effect on common scab infection, but you will need to keep the soil damp for 2-6 weeks. This technique is effective because high soil moisture promotes growth of a bacteria that can crowd out S. scabies on the potato surface.",
          "Do NOT overwater."
        ],
        outtro:
            " If you will be planting in soil where tubers have not been grown before, or where the area is known to be scab-free, treat seed potatoes with sulfur fungicides to reduce scab introduction."),
  ),
];

final diseasemap = {
  0: 'Apple: Apple Scab',
  1: 'Apple: Black Rot',
  2: 'Apple: Cedar Rust',
  3: 'Apple: Healthy',
  4: 'Blueberry: Healthy',
  5: 'Cherry: Powdery Mildew',
  6: 'Cherry: Healthy',
  7: 'Corn (Maize): Grey Leaf Spot',
  8: 'Corn (Maize): Common Rust of Maize',
  9: 'Corn (Maize): Northern Leaf Blight',
  10: 'Corn (Maize): Healthy',
  11: 'Grape: Black Rot',
  12: 'Grape: Black Measles (Esca)',
  13: 'Grape: Leaf Blight (Isariopsis Leaf Spot)',
  14: 'Grape: Healthy',
  15: 'Orange: Huanglongbing (Citrus Greening)',
  16: 'Peach: Bacterial spot',
  17: 'Peach: Healthy',
  18: 'Bell Pepper: Bacterial Spot',
  19: 'Bell Pepper: Healthy',
  20: 'Potato: Early Blight',
  21: 'Potato: Late Blight',
  22: 'Potato: Healthy',
  23: 'Raspberry: Healthy',
  24: 'Rice: Brown Spot',
  25: 'Rice: Hispa',
  26: 'Rice: Leaf Blast',
  27: 'Rice: Healthy',
  28: 'Soybean: Healthy',
  29: 'Squash: Powdery Mildew',
  30: 'Strawberry: Leaf Scorch',
  31: 'Strawberry: Healthy',
  32: 'Tomato: Bacterial Spot',
  33: 'Tomato: Early Blight',
  34: 'Tomato: Late Blight',
  35: 'Tomato: Leaf Mold',
  36: 'Tomato: Septoria Leaf Spot',
  37: 'Tomato: Spider Mites (Two-spotted Spider Mite)',
  38: 'Tomato: Target Spot',
  39: 'Tomato: Yellow Leaf Curl Virus',
  40: 'Tomato: Mosaic Virus',
  41: 'Tomato: Healthy'
};

final detailsmap = {
  'Apple: Apple Scab': [
    'A serious disease of apples and ornamental crabapples, apple scab (Venturia inaequalis) attacks both leaves and fruit. The fungal disease forms pale yellow or olive-green spots on the upper surface of leaves. Dark, velvety spots may appear on the lower surface. Severely infected leaves become twisted and puckered and may drop early in the summer.',
    'Symptoms on fruit are similar to those found on leaves. Scabby spots are sunken and tan and may have velvety spores in the center. As these spots mature, they become larger and turn brown and corky. Infected fruit becomes distorted and may crack allowing entry of secondary organisms. Severely affected fruit may drop, especially when young.',
    'https://www.planetnatural.com/pest-problem-solver/plant-disease/apple-scab'
  ],
  'Apple: Black Rot': [
    'Black rot is occasionally a problem on Minnesota apple trees. This fungal disease causes leaf spot, fruit rot and cankers on branches. Trees are more likely to be infected if they are: Not fully hardy in Minnesota, Infected with fire blight or Stressed by environmental factors like drought.',
    'Large brown rotten areas can form anywhere on the fruit but are most common on the blossom end. Brown to black concentric rings can often be seen on larger infections. The flesh of the apple is brown but remains firm. Infected leaves develop "frog-eye leaf spot". These are circular spots with purplish or reddish edges and light tan interiors.',
    'https://extension.umn.edu/plant-diseases/black-rot-apple'
  ],
  'Apple: Cedar Rust': [
    'Cedar apple rust (Gymnosporangium juniperi-virginianae) is a fungal disease that requires juniper plants to complete its complicated two year life-cycle. Spores overwinter as a reddish-brown gall on young twigs of various juniper species. In early spring, during wet weather, these galls swell and bright orange masses of spores are blown by the wind where they infect susceptible apple and crab-apple trees. The spores that develop on these trees will only infect junipers the following year. From year to year, the disease must pass from junipers to apples to junipers again; it cannot spread between apple trees.',
    'On apple and crab-apple trees, look for pale yellow pinhead sized spots on the upper surface of the leaves shortly after bloom. These gradually enlarge to bright orange-yellow spots which make the disease easy to identify. Orange spots may develop on the fruit as well. Heavily infected leaves may drop prematurely.',
    'https://www.planetnatural.com/pest-problem-solver/plant-disease/cedar-apple-rust'
  ],
  'Apple: Healthy': [
    'Your crops are healthy. You took good care of it.',
    'Healthy Crops',
    'Just take care of it as you usually do.'
  ],
  'Blueberry: Healthy': [
    'Your crops are healthy. You took good care of it.',
    'Healthy Crops',
    'Just take care of it as you usually do.'
  ],
  'Cherry: Powdery Mildew': [
    'Powdery mildew of sweet and sour cherry is caused by Podosphaera clandestina, an obligate biotrophic fungus. Mid- and late-season sweet cherry (Prunus avium) cultivars are commonly affected, rendering them unmarketable due to the covering of white fungal growth on the cherry surface. Season long disease control of both leaves and fruit is critical to minimize overall disease pressure in the orchard and consequently to protect developing fruit from accumulating spores on their surfaces.',
    'Initial symptoms, often occurring 7 to 10 days after the onset of the first irrigation, are light roughly-circular, powdery looking patches on young, susceptible leaves (newly unfolded, and light green expanding leaves). Older leaves develop an age-related (ontogenic) resistance to powdery mildew and are naturally more resistant to infection than younger leaves. Look for early leaf infections on root suckers, the interior of the canopy or the crotch of the tree where humidity is high.',
    'http://treefruit.wsu.edu/crop-protection/disease-management/cherry-powdery-mildew'
  ],
  'Cherry: Healthy': [
    'Your crops are healthy. You took good care of it.',
    'Healthy Crops',
    'Just take care of it as you usually do.'
  ],
  'Corn (Maize): Grey Leaf Spot': [
    'Gray leaf spot (GLS) is a common fungal disease in the United States caused by the pathogen Cercospora zeae-maydis in corn. Disease development is favored by warm temperatures, 80°F or 27 °C; and high humidity, relative humidity of 90% or higher for 12 hours or more. Cercospora zeae-maydis overwinters in corn residue, allowing inoculum to build up from year to year in fields. Cropping systems with reduced- or no-till and/or continuous corn are at higher risk for gray leaf spot outbreaks.',
    'Gray leaf spot lesions begin as small necrotic pinpoints with chlorotic halos, these are more visible when leaves are backlit. Coloration of initial lesions can range from tan to brown before sporulation begins. Because early lesions are ambiguous, they are easily confused with other foliar diseases such as anthracnose leaf blight, eyespot, or common rust. As infection progresses, lesions begin to take on a more distinct shape. Lesion expansion is limited by parallel leaf veins, resulting in the blocky shaped “spots”. As sporulation commences, the lesions take on a more gray coloration.',
    'https://www.pioneer.com/us/agronomy/gray_leaf_spot_cropfocus.html'
  ],
  'Corn (Maize): Common Rust of Maize': [
    'Common rust is caused by the fungus Puccinia sorghi. Late occurring infections have limited impact on yield. The fungus overwinters on plants in southern states and airborne spores are wind-blown to northern states during the growing season. Disease development is favored by cool, moist weather (60 – 70◦ F).',
    'Symptoms of common rust often appear after silking. Small, round to elongate brown pustules form on both leaf surfaces and other above ground parts of the plant. As the pustules mature they become brown to black. If disease is severe, the leaves may yellow and die early.',
    'https://fieldcrops.cals.cornell.edu/corn/diseases-corn/common-rust'
  ],
  'Corn (Maize): Northern Leaf Blight': [
    'Northern corn leaf blight caused by the fungus Exerohilum turcicum is a common leaf blight. If lesions begin early (before silking), crop loss can result. Late infections may have less of an impact on yield. Northern corn leaf blight is favored by wet humid cool weather typically found later in the growing season. Spores of the fungus that causes this disease can be transported by wind long distances from infected fields. Spread within and between fields locally also relies on wind blown spores.',
    'The tan lesions of northern corn leaf blight are slender and oblong tapering at the ends ranging in size between 1 to 6 inches. Lesions run parallel to the leaf margins beginning on the lower leaves and moving up the plant. They may coalesce and cover the enter leaf. Spores are produced on the underside of the leaf below the lesions giving the appearance of a dusty green fuzz.',
    'https://fieldcrops.cals.cornell.edu/corn/diseases-corn/northern-corn-leaf-blight'
  ],
  'Corn (Maize): Healthy': [
    'Your crops are healthy. You took good care of it.',
    'Healthy Crops',
    'Just take care of it as you usually do.'
  ],
  'Grape: Black Rot': [
    'Black rot is one of the most damaging diseases of grapes. The disease is caused by the fungus Guignardia bidwellii. The fungus can infect the leaves, shoots, berries, tendrils, rachises and cluster stems (peduncles) of grapes. If the disease is not managed early in the season, the impact on grape clusters can be devastating, resulting in complete crop losses.',
    'Disease development is favored by warm and humid weather. Symptoms of black rot first appear as small yellow spots on leaves. Enlarged spots (lesions) have a dark brownish-red border with tan to dark brown centers. As the infection develops, tiny black dots appear in the lesion, usually in a ring pattern near the border of the lesion. These dots are fungal structures (pycnidia), which contain thousands of spores (conidia) that can infect new tissue. New infections can occur in less than 10 hours at temperatures between 60 to 85 degrees Fahrenheit.',
    'https://ohioline.osu.edu/factsheet/plpath-fru-24'
  ],
  'Grape: Black Measles (Esca)': [
    'Grapevine measles, also called esca, black measles or Spanish measles, has long plagued grape growers with its cryptic expression of symptoms and, for a long time, a lack of identifiable causal organism(s). The name "measles" refers to the superficial spots found on the fruit. During the season, the spots may coalesce over the skin surface, making berries black in appearance. Spotting can develop anytime between fruit set and a few days prior to harvest.',
    'Leaf symptoms are characterized by a "tiger stripe" pattern when infections are severe from year to year. Mild infections can produce leaf symptoms that can be confused with other diseases or nutritional deficiencies. White cultivars will display areas of chlorosis followed by necrosis, while red cultivars are characterized by red areas followed by necrosis. Early spring symptoms include shoot tip dieback, leaf discoloration and complete defoliation in severe cases.',
    'https://grapes.extension.org/grapevine-measles'
  ],
  'Grape: Leaf Blight (Isariopsis Leaf Spot)': [
    'Common in tropical and subtropical grapes. The disease appear late in the season. Cynthiana and Cabernet Sauvignon are susceptible to this pathogen.',
    'On leaf surface we will see lesions which are irregularly shaped (2 to 25 mm in diameter). Initially lesions are dull red to brown in color turn black later. If disease is severe this lesions may coalesce. On berries we can see symptom similar to black rot but the entire clusters will collapse.',
    'https://plantvillage.psu.edu/topics/grape/infos'
  ],
  'Grape: Healthy': [
    'Your crops are healthy. You took good care of it.',
    'Healthy Crops',
    'Just take care of it as you usually do.'
  ],
  'Orange: Huanglongbing (Citrus Greening)': [
    'Huanglongbing (HLB) or citrus greening is the most severe citrus disease, currently devastating the citrus industry worldwide. The presumed causal bacterial agent Candidatus Liberibacter spp. affects tree health as well as fruit development, ripening and quality of citrus fruits and juice. Fruit from infected orange trees can be either symptomatic or asymptomatic. Symptomatic oranges are small, asymmetrical and greener than healthy fruit. Furthermore, symptomatic oranges show higher titratable acidity and lower soluble solids, solids/acids ratio, total sugars, and malic acid levels.',
    'In the early stages of the disease, it is difficult to make a clear diagnosis. McCollum and Baldwin (2017) noted that HLB symptoms are more apparent during cooler seasons, more so than in warmer months. It is uncertain how long a tree can be infected before showing the symptoms of the disease but, when it eventually becomes symptomatic, symptoms appear on different parts of the tree. Infected trees generally develop some canopy thinning, with twig dieback and discolored leaves, which appear in contrast to the other healthy or symptomless parts of the tree.',
    'https://www.frontiersin.org/articles/10.3389/fpls.2018.01976/full'
  ],
  'Peach: Bacterial spot': [
    'Bacterial spot affects peaches, nectarines, apricots, plums, prunes and cherries. The disease is widespread throughout all fruit growing states east of the Rocky Mountains. Bacterial spot can affect leaves, twigs, and fruit. Severe infection results in reduced fruit quality and yield. Fruit infection is most serious on late-maturing varieties. If proper environmental conditions occur, up to 50 percent or more of the fruit of susceptible varieties may have to be discarded.',
    'Small (1/25 to 1/5 inch) spots form in the leaves. Spots are irregular to angular and have a deep purple to rusty-brown or black color. In time, the centers dry and tear away leaving ragged "shot-holes". When several spots merge, the leaf may appear scorched, blighted or ragged. Badly infected leaves may turn yellow and drop early. Early defoliation is most common on trees deficient in nitrogen or where the disease is further complicated by pesticide injury.',
    'https://ohioline.osu.edu/factsheet/plpath-fru-38'
  ],
  'Peach: Healthy': [
    'Your crops are healthy. You took good care of it.',
    'Healthy Crops',
    'Just take care of it as you usually do.'
  ],
  'Bell Pepper: Bacterial Spot': [
    'Bacterial leaf spot, caused by Xanthomonas campestris pv. vesicatoria, is the most common and destructive disease for peppers in the eastern United States. It is a  gram-negative, rod-shaped bacterium that can survive in seeds and plant debris from one season to another. Different strains or races of the bacterium are cultivar-specific, causing disease symptoms in certain varieties due to stringent host specificity. Bacterial leaf spot can devastate a pepper crop by early defoliation of infected leaves and disfiguring fruit.',
    'Disease symptoms can appear throughout the above-ground portion of the plant, which may include leaf spot, fruit spot and stem canker. However, early symptoms show up as water-soaked lesions on leaves that can quickly change from green to dark brown and enlarge into spots that are up to 1/4 inch in diameter with slightly raised margins. Over time, these spots can dry up in less humid weather, which allows the damaged tissues to fall off, resulting in a tattered appearance on the affected leaves.',
    'https://extension.wvu.edu/lawn-gardening-pests/plant-disease/fruit-vegetable-diseases/bacterial-leaf-spot-of-pepper'
  ],
  'Bell Pepper: Healthy': [
    'Your crops are healthy. You took good care of it.',
    'Healthy Crops',
    'Just take care of it as you usually do.'
  ],
  'Potato: Early Blight': [
    'Common on tomato and potato plants, early blight is caused by the fungus Alternaria solani. Symptoms first appear on the lower, older leaves as small brown spots with concentric rings that form a "bull’s eye" pattern. As the disease matures, it spreads outward on the leaf surface causing it to turn yellow, wither and die. Eventually the stem, fruit and upper portion of the plant will become infected. Crops can be severely damaged.',
    'Early blight overwinters on infected plant tissue and is spread by splashing rain, irrigation, insects and garden tools. The disease is also carried on tomato seeds and in potato tubers. In spite of its name, early blight can occur any time throughout the growing season. High temperatures (80-85˚F.) and wet, humid conditions promote its rapid spread. In many cases, poorly nourished or stressed plants are attacked.',
    'https://www.planetnatural.com/pest-problem-solver/plant-disease/early-blight'
  ],
  'Potato: Late Blight': [
    'Late blight (Phytophthora infestans) fungus is in the same genus as the fungus causing pink rot (P. erythroseptica). Late blight was responsible for the Irish potato famine in the mid-nineteenth century (Daly, 1996). In the late twentieth century, there have been major re-occurrences and concern around the world over this pathogen and its disease due to recent mutations (Fry and Goodwin, 1997). These mutations, most notably strain US-8, have made the pathogen resistant to control by metalaxyl, the stand-by fungicide for many years.',
    'Late blight will first appear as water-soaked spots, usually at the tips or edges of lower leaves where water or dew tends to collect. Under moist, cool conditions, water-soaked spots rapidly enlarge and a broad yellow halo may be seen surrounding the lesion (Mohan et al., 1996). On the leaf underside, a spore-producing zone of white moldy growth approximately 0.1 - 0.2 inches wide may appear at the border of the lesion. Under continuously wet conditions, the disease progresses rapidly and warm, dry weather will slow or stop disease development.',
    'https://cropwatch.unl.edu/potato/late_blights'
  ],
  'Potato: Healthy': [
    'Your crops are healthy. You took good care of it.',
    'Healthy Crops',
    'Just take care of it as you usually do.'
  ],
  'Raspberry: Healthy': [
    'Your crops are healthy. You took good care of it.',
    'Healthy Crops',
    'Just take care of it as you usually do.'
  ],
  'Rice: Brown Spot': [
    'Brown Spot is called as sesame leaf spot or Helminthosporiose or fungal blight. The fungus attacks the crop from seedling in nursery to milk stage in main field.',
    'The disease appears first as minute brown dots, later becoming cylindrical or oval to circular (resemble sesame seed). Spots measures 0.5 to 2.0mm in breadth - coalesce to form large patches. Then several spots coalesce and the leaf dries up. Infection also occurs on panicle, neck with brown colour appearance. Seeds also infected (black or brown spots on glumes spots are covered by olivaceous velvety growth)',
    'http://www.agritech.tnau.ac.in/expert_system/paddy/cpdisbrownspot.html'
  ],
  'Rice: Hispa': [
    'The mining of the grubs will be clearly seen on the leaves. Scraping of the upper surface of the leaf blade leaving only the lower epidermis as white streaks parallel to the midrib. Tunneling of larvae through leaf tissue causes irregular translucent white patches that are parallel to the leaf veins. Damaged leaves wither off. Rice field appears burnt when severely infested.',
    'The grub mines into the leaf blade and feed on the green tissue between the veins. Adults also feed in the green tissue; they scrape green matter of the tender leaves. Generally the plants are affected in the young stage.',
    'http://www.agritech.tnau.ac.in/expert_system/paddy/cppests_ricehispa.html'
  ],
  'Rice: Leaf Blast': [
    'Blast, also called rotten neck, is one of the most destructive diseases of Missouri rice. Losses due to this disease have been on the increase since 2000. Blast does not develop every year but is very destructive when it occurs. Rice blast can be controlled by a combination of preventive measures and foliar fungicides applied when rice is in the late boot stage and again when it is 80 to 90 percent headed.',
    'Blast symptoms can occur on leaves, leaf collars, nodes and panicles. Leaf spots are typically elliptical (football shaped), with gray-white centers and brown to red-brown margins. Fully developed leaf lesions are approximately 0.4 to 0.7 inch long and 0.1 to 0.2 inch wide. Both the shape and the color vary depending on the environment, age of the lesion and rice variety. Lesions on leaf sheaths, which rarely develop, resemble those on leaves.',
    'https://extension.missouri.edu/publications/mp645'
  ],
  'Rice: Healthy': [
    'Your crops are healthy. You took good care of it.',
    'Healthy Crops',
    'Just take care of it as you usually do.'
  ],
  'Soybean: Healthy': [
    'Your crops are healthy. You took good care of it.',
    'Healthy Crops',
    'Just take care of it as you usually do.'
  ],
  'Squash: Powdery Mildew': [
    'Powdery mildew, mainly caused by the fungus Podosphaera xanthii, infects all cucurbits, including muskmelons, squash, cucumbers, gourds, watermelons and pumpkins. In severe cases, powdery mildew can cause premature death of leaves, and reduce yield and fruit quality.',
    'The first sign of powdery mildew is pale yellow leaf spots. White powdery spots can form on both upper and lower leaf surfaces, and quickly expand into large blotches. The large blotches can cover entire leaf, petiole and stem surfaces. When powdery mildew infects the majority of the foliage, the plant weakens and the fruit ripens prematurely.',
    'https://extension.umn.edu/diseases/powdery-mildew-cucurbits'
  ],
  'Strawberry: Leaf Scorch': [
    'In addition to leaves, leaf scorch (Diplocarpon earlianum) can infect petioles, runners, fruit stalks and berry caps. If unchecked, plants can be significantly weakened reducing the growth of all plant parts. Severely infected plants are weakened and can die from other stresses such as drought or extreme temperatures.',
    'Dark purple, angular to round spots appear on the upper surface of the leaf. As the disease progresses the tissues around these spots turn reddish or purple. In severe cases, the infected area dries to a tan color and the leaf curls upward looking scorched. Lesions remain reddish purple and do not turn tan or gray in the center.',
    'https://extension.umn.edu/fruit/growing-strawberries-home-garden#gray-mold%2C-leaf-blight%2C-leaf-scorch-and-leaf-spot--1008160'
  ],
  'Strawberry: Healthy': [
    'Your crops are healthy. You took good care of it.',
    'Healthy Crops',
    'Just take care of it as you usually do.'
  ],
  'Tomato: Bacterial Spot': [
    'Bacterial spot can be a devastating disease when the weather is warm and humid. The disease can affect all above-ground parts of tomato and pepper plants: stems, petioles, leaves, and fruits. Fruit spots commonly result in unmarketable fruit, not only for fresh market but also for processing because the spots make the fruit difficult to peel.',
    'Tomato leaves have small (<1/8 inch), brown, circular spots surrounded by a yellow halo. The center of the leaf spots often falls out resulting in small holes. Small, brown, circular spots may also occur on stems and the fruit calyx. Fruit spots are ¼ inch, slightly raised, brown and scabby. Tomato fruit often have a waxy white halo surrounding the fruit spot.',
    'https://extension.umn.edu/diseases/bacterial-spot-tomato-and-pepper'
  ],
  'Tomato: Early Blight': [
    'Early blight is one of the most common tomato diseases, occurring nearly every season wherever tomatoes are grown. It affects leaves, fruits and stems and can be severely yield limiting when susceptible cultivars are used and weather is favorable. Severe defoliation can occur and result in sunscald on the fruit. Early blight is common in both field and high tunnel tomato production in Minnesota.',
    'Initially, small dark spots form on older foliage near the ground. Leaf spots are round, brown and can grow up to half inch in diameter. Larger spots have target-like concentric rings. The tissue around spots often turns yellow. Severely infected leaves turn brown and fall off, or dead, dried leaves may cling to the stem.',
    'https://extension.umn.edu/diseases/early-blight-tomato'
  ],
  'Tomato: Late Blight': [
    'Late blight is a potentially devastating disease of tomato and potato, infecting leaves, stems and fruits of tomato plants. The disease spreads quickly in fields and can result in total crop failure if untreated. Late blight of potato was responsible for the Irish potato famine of the late 1840s.',
    'Leaves have large, dark brown blotches with a green gray edge; not confined by major leaf veins. Infections progress through leaflets and petioles, resulting in large sections of dry brown foliage. Stem infections are firm and dark brown with a rounded edge.',
    'https://extension.umn.edu/diseases/late-blight'
  ],
  'Tomato: Leaf Mold': [
    'Leaf mold is not normally a problem in field-grown tomatoes in northern climates. It can cause losses in tomatoes grown in greenhouses or high tunnels due to the higher humidity found in these environments. Foliage is often the only part of the plant infected and will cause infected leaves to wither and die, indirectly affecting yield. In severe cases, blossoms and fruit can also be infected, directly reducing yield.',
    'The oldest leaves are infected first. Pale greenish-yellow spots, usually less than 1/4 inch, with no definite margins, form on upper sides of leaves. Olive-green to brown velvety mold forms on the lower leaf surface below leaf spots. Leaf spots grow together and turn brown. Leaves wither and die but often remain attached to the plant.',
    'https://extension.umn.edu/diseases/leaf-mold-tomato'
  ],
  'Tomato: Septoria Leaf Spot': [
    'Septoria leaf spot is a very common disease of tomatoes. It is caused by a fungus (Septoria lycopersici) and can affect tomatoes and other plants in the Solanaceae family, especially potatoes and eggplant, just about anywhere in the world. Although Septoria leaf spot is not necessarily fatal for your tomato plants, it spreads rapidly and can quickly defoliate and weaken the plants, rendering them unable to bear fruit to maturity.',
    'Septoria leaf spots start off somewhat circular and first appear on the undersides of older leaves, at the bottom of the plant. They are small, 1/16 to 1/8 inches (1.6 to 3.2 millimeters) in diameter, with a dark brown margin and lighter gray or tan centers. A yellow halo may surround the spot.',
    'https://www.thespruce.com/identifying-and-controlling-septoria-leaf-spot-of-tomato-1402974'
  ],
  'Tomato: Spider Mites (Two-spotted Spider Mite)': [
    'Many species of the spider mite (family: Tetranychidae), so common in North America, attack both indoor and outdoor plants. They can be especially destructive in greenhouses. Spider mites are not true insects, but are classed as a type of arachnid, relatives of spiders, ticks and scorpions.',
    'Spider mites, almost too small to be seen, pass into our gardens without notice. No matter how few, each survives by sucking material from plant cells. Large infestations cause visible damage. Leaves first show patterns of tiny spots or stipplings. They may change color, curl and fall off. The mites activity is visible in the tight webs that are formed under leaves and along stems.',
    'https://www.planetnatural.com/pest-problem-solver/houseplant-pests/spider-mite-control'
  ],
  'Tomato: Target Spot': [
    'Also known as early blight, target spot of tomato is a fungal disease that attacks a diverse assortment of plants, including papaya, peppers, snap beans, potatoes, cantaloupe, and squash as well as passion flower and certain ornamentals. Target spot on tomato fruit is difficult to control because the spores, which survive on plant refuse in the soil, are carried over from season to season.',
    'Target spot on tomato fruit is difficult to recognize in the early stages, as the disease resembles several other fungal diseases of tomatoes. However, as diseased tomatoes ripen and turn from green to red, the fruit displays circular spots with concentric, target-like rings and a velvety black, fungal lesions in the center. The "targets" become pitted and larger as the tomato matures.',
    'https://www.gardeningknowhow.com/edible/vegetables/tomato/target-spot-on-tomatoes.htm'
  ],
  'Tomato: Yellow Leaf Curl Virus': [
    'Tomato yellow leaf curl virus is undoubtedly one of the most damaging pathogens of tomato, and it limits production of tomato in many tropical and subtropical areas of the world. It is also a problem in many countries that have a Mediterranean climate such as California. Thus, the spread of the virus throughout California must be considered as a serious potential threat to the tomato industry.',
    'Infected tomato plants initially show stunted and erect or upright plant growth; plants infected at an early stage of growth will show severe stunting. However, the most diagnostic symptoms are those in leaves.',
    'https://www2.ipm.ucanr.edu/agriculture/tomato/tomato-yellow-leaf-curl'
  ],
  'Tomato: Mosaic Virus': [
    'Tomato mosaic virus (ToMV) and  Tobacco mosaic virus (TMV) are hard to distinguish. Tomato mosaic virus (ToMV) can cause yellowing and stunting of tomato plants resulting in loss of stand and reduced yield. ToMV may cause uneven ripening of fruit, further reducing yield.',
    'Mottled light and dark green on leaves. If plants are infected early, they may appear yellow and stunted overall. Leaves may be curled, malformed, or reduced in size. Spots of dead leaf tissue may become apparent with certain cultivars at warm temperatures. Fruits may ripen unevenly. Reduced fruit number and size.',
    'https://extension.umn.edu/diseases/tomato-mosaic-virus-and-tobacco-mosaic-virus'
  ],
  'Tomato: Healthy': [
    'Your crops are healthy. You took good care of it.',
    'Healthy Crops',
    'Just take care of it as you usually do.'
  ]
};
