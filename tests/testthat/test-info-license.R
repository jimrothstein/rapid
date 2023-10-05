test_that("license() errors informatively for bad name", {
  expect_snapshot(
    license(name = mean),
    error = TRUE
  )
  expect_snapshot(
    license(name = c("A", "B")),
    error = TRUE
  )
})

test_that("license() errors informatively for bad url", {
  expect_snapshot(
    license(name = "A", url = mean),
    error = TRUE
  )
  expect_snapshot(
    license(name = "A", url = c("A", "B")),
    error = TRUE
  )
})
test_that("license() errors informatively for bad identifier", {
  expect_snapshot(
    license(name = "A", identifier = mean),
    error = TRUE
  )
  expect_snapshot(
    license(name = "A", identifier = c("A", "B")),
    error = TRUE
  )
})

test_that("license() errors when both url and identifier are supplied", {
  expect_snapshot(
    license(name = "A", identifier = "A", url = "https://example.com"),
    error = TRUE
  )
})

test_that("license() fails when name is missing", {
  expect_snapshot(
    license(identifier = "A"),
    error = TRUE
  )
  expect_snapshot(
    license(url = "https://example.com"),
    error = TRUE
  )
})

test_that("license() doesn't match identifier by position", {
  expect_snapshot(
    license(name = "A", "https://example.com"),
    error = TRUE
  )
})

test_that("license() returns a license when everything is ok", {
  expect_snapshot({
    test_result <- license(
      name = "A",
      url = "https://example.com"
    )
    test_result
  })
  expect_s3_class(
    test_result,
    class = c("rapid::license", "S7_object"),
    exact = TRUE
  )
  expect_identical(
    S7::prop_names(test_result),
    c("name", "identifier", "url")
  )

  expect_snapshot({
    test_result <- license(
      name = "A",
      identifier = "technically these have a fancy required format"
    )
    test_result
  })
  expect_s3_class(
    test_result,
    class = c("rapid::license", "S7_object"),
    exact = TRUE
  )
  expect_identical(
    S7::prop_names(test_result),
    c("name", "identifier", "url")
  )
})

test_that("length() of a license reports the overall length", {
  expect_equal(length(license()), 0)
  expect_equal(length(license(name = "A")), 1)
})

test_that("as_license() errors informatively for unnamed input", {
  expect_snapshot(
    as_license(letters),
    error = TRUE
  )
})

test_that("as_license() errors informatively for bad classes", {
  expect_snapshot(
    as_license(1:2),
    error = TRUE
  )
  expect_snapshot(
    as_license(mean),
    error = TRUE
  )
  expect_snapshot(
    as_license(TRUE),
    error = TRUE
  )
})

test_that("as_license() returns expected objects", {
  expect_identical(
    as_license(c(
      name = "Apache 2.0",
      identifier = "Apache-2.0"
    )),
    license(
      name = "Apache 2.0",
      identifier = "Apache-2.0"
    )
  )
  expect_warning(
    as_license(c(
      name = "Apache 2.0",
      identifier = "Apache-2.0",
      x = "https://jonthegeek.com"
    )),
    class = "rapid_warning_extra_names"
  )
  expect_identical(
    suppressWarnings(
      as_license(c(
        name = "Apache 2.0",
        identifier = "Apache-2.0",
        x = "https://jonthegeek.com"
      ))
    ),
    license(
      name = "Apache 2.0",
      identifier = "Apache-2.0"
    )
  )

  expect_identical(
    as_license(list()),
    license()
  )
})

test_that("as_license() works for licenses", {
  expect_identical(
    as_license(license()),
    license()
  )
})