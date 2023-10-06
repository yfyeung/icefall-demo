export CUDA_VISIBLE_DEVICES=

for epoch in {20..40}; do
  for ((avg=1; avg<=$epoch-20; avg++)); do
    ./zipformer/decode.py \
      --epoch $epoch \
      --avg $avg \
      --exp-dir ./zipformer/exp \
      --max-duration 2000 \
      --decoding-method greedy_search
  done
done
