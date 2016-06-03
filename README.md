# base64sha256
Returns a base64-encoded representation of raw SHA-256 sum of the given file.

Created for the sole purpose of being able to insert this calculated value into a Hashicorp Atlas Artifact to trigger deployment of updated lambda function.

See https://github.com/hashicorp/terraform/issues/6513 for details.
