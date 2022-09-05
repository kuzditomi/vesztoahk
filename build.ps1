$cwd = (Get-Item .).FullName;

function downloadAhk {
    Invoke-WebRequest "https://www.autohotkey.com/download/ahk.zip" -OutFile "$cwd\autohotkey.zip";
    Expand-Archive -Path "$cwd\autohotkey.zip" -DestinationPath "$cwd\_autohotkey\" -Force;
    
    Copy-Item -Path "$cwd\_autohotkey\Compiler\Ahk2Exe.exe" -Destination "$cwd\ahk2exe.exe"
    Copy-Item -Path "$cwd\_autohotkey\Compiler\Unicode 64-bit.bin" -Destination "$cwd\AutoHotkeySC.bin"

    Remove-Item -Path "$cwd\autohotkey.zip" -Force
    Remove-Item -Path "$cwd\_autohotkey" -Force -Recurse
}

function buildScripts {
    Write-Output ("$cwd\_autohotkey\;" + "$cwd\_autohotkey\Compiler") | Out-File -FilePath $env:GITHUB_PATH -Encoding utf8 -Append

    Get-ChildItem -Path "$cwd\scripts\*.ahk" | ForEach-Object `
    {
        $command = './ahk2exe.exe /silent verbose '
        $command += '/in "' + $_.fullname + '"'
                
        $command += " | Write-Output"
        echo $command
        Invoke-Expression $command
    }
}

downloadAhk
buildScripts