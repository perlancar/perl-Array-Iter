package Array::Iter;

# DATE
# VERSION

use strict;
use warnings;

use Exporter qw(import);
our @EXPORT_OK = qw(array_iter list_iter);

sub array_iter {
    my $ary = shift;
    my $i = 0;
    sub {
        if ($i < @$ary) {
            return $ary->[$i++];
        } else {
            return undef;
        }
    };
}

sub list_iter {
    array_iter([@_]);
}

1;
#ABSTRACT: Generate a coderef iterator for an array

=for Pod::Coverage .+

=head1 SYNOPSIS

  use Array::Iter qw(array_iter list_iter);

  my $iter = array_iter([1,2,3,4,5]);
  while (my $val = $iter->()) { ... }

  $iter = list_iter(1,2,3,4,5);
  while (my $val = $iter->()) { ... }


=head1 DESCRIPTION

This module provides a simple iterator which is a coderef that you can call
repeatedly to get elements of a list/array. When the elements are exhausted, the
coderef will return undef. No class/object involved.

The principle is very simple and you can do it yourself with:

 my $iter = do {
     my $i = 0;
     sub {
         if ($i < @$ary) {
             return $ary->[$i++];
         } else {
             return undef;
         }
     };
  }

Caveat: if list/array contains an C<undef> element, it cannot be distinguished
with an exhausted iterator.


=head1 FUNCTIONS

=head2 array_iter($aryref) => coderef

=head2 list_iter(@elems) => coderef


=head1 SEE ALSO

L<Array::Iterator>, which also lists some other related modules.

=cut
