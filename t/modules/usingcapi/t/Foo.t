use strict;
use warnings;
use blib '../../../blib';
use blib '../withcapi/blib';

use Test::More tests => 2;
BEGIN { use_ok('Foo') };

is(Foo::xs_my_sum(5, 6), 11);

