cd exp/greedy_search
grep greedy_search wer-summary-test-clean-greedy_search-epoch-* | awk '{print $2, $1}' | sort -n > 1
grep greedy_search wer-summary-test-other-greedy_search-epoch-* | awk '{print $2, $1}' | sort -n > 2
python sort_results.py > 3
