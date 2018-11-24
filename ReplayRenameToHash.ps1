Get-ChildItem *.replay | ForEach-Object {
    $Hash = Get-FileHash -Path $_.FullName -Algorithm SHA1
    Write-Host "$($Hash.Hash).replay"
    Move-Item -Path $_.FullName -Destination "$($Hash.Hash).replay" -Force
}