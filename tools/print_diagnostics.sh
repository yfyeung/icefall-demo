mkdir -p zipformer/exp_diag
ln -svf zipformer/exp/epoch-25.pt zipformer/exp_diag/
./zipformer/train.py \
  --world-size 1 \
  --full-libri 1 \
  --start-epoch 26 \
  --exp-dir zipformer/exp_diag \
  --max-duration 100 \
  --print-diagnostics 1 \
  > ./zipformer/exp_diag/diagnostic.log