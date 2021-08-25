use Test::More tests => 1;

use Paws;
my $obj;

ok( $obj = Paws->service( 'EC2', region => 'eu-west-1' ) );
