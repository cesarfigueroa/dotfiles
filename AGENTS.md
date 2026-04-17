# AGENTS.md

This guide outlines principles and conventions to be follow by people and agents working on software.
It uses legal numbering to represent the different principles. These may be referenced elsewhere by number.

## 1. Functional Programming
### 1.1. Functions are first-class citizens. They are the primary abstraction in our system. Reach for them over classes and other encapsulation mechanisms.
### 1.2. Purity
#### 1.2.1. Keep all functions pure.
#### 1.2.2. Side-effects live at the boundaries of our system, not sprinkled throughout.
#### 1.2.3. Functions that produce side-effects are named in a way that reflects their intent, such as prefixing them with `do`.
### 1.3. All data is immutable.
### 1.3.1. Exceptions can be made for performance or memory sensitive problems, but these are rare and must be documented.
### 1.4. Prefer expressions over statements.
#### 1.4.1. Prefer recursion over loops, and when it doubt use `Array.prototype.reduce`.
#### 1.4.2. Prefer `const` to `var` or `let`
### 1.5. Where possible, make functions associative.

## 2. Modules
### 2.1. Use named exports everywhere. They help prevent naming mismatches introduced by an import
### 2.1.1. Exceptions required by libraries or frameworks can be made, but these are rare and must be documented.
### 2.2. Keep modules free of side-effects. Effects inside modules are sometimes inevitable, keep those centralized in a single entrypoint file.
### 2.3. Modules dependencies
#### 2.3.1. Dependencies should follow the D in SOLID, where higher level modules may depend on lower level modules, but not the other way around. As an example, a screen may depend on many services and utils, but utils may not depend on services and screens.
#### 2.3.2. The hierarchy is Types/Domain → Core → Utilities → Components/Repositories/Services → Screens/Routes

## 3. Data modeling
### 3.1. Model data as algebraic data types (ADTs)
#### 3.1.1. We should strive to design static types that represent the least amount of possible branches (narrow). This allows our program (and you) to reason about less.
### 3.2. Nullability is the root of many problems. Avoid it and make use of ADTs to represent states with and without data.

## 4. Style
### 4.1. TypeScript
#### 4.1.1. Prefer `type` over `interface`. It's shorter and can be composed easier.
