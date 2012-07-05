#!/usr/bin/perl
################################################
# Simple script to list doubles of jpg files   #
# that are in the current directory            #
################################################
opendir(DIR,".")||die;
@files=readdir(DIR);
closedir(DIR);
foreach $file (@files) {
  if ($file =~ /\.jpg$/) { # for each jpg file in te directory
    $digest=`sha1sum $file`; #calculate the sha1 digest
    $digest =~ s/\s.*//;     
    if ($KNOWN{$digest}) {   #If the digest is known
      print "$file\n";       #Print the filename 
      $found=1;              #mark that something was found
    }
    $KNOWN{$digest}=1; #Remember this digest for later checks.
  }
}
unless ($found) { #if nothing was found print an error message
  print STDERR "ERR: No doubles found\n";
}
