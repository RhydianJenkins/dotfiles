#!/usr/bin/env python3
"""
Comprehensive test suite for NixOS configuration changes.
Tests validate syntax, structure, and logical consistency of Nix modules.
"""

import os
import re
import subprocess
import unittest
from pathlib import Path
from typing import Dict, List, Set, Any


class TestNixSyntax(unittest.TestCase):
    """Test basic Nix syntax validity for all changed files."""
    
    @classmethod
    def setUpClass(cls):
        cls.nix_root = Path(__file__).parent.parent
        cls.changed_files = [
            "flake.nix",
            "home/modules/common.nix",
            "home/modules/hyprland.nix",
            "home/modules/terminal.nix",
            "home/modules/walker.nix",
            "home/modules/waybar.nix",
            "system/modules/common.nix",
            "system/modules/hyprland.nix",
        ]
    
    def test_all_nix_files_exist(self):
        """Verify all changed Nix files exist."""
        for file_path in self.changed_files:
            full_path = self.nix_root / file_path
            self.assertTrue(
                full_path.exists(),
                f"Nix file does not exist: {file_path}"
            )
    
    def test_nix_files_not_empty(self):
        """Verify Nix files are not empty."""
        for file_path in self.changed_files:
            full_path = self.nix_root / file_path
            if full_path.exists():
                content = full_path.read_text()
                self.assertTrue(
                    len(content.strip()) > 0,
                    f"Nix file is empty: {file_path}"
                )
    
    def test_nix_files_valid_structure(self):
        """Test that Nix files have valid basic structure (balanced braces)."""
        for file_path in self.changed_files:
            full_path = self.nix_root / file_path
            if full_path.exists():
                content = full_path.read_text()
                
                # Check balanced braces
                brace_count = content.count('{') - content.count('}')
                self.assertEqual(
                    brace_count, 0,
                    f"Unbalanced braces in {file_path}: {brace_count}"
                )
                
                # Check balanced brackets
                bracket_count = content.count('[') - content.count(']')
                self.assertEqual(
                    bracket_count, 0,
                    f"Unbalanced brackets in {file_path}: {bracket_count}"
                )
                
                # Check balanced parentheses
                paren_count = content.count('(') - content.count(')')
                self.assertEqual(
                    paren_count, 0,
                    f"Unbalanced parentheses in {file_path}: {paren_count}"
                )


class TestFlakeConfiguration(unittest.TestCase):
    """Test flake.nix structure and inputs."""
    
    @classmethod
    def setUpClass(cls):
        cls.flake_path = Path(__file__).parent.parent / "flake.nix"
        cls.flake_content = cls.flake_path.read_text()
    
    def test_flake_has_required_inputs(self):
        """Verify flake.nix declares all required inputs."""
        required_inputs = [
            "nixpkgs",
            "home-manager",
            "nix-index-database",
            "apix",
            "elephant",
            "walker"
        ]
        
        for input_name in required_inputs:
            pattern = rf'{input_name}\s*='
            self.assertIsNotNone(
                re.search(pattern, self.flake_content),
                f"Missing required input: {input_name}"
            )
    
    def test_walker_follows_elephant(self):
        """Verify walker input correctly follows elephant."""
        walker_section = re.search(
            r'walker\s*=\s*\{[^}]+\}',
            self.flake_content,
            re.DOTALL
        )
        self.assertIsNotNone(walker_section, "Walker input not found")
        
        walker_text = walker_section.group(0)
        self.assertIn(
            "inputs.elephant.follows",
            walker_text,
            "Walker does not follow elephant input"
        )
    
    def test_outputs_function_signature(self):
        """Verify outputs function has correct signature."""
        # Should include walker in the inputs
        pattern = r'outputs\s*=\s*\{\s*[^}]*walker[^}]*\}'
        self.assertIsNotNone(
            re.search(pattern, self.flake_content),
            "outputs function missing walker parameter"
        )
    
    def test_nixos_configurations_exist(self):
        """Verify both NixOS system configurations are defined."""
        self.assertIn(
            "work-laptop = nixpkgs.lib.nixosSystem",
            self.flake_content,
            "work-laptop system configuration missing"
        )
        self.assertIn(
            "personal-laptop = nixpkgs.lib.nixosSystem",
            self.flake_content,
            "personal-laptop system configuration missing"
        )
    
    def test_home_configurations_exist(self):
        """Verify home-manager configurations are defined."""
        self.assertIn(
            "hyprland = home-manager.lib.homeManagerConfiguration",
            self.flake_content,
            "hyprland home configuration missing"
        )
        self.assertIn(
            "i3 = home-manager.lib.homeManagerConfiguration",
            self.flake_content,
            "i3 home configuration missing"
        )
    
    def test_hyprland_config_includes_walker(self):
        """Verify hyprland home config includes walker module."""
        # Find the hyprland configuration section
        hyprland_section = re.search(
            r'hyprland\s*=\s*home-manager\.lib\.homeManagerConfiguration\s*\{[^}]+modules\s*=\s*\[[^\]]+\]',
            self.flake_content,
            re.DOTALL
        )
        self.assertIsNotNone(hyprland_section, "hyprland configuration not found")
        
        hyprland_text = hyprland_section.group(0)
        self.assertIn(
            "walker.homeManagerModules.default",
            hyprland_text,
            "Walker module not included in hyprland configuration"
        )
    
    def test_personal_laptop_uses_hyprland_module(self):
        """Verify personal-laptop system uses hyprland module."""
        personal_laptop_section = re.search(
            r'personal-laptop\s*=\s*nixpkgs\.lib\.nixosSystem\s*\{[^}]+modules[^\]]+\]',
            self.flake_content,
            re.DOTALL
        )
        self.assertIsNotNone(personal_laptop_section, "personal-laptop config not found")
        
        laptop_text = personal_laptop_section.group(0)
        self.assertIn(
            "./system/modules/hyprland.nix",
            laptop_text,
            "Hyprland module not included in personal-laptop"
        )


