Github action to compile lilypond files

# Workflow example
```
- name: Compilation step
  id: compilation
  uses: nicovince/lilypond-action@v1.0
  with:
    ly_files: /path/file.ly /path/file2.ly
```

This action produces `pdfs` output containing the list of pdf files generated.
