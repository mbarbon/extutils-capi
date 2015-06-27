#!/usr/bin/env perl

use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME              => "ExtUtils::CAPI",
    VERSION_FROM      => "lib/ExtUtils/CAPI.pm",
    ABSTRACT_FROM     => 'lib/ExtUtils/CAPI.pm',
    AUTHOR            => [
        'Steffen Mueller <smueller@cpan.org>',
        'Mattia Barbon <mattia@barbon.org>',
    ],
    TEST_REQUIRES     => {
        'File::ShareDir'    => '1.00',
        'Capture::Tiny'     => '0.22',
    },
);
