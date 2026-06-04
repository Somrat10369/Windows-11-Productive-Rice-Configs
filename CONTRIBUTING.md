# Contributing to Win-11-Config

First off, thank you for considering contributing to this repository! It’s people like you who make the open-source community such an amazing place to learn, inspire, and create. 

Whether you want to fix a bug, optimize a configuration script, or propose a new feature, all contributions are welcome.

Please take a moment to review this document before making any changes.

---

## Code of Conduct

By participating in this project, you agree to maintain a respectful, welcoming, and professional environment for everyone. Please be constructive and kind in all interactions.

## How Can I Contribute?

### 1. Reporting Bugs
If you find a bug, configuration issue, or a script that breaks a Windows feature unexpectedly:
* Check the [Issues](https://github.com/Somrat10369/Win-11-Config/issues) tab to see if it has already been reported.
* If it hasn't, open a new issue. Include details like your Windows 11 Build/Version, what the script did, what you expected to happen, and how to reproduce the issue.

### 2. Suggesting Features/Tweaks
Have an idea for a new Windows 11 optimization, privacy tweak, or debloat feature?
* Open an issue and use it to describe the configuration change you'd like to see.
* Explain *why* this change is beneficial and what the potential trade-offs might be (e.g., does it disable a feature some users might need?).

### 3. Submitting Changes (Pull Requests)
Ready to contribute code or documentation changes directly? Follow these steps:

1. **Fork the Repository:** Create your own copy of this repository on GitHub.
2. **Clone Your Fork:** Clone it to your local machine.
   ```bash
   git clone [https://github.com/Somrat10369/Win-11-Config.git](https://github.com/Somrat10369/Win-11-Config.git)
Create a Branch: Create a branch for your specific change. Keep it descriptive (e.g., fix-taskbar-tweak or add-privacy-script).

Bash
```bash
git checkout -b feature/your-feature-name
```

Make and Test Your Changes:  _Ensure your scripts are clean, commented, and safe to run._

**Warning: Always test your configuration changes in a Virtual Machine (VM) or a test environment before submitting to avoid system instability.**

Commit Changes: Write clear, concise commit messages.

Bash
```bash
git commit -m "Add optimization tweak for Windows 11 telemetry"
```
Push and Open a PR: Push the branch to your GitHub fork and open a Pull Request against the main branch of this repository.

## Pull Request Guidelines
To ensure quick approval of your Pull Request, please make sure:

>Your scripts or Registry modifications are safe, well-documented, and don't permanently break core Windows functionalities without warning.
>
>If you are introducing a disruptive tweak (e.g., completely removing a core feature), provide an easy way to revert/undo the change if possible.
>
>Code formatting remains consistent with the rest of the repository.
>
>The README.md is updated if you are adding new features or changing how the configuration is applied.

Security Disclosures
If you discover a security vulnerability within any script or configuration in this repository, please do not open a public issue. Instead, reach out to the maintainer directly or use GitHub's private vulnerability reporting if available.

**Thank you for helping improve the Windows 11 Configuration setup!**
