package Foo;
use 5.014002;
use warnings;

use Module::WithCAPI;
our $VERSION = '0.01';

require XSLoader;
XSLoader::load('Foo', $VERSION);

1;
