docs:
	@sourcedocs generate --min-acl private -r --spm-module Dvandva

swiftlint:
	@swiftlint --autocorrect

run:
	@mint run swift-bundler run

run-linux:
	@swift run

clean:
	@swift package clean
