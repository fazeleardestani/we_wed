class ServiceModel {
  final int id;
  final String name;
  final String address;
  final String category;
  final String city;
  final String phoneNumber;
  final String image;

  ServiceModel({
    required this.id,
    required this.name,
    required this.address,
    required this.category,
    required this.city,
    required this.phoneNumber,
    required this.image,
  });

  // ServiceModel({
  //   int? id,
  //   String? name,
  //   String? address,
  //   String? category,
  //   String? city,
  //   String? phoneNumber,
  //   String? image,
  // })  : id = id ?? 0,
  //       name = name ?? "",
  //       address = address ?? "",
  //       category = category ?? "",
  //       city = city ?? "",
  //       phoneNumber = phoneNumber ?? "",
  //       image = image ?? "";

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      category: json['category'],
      city: json['city'],
      phoneNumber: json['phoneNumber'],
      image: json['image'],
    );
  }
}

List<ServiceModel> services = [
  ServiceModel(
    id: 1,
    name: "تالار امرالد استار",
    address:
        "نارمک، بالاتر از میدان نبوت، مجتمع تجاری امرالد استار، طبقه چهارم و پنجم",
    category: "تالار",
    city: "تهران",
    phoneNumber: "021-96668556",
    image: "https://www.talarkadeh.com/wp-content/uploads/em-5.jpeg",
  ),
  ServiceModel(
    id: 2,
    name: "تالار هتل پرشین پلازا",
    address: "خیابان سهروردی خیابان میرزایی زینالی شرقی",
    category: "تالار",
    city: "تهران",
    phoneNumber: "021-88432974",
    image:
        "https://www.talarkadeh.com/wp-content/uploads/WhatsApp-Image-2021-07-10-at-02.56.13.jpeg",
  ),
  ServiceModel(
    id: 3,
    name: "تالار باغ بهشت",
    address:
        "اتوبان بابایی شرق، خیابان هنگام جنوب، نبش میدان هنگام، خیابان یا مهدی",
    category: "تالار",
    city: "تهران",
    phoneNumber: "021-22986511",
    image:
        "https://www.talarkadeh.com/wp-content/uploads/2022/08/bagh-behesht-1.jpg",
  ),
  ServiceModel(
    id: 4,
    name: "تالار پارسیس",
    address: "بزرگراه آیت اله سعیدی",
    category: "تالار",
    city: "تهران",
    phoneNumber: "021-55251818",
    image:
        "https://www.talarkadeh.com/wp-content/uploads/parsis-talarkadeh-12.webp",
  ),
  ServiceModel(
    id: 5,
    name: "تالار پذیرایی عمارت شمس",
    address: "همت شرق به غرب، بعد از پل اشرفی اصفهانی، ابتدای خروجی بلوار عدل",
    category: "تالار",
    city: "تهران",
    phoneNumber: "021-46134395",
    image: "https://www.talarkadeh.com/wp-content/uploads/5-6.jpg",
  ),
  ServiceModel(
    id: 6,
    name: "باغ تالار دارایی",
    address: "تهرانپارس - خیابان استخر - باشگاه پذیرایی دارایی",
    category: "تالار",
    city: "تهران",
    phoneNumber: "021-77363194",
    image: "https://www.talarkadeh.com/wp-content/uploads/daraii-4.jpeg",
  ),
  ServiceModel(
    id: 7,
    name: "تالار عروسی لوتوس",
    address: "کرج، جهانشهر، بلوار جمهوری شمالی، ماهان غربی، تالار لوتوس",
    category: "تالار",
    city: "کرج",
    phoneNumber: "026-34447070",
    image:
        "https://talareto.com/wp-content/uploads/2023/10/Lobby-of-Lotus-Bride-Hall.jpg",
  ),
  ServiceModel(
    id: 8,
    name: "تالار عروسی لوکس اسپیدا",
    address:
        "کرج، مهرویلا، خیابان درختی، سه راه تهران، نبش بزرگ مهر‌غربی، تالار عروسی لوکس اسپیدا کرج",
    category: "تالار",
    city: "کرج",
    phoneNumber: "026-33505001",
    image:
        "https://talareto.com/wp-content/uploads/2023/10/Luxury-wedding-hall-Spida-Karaj.jpg",
  ),
  ServiceModel(
    id: 9,
    name: "تالار مجلل پارس",
    address:
        "کرج، گوهر دشت، فلکه 1، رجایی شهر، به سمت مطهری، نبش کوچه 4 شرقی، تالار پارس",
    category: "تالار",
    city: "کرج",
    phoneNumber: "026-34454861",
    image:
        "https://talareto.com/wp-content/uploads/2023/10/Pars-luxury-hall.jpg",
  ),
  ServiceModel(
    id: 10,
    name: "تالار لیان",
    address:
        "کرج، رجایی شهر، فلکه 1 به سمت مطهری، روبروی پاساژ ملاصدرا، جنب املاک خشت، تالار لیان",
    category: "تالار",
    city: "کرج",
    phoneNumber: "026-34488930",
    image: "https://talareto.com/wp-content/uploads/2023/10/Lian-Hall.jpg",
  ),
  ServiceModel(
    id: 11,
    name: "تالار قصر بابابزرگ",
    address:
        "کرج، بالاتر از میدان امام حسین، بلوار چمران، روبروی دانشکده کشاورزی، تالار قصر بابابزرگ",
    category: "تالار",
    city: "کرج",
    phoneNumber: "026-32215454",
    image:
        "https://talareto.com/wp-content/uploads/2023/10/Baba-Bozur-palace-hall.jpg",
  ),
  ServiceModel(
    id: 12,
    name: "تالار پذیرایی ارم",
    address: "کمالشهر، بعداز پلیس راه چهارباغ، گلستان ششم",
    category: "تالار",
    city: "کرج",
    phoneNumber: "09127676174",
    image:
        "https://talareto.com/wp-content/uploads/2023/10/Aram-reception-hall.jpg",
  ),
  ServiceModel(
    id: 13,
    name: "تالار ماهان",
    address:
        "جاده فردیس، روبروی شهرداری فردیس، انتهای خیابان پارک، منظریه، خیابان مریم، تالار ماهان",
    category: "تالار",
    city: "کرج",
    phoneNumber: "026-36635993",
    image:
        "https://talareto.com/wp-content/uploads/2023/10/Mahan-Karaj-Hall.jpg",
  ),
];
// }
