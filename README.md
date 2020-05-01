# PresidentApprovalRate

This is a data visualization project, in which I recreate the trend lines in FiveThirtyEight's "How Popular Is Donald Trump?" project using R.

The original project can be viewed here: https://projects.fivethirtyeight.com/trump-approval-ratings/

## Prerequisites

Obviously, you will need to have R and RStudio installed on your machine. Also, you'll need to install the following packages:
- shiny
- plotly
- tidyverse
- ggthemes

More details about the role of each will be illustrated below.

## Running Steps

Running this code is very simple, all you need to do is fork the repo, and run the main.R file. The output should look like this:


![alt text](./images/Screenshot%20from%202020-04-30%2020-37-50.png)

### main.R

main.R runs exactly 4 commands, or rather, it runs a single command four times, each time with a different parameter. The command referred to here is the `source()` function, which allows R to read and execute the code from a specified script file. We'll come to the four script files and their contents shortly, but now we'll just describe what each step achieves:  
   
1. **Package loading:** As many of you already know, the first thing we need to do is to load any libraries we will be using in our code.     
2. **Data loading and data wrangling:** Next, we load the data we'll be visualizing and apply necessay changes to it to have it in a plot-able format.   
3. **Create the plots:** Now that we have the data prepared, we can create the plots. The plots here refer to the components that makeup our visual.  
4. **Show the plots:** The title for the last step is self explanatory.   
   
Now, let's take a dive into the specifics of each step.

### Package loading

To load the libraries, we source the 'R/libraries.R' script. We mentioned earlier that we need to install four packages before we can run this code. It is important not to confuse that with what we're doing here. Here, we are simply loading these packages to our workspace, so that we're able to call commands from within these libraries. It's kinda of like what the `source()` function, the difference being that these packages are publicly available, whereas `source()` calls local files. The four packages we'll be using are:

* **tidyverse:**
* **ggthemes:**
* **shiny:**
* **plotly:**

