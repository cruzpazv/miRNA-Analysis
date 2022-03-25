Principal Component Analysis (PCA) is a statistical procedure that uses an orthogonal transformation to convert a set of observations of possibly correlated variables into a set of values of linearly uncorrelated variables called principal components. The first principal component has the largest possible variance, and each succeeding component in turn has the highest variance possible. This web tool performs internally a PCA of a dataset uploaded by the user, and plots two components, colouring the samples according to the variables selected.

You need to perform this steps to have a nice PCA plot :) :

              
  - Upload your files: We need two files to perform PCA with the web tool:
      - Data file: Load your datamatrix of interest in .csv or .txt format, knowing in advance how the values and decimal numbers are separated. You can easily do it with any spreadsheet. Be sure you put the samples in columns and the variables of study in rows. Use the first column to put the variables names or leave it in blank if you want  (since this column is not used). 
      - Targets file: The targets is a file where you defines the levels of each variable under study. The application will use this file to colour the samples in the plot. Upload a .csv or .txt file  with your variables and their levels in columns. Please use the first column to put the name of the samples (in the same order that thei are in the columns of the data file) to identify them in the plot. 
                
  - We need to configure some parameters before run the application:
      - Select the variable to study: Select one of the variables listed in the dropdown menu. The variable will be used to colour the samples in the plot. These variables are automatically read from the targets file.
      - Select the Principal Components to plot: Here you can choose two principal components calculated to plot. Usually the first and the second component, that accounts for the majority of the variance in the data are ploted
      - Please enter the title plot: Here you have to put a word or few words to complete the sentence: Principal Component Analysis of.
