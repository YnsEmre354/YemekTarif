/*import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: const RecipePage(),
    );
  }
}

class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainPage(selectedIndex: 0);
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainPage(selectedIndex: 1);
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainPage(selectedIndex: 2);
  }
}

class MainPage extends StatefulWidget {
  final int selectedIndex;

  const MainPage({super.key, required this.selectedIndex});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _pages = const [
    RecipePageContent(),
    ProfilePageContent(),
    SettingsPageContent(),
  ];

  void _onItemTapped(int index) {
    if (index != widget.selectedIndex) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainPage(selectedIndex: index),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8DC),
      body: _pages[widget.selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          _buildNavBarItem(Icons.home, "Home"),
          _buildNavBarItem(Icons.person, "Profile"),
          _buildNavBarItem(Icons.settings, "Settings"),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavBarItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}

class RecipePageContent extends StatelessWidget {         //////// butonlar
  const RecipePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildCard(
            context,
            title: "Tarif Gir",
            subtitle: "Keşfettiğin lezzetleri paylaş.",
            icon: Icons.restaurant_menu,
            gradient: const LinearGradient(colors: [Colors.orange, Colors.deepOrange]),
            onTap: () {},
          ),
          const SizedBox(height: 20),
          _buildCard(
            context,
            title: "Tariflerim",
            subtitle: "Kendi tarif arşivini oluştur.",
            icon: Icons.book,
            gradient: const LinearGradient(colors: [Colors.deepOrange, Colors.red]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyRecipesPage()),
              );
            },
          ),
          const SizedBox(height: 20),
          _buildCard(
            context,
            title: "Favori Tariflerim",
            subtitle: "En sevdiğin tariflere hızlıca ulaş.",
            icon: Icons.favorite,
            gradient: const LinearGradient(colors: [Colors.pink, Color.fromARGB(255, 153, 5, 123)]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavoriteRecipesPage()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context,
      {required String title,
      required String subtitle,
      required IconData icon,
      required Gradient gradient,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 40),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class MyRecipesPage extends StatelessWidget {        //// TARİFLERİM SAYFASI
  const MyRecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> recipes = [
      {
        "title": "Karnıyarık",
        "description":
            "Patlıcanları alacalı şekilde soyun ve uzunlamasına ikiye kesin. Tuzlu suda bekletip acısının çıkmasını sağlayın.Yeşil biberleri yıkayıp doğrayın. Domatesleri rendeleyin veya küp küp doğrayın. Sarımsakları ezin.Tuzlu suda beklettiğiniz patlıcanları durulayın ve kağıt havlu ile kurulayın. Derin yağda arkalı önlü kızartın.Bir tavada sıvı yağı ısıtın. Kıymayı ekleyip kıyma suyunu salıp çekene kadar kavurun.Kıyma kavrulunca doğranmış yeşil biberleri ekleyin ve biberler yumuşayana kadar kavurmaya devam edin.Ardından rendelenmiş veya doğranmış domatesleri, ve salçayı ekleyin. Malzemeler iyice karışana kadar pişirip Bizim Mutfak Köfte Harcı’nı ekleyin.Patlıcanların ortasını hafifçe bastırarak açın ve içlerine hazırladığınız kıymalı karışımı paylaştırın.Patlıcanları fırın tepsisine yerleştirin. Üzerlerine sıcak suyu ve salçayı karıştırıp ekleyin ekleyin.Önceden ısıtılmış 180 derece fırında, patlıcanlar iyice yumuşayana kadar pişirin (yaklaşık 30-40 dakika), karnıyarıklar fırından çıktıktan sonra sıcak servis yapabilirsiniz. İsteğe bağlı olarak üzerine maydanoz serpebilirsiniz. Afiyet olsun."
      },
      {
        "title": "Mercimek Çorbası",
        "description":
            "Bir tencereye sıvı yağı al ve üzerine iri iri doğranmış soğanı ekle.Soğanlar biraz kavruldukta sonra yine iri iri doğradığın patates ve havuçları da tencereye al.Mercimeği bol suyla güzelce yıkayıp sebzelerin üzerine boşalt. Bu esnada arzu ettiğin miktarda tuz ve karabiberi de ekle.Birkaç tur karıştırıp son olarak 6 bardak sıcak suyu ilave et. Elinde tavuk ya da et suyu varsa 4 bardak sıcak su, 2 bardak et suyu da ilave edebilirsin.Suyunu eklediğin çorbanın kapağını kapatıp sebzeler yumuşayıncaya kadar pişir.Pişen çorbayı blender’dan geçir ki pürüzsüz, leziz mercimek çorbası tarifi hazır hale gelsin.Çorban piştikten sonra ona renk ve tat katmak için dilersen biraz salça ve tereyağını kavurup azıcık suyla açabilir, çorbana ekleyebilirsin."
      },
      {
        "title": "Trileçe",
        "description":
            "İlk olarak yumurta akı ve sarısını ayırarak farklı kaplar içerisine alın. Sonrasında yumurta akı ve şekeri köpük hâlini alana kadar çırpıcı yardımıyla karıştırın.Hazırladığınız kremamsı köpük içerisine yumurta sarısını ekleyerek bir spatula yardımıyla yavaşça karıştırın.Kabartma tozu, vanilya, sıvı yağ, su ve unu ekleyerek karışımı çırpmaya devam edin.Yağlanmış bir fırın kabı içerisine karışımı dökün ve 160 derecede 20 dakika kadar pişmeye bırakın.Karamel sosu hazırlamak için sos tavasını ocağa alın. Şekeri, kahverengi renk alana kadar karıştırın. Sonrasında krema ve tereyağını ekleyerek pürüzsüz bir karamel sos elde edin.Keki fırından çıkarıp bir süre soğumaya bıraktıktan sonra bir kürdan yardımıyla delin.Sütlü sosu yine farklı bir sos tavası içerisinde hazırlayın. Tüm ürünler özdeşleşip krema kıvam aldıktan sonra soğumuş kekin üstüne dökün.Kek ve krema tabanının üstüne karamelli sosu dökün ve dağıtın."
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Tariflerim")),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepOrange, Colors.red],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return _buildRecipeCard(
              context,
              title: recipes[index]["title"]!,
              description: recipes[index]["description"]!,
            );
          },
        ),
      ),
    );
  }

  Widget _buildRecipeCard(BuildContext context,
      {required String title, required String description}) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(description, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}

class FavoriteRecipesPage extends StatelessWidget {        ///// FAVORİ TARİFLERİM SAYFASI
  const FavoriteRecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> favoriteRecipes = [
      {
        "title": "Etliekmek",
        "description":
            "Yaş mayayı biraz ılık suda eritin ve unu ekleyin. Kıvamına göre su ekleyin.Hamur, ekmek hamuru kıvamında olacak (ne sert, ne yumuşak) 30-40 dakika kadar hamuru dinlenmeye bırakın.Küçük küçük kesilmis soğan, domates ve biberi kıymaya ekleyip yoğurun.arım çay bardağı sıvı yağ dökün (harcı yumuşak olacak, köfte gibi değil).Baharatları da ekleyip karıştırın.Hamuru beze haline getirin ve isterseniz tüm tepsiye göre, isterseniz de resimdeki gibi ince bir şekilde açın.Harcından üzerine yayın.220 derecede kızarana kadar pişirin.Üzerini maydanoz ile süsleyerek servis yapın."
      },
      {
        "title": "Akçadağ Köftesi", 
        "description": "Bir kap içerisine aldığımız iri bulgurların üzerine tuz ve sıcak suyu ekleyerek üzerini bir kapak koyuyoruz ve suyunu çekmesi için dinlenmeye bırakıyoruz.İç hazırlamak üzere yağı kızarttıktan sonra üzerine soğanları ekliyoruz ve soğanlar pembeleşinceye kadar kavuruyoruzOcak orta ateşteyken soğanların üzerine salçayı, tuzu, karabiber, kırmızı pul biber, kırmızı toz biber ve kekik ekleyerek karıştırdıktan sonra kıymayı ekleyip hafif pişiriyoruz.Hamurun yapılışı , bulgur suyunu çektikten sonra üzerine iki yumurta kırıp iyice harmanlıyoruz ardından unumuzu kontrollü bir şekilde ekleyerek karıştırıyoruz (Bulgurun her yeri unlanmış olmalı)Yanımızda bulundurduğumuz bir miktar su ile elimizi ıslatarak hamuru 15 dakika yoğuruyoruz ( En son kısmını anlamak için mandalina büyüklüğünde bir parça alıp avucumuzda yuvarlıyoruz sonrada leğenin dibine sertçe atıyoruz eğer çatlama yoksa kıvamına gelmiştir. )Mandalina büyüklüğünde bir parça alıyoruz avucumuzda yuvarlayıp şekil verdikten sonra baş parmağımızla bir delik açıp yuvarlıyoruz derinliği ayarladıktan sonra işaret parmağıyla da iyice kenarlarını incelmek için avumucumuz da çeviriyoruz kenarları inceldikten sonra içine bir yemek kaşığı iç harcını koyup ağzını yuvarlayarak topluyoruz.Bir derin tencereye su koyup kaynatıyoruz, kaynadıktan sonra içine bir yemek kaşığı tuz koyuyoruz. (Buda köfte kaynarken dağılmasını engeller. Köfteleri 20 dakika süre ile pişirmeniz yeterli olacaktır. )Piştikten sonra bir tavaya üzeri için 250 gr tereyağ veya margarin yağı hangisini isterseniz kullanabilirsiniz, yağı eritiyoruz içine 2 yemek kaşığı salça koyup kavuruyoruz sonra pişen köftelerin üzerine gezdiriniz. Köfteler hazır afiyet olsun."},
      {
        "title": "İzmir Bombası",
        "description":
            "Un hariç tüm malzemeleri derin bir kaba alın. Unu kontrollü ekleyip ele yapışmayan yumuşak bir hamur elde edin.Üzerini kapatarak 15 dk. Hamuru dinlendirin. Dinlenen hamuru tezgaha alın ve ceviz büyüklüğünde parçalara ayırıp yuvarlayın.Merdane yardımıyla her bir bezeyi avuç içinden biraz büyük olacak şekilde açın. Ortasına bir tatlı kaşığı çikolata koyun.Hamuru kenarlarından toplayarak kapatın. Ucunda fazla kalan hamuru koparın. Uçlarından artan hamurları da birleştirip aynı şekilde hazırlayın.Hamurları ters çevirin ve yağlı kağıt serili fırın tepsisine dizin. Önceden ısıtılmış 220 derecelik fırında 6-7 dk pişirin. Üzerinde pembe benekler olmaya başlayınca fırından alın.Çok çabuk piştiği için kontrollü pişirin. Üzerine pudra şekeri serpip servis edebilirsiniz. Afiyet olsun."
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Favori Tariflerim")),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink, Color.fromARGB(255, 153, 5, 123)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          itemCount: favoriteRecipes.length,
          itemBuilder: (context, index) {
            return _buildFavoriteCard(
              context,
              title: favoriteRecipes[index]["title"]!,
              description: favoriteRecipes[index]["description"]!,
            );
          },
        ),
      ),
    );
  }

  Widget _buildFavoriteCard(BuildContext context,
      {required String title, required String description}) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(description, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}

class ProfilePageContent extends StatelessWidget {
  const ProfilePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 50,
            //backgroundImage: AssetImage(""),  ///// RESİM YOK ICON KOY 
          ),
          const SizedBox(height: 20),
          Text("Kullanıcı Adı", style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 10),
          Text("kullanici@mail.com", style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class SettingsPageContent extends StatelessWidget {           //////////// AYARLAR
  const SettingsPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text("Dil Ayarları"),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text("Şifreyi Değiştir"),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Çıkış Yap"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}*/