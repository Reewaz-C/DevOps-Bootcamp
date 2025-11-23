# Day 4 Study Material: Interactive Shell and Non-interactive shell

## What is a Shell?

A **shell** is a command-line interface that allows users or scripts to interact with the operating system.  
Shells like **bash**, **sh**, and **zsh** can run in two main modes:
- **Interactive**
- **Non-Interactive**

## Interactive shell

An **interactive shell** is a shell session that expects user input and interacts directly with the user.

### Characteristics of an Interactive Shell

- Reads input directly from the user
- Shows a prompt like $, #, or a customized prompt
- It Supports:
    - Command history (↑ ↓ keys)

    - Tab completion

    - Aliases

    - Keyboard shortcuts

    - Job control

## Non-Interactive shell

A **non-interactive shell** runs without expecting user input. It executes commands provided by a script, pipeline, bash -c, cron and then exits.

### Characteristics of a Non-Interactive Shell

- Reads commands from a file, script, or string

- Does not display prompts

- Does not keep command history

- Keyboard shortcuts and job control do not work

- Runs until all commands finish, then exits

## Summary

Interactive shells are user driven, terminal based, shows prompts and supports shortcuts.

Where as non-interactive shells are automation driven, no promts and user interaction.
