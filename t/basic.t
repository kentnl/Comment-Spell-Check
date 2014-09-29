use strict;
use warnings;

use Test::More;

# ABSTRACT: Basic test

# abstraktion
# abstraktion abstraktion
# abstraktion incpetion tset bsaic wrods hmubug voreflow kepe warppying thsi ssshtuff hmubug

use Comment::Spell::Check;

my $check = Comment::Spell::Check->new();
local $@;
eval { $check->spell_command; 1 } or do {
  plan skip_all => "No automatic spell checker detection supported: $@";
  exit;
};
my $out;
$check->set_output_string($out);
my $data = $check->parse_from_file($0);

diag("SAMPLE:\n");
diag($out);
note explain $data;

cmp_ok( $data->{counts}->{abstraktion}, '==', 4 );
cmp_ok( $data->{counts}->{hmubug},      '==', 2 );

done_testing;

