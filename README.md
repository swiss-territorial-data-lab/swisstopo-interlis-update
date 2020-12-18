# swisstopo INTERLIS updates

Swisstopo has the INTERLIS dataset of many cantons in Switzerland, though we want to keep track of updates and run change detection algorithms with this data in a spatio-temporal perspective. This code is a simple way of keeping track of the updates being made by swisstopo in the INTERLIS data. 

If there are updates it is able to check on its amount and then write the txt files containing only the links to use with wget. 

Pay close attention to input and output folders, as the idea of *versioning* demands the files not to be overwritten. It is important that the meta.txt file taken from the swisstopo server is also saved in the new backup folder for frequent comparisons.

# wget

After the txt files are written, simple do the following to download (remember to be in the desired folder with cd):

```
$ wget -i meta_only_links_TG.txt
$ wget -i meta_only_links_GE.txt
``` 

# Copyright and License

**csv-wkt-to-uv3** - Nils Hamel, Huriel Reichel <br >
Copyright (c) 2020 Republic and Canton of Geneva

This program is licensed under the terms of the GNU GPLv3. Documentation and illustrations are licensed under the terms of the CC BY-NC-SA.

# Dependencies

R 3.6.3 or superior and any IDE to run the code, usually RStudio or Emacs.

No CRAN or standalone packages are necessary, only R base.
