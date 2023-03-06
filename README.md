
# react-native-palawan-famous-landscape

## Getting started

`$ npm install react-native-palawan-famous-landscape --save`

### Mostly automatic installation

`$ react-native link react-native-palawan-famous-landscape`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-palawan-famous-landscape` and add `RNPalawanFamousLandscape.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNPalawanFamousLandscape.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNPalawanFamousLandscapePackage;` to the imports at the top of the file
  - Add `new RNPalawanFamousLandscapePackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-palawan-famous-landscape'
  	project(':react-native-palawan-famous-landscape').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-palawan-famous-landscape/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-palawan-famous-landscape')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNPalawanFamousLandscape.sln` in `node_modules/react-native-palawan-famous-landscape/windows/RNPalawanFamousLandscape.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Palawan.Famous.Landscape.RNPalawanFamousLandscape;` to the usings at the top of the file
  - Add `new RNPalawanFamousLandscapePackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNPalawanFamousLandscape from 'react-native-palawan-famous-landscape';

// TODO: What to do with the module?
RNPalawanFamousLandscape;
```
  