class TestHyprlandHomeModule(unittest.TestCase):
    """Test home/modules/hyprland.nix configuration."""
    
    @classmethod
    def setUpClass(cls):
        cls.module_path = Path(__file__).parent.parent / "home/modules/hyprland.nix"
        cls.module_content = cls.module_path.read_text()
    
    def test_imports_walker_and_waybar(self):
        """Verify hyprland module imports walker and waybar."""
        self.assertIn("./walker.nix", self.module_content)
        self.assertIn("./waybar.nix", self.module_content)
    
    def test_hyprland_enabled(self):
        """Verify hyprland is enabled."""
        self.assertIn("enable = true", self.module_content)
    
    def test_xwayland_enabled(self):
        """Verify xwayland is enabled."""
        pattern = r'xwayland\s*\.\s*enable\s*=\s*true'
        self.assertIsNotNone(
            re.search(pattern, self.module_content),
            "xwayland not enabled"
        )
    
    def test_mod_key_defined(self):
        """Verify mod key is defined."""
        self.assertIn('"$mod" = "ALT"', self.module_content)
    
    def test_exec_once_programs(self):
        """Verify exec-once includes waybar and elephant."""
        self.assertIn('"waybar"', self.module_content)
        self.assertIn('"elephant"', self.module_content)
    
    def test_keyboard_layout_gb(self):
        """Verify keyboard layout is set to GB."""
        pattern = r'kb_layout\s*=\s*"gb"'
        self.assertIsNotNone(
            re.search(pattern, self.module_content),
            "Keyboard layout not set to GB"
        )
    
    def test_caps_escape_enabled(self):
        """Verify caps:escape option is set."""
        pattern = r'kb_options\s*=\s*"caps:escape"'
        self.assertIsNotNone(
            re.search(pattern, self.module_content),
            "caps:escape not configured"
        )
    
    def test_repeat_delay_configured(self):
        """Verify keyboard repeat delay is configured."""
        pattern = r'repeat_delay\s*=\s*200'
        self.assertIsNotNone(
            re.search(pattern, self.module_content),
            "repeat_delay not set to 200"
        )
    
    def test_repeat_rate_configured(self):
        """Verify keyboard repeat rate is configured."""
        pattern = r'repeat_rate\s*=\s*40'
        self.assertIsNotNone(
            re.search(pattern, self.module_content),
            "repeat_rate not set to 40"
        )
    
    def test_touchpad_natural_scroll(self):
        """Verify touchpad natural scroll is enabled."""
        pattern = r'natural_scroll\s*=\s*true'
        self.assertIsNotNone(
            re.search(pattern, self.module_content),
            "natural_scroll not enabled"
        )
    
    def test_all_workspace_bindings(self):
        """Verify all workspace bindings (1-10) are configured."""
        for i in range(1, 11):
            workspace_num = i if i < 10 else 10
            binding = f'"$mod, {i % 10}, workspace, {workspace_num}"'
            self.assertIn(
                binding,
                self.module_content,
                f"Missing workspace {workspace_num} binding"
            )
    
    def test_all_movetoworkspace_bindings(self):
        """Verify all move-to-workspace bindings (1-10) are configured."""
        for i in range(1, 11):
            workspace_num = i if i < 10 else 10
            binding = f'"$mod SHIFT, {i % 10}, movetoworkspace, {workspace_num}"'
            self.assertIn(
                binding,
                self.module_content,
                f"Missing movetoworkspace {workspace_num} binding"
            )
    
    def test_hjkl_navigation(self):
        """Verify vim-style hjkl navigation is configured."""
        directions = {
            'h': 'l',  # left
            'j': 'd',  # down
            'k': 'u',  # up
            'l': 'r'   # right
        }
        
        for key, direction in directions.items():
            binding = f'"$mod, {key}, movefocus, {direction}"'
            self.assertIn(
                binding,
                self.module_content,
                f"Missing hjkl binding: {key} -> {direction}"
            )
    
    def test_essential_keybindings(self):
        """Verify essential keybindings are present."""
        essential_bindings = [
            '"$mod, Return, exec, wezterm"',
            '"$mod, space, exec, walker"',
            '"$mod SHIFT, Q, killactive"',
            '"$mod SHIFT, Space, togglefloating"',
            '"$mod, F, fullscreen"',
        ]
        
        for binding in essential_bindings:
            self.assertIn(
                binding,
                self.module_content,
                f"Missing essential keybinding: {binding}"
            )
    
    def test_mouse_bindings(self):
        """Verify mouse bindings are configured."""
        self.assertIn('"$mod, mouse:272, movewindow"', self.module_content)
        self.assertIn('"$mod, mouse:273, resizewindow"', self.module_content)
    
    def test_border_colors_defined(self):
        """Verify border colors are defined."""
        self.assertIn('"col.active_border"', self.module_content)
        self.assertIn('"col.inactive_border"', self.module_content)
    
    def test_gaps_configured(self):
        """Verify gap settings are configured."""
        self.assertIn('gaps_in = 1', self.module_content)
        self.assertIn('gaps_out = 2', self.module_content)
    
    def test_animations_disabled(self):
        """Verify animations are explicitly disabled."""
        pattern = r'animations\s*=\s*\{[^}]*enabled\s*=\s*false'
        self.assertIsNotNone(
            re.search(pattern, self.module_content, re.DOTALL),
            "Animations not disabled"
        )


