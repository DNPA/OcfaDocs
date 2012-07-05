#!/usr/bin/perl
opendir(DIR,".")||die;
@files=readdir(DIR);
closedir(DIR);
foreach $file (@files) {
  if ($file =~ /\.jpg$/) {
    $ok=`jpegtopnm $file 2>/dev/null|pnmfile`;
    if ($ok =~ /(\d+)\s+by\s+(\d+)/) {
       $pixels=$1*$2;
       $bigthumbnail=128*128;
       if ($pixels <= $bigthumbnail) {
          print "$file\n";
	  $found=1;
       }
    }
  }
}
unless ($found) {
  print STDERR "ERR: No thumbnails found\n";
}
