#!/usr/bin/env python3
# Event-driven replacement for the old `while true; do hyprctl devices; done`
# busy-loop, which had no sleep and pegged a CPU core 24/7 (high fan noise,
# fast battery drain). This now blocks on Hyprland's IPC event socket and
# only re-queries the layout when an `activelayout>>` event actually fires.
import os
import socket
import subprocess
import sys


def get_layout():
    try:
        out = subprocess.run(
            ["hyprctl", "devices"], capture_output=True, text=True, check=True
        ).stdout
    except Exception:
        return ""
    for line in out.splitlines():
        if "active keymap" in line:
            return line.split(":", 1)[1]
    return ""


def main():
    print(get_layout(), flush=True)

    sig = os.environ.get("HYPRLAND_INSTANCE_SIGNATURE")
    runtime = os.environ.get("XDG_RUNTIME_DIR", f"/run/user/{os.getuid()}")
    if not sig:
        sys.exit(1)
    sock_path = os.path.join(runtime, "hypr", sig, ".socket2.sock")

    with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as s:
        s.connect(sock_path)
        buf = b""
        while True:
            data = s.recv(4096)
            if not data:
                break
            buf += data
            while b"\n" in buf:
                line, buf = buf.split(b"\n", 1)
                if line.startswith(b"activelayout>>"):
                    print(get_layout(), flush=True)


if __name__ == "__main__":
    main()
