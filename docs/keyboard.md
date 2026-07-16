# Apple Magic Keyboard

## Overview

This document describes the Apple Magic Keyboard configuration used by AsifOS.

The goal is to make Fedora KDE behave as closely to macOS as possible while still retaining native KDE functionality.

This significantly reduces context switching when moving between:

- Work MacBook
- Personal Fedora workstation

---

## Hardware

Device:

- Apple Magic Keyboard (Bluetooth)

Detected Device ID:

```text
05ac:0256
```

---

## Objectives

The keyboard should provide a familiar macOS experience while remaining compatible with Linux applications.

Requirements:

- Keep the Command (⌘) key as the primary modifier.
- Keep KDE desktop shortcuts.
- Minimise the need to remember Linux Ctrl shortcuts.
- Behave consistently across browsers, editors and IDEs.

---

## Current Behaviour

### Desktop

| Shortcut | Action |
|----------|--------|
| ⌘ | Open KDE Application Launcher |
| ⌘ + Space | Open Application Launcher |
| ⌘ + Tab | Switch Applications |
| ⌘ + ` | Switch Windows of Current Application |

---

### Editing

| Shortcut | Action |
|----------|--------|
| ⌘ + C | Copy |
| ⌘ + V | Paste |
| ⌘ + X | Cut |
| ⌘ + A | Select All |
| ⌘ + Z | Undo |
| ⌘ + Y | Redo |
| ⌘ + S | Save |
| ⌘ + F | Find |
| ⌘ + T | New Tab |
| ⌘ + W | Close Window / Tab |
| ⌘ + L | Focus Address/Search Bar |

---

### Cursor Navigation

| Shortcut | Action |
|----------|--------|
| ⌘ + ← | Beginning of Line |
| ⌘ + → | End of Line |
| ⇧ + ⌘ + ← | Select to Beginning of Line |
| ⇧ + ⌘ + → | Select to End of Line |

---

## Configuration

The keyd configuration is stored here:

```
config/keyd/apple-magic-keyboard.conf
```

The live system configuration is installed to:

```
/etc/keyd/apple-magic-keyboard.conf
```

---

## Installation

Install the keyboard profile:

```bash
./install/macos-keyboard.sh
```

---

## Manual Validation

Validate the configuration:

```bash
sudo keyd check /etc/keyd/apple-magic-keyboard.conf
```

Reload keyd:

```bash
sudo keyd reload
```

or

```bash
sudo systemctl restart keyd
```

---

## Emergency Recovery

If an incorrect keyboard mapping prevents normal input:

```
Backspace + Escape + Enter
```

This triggers keyd's emergency shutdown.

---

## Future Improvements

The following macOS shortcuts should be implemented in future versions:

### Navigation

- ⌘ + ↑ → Beginning of Document
- ⌘ + ↓ → End of Document
- ⇧ + ⌘ + ↑ → Select to Beginning of Document
- ⇧ + ⌘ + ↓ → Select to End of Document

### Word Navigation

- ⌥ + ← → Previous Word
- ⌥ + → → Next Word
- ⇧ + ⌥ + ← → Select Previous Word
- ⇧ + ⌥ + → → Select Next Word

### Editing

- ⌘ + Delete → Delete to Beginning of Line
- ⌥ + Delete → Delete Previous Word

---

## Design Philosophy

AsifOS aims to make Fedora feel as close to macOS as practical for software development.

The philosophy is:

- Keep the Linux power.
- Keep KDE flexibility.
- Preserve macOS muscle memory.
- Reduce friction when switching between operating systems.

The keyboard profile is a core part of achieving this goal.
