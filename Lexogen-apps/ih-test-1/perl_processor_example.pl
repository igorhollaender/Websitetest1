#!/usr/bin/perl

#################################################################################################
#
#	p e r l _ p r o c e s s o r _ e x a m p l e . p l 
#
#	
#	Last revision: 160331 IH
#
#	(C) 2016 Lexogen GmbH, Igor Holländer
#
#
#################################################################################################


print "I AM PERL PROCESSOR generating SVG output (Ver.160331a)\n";
my $now_string = localtime;
print $now_string;

# the svg magnifying glass software comes from 
# www.bogotobogo.com/svg_source/famoustiger.svg

my $svg_code;
open(my $fhin, "<famoustiger.svg") or die "Cannot open file for input";
local $/=undef;
$svg_code = <$fhin>;
close $fhin;

$svg_code =~ s/[\r\n]/ /g; #IH160331 remove any newlines, so WordPress cannot include any <br>

print $svg_code;



