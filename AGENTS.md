# AGENTS.md

This guide outlines principles and conventions to be follow by people and agents working on software.

## Principles

### 1. Functional Programming

#### 1.1. Keep functions pure. Side-effects live at the boundaries of our system, not sprinkled throughout

#### 1.2. Functions are first-class citizens. Reach for them over classes and other encapsulation mechanisms.

#### 1.3. Data is immutable, functions only produce new outputs. Exceptions can be made for performance or memory sensitive problems, but these are rare and must be documented.

#### 1.4. Prefer recursion over loops, and when it doubt use `Array.prototype.reduce`.

#### 1.5. Prefer `const` to `var` or `let`

#### 1.6. Where possible, make functions associative.

## Conventions

### 1. Modules

#### 1.1. Use named exports everywhere. They help prevent naming mismatches introduced by an import. Exceptions required by libraries or frameworks are acceptable.

#### 1.2. Keep modules free of side-effects. Effects inside modules are sometimes inevitable, keep those centralized in their own entrypoint.

