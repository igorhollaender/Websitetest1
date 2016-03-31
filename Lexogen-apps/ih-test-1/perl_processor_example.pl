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

#################################################################################################
#
#       The WordPress page using this script ahs the following content:
#	(using the 'Insert HP' plugin)
#
#################################################################################################
#
#	[insert_php]
#	
#	$descriptorspec = array(
#		0 => array("pipe", "r"),  
#		1 => array("pipe", "w"),
#		2 => array("file", "/home/ubuntu/workspace/Lexogen-apps/ih-test-1/error-output.txt", "a")
#	);
#	
#	$cwd = '/home/ubuntu/workspace/Lexogen-apps/ih-test-1/';
#	$env = array('some_option' => 'aeiou');
#	
#	$process = proc_open(
#		'/home/ubuntu/workspace/Lexogen-apps/ih-test-1/perl_processor_example.pl', 
#		$descriptorspec, 
#		$pipes, $cwd, $env);
#	
#	if (is_resource($process)) {
#		fwrite($pipes[0], '');
#		fclose($pipes[0]);
#	
#		//  IH160331 for this to work, we had to make a change in 
#		//  wp-includes/post-template.php
#		// (see https://core.trac.wordpress.org/ticket/27134)
#	
#		echo stream_get_contents($pipes[1]);
#
#		fclose($pipes[1]);
#	
#		$return_value = proc_close($process);
#	
#		echo "\n\ncommand returned $return_value\n";
#		}
#	
#	[/insert_php]
#
#################################################################################################

print "I AM PERL PROCESSOR generating SVG output (Ver.160331b)\n";
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



