const { Headers, Request, Response } = require("node-fetch");
const fetch = require("node-fetch").default;

// @ts-ignore
if (!globalThis.fetch) {
  // @ts-ignore
  globalThis.fetch = fetch;
  // @ts-ignore
  globalThis.Headers = Headers;
  // @ts-ignore
  globalThis.Request = Request;
  // @ts-ignore
  globalThis.Response = Response;
}
