git --version
git config user.name "GitHub Actions Bot"
git config user.email "<>"

$latestTagCommit = @(git rev-list --tags --max-count=1)
$latestTagCommit
$latestTag = @(git describe --tags $latestTagCommit)
$latestTag

$latestVersion = [version]($latestTag.substring(1))
$newTag = "v$($latestVersion.Major).$($latestVersion.Minor+1)"

echo "new tag: $newTag"
echo "NEW_VERSION=$newTag" | Out-File -FilePath $Env:GITHUB_ENV -Encoding utf8 -Append