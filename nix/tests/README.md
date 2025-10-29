# Nix Configuration Tests

This directory contains comprehensive unit tests for the NixOS configuration files.

## Overview

The test suite validates:
- **Syntax correctness**: Ensures Nix files have valid structure (balanced braces, brackets, etc.)
- **Required attributes**: Verifies all necessary configuration options are present
- **Logical consistency**: Checks for conflicts and ensures related settings match
- **File references**: Validates all imports and module references exist
- **Configuration values**: Tests specific settings are correctly configured

## Running Tests

### Run all tests:
```bash
cd nix/tests
./run_tests.sh
```

### Run specific test class:
```bash
python3 -m unittest test_nix_configurations.TestHyprlandHomeModule
```

### Run specific test:
```bash
python3 -m unittest test_nix_configurations.TestHyprlandHomeModule.test_all_workspace_bindings
```

### Run with verbose output:
```bash
python3 -m unittest discover -v
```

## Test Structure

### Test Classes

- **TestNixSyntax**: Validates basic Nix syntax for all changed files
- **TestFlakeConfiguration**: Tests flake.nix structure and inputs
- **TestHyprlandHomeModule**: Validates home-manager Hyprland configuration
- **TestWalkerModule**: Tests Walker launcher configuration
- **TestWaybarModule**: Tests Waybar status bar configuration
- **TestSystemHyprlandModule**: Validates system-level Hyprland setup
- **TestTerminalModule**: Tests terminal module changes
- **TestCommonModules**: Validates common module modifications
- **TestAliasesFile**: Tests shell aliases changes
- **TestFileReferences**: Ensures all imports and references exist
- **TestLogicalConsistency**: Checks consistency across related configs

## Test Coverage

The test suite covers:

### Hyprland Configuration (home/modules/hyprland.nix)
- ✅ Module imports (walker, waybar)
- ✅ Hyprland and xwayland enabled
- ✅ Keyboard layout and options
- ✅ Keyboard repeat settings
- ✅ Touchpad configuration
- ✅ All workspace bindings (1-10)
- ✅ Vim-style (hjkl) navigation
- ✅ Essential keybindings
- ✅ Mouse bindings
- ✅ Visual settings (gaps, borders, colors)
- ✅ Animation settings

### Walker Configuration (home/modules/walker.nix)
- ✅ Walker program enabled
- ✅ Run as service configured
- ✅ Quick activate keybinds (1-7)

### Waybar Configuration (home/modules/waybar.nix)
- ✅ Waybar enabled
- ✅ Bar position and height
- ✅ Multi-display output configuration
- ✅ Hyprland workspace integration
- ✅ Workspace display options

### System Configuration (system/modules/hyprland.nix)
- ✅ Hyprland program enabled at system level
- ✅ Xwayland enabled
- ✅ Wayland session variables
- ✅ Display manager configuration
- ✅ Autologin setup
- ✅ X server compatibility settings
- ✅ Keyboard repeat consistency with home config

### Flake Configuration (flake.nix)
- ✅ Required inputs declared
- ✅ Walker follows elephant input
- ✅ Output function signature
- ✅ NixOS system configurations
- ✅ Home Manager configurations
- ✅ Walker module inclusion

### Terminal Module (home/modules/terminal.nix)
- ✅ Editor and git module imports
- ✅ Zsh integration

### Common Modules
- ✅ Blueman configuration preserved
- ✅ Nixpkgs unfree setting
- ✅ Zsh enabled in system config

### Shell Aliases (dotfiles/.aliases)
- ✅ Deprecated 'hm' alias removed
- ✅ Essential aliases preserved

## CI Integration

These tests are designed to complement the existing `nix flake check` validation
in the GitHub Actions workflow. While `nix flake check` validates that configurations
can be built, these tests provide additional validation of:

- Configuration structure and completeness
- Logical consistency between related settings
- Presence of required options
- Correctness of specific values

## Adding New Tests

When adding new Nix modules or modifying existing ones:

1. Add test cases to the appropriate test class or create a new one
2. Follow the existing naming convention: `test_<what_is_being_tested>`
3. Use descriptive assertion messages
4. Test both positive cases (what should exist) and negative cases (what shouldn't)
5. Update this README with the new test coverage

## Dependencies

- Python 3.6+
- Standard library only (no external dependencies required)

## Philosophy

These tests follow the principle that **configuration is code**. Just as application
code should be tested, infrastructure configuration deserves comprehensive test coverage
to catch errors early and document expected behavior.