use 5.014002;
use ExtUtils::MakeMaker;
use blib '../../../blib';
use blib '../withcapi/blib';

use ExtUtils::CAPI;

WriteMakefile(
    NAME              => 'Foo',
    VERSION_FROM      => 'lib/Foo.pm',
    PREREQ_PM         => {
        'Module::WithCAPI' => 0,
    },
    INC               => '-I. -I../../.. ' . ExtUtils::CAPI::include_path('Module-WithCAPI'),
);
