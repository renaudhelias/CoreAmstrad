# perl classify.pl < MarkusGB_test_r004.7.2.txt > go.bat
while( <> ){
    $line=$_;
	if ($line =~ /\.zip OK/ig) {
		s/^([^ ]+\.zip)/$line/i; 
		print "move Markus\\$1 1011\n";
	} elsif ($line =~ /\.zip 0011/ig) {
		s/^([^ ]+\.zip)/$line/i;
		print "move Markus\\$1 0011\n";
	} elsif ($line =~ /\.zip 0111/ig) {
		s/^([^ ]+\.zip)/$line/i;
		print "move Markus\\$1 0111\n";
	} elsif ($line =~ /\.zip KO/ig) {
		s/^([^ ]+\.zip)/$line/i;
		print "move Markus\\$1 KO\n";
	} else {
		# print $line;
		s/^([^ ]+\.zip)/$line/i;
		print "move Markus\\$1 INTRU\n";
	}
}