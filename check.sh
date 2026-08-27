#!/bin/sh
# Fails if the plugin layout, the manifests, or the skill frontmatter break.
set -e
cd "$(dirname "$0")"

for f in .claude-plugin/plugin.json .claude-plugin/marketplace.json skills/evolve/SKILL.md README.md; do
  test -f "$f" || { echo "FAIL missing $f"; exit 1; }
done

python3 - <<'PY'
import json, sys, re

p = json.load(open(".claude-plugin/plugin.json"))
m = json.load(open(".claude-plugin/marketplace.json"))
assert p["name"] == "evolve", p["name"]
assert m["plugins"][0]["name"] == p["name"], "marketplace and plugin names differ"
assert m["plugins"][0]["source"] == "./", "source must point at the repo root"

head = open("skills/evolve/SKILL.md").read()
fm = re.match(r"---\n(.*?)\n---\n", head, re.S)
assert fm, "SKILL.md has no frontmatter"
body = fm.group(1)
assert re.search(r"^name: evolve$", body, re.M), "skill name must be evolve"
desc = re.search(r"^description: (.+)$", body, re.M)
assert desc, "skill needs a description, it is the auto-trigger"
assert len(desc.group(1)) > 40, "description too thin to trigger on"
for word in ("code", "commit"):
    assert word in head.lower(), f"skill must say it is not for {word}"
print("PASS  manifests, frontmatter, layout")
PY
