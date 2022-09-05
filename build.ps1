$cwd = (Get-Item .).FullName;

function downloadAhk {
    Invoke-WebRequest "https://www.autohotkey.com/download/ahk.zip" -OutFile "$cwd\autohotkey.zip";
    Expand-Archive -Path "$cwd\autohotkey.zip" -DestinationPath "$cwd\_autohotkey\" -Force;
    Remove-Item -Path "$cwd\autohotkey.zip" -Force
    Write-Output ("$cwd\_autohotkey\;" + "$cwd\_autohotkey\Compiler") | Out-File -FilePath $env:GITHUB_PATH -Encoding utf8 -Append
    Copy-Item -Path "$cwd\_autohotkey\Compiler\Unicode 64-bit.bin" -Destination "$cwd\_autohotkey\Compiler\AutoHotkeySC.bin"
}

function buildScripts {
    Get-ChildItem -Path "$cwd/scripts/*.ahk" | ForEach-Object `
    {
        $command = 'ahk2exe.exe /silent verbose '
        $command += '/in "' + $_.fullname + '"'
                
        $command += " | Write-Output"
        Invoke-Expression $command
    }
}

downloadAhk
buildScripts