 #### Flutter App Screenshots
  
  #### Note 
    read all file before donig anything 
  
<table>
   
  <tr>
    <td><img src="https://github.com/ahmedelbagory332/flutter_notification/blob/master/screenShots/1.jpg" width=270 height=480></td>
    <td><img src="https://github.com/ahmedelbagory332/flutter_notification/blob/master/screenShots/2.jpg" width=270 height=480></td>
    <td><img src="https://github.com/ahmedelbagory332/flutter_notification/blob/master/screenShots/3.jpg" width=270 height=480></td>
  </tr>
 </table>


## Getting Started

This project is a sample example for pushing payload notification and i will put all links which i learned from 
this project works perfectly on android platform but for ios i have not the requirement for it

# setp 1 

    add your project on firebase and make its settings 

# setp 2
<pre>
add these plugins : 
      firebase_messaging: ^7.0.3
      dio: ^3.0.10
      flutter_local_notifications: ^3.0.3
   in pubspec.yaml file
</pre>


# setp 3
<pre>
now we have to create 2 file in this path (your project name/android/app/src/main/kotlin/your package name/)
    first file is jave class which name is FirebaseCloudMessagingPluginRegistrant (dont worry about red error)
    this calss to register plugins with native paltForm and for run this class we will create the second file in the same path 
    it will be another jave class called Application it will extends FlutterApplication and implements PluginRegistrantCallback
</pre>

# setp 4
<pre>
open AndroidManifest file in this path (your project name/android/app/src/main/AndroidManifest)
    put these two permission 
          - android.permission.INTERNET
          - android.permission.VIBRATE
    and go to application tag and change  android:name="" to  android:name=".Application"
    and inside activity tag put intent filter 
                 with action: FLUTTER_NOTIFICATION_CLICK and category android.intent.category.DEFAULT
       dont worry if you dont know how to put  intent filter  you find everything in the links        
</pre>

# setp 5
<pre>
in this step i create dart calss NotificationHelper which has all methods:
    -  uploadDevice this method to upload data like user mail and device token  
    - showNotificationWithDefaultSound this method to show notification
    - onSelectNotification this method to navigate when notification clicked
    
  we have two constructor:
   - main constructor which declared all variables in the class
   - named constructor which declared some variables in the class for back ground notification
</pre>
  
# setp 6
<pre>
this is step is very important i have uplaod my server file in php which is responsible for sending notification
 - Config.php this is important file which has data base info like host name and DB name ..etc and has FIREBASE_API_KEY this key you can get from your fire base project setting
  this key very important for sending notification the rest of the files if you not good in php we will need a backend developer with you
</pre>

# Links

You will notice some similarities in some lines between this project and these links because</br>
I did not rely on only one source until I was able to complete the project in this way.</br>
[Link 1 ](https://github.com/FirebaseExtended/flutterfire/blob/111c5b02945b3668016bb55b14e88a637769a1b3/packages/firebase_messaging/README.md#optionally-handle-background-messages)</br>
[Link 2 ](https://codesundar.com/flutter-push-notification/)</br>
[Link 3 ](https://www.freecodecamp.org/news/how-to-add-push-notifications-to-flutter-app/)</br>
[Link 4 ](https://www.djamware.com/post/5e4b26e26cdeb308204b427f/flutter-tutorial-firebase-cloud-messaging-fcm-push-notification#flutterfire-firebase_messaging)</br>


