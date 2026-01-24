---
name: workout day
description: Create and execute daily gym workout notes with structured exercise templates. Use when planning workouts, logging gym sessions, or when the user asks for a workout routine with sets, reps, rest periods, and RPE targets.
---

# Workout Day Skill

This skill enables agents to create structured workout notes for daily gym sessions, following a precise target-set-rep format optimized for tracking progress and physical development.

## Overview

Workout day notes serve as both **planning documents** (what to do) and **execution logs** (what was done). Each note follows a consistent structure that enables:

- Clear workout objectives
- Precise exercise prescriptions
- Progress tracking across sessions
- Data consistency for analysis

## User Context

Previous workout context and user-specific information is located in:
`08 journal/workout/`

Always reference the current quarterly user context file (e.g., `2026-Q1 workout user.md`) for:
- Current training split
- Injury considerations
- Equipment availability
- Performance history

## File Format

### Frontmatter

```yaml
---
date: YYYY-MM-DD
tags:
  - cszv/workout/YYYY
---
```

### Document Structure

```markdown
---
date: YYYY-MM-DD
tags:
  - cszv/workout/YYYY
---

[[08 journal/workout/YYYY-QN workout user]]

### Full Date (Day of Week, Month Day, Year)

# Workout Objective

Brief description of the session focus (e.g., "Upper Body Push" or "Leg Hypertrophy")

## A. Exercise Name

Rest: XX seconds between sets
Target: X sets × X-X reps (RPE X-X) @ weight

- Set 1 result
- Set 2 result
- Set 3 result

## B. Exercise Name

Rest: XX seconds between sets
Target: X sets × X-X reps (RPE X-X) @ weight

- Set 1 result
- Set 2 result
```

## Exercise Block Format

Each exercise follows this structure:

| Element | Format | Example |
|---------|--------|---------|
| **Header** | `## [Letter]. Exercise Name` | `## A. Barbell Bench Press` |
| **Rest** | `Rest: XX seconds between sets` | `Rest: 90 seconds between sets` |
| **Target** | `Target: X sets × X-X reps (RPE X-X) @ weight` | `Target: 4 sets × 8-10 reps (RPE 7-8) @ 60kg` |
| **Set logs** | Unordered list with actual performance | `- 10 reps @ 60kg` |

### Target Line Components

| Component | Description | Example |
|-----------|-------------|---------|
| **Sets** | Number of working sets | `4 sets` |
| **Reps** | Rep range (min-max) | `8-10 reps` |
| **RPE** | Rate of Perceived Exertion target | `RPE 7-8` |
| **Weight** | Target load (or progression cue) | `@ 60kg` or `@ +2.5kg` |

### RPE Scale Reference

| RPE | Description |
|-----|-------------|
| 10 | Maximum effort, no reps left |
| 9 | Could do 1 more rep |
| 8 | Could do 2 more reps |
| 7 | Could do 3 more reps |
| 6 | Could do 4+ more reps |

## Complete Example

```markdown
---
date: 2026-01-24
tags:
  - cszv/workout/2026
---

[[08 journal/workout/2026-Q1 workout user]]

### Friday, January 24, 2026

# Upper Body Push (Chest/Shoulders/Triceps)

## A. Barbell Bench Press

Rest: 120 seconds between sets
Target: 4 sets × 6-8 reps (RPE 8-9) @ 70kg

- 8 reps @ 70kg (RPE 8)
- 7 reps @ 70kg (RPE 9)
- 6 reps @ 70kg (RPE 9)
- 6 reps @ 70kg (RPE 9)

## B. Incline Dumbbell Press

Rest: 90 seconds between sets
Target: 3 sets × 8-10 reps (RPE 7-8) @ 24kg

- 10 reps @ 24kg
- 9 reps @ 24kg
- 8 reps @ 24kg

## C. Cable Flyes

Rest: 60 seconds between sets
Target: 3 sets × 12-15 reps (RPE 7-8) @ 15kg

- 15 reps @ 15kg
- 14 reps @ 15kg
- 12 reps @ 15kg

## D. Overhead Press

Rest: 90 seconds between sets
Target: 3 sets × 8-10 reps (RPE 8) @ 40kg

- 10 reps @ 40kg
- 8 reps @ 40kg
- 8 reps @ 40kg

## E. Triceps Rope Pushdown

Rest: 60 seconds between sets
Target: 3 sets × 12-15 reps (RPE 7-8) @ 25kg

- 15 reps @ 25kg
- 14 reps @ 25kg
- 12 reps @ 25kg
```

## Exercise Selection Principles

When creating workout routines, follow these evidence-based guidelines:

### Compound Movements First
- Begin with heavy compound lifts (bench, squat, deadlift, rows, OHP)
- Progress to isolation work after compounds

### Volume Guidelines
- **Per muscle group per week:** 10-20 hard sets
- **Per session:** 15-25 total sets
- **Rep ranges:** Mix of 6-8 (strength), 8-12 (hypertrophy), 12-15 (endurance)

### Rest Period Guidelines

| Exercise Type | Rest Period |
|--------------|-------------|
| Heavy compounds (1-5 reps) | 3-5 minutes |
| Moderate compounds (6-10 reps) | 2-3 minutes |
| Isolation/accessories (10-15 reps) | 60-90 seconds |

## Quality Checklist

Before finalizing a workout note:

- [ ] **Frontmatter complete** — Date and tag present
- [ ] **User context linked** — Reference to quarterly user file
- [ ] **Full date header** — Human-readable date with day of week
- [ ] **Clear objective** — Session focus stated
- [ ] **Exercise letters** — Sequential letters (A, B, C, ...)
- [ ] **Rest times specified** — Every exercise has rest period
- [ ] **Target line complete** — Sets, reps, RPE, and weight for each exercise
- [ ] **Logging space** — Empty bullet points or filled results

## References

- [Renaissance Periodization Volume Guidelines](https://rpstrength.com/)
- [RPE Scale for Strength Training](https://www.strongerbyscience.com/autoregulation/)
