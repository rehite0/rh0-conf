#!/usr/bin/env python3
import json
import pathlib
import random
import shutil
import sys
import textwrap

QUOTE_FILE = pathlib.Path("./quote.txt")


def print_help():
    help_text = """
Usage: python3 quote_picker.py [OPTIONS]

Options:
  -s             Display quote source in addition to quote and author.
  -l             Display quote flags in addition to quote and author.
  -f <flag>      Exclude quotes containing <flag> in their flags list.
  +f <flag>      Include only quotes containing <flag> in their flags list.
  -h, --help     Show this help message and exit.

Examples:
  python3 quote_picker.py -s -l
  python3 quote_picker.py -f politics
  python3 quote_picker.py +f inspirational +f science -s
"""
    print(help_text.strip())


def parse_args(argv):
    show_source = False
    show_flags = False
    exclude_flags = set()
    include_flags = set()

    i = 0
    while i < len(argv):
        arg = argv[i]

        if arg in ("-h", "--help"):
            print_help()
            sys.exit(0)
        elif arg == "-s":
            show_source = True
        elif arg == "-l":
            show_flags = True
        elif arg == "-f":
            i += 1
            if i >= len(argv):
                print("Error: Option '-f' requires a flag name.", file=sys.stderr)
                print_help()
                sys.exit(1)
            exclude_flags.add(argv[i])
        elif arg == "+f":
            i += 1
            if i >= len(argv):
                print("Error: Option '+f' requires a flag name.", file=sys.stderr)
                print_help()
                sys.exit(1)
            include_flags.add(argv[i])
        else:
            print(f"Error: Invalid argument '{arg}'.", file=sys.stderr)
            print_help()
            sys.exit(1)

        i += 1

    return show_source, show_flags, exclude_flags, include_flags


def load_quotes(filepath):
    if not filepath.is_file():
        print(f"Error: Quote file '{filepath}' does not exist.", file=sys.stderr)
        sys.exit(1)

    try:
        with open(filepath, "r", encoding="utf-8") as f:
            data = json.load(f)

        if not isinstance(data, list):
            print(
                f"Error: Expected JSON array in '{filepath}'.", file=sys.stderr
            )
            sys.exit(1)

        return data
    except json.JSONDecodeError as e:
        print(
            f"Error: Invalid JSON format in '{filepath}': {e}", file=sys.stderr
        )
        sys.exit(1)
    except Exception as e:
        print(f"Error reading '{filepath}': {e}", file=sys.stderr)
        sys.exit(1)


def filter_quotes(quotes, exclude_flags, include_flags):
    filtered = []
    for q in quotes:
        if not isinstance(q, dict):
            continue

        q_flags = set(q.get("flags", []))

        # Check exclude flags (-f)
        if any(ef in q_flags for ef in exclude_flags):
            continue

        # Check include flags (+f)
        if include_flags and not include_flags.issubset(q_flags):
            continue

        filtered.append(q)

    return filtered


def format_tty(quote_obj, show_source, show_flags):
    term_width = shutil.get_terminal_size((80, 24)).columns
    # Ensure reasonable wrapping bounds
    width = max(20, min(term_width, 100))

    quote_str = quote_obj.get("quote", "")
    author_str = quote_obj.get("author", "Unknown")
    source_str = quote_obj.get("source", "")
    flags_list = quote_obj.get("flags", [])

    output_lines = []

    # Wrap each paragraph inside quote to respect user's newlines while fitting width
    paragraphs = quote_str.split("\n")
    for paragraph in paragraphs:
        if paragraph.strip():
            output_lines.append(textwrap.fill(paragraph, width=width))
        else:
            output_lines.append("")

    output_lines.append("")
    output_lines.append(
        textwrap.fill(f"— {author_str}", width=width, initial_indent="  ")
    )

    if show_source and source_str:
        output_lines.append(
            textwrap.fill(
                f"Source: {source_str}", width=width, initial_indent="  "
            )
        )

    if show_flags and flags_list:
        output_lines.append(
            textwrap.fill(
                f"Flags: {', '.join(flags_list)}",
                width=width,
                initial_indent="  ",
            )
        )

    return "\n".join(output_lines)


def format_plain(quote_obj, show_source, show_flags):
    quote_str = quote_obj.get("quote", "")
    author_str = quote_obj.get("author", "Unknown")
    source_str = quote_obj.get("source", "")
    flags_list = quote_obj.get("flags", [])

    output = f"{quote_str}\n— {author_str}"

    if show_source and source_str:
        output += f"\nSource: {source_str}"

    if show_flags and flags_list:
        output += f"\nFlags: {', '.join(flags_list)}"

    return output


def main():
    show_source, show_flags, exclude_flags, include_flags = parse_args(
        sys.argv[1:]
    )
    quotes = load_quotes(QUOTE_FILE)

    filtered = filter_quotes(quotes, exclude_flags, include_flags)

    if not filtered:
        print("No quotes match the specified flag criteria.", file=sys.stderr)
        sys.exit(0)

    selected = random.choice(filtered)

    if sys.stdout.isatty():
        print(format_tty(selected, show_source, show_flags))
    else:
        print(format_plain(selected, show_source, show_flags))


if __name__ == "__main__":
    main()
