import argparse

from ssl_datamodule import LibriLightSSLDataModule


def get_parser():
    parser = argparse.ArgumentParser(
        formatter_class=argparse.ArgumentDefaultsHelpFormatter
    )

    return parser


parser = get_parser()
LibriLightSSLDataModule.add_arguments(parser)
args = parser.parse_args()

librilight = LibriLightSSLDataModule(args)
train_cuts = librilight.train_large_cuts()
train_dl = librilight.train_dataloaders(train_cuts, sampler_state_dict=None)
import pdb; pdb.set_trace()

for epoch in range(1, 30 + 1):
    train_dl.sampler.set_epoch(epoch - 1)

    for batch_idx, batch in enumerate(train_dl):
        batch_size = len(batch["cuts"])
        audio = batch["audio"]
        audio_lens = batch["audio_lens"]
