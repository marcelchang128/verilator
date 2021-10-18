#!/usr/bin/env perl
if (!$::Driver) { use FindBin; exec("$FindBin::Bin/bootstrap.pl", @ARGV, $0); die; }
# DESCRIPTION: Verilator: Verilog Test driver/expect definition

scenarios(vlt_all => 1);

top_filename("t/t_race.v");
compile(
	make_top_shell	=> 0,
	make_main		=> 0,
	v_flags2 => ["--exe $Self->{t_dir}/t_race.cpp"],
    );

execute(
    check_finished => 1,
    );

ok(1);
1;
