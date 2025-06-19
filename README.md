# Resume

This resume is based off [https://github.com/arasgungore/arasgungore-CV](https://github.com/arasgungore/arasgungore-CV) and has been modified to my liking. This repository at large is build multiple resumes for different role types based on config files located in [roles/](roles/). The resumes output as PDFs, are ATF compliant, and are built using [LaTeX](https://www.latex-project.org/).

The resumes can be built locally, or by using the GitHub Action provided in this repository. If you want to build the resume locally, you will need to have latexmk installed, with some other latex font dependencies. The easiest way to install these dependencies is to use a package manager like `apt`, and by running the command located in the GitHub Action workflow file [build.yml](.github/workflows/build_resumes.yml).

If using the GitHub Action, updates will be triggered automatically on pushes, and the resulting PDFs will be pushed to the [output/](output/) directory. If you want to build the resume locally, you can run the following command:

```bash
./template/build.sh <role>
```

Where `<role>` is the name of the texfile in [roles/](roles/) you want to build the resume for, such as `mle` (machine learning engineer), `ds` (data scientist), etc. The script will generate a PDF in the `output/` directory, much like how the GitHub Action does.

Feel free to use this repository as a template for your own resumes as well!