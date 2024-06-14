$sourceDirectory = " "

# list all MEG files w/ specified extension (.fif) in src dir
$files = Get-ChildItem -Path $sourceDirectory -File -Filter "*.fif"

foreach ($file in $files) {
    # Get the first 9 characters of the file name (participant ID; adjust length as needed. If you do adjust, you also need to edit line 21)
    $folderName = $file.Name.Substring(0,9)

    $folderPath = Join-Path -Path $sourceDirectory -ChildPath $folderName
    New-Item -ItemType Directory -Path $folderPath -ErrorAction SilentlyContinue

    $newFilePath = Join-Path -Path $folderPath -ChildPath $file.Name
    Move-Item -Path $file.FullName -Destination $newFilePath -Force
}

# list all log files w/ specified extension (.txt) in src dir
$logFiles = Get-ChildItem -Path $sourceDirectory -File -Filter "*.txt"

foreach ($file in $logFiles) {
    $folderName2 = $file.Name.Substring(0,9)
    $movePath = Join-Path -Path $sourceDirectory -ChildPath $folderName2
    Move-Item -Path $file.FullName -Destination $movePath -Force
    Write-Output $file.FullName
    Write-Output $movePath
}
