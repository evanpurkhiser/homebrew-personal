import argparse
import json
import subprocess
from pathlib import Path


def source_at(ref, path):
    result = subprocess.run(
        ["git", "show", f"{ref}:{path}"],
        check=False,
        capture_output=True,
        text=True,
    )
    return result.stdout if result.returncode == 0 else ""


def without_bottle_block(source):
    result = []
    in_bottle_block = False
    removed_bottle_block = False

    for line in source.splitlines():
        if line == "  bottle do":
            in_bottle_block = True
            continue

        if in_bottle_block and line == "  end":
            in_bottle_block = False
            removed_bottle_block = True
            continue

        if in_bottle_block:
            continue

        if removed_bottle_block and line == "" and result[-1:] == [""]:
            removed_bottle_block = False
            continue

        removed_bottle_block = False
        result.append(line)

    return "\n".join(result)


def changed_formulas(before, after):
    changed = subprocess.run(
        [
            "git",
            "diff",
            "--name-only",
            "--diff-filter=ACMR",
            before,
            after,
            "--",
            "*.rb",
        ],
        check=True,
        capture_output=True,
        text=True,
    ).stdout.splitlines()

    return [
        Path(path).stem
        for path in changed
        if without_bottle_block(source_at(before, path))
        != without_bottle_block(source_at(after, path))
    ]


def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("--formula")
    parser.add_argument("--before")
    parser.add_argument("--after")
    args = parser.parse_args()

    if args.formula and not args.before and not args.after:
        return args

    if not args.formula and args.before and args.after:
        return args

    parser.error("provide either --formula or both --before and --after")


def main():
    args = parse_args()
    packages = [args.formula] if args.formula else changed_formulas(args.before, args.after)
    print(json.dumps(sorted(set(packages))))


if __name__ == "__main__":
    main()
