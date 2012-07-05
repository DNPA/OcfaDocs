#!/usr/bin/perl
################################################
# Simple script to list all bogus jpg files    #
# in the current directory                     #
################################################
opendir(DIR,".")||die;
@files=readdir(DIR);
closedir(DIR);
foreach $file (@files) {
  if ($file =~ /\.jpg$/) {   #For each jpg file in te current directory:
    $ok=`jpegtopnm $file >/dev/null 2>/dev/null`; #validate the jpeg file
    if ($?) {                #If en error was returned
       print "$file\n";      #Print the filename
       $found=1;             #and mark that something was found
    }
  }
}
unless ($found) { #if nothing was found show an error message
  print STDERR "ERR: No bogus jpeg files found\n";
}
