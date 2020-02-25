# REHASH

A HACKATHON PROJECT THAT BUILT BY NHAN LE, COLIN ZEE, STEVEN TAT, PRAKHAR AGARWAL

# INSPIRATION

Every year millions if not billions of tons of plastic bottles land up in landfills or oceans and its because people do not sort their plastic bottle waste in proper categories.

# FUNCTIONALITY

There are 2 parts to this - mobile app and the machine. The app lets you take the photograph of the object and it will send the photo to the database which call an API from clarifai and determine which category the bottle falls into and finally returns a result in form of text. The machine is made of a webcam, servo motors and arduino. After you place the bottle in the machine and press a button the webcam will take a picture of the bottle and the process is same as with the app but after the API returns a result the machine will perform a task based on the result- if the bottle falls in to recycle category a servo motor will rotate and put the bottle in recycle bin, if the bottle falls in to trash category another servo motor will rotate and put the bottle in trash bin if it falls in reuse the a led will light up.

# HIGHLIGHTS

CLARIFAI ML API
Implemented CV cloud-based AI model
Flutter/ Dart
Developed UI for taking pictures and making API requests to classifier.
Firebase
Incorporated Flutter with Firestore to store users’ history images.


# CHALLENGES
Raspberry malfunction.
New technology (Flutter, Dart, GCP, CLARIFAI API).
Bugs … 
Relative paths in Flutter, Raspberry PI, data-set labeling, learning curve.
Time-constraint for training and labeling data.
Collaborating, communication skills, dividing tasks.

# WHAT WE LEARNED ?

Learned how to train a model using ML
New technology (Flutter, Dart, GCP, Clarifai)
UI/UX design
Relative paths in Flutter, Raspberry PI, data-set labeling, learning curve
Time-constraint for training and labeling data.

# WHAT NEXT ?

In future we plan to use raspberry pi instead of arduino. Also we wish to use optical sensor which can detect the microorganisms inside a bottle and really differentiate between a reusable bottle and recyclable bottle.

https://www.youtube.com/watch?v=PHuXxlQkUTo&feature=youtu.be