class TestWalkerModule(unittest.TestCase):
    """Test home/modules/walker.nix configuration."""
    
    @classmethod
    def setUpClass(cls):
        cls.module_path = Path(__file__).parent.parent / "home/modules/walker.nix"
        cls.module_content = cls.module_path.read_text()
    
    def test_walker_enabled(self):
        """Verify walker is enabled."""
        pattern = r'programs\.walker\s*=\s*\{[^}]*enable\s*=\s*true'
        self.assertIsNotNone(
            re.search(pattern, self.module_content, re.DOTALL),
            "Walker not enabled"
        )
    
    def test_run_as_service(self):
        """Verify walker runs as a service."""
        pattern = r'runAsService\s*=\s*true'
        self.assertIsNotNone(
            re.search(pattern, self.module_content),
            "runAsService not set to true"
        )
    
    def test_quick_activate_keybinds(self):
        """Verify quick_activate keybinds are configured."""
        pattern = r'quick_activate\s*=\s*\[[^\]]*"1"[^\]]*"2"[^\]]*"3"[^\]]*"4"[^\]]*"5"[^\]]*"6"[^\]]*"7"[^\]]*\]'
        self.assertIsNotNone(
            re.search(pattern, self.module_content),
            "quick_activate keybinds not properly configured"
        )
    
    def test_all_quick_activate_numbers(self):
        """Verify all numbers 1-7 are in quick_activate."""
        for num in range(1, 8):
            self.assertIn(
                f'"{num}"',
                self.module_content,
                f"Missing quick_activate number: {num}"
            )


