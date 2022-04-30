Enrichment analysis is a computational method for inferring knowledge about an input gene set by comparing it to annotated gene sets representing prior biological knowledge. Enrichment analysis checks whether an input set of genes significantly overlaps with annotated gene sets. [More information.](https://pubmed.ncbi.nlm.nih.gov/19033363/)

Enrichment Analysis made with `enrichR` package, check the website for more information: [Enrichr web site](https://maayanlab.cloud/Enrichr/).

You need to perform this steps to have obtain good results :) :

              
  - Upload your file:
      - Data file: Load your data of interest in .csv or .txt format. This must have one column with the genes of interest in Entrez gene symbol or HGNC gene symbol. You can select later the right column, there is not need to have a certain column order. 
      
                
  - Parameters to edit:
      - Select the database: Select one of the predeterminated databases given (7) or search for a different one (193 in total).
      - Select the numbers of terms: You can choose how many terms do you want in your plot here (from 5 to 30).
      - Select the numbers of characters: Here you can set the limit of characters to keep in the term description on the plot (from 25 to 120).
      - Title plot: Here you could put a word or few words to complete the sentence. If there is empty, the title will be by default.
