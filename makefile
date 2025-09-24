include .env
PRODUCT_NAME := PhosphorBinary
VERSION := 1.0.0
CHECKSUM := $(swift package compute-checksum release/PhosphorBinary-${VERSION}.xcframework.zip)
IF := ./Scripts/Build.swift 
OF := ./Scripts/Build

quick_start:
	make generate
	make archive
	make xc
	make codesign
	make zip
	make update-package

archive:
	xcodebuild archive \
	ASSETCATALOG_COMPILER_GENERATE_ASSET_SYMBOLS=NO \
	SKIP_INSTALL=NO \
	BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
	-project PhosphorBinary.xcodeproj \
	-scheme PhosphorBinary_tvOS \
	-destination "generic/platform=tvOS" \
	-archivePath "archives/PhosphorBinary-tvOS"

	xcodebuild archive \
	ASSETCATALOG_COMPILER_GENERATE_ASSET_SYMBOLS=NO \
	SKIP_INSTALL=NO \
	BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
	-project PhosphorBinary.xcodeproj \
	-scheme PhosphorBinary_tvOS \
	-destination "generic/platform=tvOS Simulator" \
	-archivePath "archives/PhosphorBinary-tvOS_Simulator"
	
	xcodebuild archive \
	ASSETCATALOG_COMPILER_GENERATE_ASSET_SYMBOLS=NO \
	SKIP_INSTALL=NO \
	BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
	-project PhosphorBinary.xcodeproj \
	-scheme PhosphorBinary_iOS \
	-destination "generic/platform=iOS Simulator" \
	-archivePath "archives/PhosphorBinary-iOS_Simulator"

	xcodebuild archive \
	ASSETCATALOG_COMPILER_GENERATE_ASSET_SYMBOLS=NO \
	SKIP_INSTALL=NO \
	BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
	-project PhosphorBinary.xcodeproj \
	-scheme PhosphorBinary_iOS \
	-destination "generic/platform=iOS" \
	-archivePath "archives/PhosphorBinary-iOS"

	xcodebuild archive \
	ASSETCATALOG_COMPILER_GENERATE_ASSET_SYMBOLS=NO \
	SKIP_INSTALL=NO \
	BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
	-project PhosphorBinary.xcodeproj \
	-scheme PhosphorBinary_macOS \
	-destination "generic/platform=macOS" \
	-archivePath "archives/PhosphorBinary-macOS"

xc:
	xcodebuild -create-xcframework \
	-archive archives/PhosphorBinary-iOS.xcarchive -framework PhosphorBinary.framework \
	-archive archives/PhosphorBinary-iOS_Simulator.xcarchive -framework PhosphorBinary.framework \
	-archive archives/PhosphorBinary-macOS.xcarchive -framework PhosphorBinary.framework \
	-archive archives/PhosphorBinary-tvOS.xcarchive -framework PhosphorBinary.framework \
	-archive archives/PhosphorBinary-tvOS_Simulator.xcarchive -framework PhosphorBinary.framework \
	-output xcframeworks/PhosphorBinary-${VERSION}.xcframework

generate:
	make update-assets
	mint bootstrap
	mint run xcodegen xcodegen generate

open:
	make generate
	open ./${PRODUCT_NAME}.xcodeproj

update-assets:
	git submodule update --remote --init --recursive --force
	xcrun --sdk macosx swiftc -parse-as-library ${IF} -o ${OF}
	${OF}

codesign:
	codesign --timestamp -v --sign "$(APPLE_CERT_NAME)" xcframeworks/PhosphorBinary-${VERSION}.xcframework

zip:
	cd xcframeworks && zip -r PhosphorBinary-${VERSION}.xcframework.zip PhosphorBinary-${VERSION}.xcframework/

update-package:
	export CHECKSUM=`swift package compute-checksum release/PhosphorBinary-${VERSION}.xcframework.zip` && export VER=${VERSION} && envsubst < ./Package.template > ./Package.swift

