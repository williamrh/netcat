#!/usr/bin/perl

 use Term::ANSIColor;
 $Term::ANSIColor::AUTORESET = 1;

system('clear');
$finish = 0;
@formatarray;
@formatarray2;
while ( $finish ne 1 ) {
system('tput cup 0 0');
	#FORMATTING
    $netdev = `cat /proc/net/dev | tail -n+2 | sed 's/|/ /g' | awk '\$1\=\$1' ORS='\n'`;
    $netdev =~ s/: /#/g;
    $netdev =~ s/:/#/g;
    $netdev =~ s/ /#/g;
	@netdevarray = split(/\n/,$netdev);

	#FORMAT
	$n=0;
	foreach $Line(@netdevarray) {
		$i=0;
		$Line2 = @netdevarray2[$n]; $n++;
		@formatarray = split(/#/,$Line); @formatarray2 = split(/#/,$Line2);
		foreach $arg(@formatarray) {
			if ( $i eq 1 || $i eq 9) {
				if ( $arg > @formatarray2[$i]) {
					print colored( (sprintf "%15s",$arg), 'RED'),"|";
				} else {
					printf "%15s|",$arg;
				}
			} else {
				if ( $arg > @formatarray2[$i]) {
					print colored( (sprintf "%10s",$arg), 'RED'),"|";
				} else {
					printf "%10s|",$arg;
				}
			}
			$i++;
		}
		print "\n";
	}
	@netdevarray2 = split(/\n/,$netdev);
	sleep 1;
}
