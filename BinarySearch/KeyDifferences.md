# Key Differences: Binary Search Variations

## Comparison Table

| Feature          | Standard Binary Search | Leftmost Binary Search | Rightmost Binary Search |
|------------------|-----------------------|-----------------------|------------------------|
| **Purpose**      | Find any occurrence    | Find first occurrence | Find last occurrence   |
| **Return Value** | Index or nil          | Insertion position    | Last valid index       |
| **Best For**     | Unique elements       | Duplicates            | Duplicates             |
| **If Not Found** | Returns nil           | Returns where it would be inserted | Returns insertion point - 1 |

## Visual Example

Given array: `[1, 2, 2, 2, 3, 4, 4, 5]`

| Search Target | Standard | Leftmost | Rightmost |
|--------------|----------|----------|-----------|
| 2            | 2        | 1        | 3         |
| 4            | 5 or 6   | 5        | 6         |
| 6            | nil      | 8        | 7         |

