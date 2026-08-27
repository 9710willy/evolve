---
name: evolve
description: Use when writing prose the user cares about — essay, email, paper, doc, copy, fiction — instead of producing one draft. Writes by selection: two different drafts per turn, the user picks, the winner breeds two descendants that converge on the user's voice and on the register the field actually uses.
---

# Evolve

Write by selection. Never one draft.

## Every turn

1. Name the register in one line: `Register: academic — say "register: X" to change.`
   This line is the only commentary allowed.
2. Output exactly two drafts. Label them **A** and **B**.
3. Make them differ in strategy, not wording. See the register table for which
   axis to vary. Two paraphrases is a failed turn.
4. Full length both times. No outlines, no "here is the gist".
5. Collect the pick with the AskUserQuestion tool, never a text line. See
   below. Long prose must never make the user scroll back up to choose.
6. No commentary on the drafts. Do not say which you prefer. The user judges.

## The pick

After printing both drafts, call AskUserQuestion once:

- `question`: `Which draft?`  `header`: `Draft`  `multiSelect`: false
- Two options only. `label` names the strategy in three or four words, flat and
  neutral: "ask first, direct", "context first, soft close". Never "stronger",
  "better", "more polished". The label is a handle, not a verdict.
- `description`: one line on what that draft does. Still no preference.
- `preview`: the draft itself, so the user compares side by side without
  scrolling. Over 30 lines? Put the opening 30 in the preview. The full text is
  already above.

The auto "Other" slot is where the user types `B but keep A's subject`. That is
why you never spend an option on a merge.

## Register

What varies between A and B depends on the field.

| Register | A and B differ in |
|----------|-------------------|
| Academic, scientific, legal, spec | the claim, the order of evidence, the shape of the argument. Not the voice. |
| Work email, memo, ticket, release note | where the ask sits, how much context comes first, direct or soft. |
| Essay, blog, opinion, talk | the angle and the entry point. Voice is fair game. |
| Fiction, poetry, lyrics, eulogy | POV, tense, form, what the scene withholds. Voice is the point. |

Homer is in the weights. Keep him out of the methods section. In the top two
rows: no metaphor, no rhetorical questions, no throat-clearing openers, no
"delve", "tapestry", "testament to", "it is worth noting". The convention of
the field beats good prose.

## The hatch

The user's word beats your detection, and holds for the rest of the session:

- `register: academic` — pick a row from the table.
- `register: like this <sample>` — match the sample, ignore the table.
- `register: free` — no constraint.

Torn between two registers? Make A one and B the other. Do not ask.

## The next turn

The pick is the parent.

- Keep the winner's text as the base. Do not rewrite what the user did not flag.
- The user quoted a line from the loser? Graft that line in.
- Produce two children of the parent, then stop and wait again.

## Variation budget

| Turn | How far apart A and B are |
|------|---------------------------|
| 1 | Far. Different angle, different form. |
| 2 | Medium. Same angle, different execution. |
| 3+ | Near. Line level: rhythm, verbs, cuts. |

Turn 1 explores. Turn 3 refines. Converge.

## Do not

- Do not use this for code, commit messages, or chat answers. Two versions of
  a refactor helps nobody. Prose only.
- Do not ask what tone or angle they want. Let A and B ask that question.
- Do not merge A and B unless asked.
- Do not carry your own summary of the winner forward. Carry the words.
