#! /usr/bin/env nix-shell
#! nix-shell -i python3 -p python3


import subprocess
import re


def process_monitors(raw_input):
    lines = raw_input.split("\n")
    monitor_id = 0
    output = {}
    for line in lines:
        if re.search(r"active workspace", line):
            workspace_id = int(re.search(r"[0-9]", line).group(0))
            monitor_id += 1
            output[workspace_id] = monitor_id
    return output


def process_workspaces(raw_input):
    icons = {
       ".*Firefox.*": "",
       ".*@.*:.*": "",
       ".*Slack.*": "",
       ".*Zoom.*": "",
       ".*Spotify.*": "",
    }
    
    output = {}
    workspace_id = 1
    lines = raw_input.split("\n")
    for line in lines:
        if "workspace ID" in line:
            workspace_id = int(re.search(r"[0-9]", line).group(0))
            output[workspace_id] = ""
        if "lastwindowtitle" in line:
            for key in icons.keys():
                if re.match(key, line):
                    output[workspace_id] = icons[key]
    return output



def convert_to_color(num):
    value = (int(num) % 8) + 11
    return f"colors.$base{value:02x}"


output = ""
max_workspaces = 5
workspace_id = 0

monitors_command = subprocess.run(['hyprctl', 'monitors'], stdout=subprocess.PIPE)
monitors = process_monitors(monitors_command.stdout.decode('utf-8'))
workspaces_command = subprocess.run(['hyprctl', 'workspaces'], stdout=subprocess.PIPE)
workspaces = process_workspaces(workspaces_command.stdout.decode('utf-8'))

while workspace_id < max_workspaces:
    workspace_id += 1
    if workspace_id in monitors:
        output += convert_to_color(monitors[workspace_id])
    else:
        output += "colors.$base05"
    if workspace_id in workspaces:
        output += workspaces[workspace_id]
    else:
        output += ""

print(output)
