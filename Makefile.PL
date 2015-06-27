#!/usr/bin/env perl

use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME              => "ExtUtils::CAPI",
    VERSION_FROM      => "lib/ExtUtils/CAPI.pm",
);
