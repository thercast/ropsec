% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sign-commits.R
\name{sign_commits_with_key}
\alias{sign_commits_with_key}
\title{GPG sign all git commits}
\usage{
sign_commits_with_key(name, email, key = NULL, global = TRUE)
}
\arguments{
\item{name}{A character string containing your name. If not provided,
\code{sign_commits_with_key()} will look first in your local then in your global
git configuration.}

\item{email}{A character string containing your email address. If not
provided, \code{sign_commits_with_key()} will look first in your local then in
your global git configuration.}

\item{key}{A character string containing the ID of a pre-existing key to use.
If \code{NULL} and key cannot be found based on name and email unambiguously, a
new key will be created.}

\item{global}{boolean, set commit signing in global or local (repository) git
config.}
}
\value{
A character string containing the ID of the key that was provided or
generated.
}
\description{
Configure git to sign all commits using GPG. If no existing key is provided
or found, \code{sign_commits_with_key()} will create a new key and use it for
signing. This function is suitable only for interactive use, before changing
the user's git config it will always ask for confirmation.
}
\details{
In case of already existing key(s) for convenience an appropriate key will be
identified based on the provided name and/or email, or git config. This is
especially handy if you have multiple email addresses used with git and thus
would like to set-up commit signing on a per-repository basis. In this case
supply the email and set the global param to \code{FALSE}. If you accidentally set
that all commits should be signed you can revert this by deleting the
\code{commit.gpgsign} and \code{user.signingkey} git options.
}
\examples{
\dontrun{
# generate key and use newly generated key
newkey <- sign_commits_with_key("John Doe", "johndoe@example.com")

# use existing key by explicitly providing it
sign_commits_with_key(key = "test_key")

# use existing key based on email match
sign_commits_with_key(email = "johndoe@example.com")

# set key to sign commits only in current repository
sign_commits_with_key(key = "test_key", global = FALSE)
}
}
