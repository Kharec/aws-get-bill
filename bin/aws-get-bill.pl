#!perl -w
use strict;
use DateTime;
use Paws;

our $VERSION = 0.1;

my $ce   = Paws->service( 'CostExplorer', region => 'us-east-1' );
my $date = DateTime->now();
my $month = sprintf("%02d", $date->month());

my $first_day = $date->year() . "-" . $month . "-" . "01";

my $object_bill = $ce->GetCostAndUsage(
    Granularity => 'MONTHLY',
    TimePeriod  => {
        Start => $first_day,
        End   => $date->ymd(),
    },
    Metrics => ['BlendedCost'],
);

my $amount =
  $object_bill->ResultsByTime()->[0]->Total()->{'Map'}->{'BlendedCost'}
  ->{'Amount'};
my $currency =
  $object_bill->ResultsByTime()->[0]->Total()->{'Map'}->{'BlendedCost'}
  ->{'Unit'};

print("Current AWS bill : $amount $currency\n");

exit(0);
