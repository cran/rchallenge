rchallenge
==========
[![GitHub sources](https://img.shields.io/badge/View_on-GitHub-yellow.svg)](https://github.com/adrtod/rchallenge)
[![Build Status](https://travis-ci.org/adrtod/rchallenge.svg)](https://travis-ci.org/adrtod/rchallenge)
[![GPLv2 License](https://img.shields.io/badge/license-GPLv2-blue.svg)](https://www.gnu.org/licenses/gpl-2.0.html)

The **rchallenge** R package provides a simple data science competition system using [R Markdown](http://rmarkdown.rstudio.com/) 
and [Dropbox](https://www.dropbox.com/) with the following features:

- No network configuration required.
- Does not depend on external platforms like e.g. [Kaggle](https://www.kaggle.com/).
- Can be easily installed on a personal computer.
- Provides a customizable template in english and french.

Further documentation is available in the [Reference manual](https://adrtod.github.io/rchallenge).

Please report bugs, troubles or discussions on the [Issues](https://github.com/adrtod/rchallenge/issues) tracker. Any contribution to improve the package is welcome.

## Installation
Install the R package from [CRAN](https://cran.r-project.org/package=rchallenge) repositories
```
install.packages("rchallenge")
```
or install the latest development version from [GitHub](https://github.com/adrtod/rchallenge)
```
# install.packages("devtools")
devtools::install_github("adrtod/rchallenge")
```

A recent version of [pandoc](http://johnmacfarlane.net/pandoc/) (>= 1.12.3) is also required. See the [pandoc installation instructions](https://github.com/rstudio/rmarkdown/blob/master/PANDOC.md) for details on installing pandoc for your platform.

## Getting started
Install a new challenge in `Dropbox/mychallenge`:
<pre>
setwd("~/Dropbox/mychallenge")
library(rchallenge)
<a href=https://adrtod.github.io/rchallenge/new_challenge.html>?new_challenge</a>
new_challenge()
</pre>

or for a french version:
```
new_challenge(template = "fr")
```

You will obtain a ready-to-use challenge in the folder `Dropbox/mychallenge` containing:

Name | Description
------------- | -------------
`challenge.rmd` | Template R Markdown script for the webpage.
`data` | Directory of the data containing `data_train` and `data_test` datasets.
`submissions` | Directory of the submissions. It will contain one subdirectory per team where they can submit their submissions. The subdirectories are shared with Dropbox.
`history` | Directory where the submissions history is stored.


The default challenge provided is a binary classification problem on the [German Credit Card](https://goo.gl/ndMhNw) dataset.

You can easily customize the challenge in two ways:

- *During the creation of the challenge*: by using the options of the [`new_challenge`](https://adrtod.github.io/rchallenge/new_challenge.html) function.
- *After the creation of the challenge*: by manually replacing the data files in the `data` subdirectory and the baseline predictions in `submissions/baseline` and by customizing the template `challenge.rmd` as needed.

## Next steps
To complete the installation:

1. Create and [share](https://www.dropbox.com/en/help/19) subdirectories in `submissions` for each team:
    <pre>
    <a href=https://adrtod.github.io/rchallenge/new_team.html>?new_team</a>
    new_team("team_foo", "team_bar")
    </pre>

2. Publish the html page in `Dropbox/Public`:
    <pre>
    <a href=https://adrtod.github.io/rchallenge/publish.html>?publish</a>
    publish()
    </pre>
    Prior to this, make sure you [enabled your Public Dropbox folder](https://www.dropbox.com/enable_public_folder).

3. Give the [public link](https://www.dropbox.com/en/help/274) to your `Dropbox/Public/challenge.html` file to the participants.
    
4. Refresh the webpage by repeating step 2 on a regular basis. See below for automating this step.

From now on, a fully autonomous challenge system is set up requiring no further 
administration. With each update, the program automatically performs the following
tasks using the functions available in our package:

Name | Description
------------- | -------------
[`store_new_submissions`](https://adrtod.github.io/rchallenge/store_new_submissions.html) | Reads submitted files and save new files in the history.
[`print_readerr`](https://adrtod.github.io/rchallenge/print_readerr.html) | Displays any read errors.
[`compute_metrics`](https://adrtod.github.io/rchallenge/compute_metrics.html) | Calculates the scores for each submission in the history.
[`get_best`](https://adrtod.github.io/rchallenge/get_best.html) | Gets the highest score per team.
[`print_leaderboard`](https://adrtod.github.io/rchallenge/print_leaderboard.html) | Displays the leaderboard.
[`plot_history`](https://adrtod.github.io/rchallenge/plot_history.html) | Plots a chart of score evolution per team.
[`plot_activity`](https://adrtod.github.io/rchallenge/plot_activity.html) | Plots a chart of activity per team.

## Automating the updates

### Unix/OSX

You can setup the following line to your [crontab](https://en.wikipedia.org/wiki/Cron) using `crontab -e` (mind the quotes):
```
0 * * * * Rscript -e 'rchallenge::publish("~/Dropbox/mychallenge/challenge.rmd")'
```
This will publish a html webpage in your `Dropbox/Public` folder every hour.

You might have to add the path to Rscript and pandoc at the beginning of your crontab:
```
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
```

Depending on your system or pandoc version you might also have to explicitly add the encoding option to the command:
```
0 * * * * Rscript -e 'rchallenge::publish("~/Dropbox/mychallenge/challenge.rmd", encoding = "utf8")'
```

### Windows

You can use the [Task Scheduler](http://windows.microsoft.com/en-us/windows/schedule-task) to create a new task with a *Start a program* action with the settings (mind the quotes):

- *Program/script*: `Rscript.exe`
- *options*: `-e rchallenge::publish('~/Dropbox/mychallenge/challenge.rmd')`

## Examples
- [My own challenge](https://dl.dropboxusercontent.com/u/25867212/challenge_mimse2014.html) (in french) given to Master students at the University of Bordeaux.

- [A classification and variable selection problem](https://dl.dropboxusercontent.com/u/50849929/challenge_fr.html) (in french) given by Robin Genuer (Bordeaux).

Please [contact me](https://sites.google.com/site/adrientodeschini/) to add yours.

## Copyright
Copyright (C) 2014-2015 [Adrien Todeschini](https://sites.google.com/site/adrientodeschini/).

Contributions from [Robin Genuer](http://robin.genuer.fr/).

Design inspired by [Datascience.net](https://www.datascience.net/), a french platform
for data science challenges.

The **rchallenge** package is licensed under the GPLv2 (https://www.gnu.org/licenses/gpl-2.0.html).

## To do list
- [ ] common leaderboard for several metrics
- [ ] do not take baseline into account in ranking
- [ ] examples, tests, vignettes
- [ ] interactive plots with `ggvis`
- [ ] check arguments
- [ ] interactive webpage using [Shiny](http://shiny.rstudio.com/)
