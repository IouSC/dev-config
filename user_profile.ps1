# Load Prompt Config
# [themes](https://ohmyposh.dev/docs/themes)
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/ethereal-shadows.omp.json" | Invoke-Expression

# Terminal-Icons
Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar

# PSFzf
Import-Module -Name PSFzf
Set-PSFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Alias
Set-Alias vim nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# Utilities
function which ($command) {
   Get-Command -Name $command -ErrorAction SilentlyContinue | 
   Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function touch {
   Param(
      [Parameter(Mandatory=$true)]
      [string]$Path
   )
   if (Test-Path -LiteralPath $Path) {
      (Get-Item -Path $Path).LastWriteTime = Get-Date
   } else {
      New-Item -Type File -Path $Path
   }
}
