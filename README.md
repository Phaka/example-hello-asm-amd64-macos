# Hello World in x64 Assembly (macOS)

A minimal Hello World implementation in x64 assembly for macOS systems.

## Installation

### macOS
Install the development tools:
```bash
xcode-select --install
```

Install NASM through Homebrew:
```bash
brew install nasm
```

## Building and Running

```bash
# Assemble
nasm -f macho64 hello.asm

# Link
# Note: We link against System framework which provides C runtime
ld -macosx_version_min 10.7.0 -lSystem hello.o -o hello

# Run
./hello
```

## Code Explanation

The program demonstrates key aspects of macOS x64 assembly programming:

System Call Interface:
- macOS uses a unique syscall numbering scheme (0x2000000 + syscall number)
- System calls follow BSD Unix conventions but with macOS-specific numbers
- Unlike Linux, system calls are prefixed with 0x2000000

Register Convention:
- System call number goes in RAX
- First argument in RDI (file descriptor)
- Second argument in RSI (buffer address)
- Third argument in RDX (buffer length)

C Runtime Integration:
- Uses _main as entry point (required by macOS)
- Links against System framework for C runtime
- Exits cleanly through C runtime _exit function

Note: This implementation specifically targets macOS on x64 processors. For other platforms, see the respective platform-specific implementations.
