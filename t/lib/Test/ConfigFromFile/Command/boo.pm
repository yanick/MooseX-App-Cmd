package Test::ConfigFromFile::Command::boo;
use Moose;
use YAML();

extends qw(MooseX::App::Cmd::Command);
with 'MooseX::ConfigFromFile';

=head1 NAME

Test::MyCmd::Command::boo - reads from config file

=cut

has 'moo' => (
    isa => "ArrayRef",
    is  => "ro",
    required => 1,
    auto_deref => 1,
    documentation => "required option field",
);

has '+configfile' => (
    default => sub { 't/lib/Test/ConfigFromFile/config.yaml' },
);

sub execute {
  my ($self, $opt, $arg) =@_;

  die ("ghosts go " . join(' ', $self->moo));
}

sub get_config_from_file {
    my ($self, $file) = @_;

    return YAML::LoadFile($file);
}

1;
