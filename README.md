# NITK Companion App
Inspired from the InstiApp of IITB, a contribution to the community of NITK

## Note
- Flutter channel - stable
- Flutter version - 1.22.6+
- Dart version - 2.10.5+

## Setup
- Clone the repository
- Rename the repository as "utilapp" (just for project's convention)
- Add your google-services.json file under '/android/app/' 
- To run the app in development mode, bypass the authentication by following instruction in 'lib/infrastucture/auth/firebase_auth_facade.dart'
- To test the authentication generate your SHA1 and SHA256 debug key and add it in the firebase console
- For the backend, follow the steps in the README's of the "backend"

## Contribute
- Create a seperate branch from frontend or backend to work on a specific feature
- Run 'flutter clean' and remove any unnecessary changes/files before making any commit