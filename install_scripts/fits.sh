#!/usr/bin/env bash

# FITS
SHARED_DIR=$1

if [ -f "$SHARED_DIR/install_scripts/config" ]; then
	# shellcheck source=/dev/null
	. "$SHARED_DIR/install_scripts/config"
fi

if [ ! -d "fits-$FITS_VERSION" ]; then
	DOWNLOAD_URL="http://projects.iq.harvard.edu/files/fits/files/fits-${FITS_VERSION}.zip"
	# shellcheck source=/dev/null disable=SC2164
	cd "$DOWNLOAD_DIR"
	if [ ! -f "fits.zip" ]; then
		# shellcheck source=/dev/null disable=SC2164
		curl "$DOWNLOAD_URL" -o fits.zip
	fi
	unzip fits.zip
	# shellcheck disable=SC2086
	chmod a+x fits-$FITS_VERSION/*.sh
	# shellcheck source=/dev/null disable=SC2164
	FITS_PATH="${DOWNLOAD_DIR}/fits-${FITS_VERSION}"
	# shellcheck source=/dev/null disable=SC2164
	cd "$HOME"
	echo "PATH=\${PATH}:$FITS_PATH" >>.bashrc
fi
