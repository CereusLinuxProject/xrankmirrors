# xrankmirrors
A script to rank and select XBPS mirrors.

<a href="https://codeberg.org/cereus-linux/xrankmirrors">
    <img alt="Get it on Codeberg" src="https://get-it-on.codeberg.org/get-it-on-white-on-black.png" height="60">
</a>

The source code is mainly hosted on [Codeberg](https://codeberg.org/cereus-linux/xrankmirrors) with a mirror available on [GitHub](https://github.com/CereusLinuxProject/xrankmirrors). **Issues and pull requests should be made in Codeberg**.

## Usage

    usage: xrankmirrors [-c URL] [-f] [-g] [-h] [-i] [-c URL -v URL -m] [-r REGION] [-s] [-v URL]
    -c   Set Cereus mirror (only for -m)
    -f   Print last rank results
    -g   Rank Void & Cereus mirrors and print results
    -h   Show this help
    -i   Manually change mirrors in interactive mode
    -m   Manually change mirrors on non-interactive mode (requires -v and/or -c)
    -r   Rank/list only specified region mirrors (valid options: AS,EU,NA,OC,SA,World)
    -s   Set fastest mirrors from previous results
    -v   Set Void mirror (only for -m)

It supports both Void and Cereus Linux mirrors.

## About Void Linux mirrors
Void Linux mirrorlist is get from <a href="https://github.com/void-linux/xmirror/blob/master/mirrors.lst">xmirror</a> list. For the best experience, choose a mirror geographically close to you, or use the Fastly Global CDN (listed in <b>World</b>).

Tier 1 mirrors are maintained by the Void Linux Infrastructure Team and will always have the latest packages available. Tier 2 mirrors are not managed by Void and do not have any guarantees of freshness or completeness of packages, nor are they required to sync every available architecture or sub-repository.

## Important note about Cereus Linux mirrors
<bold>Tier 1</bold> mirrors have all the packages available in both cereus-extra and cereus-core repositories and will always have the latest packages available. 

Tier 2 mirrors are limited by 100MB limit size on packages, this make heavy packages like OnlyOffice, Brave or Heroic unavailable in them. You can choose them <bold>only if you are ok with that</bold>.

## Region formats
Supported region formats are based in Void <a href=https://github.com/void-linux/xmirror>xmirror</a>, which uses https://planetarynames.wr.usgs.gov/Abbreviations region abbreviations.

When a region is only available in Void or Cereus mirrors, the wizard will fallback the another one to World region.

## Desktop launcher
As you may seen, xrankmirrors provides a desktop file. It will look for terminal emulators in your system using different methods. When using PCManFM-Qt it will extract the default terminal emulator from there. When using XFCE it will use <code>exo-open</code> to launch the default terminal emulator. In case your terminal emulator is not detected or the script launches the wrong one, please set it at <code>~/.config/xrankmirrors.conf</code> like this:

    terminal=kitty

## Examples
Rank XBPS mirrors in non-interactive mode, listing only mirrors from North America:

    # xrankmirrors -r NA -g

Change mirrors in non-interactive mode:

    # xrankmirrors -c https://plug-mirror.rcac.purdue.edu/osdn/storage/g/c/ce/cereuslinux/repos/ -v https://mirrors.servercentral.com/voidlinux/ -m






