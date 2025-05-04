# fishAngel

fish-angel is a supportive companion for the Fish shell that gently encourages and uplifts you when you mistype a command. Inspired by the humorous tone of bash-insulter, this plugin takes the opposite approach — offering positive reinforcement, not insults.

    Because even command-line mistakes deserve kindness.

Example
``` bash
 > sl
  That command didn't work — but you did your best, and that's what counts.
fish: Unknown command: sl

> gti status
  Mistakes happen — progress is messy, but you're doing great.
fish: Unknown command: gti

> sp aux
  Don't worry, you're learning — and that's powerful.
fish: Unknown command: sp
```

## Install 
- Using Fisher
```bash
fisher install tanaybhomia/fish-angel
```

## Configuration
Move to conf.d folder under your fish install and change these according to your needs
```bash
set color 0
set freq 5
```