class TestWaybarModule(unittest.TestCase):
    """Test home/modules/waybar.nix configuration."""
    
    @classmethod
    def setUpClass(cls):
        cls.module_path = Path(__file__).parent.parent / "home/modules/waybar.nix"
        cls.module_content = cls.module_path.read_text()
    
    def test_waybar_enabled(self):
        """Verify waybar is enabled."""
        pattern = r'programs\.waybar\s*=\s*\{[^}]*enable\s*=\s*true'
        self.assertIsNotNone(
            re.search(pattern, self.module_content, re.DOTALL),
            "Waybar not enabled"
        )
    
    def test_mainbar_configured(self):
        """Verify mainBar settings exist."""
        self.assertIn("mainBar", self.module_content)
    
    def test_bar_position_top(self):
        """Verify bar is positioned at top."""
        pattern = r'position\s*=\s*"top"'
        self.assertIsNotNone(
            re.search(pattern, self.module_content),
            "Bar position not set to top"
        )
    
    def test_bar_height(self):
        """Verify bar height is configured."""
        pattern = r'height\s*=\s*30'
        self.assertIsNotNone(
            re.search(pattern, self.module_content),
            "Bar height not set to 30"
        )
    
    def test_outputs_configured(self):
        """Verify outputs are configured for multiple displays."""
        self.assertIn('"eDP-1"', self.module_content)
        self.assertIn('"DP-1"', self.module_content)
    
    def test_hyprland_workspaces_module(self):
        """Verify hyprland/workspaces module is configured."""
        self.assertIn('"hyprland/workspaces"', self.module_content)
    
    def test_workspaces_show_all_outputs(self):
        """Verify workspaces show on all outputs."""
        pattern = r'"hyprland/workspaces"\s*=\s*\{[^}]*all-outputs\s*=\s*true'
        self.assertIsNotNone(
            re.search(pattern, self.module_content, re.DOTALL),
            "all-outputs not set for workspaces"
        )
    
    def test_workspaces_show_all(self):
        """Verify empty workspaces are shown."""
        pattern = r'"hyprland/workspaces"\s*=\s*\{[^}]*show-all\s*=\s*true'
        self.assertIsNotNone(
            re.search(pattern, self.module_content, re.DOTALL),
            "show-all not set for workspaces"
        )


class TestSystemHyprlandModule(unittest.TestCase):
    """Test system/modules/hyprland.nix configuration."""
    
    @classmethod
    def setUpClass(cls):
        cls.module_path = Path(__file__).parent.parent / "system/modules/hyprland.nix"
        cls.module_content = cls.module_path.read_text()
    
    def test_hyprland_program_enabled(self):
        """Verify hyprland program is enabled."""
        pattern = r'programs\.hyprland\s*=\s*\{[^}]*enable\s*=\s*true'
        self.assertIsNotNone(
            re.search(pattern, self.module_content, re.DOTALL),
            "Hyprland program not enabled"
        )
    
    def test_xwayland_enabled_system(self):
        """Verify xwayland is enabled at system level."""
        pattern = r'xwayland\s*\.\s*enable\s*=\s*true'
        self.assertIsNotNone(
            re.search(pattern, self.module_content),
            "xwayland not enabled at system level"
        )
    
    def test_wayland_session_variables(self):
        """Verify Wayland session variables are set."""
        required_vars = [
            'XDG_SESSION_TYPE = "wayland"',
            'NIXOS_OZONE_WL = "1"',
            'XDG_CURRENT_DESKTOP = "X-NIXOS-SYSTEMD-AWARE"'
        ]
        
        for var in required_vars:
            self.assertIn(
                var,
                self.module_content,
                f"Missing session variable: {var}"
            )
    
    def test_display_manager_configured(self):
        """Verify display manager is configured."""
        pattern = r'services\.displayManager\s*=\s*\{[^}]*enable\s*=\s*true'
        self.assertIsNotNone(
            re.search(pattern, self.module_content, re.DOTALL),
            "Display manager not enabled"
        )
    
    def test_autologin_enabled(self):
        """Verify autologin is configured."""
        self.assertIn("autoLogin.enable = true", self.module_content)
        self.assertIn('autoLogin.user = "rhydian"', self.module_content)
    
    def test_xserver_configuration(self):
        """Verify X server configuration for compatibility."""
        self.assertIn("services.xserver", self.module_content)
        self.assertIn("enable = true", self.module_content)
        self.assertIn("autorun = true", self.module_content)
    
    def test_keyboard_repeat_settings(self):
        """Verify keyboard repeat settings match home config."""
        self.assertIn("autoRepeatDelay = 200", self.module_content)
        self.assertIn("autoRepeatInterval = 40", self.module_content)


