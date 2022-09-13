$latestTagCommit = @(git rev-list --tags --max-count=1)
$latestTag = @(git describe --tags $latestTagCommit)
$latestVersion = [version]($latestTag.substring(1) )
$newTag = "v$($latestVersion.Major).$($latestVersion.Minor+1)"

echo "NEW_VERSION=$newTag" | Out-File -FilePath $Env:GITHUB_ENV -Encoding utf8 -Append