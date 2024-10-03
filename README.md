# PowerShell Installation and Setup on Windows

This document provides step-by-step instructions to install PowerShell on a Windows machine, along with *Iou-Sheng (Danny) Chang*'s setup configurations.

## Table of Contents
- [PowerShell Installation and Setup on Windows](#powershell-installation-and-setup-on-windows)
  - [Table of Contents](#table-of-contents)
  - [Prerequisites](#prerequisites)
  - [Installation Instructions](#installation-instructions)
  - [User Profile](#user-profile)
  - [References](#references)

## Prerequisites
Ensure that you have:
- Administrator privileges on the Windows machine.
- A stable internet connection.

## Installation Instructions
1. Install patched nerd fonts (Hack).
   - Download the latest Hack Nerd Font from [ryanoasis nerd-fonts git](https://github.com/ryanoasis/nerd-fonts) $\rightarrow$ [Releases](https://www.youtube.com/watch?v=5-aK2_WwrmM&list=PLeJfAHGvmvyDDOECvt6cWEhZqEXAMKO3g&index=4) $\rightarrow$ [Hack.zip](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip).
   - Install all Windows compatible `.ttf` files.
2. Install PowerShell.
   - Install [PowerShell](https://apps.microsoft.com/detail/9mz1snwt0n5d?hl=en-US&gl=US) from Microsoft Store.
3. Configure Windows terminal.
   - Change the default shell.
     - `Startup` $\rightarrow$ set `Default profile` to `PowerShell`.
   - Configure `Settings`.
     - `Startup` $\rightarrow$ set `Default terminal application` to `Windows Terminal`.
   - Configure customized terminal color theme.
     - `Open JSON file`.
     - Duplicate the `One Half Dark` theme and rename it to `Ethereal Shadows`.
     - The JSON settings shall be modified as follow:
        ```JSON
        {
            "background": "#001B26",
            "black": "#282C34",
            "blue": "#61AFEF",
            "brightBlack": "#5A6374",
            "brightBlue": "#61AFEF",
            "brightCyan": "#56B6C2",
            "brightGreen": "#98C379",
            "brightPurple": "#C678DD",
            "brightRed": "#E06C75",
            "brightWhite": "#DCDFE4",
            "brightYellow": "#E5C07B",
            "cursorColor": "#FFFFFF",
            "cyan": "#56B6C2",
            "foreground": "#DCDFE4",
            "green": "#98C379",
            "name": "Ethereal Shadows",
            "purple": "#C678DD",
            "red": "#E06C75",
            "selectionBackground": "#FFFFFF",
            "white": "#DCDFE4",
            "yellow": "#E5C07B"
        },
        ```
   - Configure `Default` $\rightarrow$ `Appearance`.
     - `Text` $\rightarrow$ set `Color scheme` to `Ethereal Shadows`.
     - `Text` $\rightarrow$ set `Font face` to `Hack Nerd Font`.
     - `Transparency` $\rightarrow$ set `Enable acrylic material` to `On`.
     - `Transparency` $\rightarrow$ set `Background opacity` to `50%`.
4. Install [Scoop](https://scoop.sh/) (command-line installer).
   - Open a PowerShell prompt and run the following command:
      ```PowerShell
      Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
      Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
      ```
   - Install key packages.
      ```PowerShell
      scoop install curl sudo jq jid neovim gcc nvm fzf
      ```
     - [Node.js](https://nodejs.org/en) `nvm` commands:
       - Install latest nvm version: `nvm install latest`
       - Install specific nvm version: `nvm install vX.Y.Z`
       - Check nvm version: `nvm -v`
       - Set default nvm version: `nvm alias default vX.Y.Z`
       - Use specific nvm version: `nvm use vX.Y.Z`
   - Test installation.
      ```PowerShell
      curl "google.com" | jq
      ```
5. Install [Git for Windows](https://gitforwindows.org/).
   - Open a PowerShell prompt and run the following command:
      ```PowerShell
      winget install -e --id Git.Git
      ```
6. User profile and command aliases.
   - Create a new user profile and set command aliases.
      ```PowerShell
      mkdir .config\powershell
      nvim .config\powershell\user_profile.ps1
      ```
      ```PowerShell
      # Alias
      Set-Alias vim nvim
      Set-Alias ll ls
      Set-Alias g git
      Set-Alias grep findstr
      Set-Alias tig 'C:\Program Files\Git\usr:wq:\bin\tig.exe'
      Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
      ``` 
   - Link Windows user profile.
      ```PowerShell
      nvim $PROFILE.CurrentUserCurrentHost
      ```
      ```PowerShell Code Block Title
      . $env:USERPROFILE\.config\powershell\user_profile.ps1
      ```
   - Test alias.
      ```PowerShell
      g
      ll | tig
      ll | less
      ```
7. Install [Oh My Posh](https://ohmyposh.dev/docs/installation/windows#installation) (prompt theme engine)
   - Open a PowerShell prompt and run the following command:
      ```PowerShell
      winget install JanDeDobbeleer.OhMyPosh -s winget
      ```
      This installs a couple of things:
       - `oh-my-posh.exe` - Windows executable
       - `themes` - The latest Oh My Posh themes
   - Themes.
      >
      Oh My Posh comes with many themes included out-of-the-box. Below are some screenshots of the more common themes. For the full updated list of themes, [view the themes](https://github.com/JanDeDobbeleer/oh-my-posh/tree/main/themes) in Github. If you are using PowerShell, you can display every available theme using the following PowerShell cmdlet.
      ```PowerShell
      Get-PoshThemes
      ```
      Once you're ready to swap to a theme, follow the steps described in [🚀 Get started > Customize](https://ohmyposh.dev/docs/installation/customize).
   - Set prompt in user profile.
      ```PowerShell
      nvim .config\powershell\user_profile.ps1
      ```      
      ```PowerShell
      # Load Prompt Config
      # [themes](https://ohmyposh.dev/docs/themes)
      oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/night-owl.omp.json" | Invoke-Expression
      ```
8.  Install [PowerShell Gallery](https://www.powershellgallery.com/) packages.
    - [Terminal-Icons](https://www.powershellgallery.com/packages/Terminal-Icons).
      ```PowerShell
      Install-Module -Name Terminal-Icons -Repository PSGallery -Force
      ```
    - [z](https://www.powershellgallery.com/packages/z).
      ```PowerShell
      Install-Module -Name z -Repository PSGallery -Force
      ```
    - [PSReadLine](https://www.powershellgallery.com/packages/PSReadLine).
      ```PowerShell
      Install-Module -Name PSReadLine -Repository PSGallery -Force -AllowPrerelease -Scope CurrentUser -SkipPublisherCheck
      ```
      ```PowerShell
      Set-PSReadLineOption -PredictionSource History
      ```
    - [PSFzf](https://www.powershellgallery.com/packages/PSFzf).
      ```PowerShell
      Install-Module -Name PSFzf -Repository PSGallery -Force -AllowPrerelease -Scope CurrentUser -SkipPublisherCheck
      ```
      ```PowerShell
      Set-PSFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'
      ```
    - Set prompt in user profile.
      ```PowerShell
      nvim .config\powershell\user_profile.ps1
      ```      
      ```PowerShell
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
      ```
9. Set functions in user profile.
   ```PowerShell
   nvim .config\powershell\user_profile.ps1
   ```      
   ```PowerShell
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
   ```

## User Profile
```PowerShell user_profile.ps1
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
```

## References
[1] [How to set up PowerShell prompt with Oh My Posh on Windows 11](https://www.youtube.com/watch?v=5-aK2_WwrmM&list=PLeJfAHGvmvyDDOECvt6cWEhZqEXAMKO3g&index=3)