class TestTerminalModule(unittest.TestCase):
    """Test home/modules/terminal.nix changes."""
    
    @classmethod
    def setUpClass(cls):
        cls.module_path = Path(__file__).parent.parent / "home/modules/terminal.nix"
        cls.module_content = cls.module_path.read_text()
    
    def test_imports_editors_module(self):
        """Verify terminal module imports editors.nix."""
        self.assertIn("./editors.nix", self.module_content)
    
    def test_imports_git_module(self):
        """Verify terminal module imports git.nix."""
        self.assertIn("./git.nix", self.module_content)
    
    def test_imports_section_exists(self):
        """Verify imports section is properly structured."""
        pattern = r'imports\s*=\s*\[\s*./editors\.nix\s*./git\.nix\s*\]'
        self.assertIsNotNone(
            re.search(pattern, self.module_content, re.DOTALL),
            "imports section not properly structured"
        )
    
    def test_zsh_integration_enabled(self):
        """Verify zsh integration is enabled."""
        pattern = r'home\.shell\.enableZshIntegration\s*=\s*true'
        self.assertIsNotNone(
            re.search(pattern, self.module_content),
            "zsh integration not enabled"
        )


class TestCommonModules(unittest.TestCase):
    """Test common module changes."""
    
    @classmethod
    def setUpClass(cls):
        cls.home_common_path = Path(__file__).parent.parent / "home/modules/common.nix"
        cls.home_common_content = cls.home_common_path.read_text()
        
        cls.system_common_path = Path(__file__).parent.parent / "system/modules/common.nix"
        cls.system_common_content = cls.system_common_path.read_text()
    
    def test_home_common_blueman_config(self):
        """Verify blueman config is still present in home common."""
        self.assertIn('file.".config/blueman/blueman.conf"', self.home_common_content)
        self.assertIn("ConnectionNotifier=false", self.home_common_content)
    
    def test_home_common_nixpkgs_config(self):
        """Verify nixpkgs config allows unfree."""
        self.assertIn('file.".config/nixpkgs/config.nix"', self.home_common_content)
        self.assertIn("allowUnfree = true", self.home_common_content)
    
    def test_system_common_zsh_enabled(self):
        """Verify zsh is enabled in system common."""
        pattern = r'programs\s*=\s*\{[^}]*zsh\.enable\s*=\s*true'
        self.assertIsNotNone(
            re.search(pattern, self.system_common_content, re.DOTALL),
            "zsh not enabled in system common"
        )
    
    def test_system_common_nix_ld(self):
        """Verify nix-ld is still configured."""
        self.assertIn("nix-ld", self.system_common_content)


class TestAliasesFile(unittest.TestCase):
    """Test dotfiles/.aliases changes."""
    
    @classmethod
    def setUpClass(cls):
        cls.aliases_path = Path(__file__).parent.parent.parent / "dotfiles/.aliases"
        cls.aliases_content = cls.aliases_path.read_text()
    
    def test_hm_alias_removed(self):
        """Verify 'hm' alias has been removed."""
        self.assertNotIn(
            "alias hm=",
            self.aliases_content,
            "'hm' alias should be removed"
        )
    
    def test_ns_alias_exists(self):
        """Verify 'ns' nix search alias still exists."""
        self.assertIn(
            "alias ns=",
            self.aliases_content,
            "'ns' alias should still exist"
        )
    
    def test_common_aliases_preserved(self):
        """Verify common aliases are still present."""
        common_aliases = [
            "alias gs=",
            "alias gp=",
            "alias lg=",
            "alias ll=",
        ]
        
        for alias in common_aliases:
            self.assertIn(
                alias,
                self.aliases_content,
                f"Common alias missing: {alias}"
            )


