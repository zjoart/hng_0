(# hng_0 — Cat Fact API (HNG13 Stage 0))

This is a minimal Dart Frog API that returns a cat fact and basic user metadata for the HNG13 Stage 0 task.

This project uses an [`AppConfig`](models/config.dart) to manage Confiuration settings

## Quick overview

- Endpoint: `GET /me`
- Response: JSON with fields `status`, `user`, `timestamp`, and `fact` on success; `status` and `message` on error.
- External API used: `https://catfact.ninja/fact` 

Example successful response:

```json
{
	"status": "success",
	"user": {
		"email": "youremailinconfig@gmail.com",
		"name": "Your Name",
		"stack": "Dart/Dart Frog"
	},
	"timestamp": "2025-10-20T12:34:56.789Z",
	"fact": "Cats sleep 70% of their lives."
}
```

Example error response (when the cat fact service fails):

```json
{
	"status": "error",
	"message": "An error occurred fetching cat fact"
}
```

## Prerequisites

- Dart SDK 3.x (the project `pubspec.yaml` requires `>=3.0.0 <4.0.0`)

Check your Dart version:

```bash
dart --version
```

## Install dependencies

From the project root run:

```bash
dart pub get
```

Dependencies of interest (from `pubspec.yaml`):

- `dart_frog: ^1.1.0` — the web framework used to build route handlers
- `http: ^1.5.0` — used in `repo/fact.dart` to fetch the cat fact

Dev dependencies:

- `dart_frog_lint`, `dart_frog_cli`, `test`

## Run locally

Start the Dart Frog development server:

```bash
dart run dart_frog dev
```

By default the server binds to `http://localhost:8080`.

Call the endpoint with curl or your browser:

```bash
curl http://localhost:8080/me
```

If you need to change port:

```bash
PORT=3000 dart run dart_frog dev
```

## Make / local builds

Builds and release tasks can also be run locally via Make targets. For a list of available Make commands run:

```sh
make help
```

## Troubleshooting

- If you see an SDK version mismatch, install a Dart 3.x SDK or switch SDK versions (e.g., with asdf).
- If the external catfact service is slow or down, `repo/fact.dart` times out after 5 seconds and returns an error message.
- If you get CORS issues in a browser, note `routes/me.dart` sets `Access-Control-Allow-Origin: *` in responses.

