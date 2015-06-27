package Module::WithCAPI;
use 5.014002;
use warnings;
use blib '../../../blib';

use ExtUtils::CAPI;

our $VERSION = '0.01';

require XSLoader;
XSLoader::load('Module::WithCAPI', $VERSION);

1;
