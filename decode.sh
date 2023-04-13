export CUDA_VISIBLE_DEVICES=

for epoch in {20..40}; do
  for ((avg=1; avg<=$epoch-20; avg++)); do
    ./pruned_transducer_stateless7/decode.py \
      --epoch $epoch \
      --avg $avg \
      --exp-dir ./pruned_transducer_stateless7/exp_960 \
      --max-duration 600 \
      --decoding-method greedy_search
  done
done
