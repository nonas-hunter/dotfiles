#!/bin/sh

command=$1

if [[ ! "$command" =~ install|update ]]; then
	echo "Error: First argument must be a valid command (install or update)"
	exit 1
fi

shift

options=$(getopt -l "system:,distro:" -o "s:d:" -- "$@")

eval set -- "$options"

while true; do
	case "$1" in
		-s|--system)
			system="$2" ; shift 2
			if [[ ! "$system" =~ linux|darwin ]]; then
				echo "Error: System not recognized, must be linux or darwin"
				exit 1
			fi ;;
		-d|--distro)
			distro="$2"; shift 2
			if [[ ! "$distro" =~ arch ]]; then
				echo "Error: Distro not recognized, must be arch"
				exit 1
			fi;;
		--) shift ; break ;;
		*) echo "Error: Unrecognized command/options, $1" ; exit 1 ;;
	esac
done


case "$command" in
	install)
		if [ -z "$system" ] && [ -z "$distro" ]; then
			echo "Error: System or distro must be defined"
			exit 1
		fi

		if [[ ! -z "$system" ]]; then
			echo "Install multi-user nix for $system"
			case "$system" in
				linux)
					sh <(curl -L https://nixos.org/nix/install) --daemon ;;

				darwin)
					sh <(curl -L https://nixos.org/nix/install) ;;
			esac

			# echo "Source nix from $HOME/.nixprofile/etc/profiles.d/nix.sh"
			# . $HOME/.nix-profile/etc/profiles.d/nix.sh

			# echo "Make per-user directories"
			# mkdir /nix/var/nix/profiles/per-user/$USER
			# mkdir /nix/var/nix/gcroots/per-user/$USER

			echo "Add nixpkgs and home-manager channels and update channels"
			nix-channel --add https://nixos.org/channels/nixos-unstable nixpkgs
			nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
			nix-channel --update

			echo "Install home-manager"
			nix-shell '<home-manager>' -A install

			# echo "Source nix again"
			# . $HOME/.nix-profile/etc/profile.d/nix.sh
		fi

		if [[ ! -z  "$distro" ]]; then
			echo "Installing the following packages from ./packages/${distro}.txt"
			eval "cat ./packages/${distro}.txt | sed 's/^/  /'"
			echo "Install will require sudo permisions."
			case "$distro" in
				arch)
					sudo pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(sort ./packages/${distro}.txt))
			esac
		fi

		echo "Complete."
		exit 0 ;;
	update)
		if [ -z "$system" ]; then
			echo "Error: System not defined"
			exit 1
		fi
		echo "Generations before switch"
		nix-env --list-generations

		echo "Update home-manager"
		eval "$HOME/.nix-profile/bin/home-manager switch -b backup --extra-experimental-features nix-command --extra-experimental-features flakes --flake .#luke-$system"

		echo "Removing garbage"
		nix-store --gc --print-roots | grep -v "/nix/store/" | xargs -r nix-store --delete
		nix-store --gc

		echo "Complete."
esac
