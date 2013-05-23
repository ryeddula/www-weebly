package WWW::Weebly::TieFileWeebly;

=head1 NAME

WWW::Weebly::TieFileWeebly - a simple tie to allow for easy debugging.

=cut

use strict;

sub _timestamp {
	return '['.localtime.']';
}

sub TIEHANDLE {

	my ($class, $file) = @_;
	
	open my $fh, '>>', $file or return;
	bless $fh, $class;
}

sub PRINT {

	my ($self, @args) = @_;
	print {$self} $self->_timestamp, ' ', @args;
}

sub PRINTF {

	my ($self, $fmt, @args) = @_;
	printf ${$self}, $fmt, @args;
}

sub WRITE {

	my $self   = shift;
	my $string = shift;
	my $length = shift || length $string;
	my $offset = shift || 0;
	return syswrite $self, $string, $length, $offset;
}

sub CLOSE {
	close shift;
}

1;