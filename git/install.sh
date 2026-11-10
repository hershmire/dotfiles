#!/bin/sh
#
# Install a launchd job that runs bin/git-gone-all once a day, deleting local
# branches (and their worktrees) whose remote branch was deleted.
# Output goes to ~/Library/Logs/git-gone.log.

label=com.dotfiles.git-gone
plist="$HOME/Library/LaunchAgents/$label.plist"
dotfiles=$(cd "$(dirname "$0")/.." && pwd)

mkdir -p "$HOME/Library/LaunchAgents" "$HOME/Library/Logs"

cat > "$plist" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key>
  <string>$label</string>
  <key>ProgramArguments</key>
  <array>
    <string>$dotfiles/bin/git-gone-all</string>
  </array>
  <key>EnvironmentVariables</key>
  <dict>
    <key>PATH</key>
    <string>/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin</string>
  </dict>
  <!-- Daily at 12:30. A run missed while asleep happens on wake. -->
  <key>StartCalendarInterval</key>
  <dict>
    <key>Hour</key>
    <integer>12</integer>
    <key>Minute</key>
    <integer>30</integer>
  </dict>
  <key>StandardOutPath</key>
  <string>$HOME/Library/Logs/git-gone.log</string>
  <key>StandardErrorPath</key>
  <string>$HOME/Library/Logs/git-gone.log</string>
  <key>LowPriorityIO</key>
  <true/>
  <key>ProcessType</key>
  <string>Background</string>
</dict>
</plist>
EOF

launchctl bootout "gui/$(id -u)/$label" 2>/dev/null
launchctl bootstrap "gui/$(id -u)" "$plist" && echo "Installed $label (daily git-gone-all)"
