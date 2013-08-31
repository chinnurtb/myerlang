#! /bin/sh

command="$1"
shift

touch .flass

case $command in
  ./module-*)
    module=${command#./module-}

    erl +A 10 -sname $$ -pa ../src -eval "
      cover:compile_beam_directory (\"../src\"),
      io:format (\"$module:test () ...\", [ ]),
      ok = $module:test (),
      cover:analyse_to_file ($module).
    " -noshell -s init stop 2>&1 > $module.test.out || exit $?

  ;;
  *)
    "$command" "$@" || exit $?
  ;;
esac

find . -name '*.COVER.out' -and -newer .flass -print | \
  perl -MIO::File -lne 'chomp;
                       $fh = new IO::File $_, "r" or die $!;
                       my @lines = grep { ! / 0\.\.\|  -module \(/ } <$fh>;
                       my $bad = grep /^\s+0\.\.\|/, @lines;
                       my $total = grep /^\s+\d+\.\.\|/, @lines;
                       my $perc = int (100 * (1.0 - ($bad / $total)));
                       print "$perc% of $total lines covered in $_"'

# find . -name '*.COVER.out' -and -newer .flass -print | \
# xargs grep -n -H -A2 -B2 '0\.\.\|'

rm .flass
