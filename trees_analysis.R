##### For collaborative projects--figure out what machine we're on so that we can automatically set the working directory ####
jacobsocolar <- length(grep('jacobsocolar', Sys.info())) > 0
jacob <- length(grep('jacob', Sys.info())) > 0

if(jacobsocolar){
  basepath <- "/Users/jacobsocolar/Dropbox/Work/Iquitos/Trees/secondary_forests"
}else if(jacob){
  basepath <- "/Users/jacob/Dropbox/Work/Iquitos/Trees/secondary_forests"
}# else if(){basepath <- }
# Edit the above for whatever computer(s) you use.  Just make absolutely sure that the if condition is something that definitely
# wouldn't possibly evaluate as true on anybody else's system, and that none of the preceding conditions could possibly evaluate
# to TRUE on your system!  (This isn't just about making sure that we get the right working directories; in some cases we might
# conceivably invoke system commands for file management that depend on the basepath.)

setwd(basepath)

##### Data download and cleanup #####
# Get Valderrama tree data from Socolar et al
download.file("https://datadryad.org/stash/downloads/download_resource/29244",
              destfile = 'Valderrama_data/socolar_valderrama.zip')
unzip('Valderrama_data/socolar_valderrama.zip', exdir = 'Valderrama_data')

# Get genus-level phylogeny from Coelho de Souza et al
download.file("https://www.forestplots.net/upload/data-packages/coelho-de-souza-et-al-2019/data%20package%20Coelho%20de%20Souza%20et%20al.,%202019%20NEE.zip",
              destfile = 'Coelho_data/Coelho_de_Souza.zip')
unzip('Coelho_data/Coelho_de_Souza.zip', exdir = 'Coelho_data')

# Souza et al weren't smart enough to zip their data file in such a way that the godawful __MACOSX file isn't included,
# and made visible when we unzip with R.  The following works to remove that dumb folder on my system.  Feel free to 
# fill in the "else if" for something that works for you, but make absolutely sure that there's no way that your if-statement
# will evaluate to 'true' on my computer and trigger some unwanted system command.

if(jacobsocolar | jacob){
  system2('trash', c('-rf', paste0(basepath, '/Coelho_data/__MACOSX')))
}# else if(){}


##### Tree data initial formatting #####


