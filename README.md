Github action to compile lilypond files

# Workflow examples
## Simple mode

By default, this action requires the `ly_files` input parameter to contain the list of lilypond files to compile:
```
- name: Compilation step
  id: compilation
  uses: nicovince/lilypond-action@v2.2
  with:
    ly_files: /path/file.ly /path/file2.ly
```

## Make base build
If a makefile is available in target repository, `make` mode can be set in the `build_mode` input parameter to call make at the root of the repository.
```
- name: Compilation step
  id: compilation
  uses: nicovince/lilypond-action@v2.2
  with:
    build_mode: make
```
See `action.yml` for advanced make options.

# Output
This action produces `pdfs` output containing the list of pdf files generated.
