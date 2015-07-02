#!/usr/bin/env perl

use common::sense;
use feature qw[say] ;

sub generate_grants {
    my ($ip_address, $database_name, $password) = @_;

    say "grant all on \`$database_name\`.* to '$database_name'\@'$ip_address' identified by '$password' ;" ;
}

my ($ip_address,
    $database_name,
    $password) = @ARGV;

my @addresses = (qw[127.0.0.1 localhost]);
push @addresses, $ip_address;

for my $i (@addresses) {
    generate_grants $i, $database_name, $password ;
}

