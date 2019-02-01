all: output/milestone-2-interim-report.pdf

output:
	mkdir -p $@

output/milestone-2-interim-report.pdf: presentations_reports/milestone_2/interim_report.md | output
	bin/compile-report $^ $@

