# Attendance (Admin)

## Overview
As College students, we all have seen how our Professors take attendance in classes, manually calling each and every single child's name and marking them present or absent. It is a very primitive way of marking student's attendance. Calling out each person's name in a lecture can easily take about 5-10 minutes, which is 5-10 minutes of study time in a class wasted. There are not many easy solutions for marking student's attendance out there - major methods include Biometric entries, such as using Facial Recognition or Fingerprint Scanners. These solutions are pretty expensive in nature and can create chaos (Be honest, we don't enter the class before it's like already 2 minutes late).

## How do we overcome this problem? 
Seeing the issue that we mentioned above, we planned on creating a solution that could help teachers for a faster and much better mode of attendance than a primitive one. The solution we came to was an application, which can help students mark their attendance when inside the class, without any roll calls. This application can help make time usage of a lecture more efficient in classes.
The Application uses Flutter Framework and Dart for building the application. We used the SharedPreferences Storage system for storing Key-Value pairs of data locally on the device. The major part of the project relies on the Nearby Connections API/Plugin, which is a very popular one for connecting devices and transferring data locally on a Peer to Peer network (small scale without any other issues). It has many examples use cases such as Offline File Transfer, Multi Screen Gaming etc.

 ## The Solution
 The Solution is an application that uses Nearby Connections API for creating a local network for transfer of data back on the network. It allows us to catch the enrollment numbers of all the students connected and sends it to the main Application (the Admin Application) where it can be used by the teacher later on for marking Student's Attendance. In this way, the teacher doesn't need to use 10 minutes of his class calling out each student's names; rather the teacher can just switch on this application and it collects all the data in a very fast manner.

 The Nearby Connections API helps us to establish three major types of connections - [Peer to Peer Cluster](https://developers.google.com/nearby/connections/strategies#p2p_cluster), [Peer to Peer Star](https://developers.google.com/nearby/connections/strategies#p2p_star) and [Peer to Peer point to point](https://developers.google.com/nearby/connections/strategies#p2p_point_to_point). They form different types of Network Topologies, and can be used for different functionality. For our goal here, P2P Star is a great way to establish connections, as we can create 1 outgoing connection(the main head) and many outgoing connections(the clients to it).

 ## The Working
 When the user opens up the Appication for the first time, they need to enter their details into the application which are stored locally. Once you reach the Home Page of the application, it displays a button asking you to capture the attendance of the peers. Upon Click, the Application starts connecting nearby devices using a Cluster Topology to each other. It keeps on expanding, as all the clients will start making their own clients as the network expands. Once all the devices are connected and no more devices can be found, the clients start sending data backwards towards the start point. As all the data transfers back to the Admin, it can be used by the Admin(Teacher) to mark the attendance of the students, all done without the need to perform any other action than a click of a button.

[![image](https://user-images.githubusercontent.com/72783120/161404702-40e6102e-664c-4798-ad2f-94ac5c2401f9.png)](https://whimsical.com/hint-RpnXKxzgKB7YspQXzzUMfq)

 The Client Application can be found [here](https://github.com/NaK915/Attendance_client)
