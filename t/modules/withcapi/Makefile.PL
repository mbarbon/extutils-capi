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
    VERSION_FROM      => 'lib/Module/WithCAPI.pm',
    PREREQ_PM         => {
      'ExtUtils::CAPI' => '0',
    },
    INC               => '-Iapi -I../../..',
);

package MY;
use File::ShareDir::Install qw(postamble);
