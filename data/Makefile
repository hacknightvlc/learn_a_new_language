.PHONY: all
all: payments-100.jsonl payments-1000.jsonl payments-1M.jsonl.gz

.PHONY: clean
clean:
	rm -f *.jsonl

payments-100.jsonl:
	bundle exec ruby generate.rb | head -n 100 > $@

payments-1000.jsonl:
	bundle exec ruby generate.rb | head -n 1000 > $@

payments-1M.jsonl:
	bundle exec ruby generate.rb | head -n 1000000 > $@

payments-1M.jsonl.gz: payments-1M.jsonl
	gzip -9 $< > $@
