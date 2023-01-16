# Tech Virtual Museum  :classical_building:

Mobile app of a museum that allows users to scan a QR Code next to every item of the museum. When a QR is scanned, the app displays information about the corresponding object.
Additionally, users can see a list of upcoming events at the museum, with their respective information, date and price and book tickets to visit the museum.

## :ok: Project state
Finished first version

## Technologies
Below are the technologies used for developing this version, which corresponds to the native iOS version of the app.
* <img src="https://images.squarespace-cdn.com/content/v1/558def25e4b0fc259f066636/1533603278905-AVZ8RD2X0YCPY0N3VGRZ/Swift_logo.png?format=1000w" alt="Swift" width="30"/> &ensp; **Swift** - Programming language designed by Apple, used for developing iOS, macOS, watchOS, tvOS and iPadOS applications.
* <img src="https://developer.apple.com/assets/elements/icons/swiftui/swiftui-96x96_2x.png" alt="SwiftUI" width="32"/> &ensp; **SwiftUI** - Framework for building user interfaces  for iOS, macOS, watchOS, tvOS and iPadOS applications.
* <img src="https://miro.medium.com/max/400/1*JktK87FL_sqDDnuxHxe6Fw.png" alt="Firebase" width="32"/> &ensp; **Firebase** - Google platform that offers different services divided into modules for developing applications.
* <img src="https://s3.amazonaws.com/cdn.hotglue.xyz/images/logos/firebase-auth.png" alt="Firebase Auth" width="32"/> &ensp; **Firebase Auth** - Provides backend services to authenticate users in apps easy and securely. Used in the app to authenticate users and perform activities such as logging in or out, signing in, editing the profile data or recovering password.
* &nbsp; <img src="https://miro.medium.com/max/304/1*BXaq7UZ-QoMH0vF0Znjy0A.jpeg" alt="Firestore" width="25"/> &ensp; **Firestore** - Flexible and scalable database for mobile and web development. There, information of museum events and products, among others, can be stored using collections and documents.

* &nbsp; <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/YouTube_social_white_squircle.svg/1200px-YouTube_social_white_squircle.svg.png" alt="Firestore" width="30"/> &ensp; **YouTube API** - Allows to add YouTube features to the mobile app. Allows this app to display videos of the objects that are scanned.


## :wrench: Installation
For generating and distributing the .ipa file to test this app on your own iPhone or iOS device, a subscription to Apple Developer Program is needed. Because of this, the remaining way to test this project on your device is downloading the source code from this repository and installing the dependencies used. 
Then, the device that is going to be used needs to be connected to the Mac using a cable or pair it via Wi-Fi with Xcode. After adding this device as a simulator, select it as a simulated device from the run destination menu and run the app using the run button. It is important, if you are using a real device, to enable developer mode in orden to be able to run it.
You can also run the app using a simulated device, which you can select between the variety of simulator Apple offers inside Xcode.

## :hammer:Project features
- `Feature 1`: Registration and authentication of users through forms which fields get validated using Firebase Auth and regular expressions.

<p align="center">
  <img src="https://user-images.githubusercontent.com/56322714/212747818-70322077-6dc6-4e78-9769-477f37821d8d.gif" width="300"/>
  <img src="https://user-images.githubusercontent.com/56322714/212750691-ddabffd9-b8a4-4041-a285-b38291665ff6.gif" width="300"/>
</p>


- `Feature 2`: Viewing and editing users own personal information. Log out button included below users' data.
- `Feature 3`: Password recovery in case the user has forgotten their password. 
<p align="center">
  <img src="https://user-images.githubusercontent.com/56322714/212751003-f8a9ab99-e860-4685-bd05-d4f4e7f6f647.gif" width="300"/>
</p>

- `Feature 4`: Home page. Here, a carousel with different images of products can be seen, as well as an interactive map with the museums location. Clicking on the map annotation, you can get redirected to Apple Maps to start your route to the museum. There is also a button to book a ticket to visit the museum.

<p align="center">
  <img src="https://user-images.githubusercontent.com/56322714/212748997-5917b2b9-3c9d-44a6-9a6f-497fb91143fb.gif" width="300"/>
</p>



- `Feature 5`: Museum ticket booking. In the first view, the user can select the date and hour to visit the museum. Then, they must select the corresponding tickets and, after choosing them, select a payment method.
- `Feature 6`: Event list, that show the upcoming events that will take place at the museum, from exhibitions to talks or expositions. Its time and date is also shown.
- `Feature 6.1`: Clicking one of the above list items, the user can see the details of the event, such as a description, pricing and a button to book a ticket for that event.
- `Feature 6.2`: Clicking the button, the user can access the process to buy a ticker for an event.
- `Feature 7`: QR Scanner used by the users to scan the QR codes next to the items of the museum, to get the detailed information of the object.
- `Feature 7.1`: After scanning the QR code, the user can see the description and image of the object, as well as two other buttons (comment button to redirect to comment section and play button to play a video of the object).
- `Feature 7.1.1`: After pressing the comment button, the user can see the commments other users have submitted. Also, there is a comment field where the user can write the comment and submit it.
- `Feature 7.1.2`: After pressing the play button, the user can see an embedded YouTube video inside the app. This video can be paused, resumed and also enables fast forward and rewind.
- `Feature 8`: Tab bar that allows the user to navigate between the three main views of the app: home page, QR scanner and event list.


## Contributors
<a href="https://github.com/Tech-Virtual-Museum/iOS-Tech-Virtual-Museum/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=Tech-Virtual-Museum/iOS-Tech-Virtual-Museum" />
  <sub>Nahima Ortega - iOS</sub>
</a>
<a href="https://github.com/Tech-Virtual-Museum/Android-Tech-Virtual-Museum/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=Tech-Virtual-Museum/Android-Tech-Virtual-Museum" />
  <sub>Tinizara Rodriguez - Android</sub>
</a>
