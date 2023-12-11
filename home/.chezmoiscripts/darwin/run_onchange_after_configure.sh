#!/bin/bash

set -eufo pipefail

# https://github.com/mathiasbynens/dotfiles/blob/main/.macos

# Dark Mode and Language Settings
# Set the system interface to Dark Mode.
defaults write NSGlobalDomain AppleInterfaceStyle Dark
# Set the primary language of the system to English (United States).
defaults write NSGlobalDomain AppleLanguages -array en-US
# Set the system locale to English (United States).
defaults write NSGlobalDomain AppleLocale en_US

# Keyboard Settings
# Adjust the delay before a key starts repeating when held down.
defaults write NSGlobalDomain InitialKeyRepeat -int 15
# Set the key repeat rate (the speed at which a key repeats when held down).
defaults write NSGlobalDomain KeyRepeat -int 2
# Disable automatic capitalization.
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
# Disable automatic period substitution.
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
# Disable automatic quote substitution.
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
# Disable automatic spelling correction.
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
# Disable automatic text completion.
defaults write NSGlobalDomain NSAutomaticTextCompletionEnabled -bool false
# Request linguistic data assets for English and US English.
defaults write NSGlobalDomain NSLinguisticDataAssetsRequested -array en en_US
# Set user dictionary replacement items (empty in this command).
defaults write NSGlobalDomain NSUserDictionaryReplacementItems -array
# Disable automatic spelling correction in web content.
defaults write NSGlobalDomain WebAutomaticSpellingCorrectionEnabled -bool false

# Trackpad and Scroll Settings
# Disable natural scrolling direction.
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true

# Dock Settings
# Enable auto-hiding of the Dock.
defaults write com.apple.dock autohide -bool true
# Set the delay before the Dock auto-hides to zero.
defaults write com.apple.dock autohide-delay -float 0
# Set the animation time for Dock auto-hide to zero.
defaults write com.apple.dock autohide-time-modifier -float 0
# Disable the animation when launching applications from the Dock.
defaults write com.apple.dock launchanim -bool false
# Position the Dock on the left side of the screen.
defaults write com.apple.dock orientation left
# Disable the recent applications section in the Dock.
defaults write com.apple.dock show-recents -bool false

# Global Settings
# Disable the press-and-hold for keys to access accented characters.
defaults write -g ApplePressAndHoldEnabled -bool false

# Finder Settings:
# Display the full POSIX path as the Finder window title.
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# System Preferences Settings:
# Disable the feature where windows are kept when quitting and re-opening apps.
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

# Notification Center Settings:
# Disable the Notification Center.
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null