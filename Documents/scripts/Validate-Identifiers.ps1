Param(
    [string]$Root = "d:\GitHub_metashare\eService_WorkItems\Documents",
    [switch]$Fix
)

function Get-TypePrefix([string]$fileName) {
    switch ($fileName.ToLower()) {
        "main.md" { return "I" }
        "process.md" { return "P" }
        "collaboration.md" { return "C" }
        "domain-model.md" { return "D" }
        "vocabulary.md" { return "V" }
        default { return $null }
    }
}

function Get-IdentifierFromFile([string]$filePath) {
    try {
        $lines = Get-Content -LiteralPath $filePath -TotalCount 10 -ErrorAction Stop
        foreach ($line in $lines) {
            if ($line -match "<!--\s*Identifier:\s*(.+?)\s*-->") {
                return $Matches[1].Trim()
            }
        }
        return $null
    } catch {
        return $null
    }
}

function Get-ExpectedIdentifier([string]$filePath, [string]$root) {
    $type = Get-TypePrefix ([System.IO.Path]::GetFileName($filePath))
    if (-not $type) { return $null }

    # Normalize paths
    $rootResolved = (Resolve-Path -LiteralPath $root).Path
    $dirPath = Split-Path -Path $filePath -Parent

    if ($dirPath.StartsWith($rootResolved)) {
        $relativeDir = $dirPath.Substring($rootResolved.Length).TrimStart('\\')
    } else {
        $relativeDir = $dirPath
    }

    $segments = New-Object System.Collections.Generic.List[string]
    if ($relativeDir) {
        $parts = $relativeDir -split "[\\/]"
        foreach ($part in $parts) {
            # Match numeric folder prefixes like "01 - Name" or "01 Name"
            if ($part -match "^\s*(\d{1,2})(?:\s*-|\s+)") {
                $num = [int]$Matches[1]
                $segments.Add(('{0:D2}' -f $num))
            }
        }
    }

    if ($segments.Count -gt 0) { return "$type-" + ($segments -join '-') }
    return $type
}

function New-ValidationResult() {
    [PSCustomObject]@{
        Path = $null
        Type = $null
        Actual = $null
        Expected = $null
        Status = $null # OK | Missing | UnknownType | Mismatch | Ignored
        Notes = $null
    }
}

$mdFiles = Get-ChildItem -LiteralPath $Root -Recurse -File -Filter "*.md"
$results = New-Object System.Collections.Generic.List[object]

foreach ($file in $mdFiles) {
    $actual = Get-IdentifierFromFile $file.FullName
    $expected = Get-ExpectedIdentifier $file.FullName $Root
    $type = Get-TypePrefix $file.Name

    $status = "OK"
    if (-not $type) { $status = "Ignored" }
    elseif (-not $actual) { $status = "Missing" }
    elseif ($expected -and ($actual -ne $expected)) { $status = "Mismatch" }

    $result = New-ValidationResult
    $result.Path = $file.FullName
    $result.Type = $type
    $result.Actual = $actual
    $result.Expected = $expected
    $result.Status = $status
    
    # Notes for edge cases
    if ($actual) {
        if ($actual -match "-[0][a-fA-F]") { $result.Notes = "Hex-like segment present" }
        elseif ($type -and ($actual.Substring(0,1) -ne $type)) { $result.Notes = "Type prefix mismatch" }
    }
    $results.Add($result)
}

