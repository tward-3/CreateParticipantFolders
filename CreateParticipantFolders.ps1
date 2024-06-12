$sourceDirectory = " "

# list all MEG files w/ specified extension (.fif) in src dir
$files = Get-ChildItem -Path $sourceDirectory -File -Filter "*.fif"

foreach ($file in $files) {

    # Get the first 9 characters of the file name (participant ID; adjust length as needed)
    $folderName = $file.Name.Substring(0,9)

    $folderPath = Join-Path -Path $sourceDirectory -ChildPath $folderName
    New-Item -ItemType Directory -Path $folderPath -ErrorAction SilentlyContinue

    $newFilePath = Join-Path -Path $folderPath -ChildPath $file.Name
    Move-Item -Path $file.FullName -Destination $newFilePath -Force
}

# list all log files w/ specified extension (.txt) in src dir
$logFiles = Get-ChildItem -Path $sourceDirectory -File -Filter "*.txt"

foreach ($file in $logFiles) {

    $folderPath = Join-Path -Path $sourceDirectory -ChildPath $folderName
    Move-Item -Path $file.FullName -Destination $folderPath -Force
    Write-Output $folderPath

}
