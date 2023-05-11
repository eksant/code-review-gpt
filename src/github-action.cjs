require("./fetch-polyfill.cjs");
// @ts-ignore
const { run } = require("@probot/adapter-github-actions");
const { robot } = require("./bot");

run(robot);
