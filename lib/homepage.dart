import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = false;
  var loadingPercentage = 0;

  bool get isLoading => _isLoading;

  set isLoading(bool newValue) {
    setState(
      () => _isLoading = false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.blue,
      body: SafeArea(
        child: Stack(
          children: [
            WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: 'https://www.swipetelecom.com.ng/login',
              navigationDelegate: (NavigationRequest request) async{
                print("object");
                if(request.url.startsWith("https://api.whatsapp.com/send?phone")){
                //   List<String> urlSplitted = request.url.split("&text=");
                //
                //   String phoneNumber = "08142602528";
                //   String message = urlSplitted.last.toString().replaceAll("%20",  " ");
                //   Uri uri = Uri(
                //     scheme: 'https',
                //     path: "https://wa.me/$phoneNumber/?text=${Uri.parse(message)}"
                //   );
                //   if(await canLaunchUrl(uri)){
                //     await launchUrl(uri,mode: LaunchMode.externalApplication);
                //   } else {
                //     throw "Could not launch WhatsApp";
                //   }
                //   // await _launchUrl();
                  return NavigationDecision.prevent;
                }
                return NavigationDecision.navigate;
              },
              onPageStarted: (url) => setState(
                () => loadingPercentage = 0,
              ),
              onProgress: (progress) => setState(
                () => loadingPercentage = progress,
              ),
              onPageFinished: (url) => setState(
                () => loadingPercentage = 100,
              ),
            ),
            if (loadingPercentage < 100)
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
  _launchUrl(String url) async{
    if(await canLaunchUrl(Uri.parse(url))){
      await launchUrl(Uri.parse(url),mode: LaunchMode.externalApplication);
    } else {
      throw "Could not launch WhatsApp";
    }
  }
}