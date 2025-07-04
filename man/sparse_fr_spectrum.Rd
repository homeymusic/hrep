% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sparse-fr-spectrum.R
\name{sparse_fr_spectrum}
\alias{sparse_fr_spectrum}
\alias{sparse_fr_spectrum.sparse_fr_spectrum}
\alias{sparse_fr_spectrum.sparse_pi_spectrum}
\alias{sparse_fr_spectrum.pi_chord}
\alias{sparse_fr_spectrum.default}
\alias{sparse_fr_spectrum.list}
\title{Sparse frequency spectrum}
\usage{
sparse_fr_spectrum(x, ...)

\method{sparse_fr_spectrum}{sparse_fr_spectrum}(x, ...)

\method{sparse_fr_spectrum}{sparse_pi_spectrum}(x, ...)

\method{sparse_fr_spectrum}{pi_chord}(x, ...)

\method{sparse_fr_spectrum}{default}(x, ...)

\method{sparse_fr_spectrum}{list}(x, ...)
}
\arguments{
\item{x}{Input sonority.
\itemize{
\item Numeric vectors will be treated as vectors of MIDI note numbers,
and expanded into their implied harmonics.
\item Two-element lists will be treated as finalised spectra.
The first element should be labelled "frequency",
and correspond to a numeric vector of frequencies;
the second element should be labelled "amplitude",
and correspond to a numeric vector of amplitudes.
}}

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
    \item{\code{coherent}}{Whether the amplitudes from different spectral components should be combined
assuming coherent summation, where the amplitudes simply add together
(default is \code{FALSE}).
Otherwise incoherent summation is used, where the amplitudes are squared, added, then
square rooted.}
  }}
}
\value{
An object of class \code{sparse_fr_spectrum}.
}
\description{
This function represents an input object as a
sparse frequency spectrum.
}
\details{
A sparse frequency spectrum comprises a finite set of spectral components,
each defined by a frequency (in Hz)
and an amplitude (expressed in arbitrary units, but with the
fundamental frequencies of chord pitches typically taking the value 1).
}
