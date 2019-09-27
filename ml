#!/usr/bin/perl -n -s
use Math::Matrix;

BEGIN {
    if($l) { # learn
	    $trainset = $t || 1;
	    open VALID, ">VALID";
    }
    elsif($v || $c) { # validar o clasificar
    	$pesos = "$w" || "PESOS"; 
	    open W, "<".$pesos|| die "faltan pesos";
	    while(my $w = <W>) {
		    push @W, [$w];
	    }
	    close W;
	    $W = new Math::Matrix(@W);
    }
    elsif($h) {
        print "ml -l [-d] < ejemplos    # aprender [con debug]\n";
        print "                         # genera archivo PESOS\n";
        print "ml -l -t=0.4 < ejemplos  # training set random 40%\n";
        print "                         # el resto se graba en VALID\n";
        print "ml -v [-d]	   	# validar aprendizaje con PESOS\n";
        print "ml -v -w=FILE       	# usa archivo de pesos FILE\n";
        print "ml -c [-d] < ejemplos	# clasificar ejemplos\n";
        print "ml -h               	# este mensaje\n";
        exit();
    }
}

sub debug {
	return unless($d);
	my ($lbl, $mat) = @_;
	my ($m,$n) = $mat->size();
	$mat->print("$lbl ($m x $n):\n");
}

sub pesos {
	$X = new Math::Matrix(@X);
	$Y = new Math::Matrix(@Y);

	debug("X", $X);
	debug("Y", $Y);
	$Xt = $X->transpose();
	debug("Xt", $Xt);
	$N = $Xt->multiply($X);
	debug("Xt * X", $N);

	$W2 = $N->invert();
	debug("(X * Xt)^-1", $W2);
	$W3 = $Xt->multiply($Y);
	debug("Xt * Y", $W3);

	$W = $W2->multiply($W3);
	debug("W=(X * Xt)^-1 * Xt * Y", $W);

    	$pesos = "$w" || "PESOS"; 
	open W, ">$pesos";
	printf W $W;
	close W;
}


sub validar {
	$X = new Math::Matrix(@X);
	$Y = new Math::Matrix(@Y);

	debug("W",$W);
	debug("X", $X);
	debug("Y", $Y);
	$Z = $X->multiply($W);
	debug("Z", $Z);
	my ($m, $n) = $Z->size();
	my $ok = 0;
	for(my $i=0; $i < $m; $i++) {
		my $y = $Y->[$i][0];
		my $z = $Z->[$i][0];
		my $dy = abs($y - $z);
		$ok++ if($dy < 1);

	}
	printf "Clasificados OK %d de %d (%.2f %%)\n",
		$ok, $m, 100 * $ok/$m;
}

sub clasificar {
	$X = new Math::Matrix(@X);
	$Y = new Math::Matrix(@Y);

	debug("W",$W);
	debug("X", $X);
	debug("Y", $Y);
	$Z = $X->multiply($W);
	debug("Z", $Z);
	my ($m, $n) = $Y->size();
	for(my $i=0; $i < $m; $i++) {
		printf "%.2f %.2f %.2f %.2f -> %.2f\n",
			$X[$i]->[0],
			$X[$i]->[1],
			$X[$i]->[2],
			$X[$i]->[3],$Z->[$i][0];
	}
}


if(/([\d.]+),([\d.]+),([\d.]+),([\d.]+),(\S+)/) {
    my($x1, $x2, $x3, $x4, $sp) = ($1, $2, $3, $4, $5);
    if($l) {
	    if(rand() > $trainset) { 
		    print VALID;
            next;
	    }
    }
    push @X, [$x1, $x2, $x3, $x4];
    push @Y, [($sp eq 'Iris-setosa')? 1 :
		 ($sp eq 'Iris-virginica')? 2:
		 ($sp eq 'Iris-versicolor')? 3:0];
}



END {
    if($l) {
	    &pesos;
	    close VALID;
    }
    if($v) {
	    &validar();
    }
    if($c) {
	    &clasificar();
    }
}


