# Get the replays files which should be added to Git
$files = Get-ChildItem '.\_upload\*.replay'

# Source location of the replays
$targetPath = '.\Replays'

foreach ($file in $files) {
    $year = $file.LastWriteTime.Year.ToString()
    $month = $file.LastWriteTime.Month.ToString()

    $directory = $targetPath + "\" + $year + "\" + $month

    # Create directory if it doesn't exsist
    if (!(Test-Path $directory))
    {
        New-Item $directory -type directory
    }

    # $Hash = Get-FileHash -Path $file -Algorithm SHA1
    # Write-Host "$($Hash.Hash).replay"
    # Rename-Item -Path $file -NewName "$($Hash.Hash).replay"

    # Move File to new location
    # "./_upload/$($Hash.Hash).replay" | Move-Item -Destination $directory
    $file | Move-Item -Destination $directory

}
