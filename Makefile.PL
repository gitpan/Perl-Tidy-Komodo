
use strict;
use warnings;

use 5.006;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "tidy perl files in Komodo with a project rc",
  "AUTHOR" => "Christian Walde <walde.christian\@googlemail.com>",
  "BUILD_REQUIRES" => {
    "Capture::Tiny" => 0,
    "File::Find" => 0,
    "File::Slurp" => 0,
    "File::Temp" => 0,
    "Test::InDistDir" => 0,
    "Test::More" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Perl-Tidy-Komodo",
  "EXE_FILES" => [
    "bin/perltidy_ko"
  ],
  "LICENSE" => "unrestricted",
  "NAME" => "Perl::Tidy::Komodo",
  "PREREQ_PM" => {
    "File::chdir" => 0,
    "Perl::Tidy" => 0,
    "strictures" => 0
  },
  "VERSION" => "1.120910",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



