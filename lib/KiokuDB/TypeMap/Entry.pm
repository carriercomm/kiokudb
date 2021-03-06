#!/usr/bin/perl

package KiokuDB::TypeMap::Entry;
use Moose::Role;

use namespace::clean -except => 'meta';

requires "compile";

__PACKAGE__

__END__

=pod

=head1 NAME

KiokuDB::TypeMap::Entry - Role for L<KiokuDB::TypeMap> entries

=head1 SYNOPSIS

    package KiokuDB::TypeMap::Foo;
    use Moose;

    with qw(KiokuDB::TypeMap::Entry);

    # or just use KiokuDB::TypeMap::Entry::Std

    sub compile {
        ...
    }

=head1 DESCRIPTION

This is the role consumed by all typemap entries.

=head1 REQUIRED METHODS

=over 4

=item compile $class

This method is called by L<KiokuDB::TypeMap::Resolver> for a given class, and
should return two code references, one for collapsing and one for expanding.

The collapsing sub is called as a method on L<KiokuDB::Collapser> and the
expanding sub is called on L<KiokuDB::Linker>.

The callbacks must call other L<KiokuDB::Collapser> and L<KiokuDB::Linker>
methods to actually get the work done.

L<KiokuDB::TypeMap::Entry::Std> provides a more concise way of defining typemap entries.

=back
