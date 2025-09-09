## start-rstudio-projects

For starting new RStudio projects

## 🛠 Initial Git Setup
After cloning the repository, configure Git to handle long paths using, `git config --system core.longpaths true` or run the following in R script: `source("setup_git_config.R")`

## Directory Structure

```
├── cleanup.R               (a script for cleaning up the project repo at termination)
└── data/
│   └── interim/ 
│   ├── processed/
│   └── raw/
├── <project-name>.Rproj    (the R project file)
├── docs/
├── .gitignore              (a version-control gitignore file)
├── requirements.txt        (a file for required Python libraries, etc.)
├── requirements.R          (a file containing instructions for required R libraries, etc.)
├── README.md               (a read me file)
├── refs/
└── reports/
│   ├── figs/
│   └── images/
├── setup_git_config.R       (a script for configuration settings, namely, long path handling)
└── src/
│   ├── data/
│   ├── figs/
│   ├── functions/
│   └── utils/
```
