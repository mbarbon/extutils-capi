use 5.014002;
use ExtUtils::MakeMaker;
use File::ShareDir::Install;

my $module = 'Module::WithCAPI';

use blib '../../../blib';
use ExtUtils::CAPI;
mkdir 'api' unless -d 'api';
ExtUtils::CAPI::export_functions(
  module => $module,
  header => "api/module_withcapi.h",
  functions => {
    my_sum => 'int (*)(int, int)',
    my_diff => 'int (*)(int, int)',
    my_prod => 'int (*)(int, int)',
  },
);

install_share 'api';

WriteMakefile(
    NAME              => $module,
    VERSION_FROM      => 'lib/Module/WithCAPI.pm', # finds $VERSION
    PREREQ_PM         => {
#      'ExtUtils::CAPI' => '0',
    }, # e.g., Module::Name => 1.1
    ABSTRACT_FROM     => 'lib/Module/WithCAPI.pm', # retrieve abstract from module
    AUTHOR            => 'Steffen Mueller <smueller@cpan.org>',
    LIBS              => [''], # e.g., '-lm'
    DEFINE            => '', # e.g., '-DHAVE_SOMETHING'
    INC               => '-Iapi -I../../..', # e.g., '-I. -I/usr/include/other',
);

package MY;
use File::ShareDir::Install qw(postamble);
