# Practical Test – SE - Flutter vdev-20210801


(1) `git init`

(2) `echo "# new" >> README.md`

(3) `git add.`
    `git commit -m "Empty project with README"` 

(4) `git remote add origin https://github.com/kesharaJayasinghe/vdev-20210801.git`
    `git branch -M main`

(5) `git push -u origin main` 


# Flutter development environment setup

(6) 

OS used: macOS Big Sur

Download the latest stable release of the Flutter SDK.

Navigate to the desired directory from terminal `cd ~/flutter-dev`

Clone the stable branch of flutter SDK `git clone https://github.com/flutter/flutter.git -b stable` 

Add path variable
Check if the shell you are using is Bash or Z
This can also be found in the title of the terminal.

```sh
echo $SHELL
```

Create and open the rc file (depending on your shell)

```sh
touch .zshrc OR touch .bashrc
open .zshrc OR open .bashrc
```

Add the path in file

`export PATH="$PATH:[PATH_OF_FLUTTER_GIT_DIRECTORY]/bin` 

Verify flutter/bin is added to path

```sh
echo $PATH
```

Verify if setup is successful by entering;

```sh
which flutter
```

If successful the above command will show the path.

Install Xcode and Android studio

iOS
```sh
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch
```

Android
```sh
flutter doctor --android-licenses
```
Run the following command to see if everything is successful

```sh
flutter doctor -v
```
