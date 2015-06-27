#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use Cwd;
use autodie 'chdir';
use Capture::Tiny qw(capture);
use Config;

sub run_in_ok {
    my ($dir, $command) = @_;

    local $Test::Builder::Level = $Test::Builder::Level + 1;
    my $origin = Cwd::cwd();
    chdir $dir;

    my ($stdout, $stderr, $result) = capture {
        system @$command;
        return $? >> 8;
    };

    if (!$result) {
        ok(1, "$dir: [@$command]");
    } else {
        ok(0, "$dir: [@$command]");
        diag($stdout);
        diag($stderr);
    }

    chdir $origin;
}

run_in_ok('t/modules/withcapi', [$^X, 'Makefile.PL']);
run_in_ok('t/modules/withcapi', [$Config{make}, 'clean']);
run_in_ok('t/modules/withcapi', [$^X, 'Makefile.PL']);
run_in_ok('t/modules/withcapi', [$Config{make}]);
run_in_ok('t/modules/withcapi', [$Config{make}, 'test']);

run_in_ok('t/modules/usingcapi', [$^X, 'Makefile.PL']);
run_in_ok('t/modules/usingcapi', [$Config{make}, 'clean']);
run_in_ok('t/modules/usingcapi', [$^X, 'Makefile.PL']);
run_in_ok('t/modules/usingcapi', [$Config{make}]);
run_in_ok('t/modules/usingcapi', [$Config{make}, 'test']);

done_testing();
