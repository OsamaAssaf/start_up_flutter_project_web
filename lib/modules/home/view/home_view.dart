import 'package:image_picker/image_picker.dart';

import '../../../resources/helpers/all_imports.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const DrawerHome(),
      body: Center(
        child: FilledButton(
          onPressed: () async {
            try {
              final ImagePicker picker = ImagePicker();
              final XFile? image = await picker.pickImage(source: ImageSource.gallery);
              if (image == null) return;
              if (context.mounted) {
                final CroppedFile? croppedFile =
                    await Components.cropImage(context, path: image.path);
                print(croppedFile);
              }
            } catch (e) {
              rethrow;
            }
          },
          child: const Text('Pick'),
        ),
      ),
    );
  }
}
