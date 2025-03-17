module.exports = {
  extends: ["@commitlint/config-conventional"],
  rules: {
    "scope-enum": [
      2,
      "always",
      ["ftp", "core", "auth", "ci", "deps", "release"],
    ],
    "type-enum": [
      2,
      "always",
      [
        "feat", // New features
        "fix", // Bug fixes
        "docs", // Documentation changes
        "style", // Code style changes
        "refactor", // Code refactoring
        "test", // Adding/updating tests
        "chore", // Maintenance tasks
        "ci", // CI/CD changes
      ],
    ],
  },
};
