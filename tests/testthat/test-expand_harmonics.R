context("test-expand_harmonics")

test_that("misc", {
  .sparse_fr_spectrum(frequency = c(1, 2),
                      amplitude = c(1, 1)) %>%
    expand_harmonics(num_harmonics = 1, digits = 1e50) %T>%
    expect_is("sparse_fr_spectrum") %>%
    expect_equal(data.frame(x = c(1, 2),
                            y = c(1, 1)),
                 check.attributes = FALSE)

  .sparse_fr_spectrum(frequency = c(1, 2),
                      amplitude = c(1, 1)) %>%
    expand_harmonics(num_harmonics = 1, digits = 6) %T>%
    expect_is("sparse_fr_spectrum") %>%
    expect_equal(data.frame(x = c(1, 2) %>% freq_to_midi() %>% round(6) %>% midi_to_freq(),
                            y = c(1, 1)),
                 check.attributes = FALSE)


  .sparse_fr_spectrum(frequency = c(1, 2),
                      amplitude = c(1, 1)) %>%
    expand_harmonics(num_harmonics = 3, digits = 1e50) %T>%
    expect_is("sparse_fr_spectrum") %>%
    expect_equal(data.frame(x = c(1, 2, 3, 4, 6),
                            y = c(1, sqrt(1.25), 1 / 3, 1 / 2, 1 / 3)),
                 check.attributes = FALSE)

  pi_chord(0) %>%
    expand_harmonics(num_harmonics = 6) %>%
    expect_equal(data.frame(x = c(0, 12, 19, 24, 28, 31),
                            y = c(1, 1/2, 1/3, 1/4, 1/5, 1/6)),
                 check.attributes = FALSE,
                 tolerance = 1e-1)
})

test_that("roll-off", {
  pi_chord(0) %>%
    expand_harmonics(num_harmonics = 6, roll_off_dB = 2) %>%
    {amp(.)} %>%
    expect_equal(c(1, 1 / 2 ^ 2, 1 / 3 ^ 2, 1 / 4 ^ 2, 1 / 5 ^ 2, 1 / 6 ^ 2))
})

test_that("MIDI transposition", {
  pi_chord(0) %>%
    expand_harmonics(num_harmonics = 6, roll_off_dB = 2) %>%
    {pitch(.)} %>%
    expect_equal(c(10, 22, 29, 34, 38, 41),
                 tolerance = 1)
})

test_that("rounding", {
  c(60, 64, 67) %>% pi_chord %>% expand_harmonics(digits = 0) %>%
    as.data.frame %>% magrittr::extract2("x") %>%
    {checkmate::qtest(., "X")} %>% expect_true

  c(0) %>% pi_chord %>% expand_harmonics(digits = 0,
                                         num_harmonics = 5) %>%
    as.data.frame() %>%
    expect_equal(data.frame(x = c(0, 12, 19, 24, 28),
                            y = c(1, 1/2, 1/3, 1/4, 1/5)))

  c(7) %>% pi_chord %>% expand_harmonics(digits = 0,
                                         num_harmonics = 5) %>%
    as.data.frame() %>%
    expect_equal(data.frame(x = c(7, 19, 26, 31, 35),
                            y = c(1, 1/2, 1/3, 1/4, 1/5)))

  c(0, 7) %>% pi_chord %>% expand_harmonics(digits = 0,
                                            num_harmonics = 5) %>%
    as.data.frame() %>%
    expect_equal(data.frame(x = c(0, 7, 12, 19,
                                  24, 26, 28, 31, 35),
                            y = c(1, 1, 1/2, sum_amplitudes(1/3, 1/2),
                                  1/4, 1/3, 1/5, 1/4, 1/5)))

  expect_equal(
    c(0, 7) %>% pi_chord %>% expand_harmonics(digits = 0),
    c(0, 7) %>% sparse_pi_spectrum(digits = 0)
  )
})
test_that('octave ratio stretches and compresses',{
  harmonic_default_result <- 60 %>%
    sparse_pi_spectrum(num_harmonics=10) %>%
    pitch
  expect_equal(harmonic_default_result[1], 60)
  expect_equal(harmonic_default_result[2], 60+12)
  expect_equal(harmonic_default_result[4], 60+24)
  expect_equal(harmonic_default_result[8], 60+36)

  harmonic_explicit_result <- 60 %>%
    sparse_pi_spectrum(num_harmonics=10, pseudo_octave = 2.0) %>%
    pitch
  expect_equal(harmonic_explicit_result[1], 60)
  expect_equal(harmonic_explicit_result[2], 60+12)
  expect_equal(harmonic_explicit_result[4], 60+24)
  expect_equal(harmonic_explicit_result[8], 60+36)

  compressed_result <- 60 %>%
    sparse_pi_spectrum(num_harmonics=10, pseudo_octave = 1.9) %>%
    pitch
  expect_equal(compressed_result[1], 60)
  expect_equal(compressed_result[2],
               freq_to_midi(midi_to_freq(60)*1.9^log2(2)))
  expect_equal(compressed_result[4],
               freq_to_midi(midi_to_freq(60)*1.9^log2(4)))
  expect_equal(compressed_result[8],
               freq_to_midi(midi_to_freq(60)*1.9^log2(8)))

  stretcheded_result <- 60 %>%
    sparse_pi_spectrum(num_harmonics=10, pseudo_octave = 2.1) %>%
    pitch
  expect_equal(stretcheded_result[1], 60)
  expect_equal(stretcheded_result[2],
               freq_to_midi(midi_to_freq(60)*2.1^log2(2)))
  expect_equal(stretcheded_result[4],
               freq_to_midi(midi_to_freq(60)*2.1^log2(4)))
  expect_equal(stretcheded_result[8],
               freq_to_midi(midi_to_freq(60)*2.1^log2(8)))

})
