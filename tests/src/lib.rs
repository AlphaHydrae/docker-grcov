pub mod hello {
    /// Salutes.
    ///
    /// # Examples
    ///
    /// ```rust
    /// use grcov_test::hello::salute;
    /// assert_eq!(salute("World"), "Hello, World!");
    /// ```
    pub fn salute(name: &str) -> String {
        format!("Hello, {}!", name)
    }
}

#[cfg(test)]
mod tests {
    use super::hello::salute;

    #[test]
    fn fibonacci() {
        assert_eq!(salute("World"), "Hello, World!");
        assert_eq!(salute("Alice"), "Hello, Alice!");
        assert_eq!(salute("Bob"), "Hello, Bob!");
    }
}
