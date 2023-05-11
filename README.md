# Code Review GPT

> A GitHub App built with [Probot](https://github.com/probot/probot) that A code review bot powered by ChatGPT.

## Setup

```sh
# Install dependencies
npm install

# Run the bot
npm start
```

## Docker

```sh
# 1. Build container
docker build -t code-review-gpt .

# 2. Start container
docker run -e APP_ID=<app-id> -e PRIVATE_KEY=<pem-value> code-review-gpt
```

## Contributing

If you have suggestions for how code-review-gpt could be improved, or want to report a bug, open an issue! We'd love all and any contributions.

For more, check out the [Contributing Guide](CONTRIBUTING.md).

## License

[ISC](LICENSE) © 2023 Seorang Eksa
