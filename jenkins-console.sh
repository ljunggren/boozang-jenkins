# Output parameter for debug purposes
echo $bz-test-url

# Install dependencies
npm install

# Create report directory if non-existing
mkdir -p reports

# Run headless test and put report into results.html
./run-headless-chromium.js $bz_test_url | grep html > reports/results.html

# 0 means no error match, 1 means error match
grep -vq "The actual result does not match the expected result." reports/results.html || exit 1