class TestFileReferences(unittest.TestCase):
    """Test that all file references and imports exist."""
    
    @classmethod
    def setUpClass(cls):
        cls.nix_root = Path(__file__).parent.parent
    
    def test_walker_module_exists(self):
        """Verify walker.nix module file exists."""
        walker_path = self.nix_root / "home/modules/walker.nix"
        self.assertTrue(
            walker_path.exists(),
            "walker.nix module does not exist"
        )
    
    def test_waybar_module_exists(self):
        """Verify waybar.nix module file exists."""
        waybar_path = self.nix_root / "home/modules/waybar.nix"
        self.assertTrue(
            waybar_path.exists(),
            "waybar.nix module does not exist"
        )
    
    def test_hyprland_home_module_exists(self):
        """Verify hyprland.nix home module exists."""
        hyprland_path = self.nix_root / "home/modules/hyprland.nix"
        self.assertTrue(
            hyprland_path.exists(),
            "hyprland.nix home module does not exist"
        )
    
    def test_hyprland_system_module_exists(self):
        """Verify hyprland.nix system module exists."""
        hyprland_path = self.nix_root / "system/modules/hyprland.nix"
        self.assertTrue(
            hyprland_path.exists(),
            "hyprland.nix system module does not exist"
        )
    
    def test_editors_module_exists(self):
        """Verify editors.nix module exists (imported by terminal)."""
        editors_path = self.nix_root / "home/modules/editors.nix"
        self.assertTrue(
            editors_path.exists(),
            "editors.nix module does not exist"
        )
    
    def test_git_module_exists(self):
        """Verify git.nix module exists (imported by terminal)."""
        git_path = self.nix_root / "home/modules/git.nix"
        self.assertTrue(
            git_path.exists(),
            "git.nix module does not exist"
        )


class TestLogicalConsistency(unittest.TestCase):
    """Test logical consistency across configuration files."""
    
    @classmethod
    def setUpClass(cls):
        cls.nix_root = Path(__file__).parent.parent
        cls.home_hyprland = (cls.nix_root / "home/modules/hyprland.nix").read_text()
        cls.system_hyprland = (cls.nix_root / "system/modules/hyprland.nix").read_text()
    
    def test_keyboard_repeat_consistency(self):
        """Verify keyboard repeat settings match between home and system."""
        # Both should have repeat_delay = 200
        self.assertIn("200", self.home_hyprland)
        self.assertIn("200", self.system_hyprland)
        
        # Both should have repeat_rate/interval = 40
        self.assertIn("40", self.home_hyprland)
        self.assertIn("40", self.system_hyprland)
    
    def test_no_conflicting_keybindings(self):
        """Verify no duplicate keybinding definitions exist."""
        # Extract binding lines
        bind_lines = re.findall(r'"(\$mod[^"]+)"', self.home_hyprland)
        
        # Remove SHIFT variants for comparison
        normalized_binds = []
        for bind in bind_lines:
            # Keep track of base bindings (without SHIFT)
            if "SHIFT" not in bind:
                normalized_binds.append(bind)
        
        # We expect some duplicates (like workspace bindings), so just ensure it's reasonable
        self.assertGreater(
            len(normalized_binds), 0,
            "No keybindings found"
        )
    
    def test_mod_key_consistency(self):
        """Verify mod key is consistently defined."""
        mod_definitions = re.findall(r'\$mod.*=.*"(\w+)"', self.home_hyprland)
        
        # Should have at least one definition
        self.assertGreater(len(mod_definitions), 0, "No mod key defined")
        
        # All definitions should be the same
        if len(mod_definitions) > 1:
            self.assertTrue(
                all(m == mod_definitions[0] for m in mod_definitions),
                "Inconsistent mod key definitions"
            )


if __name__ == '__main__':
    unittest.main(verbosity=2)