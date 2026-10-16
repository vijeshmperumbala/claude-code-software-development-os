$ErrorActionPreference = 'Stop'
$PackageRoot = [System.IO.Path]::GetFullPath($PSScriptRoot)
$ProjectRoot = [System.IO.Path]::GetFullPath((Get-Location).Path)
$LogFile = Join-Path $ProjectRoot 'software-os-install.log'

Write-Host ''
Write-Host 'Claude Code Software Development OS - Safe Project Installer' -ForegroundColor Cyan
Write-Host "Package:     $PackageRoot"
Write-Host "Destination: $ProjectRoot"
Write-Host ''
Write-Host 'Policy: copy missing files only; never overwrite existing files.'
Write-Host 'Existing-file conflicts will be listed for manual review.'

if (-not (Test-Path (Join-Path $PackageRoot 'agents-manifest.json')) -or -not (Test-Path (Join-Path $PackageRoot '.claude') -PathType Container)) {
    Write-Error 'Package files not found beside the installer. Keep the installer in the extracted package root.'
    exit 3
}

$answer = Read-Host 'Continue [Y,N]?'
if ($answer -notin @('Y','y','YES','yes')) { Write-Host 'Cancelled.'; exit 0 }

$copied = 0
$conflicts = [System.Collections.Generic.List[string]]::new()
$errors = [System.Collections.Generic.List[string]]::new()
$log = [System.Collections.Generic.List[string]]::new()
$log.Add("Software OS installer log")
$log.Add("Package: $PackageRoot")
$log.Add("Destination: $ProjectRoot")
$log.Add("Started: $(Get-Date -Format o)")

$directories = @('.claude','workflows','templates','docs','scripts')
foreach ($directory in $directories) {
    $sourceDir = Join-Path $PackageRoot $directory
    if (-not (Test-Path $sourceDir -PathType Container)) { continue }
    Get-ChildItem -LiteralPath $sourceDir -File -Recurse | ForEach-Object {
        $relative = $_.FullName.Substring($sourceDir.TrimEnd('\').Length).TrimStart('\')
        $destinationFile = Join-Path (Join-Path $ProjectRoot $directory) $relative
        $destinationParent = Split-Path -Parent $destinationFile
        try {
            if (Test-Path -LiteralPath $destinationFile) {
                $conflicts.Add($destinationFile)
                $log.Add("PRESERVED CONFLICT: $destinationFile")
            } else {
                New-Item -ItemType Directory -Path $destinationParent -Force | Out-Null
                Copy-Item -LiteralPath $_.FullName -Destination $destinationFile
                $copied++
                $log.Add("COPIED: $destinationFile")
            }
        } catch {
            $errors.Add("$destinationFile : $($_.Exception.Message)")
            $log.Add("ERROR: $destinationFile : $($_.Exception.Message)")
        }
    }
}

$rootFiles = @('CLAUDE.md','agents-manifest.json','commands.txt','CHANGELOG-AGENT-EXPANSION.md','CLAUDE_CODE_INTEGRATION.md')
foreach ($file in $rootFiles) {
    $sourceFile = Join-Path $PackageRoot $file
    if (-not (Test-Path -LiteralPath $sourceFile -PathType Leaf)) { continue }
    $destinationFile = Join-Path $ProjectRoot $file
    if (Test-Path -LiteralPath $destinationFile) {
        $conflicts.Add($destinationFile)
        $log.Add("PRESERVED CONFLICT: $destinationFile")
    } else {
        try { Copy-Item -LiteralPath $sourceFile -Destination $destinationFile; $copied++; $log.Add("COPIED: $destinationFile") }
        catch { $errors.Add("$destinationFile : $($_.Exception.Message)"); $log.Add("ERROR: $destinationFile : $($_.Exception.Message)") }
    }
}

$log.Add("Finished: $(Get-Date -Format o)")
$log | Set-Content -LiteralPath $LogFile -Encoding UTF8
Write-Host ''
Write-Host "Copied missing files: $copied" -ForegroundColor Green
Write-Host "Existing files preserved: $($conflicts.Count)" -ForegroundColor Yellow
Write-Host "Copy errors: $($errors.Count)" -ForegroundColor $(if ($errors.Count) {'Red'} else {'Green'})
if ($conflicts.Count -gt 0) {
    Write-Host "`nConflicts (review and merge manually):" -ForegroundColor Yellow
    $conflicts | Select-Object -Unique | ForEach-Object { Write-Host "  $_" }
}
if ($errors.Count -gt 0) {
    Write-Host "`nErrors:" -ForegroundColor Red
    $errors | ForEach-Object { Write-Host "  $_" }
}
Write-Host "`nLog: $LogFile"
if ($errors.Count -gt 0) { exit 5 }
Write-Host 'Copy operation completed. Run the OS validator from the project root after reviewing any conflicts.'
exit 0
