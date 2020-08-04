#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';
use IO::All;
use JSON::XS;
use YAML::XS;
use Getopt::Std;

my %opt;
getopts("n"=>\%opt);

my @sp;
if($opt{n}) {
  $sp[0]='%s_%s=%s';
  $sp[1]='%s_%03d=%s';
  $sp[2]='%s=%s';
} else {
  $sp[0]='%s_%s="%s"';
  $sp[1]='%s_%03d="%s"';
  $sp[2]='%s="%s"';
}

sub load_json {
  return JSON::XS::decode_json(io(shift)->utf8->slurp);
}
sub load_yaml {
  return YAML::XS::LoadFile(shift);
}

# --------------

my $config=load_yaml('/data/config.yaml');
my $terraform=load_json('/data/terraform.json');

{
  my %tfk;
  while(my($k,$v)=each %{$terraform}) {
    $tfk{$k}=$v->{value};
  }
  $terraform=\%tfk;
}

foreach my $c(@{$config}) {
  my $js=$terraform;
  foreach(split(/\./,$c->{key})) { $js=$js->{$_} }

  my $rjs=ref($js);
  if($rjs eq 'HASH') {
    while(my($key,$val)=each %{$js}) {
      say sprintf($sp[0], $c->{prefix}, uc($key), $val);
    }
  } elsif($rjs eq 'ARRAY') {
    for(my $i=0;$i<=$#{$js};$i++) {
      say sprintf($sp[1], $c->{prefix}, $i, $js->[$i]);
    }
  } else {
      say sprintf($sp[2], $c->{prefix}, $js);
  }
}

