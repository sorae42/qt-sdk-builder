Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"
$PSDefaultParameterValues['*:ErrorAction']='Stop'
function ThrowOnNativeFailure {
    if (-not $?)
    {
        throw 'Native Failure'
    }
}

New-Item -Path "build" -ItemType directory
Set-Location build

cmd /c "..\source\qt-everywhere-src-$Env:QT_VERSION\configure.bat -static -debug -platform win32-msvc -opensource -confirm-license -opengl desktop -qt-zlib -qt-libpng -qt-webp -qt-libjpeg -qt-freetype -skip qt3d -skip qtactiveqt -skip qtandroidextras -skip qtcharts -skip qtconnectivity -skip qtdatavis3d -skip qtdeclarative -skip qtdoc -skip qtgamepad -skip qtlocation -skip qtlottie -skip qtmacextras -skip qtmultimedia -skip qtnetworkauth -skip qtpurchasing -skip qtquick3d -skip qtquickcontrols -skip qtquickcontrols2 -skip qtquicktimeline -skip qtremoteobjects -skip qtscript -skip qtsensors -skip qtspeech -skip qtsvg -skip qtwayland -skip qtwebglplugin -skip qtwebview -skip webengine -make libs -nomake tools -nomake examples -nomake tests"
ThrowOnNativeFailure

jom
jom install
