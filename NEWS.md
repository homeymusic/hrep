# hrep 0.18.0

# hrep 0.17.0

# hrep 0.16.1

- Remove unnecessary info messages.

# hrep 0.16.0

- Increase computational efficiency of transposing coded corpora.

# hrep 0.15.0

- Add and propagate a `coherent` option for summing amplitudes. 
Setting `coherent == TRUE` means coherent phases, so amplitudes are summed using addition;
setting `coherent == FALSE` means incoherent phases, so amplitudes are summed using 
the root mean square. This argument is now available in many `hrep` functions
where spectra are constructed.

# hrep 0.14.0

- Add `[.wave` method.
- Add `silence` function.
- Add `concatenate` method for waves.
- Add `pad` method for waves.
- Improve sparse spectrum plotting.
- Implement spectral filters.
- Implement ADSR filter.
- Implement `as.data.frame.wave`.
- `wave` now supports the argument `phase`.
- Bugfix in propagating spectrum labels.

# hrep 0.13.0

- Support plotting harmonic numbers.

# hrep 0.12.1

- Exported `play_wav`.

# hrep 0.12.0

- Implemented `save_wav` and `play_wav`, a more streamlined and faster alternative to `save_wav_sox` and `play_wav_sox`.

# hrep 0.11.1

- Improved documentation for sparse_pi_spectrum, sparse_pc_spectrum, and sparse_fr_spectrum.
- Inserted some missing reference lists.
- Removed old warnings about dictionary versions.

# hrep 0.11.0

- BREAKING CHANGE - changed integer encodings for symbolic representations.
- Implementing chord qualities dictionary (see `decode_chord_quality`).
- Improved API for `decode` function.
- Implemented new representations: `smooth_pi_spectrum`, `smooth_pc_spectrum`,
`sparse_pc_spectrum`.
- Renamed `pc_set_norm_form` to `pc_set_type`.
- Improved documentation.

# hrep 0.10.0

- Added documentation website.
- Introduced S3 subclasses for different vector types.

# hrep 0.9.0

- Expanding sound synthesis capabilities.

# hrep 0.8.0

- Added methods for synthesising audio.

# hrep 0.7.0

- Added wave representation.

# hrep 0.6.0

- Added a `NEWS.md` file to track changes to the package.
- Added `milne_pc_spec_dist` for computing spectral distances between sonorities.
