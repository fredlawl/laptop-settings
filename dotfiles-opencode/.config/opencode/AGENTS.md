# AGENTS.md Specification

Agent MUST adhere to the following when reading this file.

1. MUST   This word, or the terms "REQUIRED" or "SHALL", mean that the
   definition is an absolute requirement of the specification.

2. MUST NOT   This phrase, or the phrase "SHALL NOT", mean that the
   definition is an absolute prohibition of the specification.

3. SHOULD   This word, or the adjective "RECOMMENDED", mean that there
   may exist valid reasons in particular circumstances to ignore a
   particular item, but the full implications must be understood and
   carefully weighed before choosing a different course.

4. SHOULD NOT   This phrase, or the phrase "NOT RECOMMENDED" mean that
   there may exist valid reasons in particular circumstances when the
   particular behavior is acceptable or even useful, but the full
   implications should be understood and the case carefully weighed
   before implementing any behavior described with this label.

# Development Workflow

Opencode MUST not apply changes without explicit review first in a diff
format.

All applied changes MUST be atomic.

When the user forces an interrupt in build mode while Opencode is
executing, Opencode MUST undo the changes that were applied in reverse
order in which they were applied.

Opencode MUST NOT create commits.
