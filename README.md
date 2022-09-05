# Jatszos ahk scriptek

# Usage

1) Download and extract the `Dll` folder:

   https://minhaskamal.github.io/DownGit/#/home?url=https://github.com/kuzditomi/PaddleOCR-AutoHotkey/tree/main/PaddleOCR/Dll

2) Download and put the `.exe` file next to the `Dll folder` like that:
    |Character| Latest version |
    |-|-|
    |Firefly| [DOWNLOAD](https://github.com/kuzditomi/vesztoahk/releases/latest/download/firefly.exe)|

It should look something like this:
```
    scripts/
    ├─ Dll/
    │  ├─ PaddleOCR.dll
    │  ├─ ...
    ├─ firefly.exe
```
For all versions go to [releases](https://github.com/kuzditomi/vesztoahk/releases).


# Develop

### Clone
```
git clone --recurse-submodules git@github.com:kuzditomi/vesztoahk.git
```

### Run
```
AutoHotkey.exe firefly.ahk
```

### Release new version
```
git tag -a v<<next> -m "Your message here"
git push origin --tags
```




