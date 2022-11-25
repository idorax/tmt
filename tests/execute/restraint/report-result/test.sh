#!/bin/bash
. /usr/share/beakerlib/beakerlib.sh || exit 1

rlJournalStart
    rlPhaseStartSetup
        rlRun "pushd data"
    rlPhaseEnd

    rlPhaseStartTest
        rlRun -s "tmt run -vvv --remove" 1
        rlAssertGrep "pass /report" $rlRun_LOG
        rlAssertGrep "pass /smoke/rstrnt-good" $rlRun_LOG
        rlAssertGrep "fail /smoke/rstrnt-bad" $rlRun_LOG
        rlAssertGrep "skip /smoke/rstrnt-skip" $rlRun_LOG
        rlAssertGrep "warn /smoke/rstrnt-warn" $rlRun_LOG
	rlAssertGrep "pass /smoke/rhts-good" $rlRun_LOG
        rlAssertGrep "fail /smoke/rhts-bad" $rlRun_LOG
        rlAssertGrep "skip /smoke/rhts-skip" $rlRun_LOG
        rlAssertGrep "warn /smoke/rhts-warn" $rlRun_LOG
	rlAssertGrep "pass /multi_reports/rstrnt-good" $rlRun_LOG
        rlAssertGrep "fail /multi_reports/rstrnt-bad" $rlRun_LOG
        rlAssertGrep "pass /multi_reports/rstrnt-skip" $rlRun_LOG
        rlAssertGrep "warn /multi_reports/rstrnt-warn" $rlRun_LOG
        rlAssertGrep "pass /multi_reports/rhts-good" $rlRun_LOG
        rlAssertGrep "fail /multi_reports/rhts-bad" $rlRun_LOG
        rlAssertGrep "pass /multi_reports/rhts-skip" $rlRun_LOG
        rlAssertGrep "warn /multi_reports/rhts-warn" $rlRun_LOG
    rlPhaseEnd

    rlPhaseStartCleanup
        rlRun "popd"
    rlPhaseEnd
rlJournalEnd
