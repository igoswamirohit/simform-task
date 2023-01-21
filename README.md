
# Simform Practical Task

Problem Statement: Create an app that displays List of Users. Every time, app opens it should show the old data
from previous session, meanwhile it should fetches new users list in background, then
update the current list with new one. The app should be usable even if app is not connected
to the internet.


## Solution (What is implemented? Based on cases)

- **If Internet and Local Data both are available**
      
      1. Show Data from Local DB
      2. Fetch Remote Data in Background
      3. Update the data in Local DB
      4. Update the list in UI with new Data

- **If Internet is available but Local Data is not available (App Installed for the first time)**
      
      1. Fetch Remote Data
      2. Store the data in Local DB
      3. Show the Remote Data on UI

- **If Internet is not available but Local Data is available**
      
      1. Show Data from Local DB
      2. Show Snackbar for Internet Unavailability

- **If Internet and Local Data both are NOT available**
      
      1. Show Message on UI "No Local Data Available! Please turn on the internet to fetch the data once."
      2. Data will be fetched as soon as device gets Internet Connection




## Code Gen

Run build_runner for code generation which will build a file which is necessary to run the Project. (Currently Present on the branch so no need to run)

```bash
  flutter pub run build_runner build
```
    
## API Reference

#### Get all users

```http
  GET https://randomuser.me/api
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `results` | `string` | **Optional**. Number of users to fetch from the api |




## Features

- Offline Availability of Users List
- Local Data gets updated each time app is opened


## Screenshots

![App Screenshot](https://github.com/igoswamirohit/simform-task/blob/master/screenshots/internet.jpg)
![App Screenshot](https://github.com/igoswamirohit/simform-task/blob/master/screenshots/no_internet.jpg)

## Packages Used
get - State Management
![get](https://img.shields.io/pub/v/get)

chopper - API Calls
![chopper](https://img.shields.io/pub/v/chopper)

drift Local DB (Earlier Moor)
![drift](https://img.shields.io/pub/v/drift)

connectivity_plus - To Check Internet Availability
![chopper](https://img.shields.io/pub/v/chopper)

flutter_spinkit - For Loaders
![flutter_spinkit](https://img.shields.io/pub/v/flutter_spinkit)

http - API Calls
![http](https://img.shields.io/pub/v/http)

logging - For Logging
![logging](https://img.shields.io/pub/v/logging)

sqlite3_flutter_libs - To support drift package
![sqlite3_flutter_libs](https://img.shields.io/pub/v/sqlite3_flutter_libs)

path_provider - To support drift package
![path_provider](https://img.shields.io/pub/v/path_provider)

path - To support drift package
![path](https://img.shields.io/pub/v/path)

cached_network_image - For image caching
![cached_network_image](https://img.shields.io/pub/v/cached_network_image)

## 🔗 My Profile Links
[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/igoswamirohit/)
[![github](https://img.shields.io/badge/github-000000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/igoswamirohit/)
