Get-ChildItem *.replay | ForEach-Object {
    $Hash = Get-FileHash -Path $_.FullName -Algorithm SHA1
    Write-Host "$($Hash.Hash).replay"
    Rename-Item -Path $_.FullName -NewName "$($Hash.Hash).replay"
}