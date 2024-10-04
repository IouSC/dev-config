# Development Environment Setup on Windows

This document offers a step-by-step guide for installing Conda and Pip on a Windows machine.

We will choose the following tools for efficient and reliable environment management:
- A language-agnostic package manager and environment management system: [Miniconda3](https://github.com/conda-forge/miniforge).
- A Python package and project manager: [uv](https://github.com/astral-sh/uv).

## Table of Contents
- [Development Environment Setup on Windows](#development-environment-setup-on-windows)
  - [Table of Contents](#table-of-contents)
  - [Prerequisites](#prerequisites)
  - [Installation Instructions](#installation-instructions)
  - [References](#references)

## Prerequisites
Ensure that you have:
- Administrator privileges on the Windows machine.
- A stable internet connection.

## Installation Instructions
1. Install the latest `Miniforge3-Windows-x86_64.exe` from the conda-forge git repo [Releases](https://github.com/conda-forge/miniforge/releases) page.
2. Add `conda` and `mamba`'s paths to PowerShell's environment.
   - Open a PowerShell prompt with administrator privilege and run the following command:
      ```Powershell
      conda init powershell
      ```
   - Restart PowerShell and test `conda` and `mamba`.
      ```Powershell
      conda env list
      ```
3. Install `uv`.
    ```Powershell
    conda install uv -c conda-forge
    ```
   > Install all other necessary packages with `uv` - an extremely fast Python package and project manager.
   - Install: `uv tool install`
   - Upgrade: `uv.exe tool upgrade --all`
4. update conda and its packages.
    ```Powershell
    conda update conda
    conda update --all
    ```
5. Update all `pip` packages.
    ```Powershell
    pip list --outdated --format=json | ConvertFrom-Json | ForEach-Object {pip install --upgrade $_.name}
    ```

## References
[1] .