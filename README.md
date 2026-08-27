# evolve

Write by selection, not by prompt.

The model already holds good prose. One prompt gets you one sample from it,
and the sample is average. So stop asking for one text. Ask for two, keep the
better one, and breed two descendants of the winner. After two or three picks
the output sounds like you.

## What it does

Every turn Claude gives you two full drafts, **A** and **B**, and stops.

```
turn 1   ask ──> A ──┐            far apart: different angle, different form
                 B ──┘
         you pick A
turn 2   A ──> A1 ──┐             medium: same angle, new execution
               A2 ──┘
         you pick A2
turn 3   A2 ──> A2a ──┐           near: rhythm, verbs, cuts
                A2b ──┘
```

You reply `A`, `B`, or `B but keep A's opening`. Turn 1 explores. Turn 3
refines.

## Register

Homer is in the weights. Keep him out of the methods section. The skill names
the register first, then varies A and B on the axis that field cares about.

| Register | A and B differ in |
|----------|-------------------|
| Academic, scientific, legal, spec | the claim, the order of evidence, the shape of the argument. Not the voice. |
| Work email, memo, ticket, release note | where the ask sits, how much context comes first, direct or soft. |
| Essay, blog, opinion, talk | the angle and the entry point. Voice is fair game. |
| Fiction, poetry, lyrics, eulogy | POV, tense, form, what the scene withholds. Voice is the point. |

Your word beats the guess, and holds for the session:

- `register: academic` — pick a row.
- `register: like this <sample>` — match the sample, ignore the table.
- `register: free` — no constraint.

## Install

```
/plugin marketplace add 9710willy/evolve
/plugin install evolve@evolve
```

## Use

Ask for the writing. The skill triggers on prose by itself.

Want it to fire every time without fail, add one line to your `CLAUDE.md`:

```
Writing prose — doc, email, essay, paper, copy? Use the `evolve` skill
without being asked. Not for code, commit messages, or chat answers.
```

To call it by hand: `/evolve <your ask>`.

## Do not use it for

Code, commit messages, chat answers. Two versions of a refactor helps nobody.

## Check

```
./check.sh
```

Validates the manifests, the skill frontmatter, and the file layout.
