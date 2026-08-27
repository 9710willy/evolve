# evolve

A Claude Code plugin. Two drafts every turn, you keep one, it breeds.

## Install

```
/plugin marketplace add 9710willy/evolve
/plugin install evolve@evolve
```

Restart Claude Code.

## Use

Ask for prose. The skill fires by itself, no slash command.

You get two full drafts, then a menu with each draft in the preview pane.
Pick one, or use the free-text slot: `B but keep A's subject`.

```
turn 1   ask ──> A ──┐   far apart: different angle, different form
                 B ──┘
         keep A
turn 2   A ──> A1 ──┐    medium: same angle, new execution
               A2 ──┘
         keep A2
turn 3   A2 ──> A2a ──┐  near: rhythm, verbs, cuts
                A2b ──┘
```

Two or three picks and it sounds like you. Past four you trade equals.

## Register

The skill names the register before it drafts, then varies the two drafts
on the axis that field cares about.

| Register | The two drafts differ in |
|----------|--------------------------|
| Academic, scientific, legal, spec | the claim, the order of evidence, the shape of the argument. Not the voice. |
| Work email, memo, ticket, release note | where the ask sits, how much context comes first, direct or soft. |
| Essay, blog, opinion, talk | the angle and the entry point. Voice is fair game. |
| Fiction, poetry, lyrics, eulogy | POV, tense, form, what the scene withholds. Voice is the point. |

Homer is in the weights. Keep him out of the methods section.

Override it, and the override holds for the session:

| Say this | Effect |
|----------|--------|
| `register: academic` | pick a row |
| `register: like this <sample>` | match the sample, ignore the table |
| `register: free` | no constraint |

## Always on

Optional. One line in your `CLAUDE.md` so it never misses:

```
Writing prose — doc, email, essay, paper, copy? Use the `evolve` skill
without being asked. Not for code, commit messages, or chat answers.
```

## Not for

Code, commit messages, chat answers. Two versions of a refactor helps nobody.

## Check

```
./check.sh
```

Validates the manifests, the skill frontmatter, and the layout.

## Credit

The idea is [@damian_b's](https://x.com/damian_b/status/2092634887597772940).
This repo is that idea as a plugin.
