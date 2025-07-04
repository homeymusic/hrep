% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sparse-pi-spectrum.R
\name{sparse_pi_spectrum}
\alias{sparse_pi_spectrum}
\alias{sparse_pi_spectrum.sparse_pi_spectrum}
\alias{sparse_pi_spectrum.sparse_fr_spectrum}
\alias{sparse_pi_spectrum.list}
\alias{sparse_pi_spectrum.default}
\alias{sparse_pi_spectrum.pi_chord}
\title{Sparse pitch spectrum}
\usage{
sparse_pi_spectrum(x, ...)

\method{sparse_pi_spectrum}{sparse_pi_spectrum}(x, ...)

\method{sparse_pi_spectrum}{sparse_fr_spectrum}(x, ...)

\method{sparse_pi_spectrum}{list}(x, ...)

\method{sparse_pi_spectrum}{default}(x, ...)

\method{sparse_pi_spectrum}{pi_chord}(x, amplitude = 1, coherent = FALSE, ...)
}
\arguments{
\item{x}{Input sonority.}

\item{...}{
  Arguments passed on to \code{\link[=expand_harmonics]{expand_harmonics}}
  \describe{
    \item{\code{num_harmonics}}{(Integerish scalar)
Number of harmonics (including the fundamental) to which
each tone should be expanded.}
    \item{\code{roll_off_dB}}{(Numeric scalar) Parametrises the amount of amplitude roll-off
in the harmonics, with greater values corresponding to higher roll-off.}
    \item{\code{digits}}{Number of digits to which each partial's MIDI pitch should be rounded.}
    \item{\code{label_harmonics}}{If TRUE, then the harmonics in the resulting spectrum are labelled with their harmonic numbers.}
    \item{\code{pseudo_octave}}{The octave ratio for stretching and compressing harmonics, defaults to 2.0.}
  }}

\item{amplitude}{(Numeric vector)
Vector of amplitudes to assign to each pitch.
If a scalar value is provided, this value is assigned to all pitches}

\item{coherent}{Whether the amplitudes from different spectral components should be combined
assuming coherent summation, where the amplitudes simply add together
(default is \code{FALSE}).
Otherwise incoherent summation is used, where the amplitudes are squared, added, then
square rooted.}
}
\value{
An object of class \code{sparse_pi_spectrum}.
}
\description{
This function represents an input object as a sparse pitch spectrum.
}
\details{
A sparse pitch spectrum describes an input sonority as a finite set
of spectral components, each defined by a
pitch (expressed on the MIDI pitch scale)
and an amplitude (expressed in arbitrary units, but with the
fundamental frequencies of chord pitches typically taking the value 1).

A sparse pitch spectrum is most easily created by coercion from
a different chord representation. If a numeric vector is provided as the input,
it is treated as a \code{pi_chord} representation, for example
\code{sparse_pi_spectrum(c(60, 64, 67))} will create a sparse pitch spectrum
by expanding the harmonics implied by a C major triad.

A sparse pitch spectrum can also be created directly by providing a list
with two elements, the first being labelled "pitch", and the second labelled "amplitude",
each of which being numeric vectors of the same length.
In this case no harmonic expansion is performed.
The first element will be taken as a vector of pitches,
and the second element will be taken as a vector of corresponding amplitudes.
For example, one might write
\code{sparse_pi_spectrum(list(pitch = c(60, 72, 79), amplitude = c(3, 2, 1)))}.
}
