##' Download Phenocam data
##'
##' @param URL  web address where data is located
##' @export
download_phenocam <- function(URL) {
  ## check that we've been passed a URL
  if (length(URL) == 1 & is.character(URL) & substr(URL,1,4)=="http") {

    ## read data
    # dat <- read.csv(URL,skip = 22)
    res <- httr::GET(URL, httr::config(ssl_verifypeer = FALSE, ssl_verifyhost = FALSE))
    content_text <- httr::content(res, as = "text", encoding = "UTF-8")
    dat <- read.csv(text = content_text, skip = 22)

    ## convert date
    dat$date <- as.Date(as.character(dat$date))

    return(dat)
  } else {
    print(paste("download.phenocam: Input URL not provided correctly",URL))
  }
}