# Optional auto-fix for Missing/Mismatch
if ($Fix.IsPresent) {
    foreach ($r in $results) {
        if (($r.Status -eq 'Missing' -or $r.Status -eq 'Mismatch') -and $r.Expected) {
            try {
                $lines = Get-Content -LiteralPath $r.Path -ErrorAction Stop
                $updated = $false
                # Replace existing Identifier line if present
                for ($i = 0; $i -lt [Math]::Min(10, $lines.Count); $i++) {
                    if ($lines[$i] -match "<!--\s*Identifier:\s*(.+?)\s*-->") {
                        if ($lines[$i] -ne "<!-- Identifier: $($r.Expected) -->") {
                            $lines[$i] = "<!-- Identifier: $($r.Expected) -->"
                            $updated = $true
                        }
                        break
                    }
                }
                if (-not $updated) {
                    # Prepend identifier header
                    $lines = @("<!-- Identifier: $($r.Expected) -->") + $lines
                    $updated = $true
                }
                if ($updated) {
                    Set-Content -LiteralPath $r.Path -Value $lines -Encoding UTF8 -NoNewline:$false
                }
            } catch {
                Write-Warning "Failed to update: $($r.Path) - $($_.Exception.Message)"
            }
        }
    }
    # Recompute results after fixes
    $results.Clear()
    foreach ($file in $mdFiles) {
        $actual = Get-IdentifierFromFile $file.FullName
        $expected = Get-ExpectedIdentifier $file.FullName $Root
        $type = Get-TypePrefix $file.Name

        $status = "OK"
        if (-not $type) { $status = "Ignored" }
        elseif (-not $actual) { $status = "Missing" }
        elseif ($expected -and ($actual -ne $expected)) { $status = "Mismatch" }

        $result = New-ValidationResult
        $result.Path = $file.FullName
        $result.Type = $type
        $result.Actual = $actual
        $result.Expected = $expected
        $result.Status = $status
        $results.Add($result)
    }
}

# Summaries
$summary = @{
    Total = $results.Count
    OK = ($results | Where-Object Status -eq 'OK').Count
    Missing = ($results | Where-Object Status -eq 'Missing').Count
    UnknownType = ($results | Where-Object Status -eq 'UnknownType').Count
    Mismatch = ($results | Where-Object Status -eq 'Mismatch').Count
    Ignored = ($results | Where-Object Status -eq 'Ignored').Count
}

# Write report
$reportPath = Join-Path -Path $Root -ChildPath "identifier_report.md"
$sb = New-Object System.Text.StringBuilder
[void]$sb.AppendLine("# Identifier Validation Report")
[void]$sb.AppendLine("")
[void]$sb.AppendLine("- Root: $Root")
[void]$sb.AppendLine("- Generated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')")
[void]$sb.AppendLine("- Fix Mode: $($Fix.IsPresent)")
[void]$sb.AppendLine("")
[void]$sb.AppendLine("## Summary")
[void]$sb.AppendLine("- Total: $($summary.Total)")
[void]$sb.AppendLine("- OK: $($summary.OK)")
[void]$sb.AppendLine("- Missing: $($summary.Missing)")
[void]$sb.AppendLine("- UnknownType: $($summary.UnknownType)")
[void]$sb.AppendLine("- Mismatch: $($summary.Mismatch)")
[void]$sb.AppendLine("- Ignored: $($summary.Ignored)")
[void]$sb.AppendLine("")

function Add-Section($title) {
    [void]$sb.AppendLine("## $title")
}
function Add-ResultLine($r) {
    $rel = $r.Path.Substring($Root.Length).TrimStart('\\')
    [void]$sb.AppendLine("- [$rel]($rel): Actual='$($r.Actual)' Expected='$($r.Expected)' Type='$($r.Type)'")
}

if ($summary.Missing -gt 0) {
    Add-Section "Missing Identifier"
    $results | Where-Object Status -eq 'Missing' | ForEach-Object { Add-ResultLine $_ }
    [void]$sb.AppendLine("")
}
if ($summary.UnknownType -gt 0) {
    Add-Section "Unknown Type (unmapped file name)"
    $results | Where-Object Status -eq 'UnknownType' | ForEach-Object { Add-ResultLine $_ }
    [void]$sb.AppendLine("")
}
if ($summary.Mismatch -gt 0) {
    Add-Section "Mismatched Identifier"
    $results | Where-Object Status -eq 'Mismatch' | ForEach-Object { Add-ResultLine $_ }
    [void]$sb.AppendLine("")
}
if ($summary.Ignored -gt 0) {
    Add-Section "Ignored (no identifier type for file name)"
    $results | Where-Object Status -eq 'Ignored' | Select-Object -First 20 | ForEach-Object { Add-ResultLine $_ }
    [void]$sb.AppendLine("")
}
if ($summary.OK -gt 0) {
    Add-Section "OK (sample)"
    $results | Where-Object Status -eq 'OK' | Select-Object -First 20 | ForEach-Object { Add-ResultLine $_ }
    [void]$sb.AppendLine("")
}

$sb.ToString() | Out-File -LiteralPath $reportPath -Encoding UTF8
Write-Output "Report written: $reportPath"
