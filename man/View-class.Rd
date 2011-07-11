\name{View-class}
\docType{class}

% Class:
\alias{class:View}
\alias{View-class}

\title{View objects}

\description{
  An abstraction of a widget that displays a \code{\linkS4class{Layer}}
  (and its children), possibly through a transformation. A separate
  \code{Layer} can provide an overlay that is constant across
  transformations. If a layer is too large to display in the viewport,
  the view should support scrolling. If the viewport is resizable, the
  view should offer some way to control its reaction to resizing.
}

\section{Interface}{
  The following active fields should be implemented by a \code{View}
  implementation. All are read/write unless noted.
  \describe{
    \item{}{\code{layer}: The \code{\linkS4class{Layer}} that
      is displayed.}
    \item{}{\code{overlay}: The \code{Layer} that is
      drawn untransformed within the viewport. Could be thought of a
      heads up display.}
    \item{}{\code{transform}: The \code{\linkS4class{Transform}} applied
      to the drawing of \code{layer}.}
    \item{}{\code{rescaleMode}: Determines how the View behaves when resized,
      One of 'geometry', 'transform' or 'none'.}
    \item{}{\code{viewportRect}: The rectangle (2x2 matrix) representing
      the geometry of the viewport in view coordinates. This provides
      the dimensions of the viewport, as well as its offset, which may
      not be zero if the view is larger than the viewport.}
  }
}


\section{Signals}{
  \describe{
    \item{\code{viewportRectChanged()}}{
      Emitted when the \code{viewportRect} field has changed, i.e., the
      viewport/view has changed size, or the view has been scrolled.
    }
  }
}

\author{Michael Lawrence}


