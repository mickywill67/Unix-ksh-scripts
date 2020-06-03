#!/usr/bin/perl -w

my $osver = `uname -s` ;

chomp $osver ;

if ($osver eq "SunOS") {
   print "Solaris - $osver\n" ;
}
elsif ($osver eq "Linux") {
   print "Linux - $osver\n" ;
}
else {
   print "unknown OS - $osver \n" ;
}

