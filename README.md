[![Version](https://img.shields.io/npm/v/@dperuo/npm-carbon.svg?style=for-the-badge)](https://www.npmjs.com/package/@dperuo/npm-carbon)
[![Documentation](https://img.shields.io/badge/documentation-yes-brightgreen.svg?style=for-the-badge)](https://github.com/dperuo/npm-carbon/blob/master/README.md)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://github.com/dperuo/npm-carbon/blob/master/LICENSE)


# Welcome to @dperuo/npm-carbon 👋

_Forked from [goodeggs/npm-copy](https://github.com/goodeggs/npm-copy)._

Use `@dperuo/npm-carbon` to make a "carbon copy" of any npm package and all its published versions.


## Install
No installation needed. Use `@dperuo/npm-carbon` directly from npm using the `npx` command.

```sh
npx @dperuo/npm-carbon <OPTIONS>
```


## Usage

:dart: **NOTE: You can mix-and-match command options as needed.**


### Authenticate Using Auth Tokens

```sh
npx @dperuo/npm-carbon \
  --from ${FROM_URL} \
  --from-token ${FROM_TOKEN} \
  --to ${TO_URL} \
  --to-token ${TO_TOKEN} \
  packageA [packageB...]
```

### Authenticate Using Username, Password, and Email

```sh
npx @dperuo/npm-carbon \
  --from ${FROM_URL} \
  --from-username ${FROM_USERNAME} \
  --from-password ${FROM_PASSWORD} \
  --from-email ${FROM_EMAIL} \
  --to ${TO_URL} \
  --to-username ${TO_USERNAME} \
  --to-password ${TO_PASSWORD} \
  --to-email ${TO_EMAIL} \
  packageA [packageB...]
```

### Modify Package Prefix
Modify the package prefix using the `--from-prefix` and `--to-prefix` flags.

```sh
npx @dperuo/npm-carbon \
  --from-prefix ${FROM_PREFIX} \
  --to-prefix ${TO_PREFIX} \
  packageA [packageB...]
```

:warning: **WARNING: List packages without their prefix when using the prefix flags. Example: `@foo/packageA` becomes just `packageA`.**


## Author
👤 **Derek Peruo <derek@derekperuo.net>**

* Website: http://a6t.co
* Github: [@dperuo](https://github.com/dperuo)
* LinkedIn: [@derekperuo](https://linkedin.com/in/derekperuo)
* Twitter: [@derekperuo](https://twitter.com/derekperuo)


## 🤝 Contributing
Contributions, issues and feature requests are welcome! Feel free to check [issues page](https://github.com/dperuo/npm-carbon/issues).

### Working With the @dperuo/npm-carbon Repo

#### Install
Clone this repo to your local machine and install dependencies.

```sh
git clone https://github.com/dperuo/npm-carbon.git
cd npm-carbon/
npm install
```

#### Usage
Use the `start` command to compile [Coffeescript](https://coffeescript.org/) and watch for changes.

```sh
npm start
```

Run the local JavaScript file directly to check your changes.

```sh
./bin/npm-carbon.js <OPTIONS>
```

#### Run Tests
Run the full test suite using the `test` command.

```sh
npm run test
```

### Submit Your Pull Request
Always submit your Pull Request against `master`.


## Show your support
Give a ⭐️ if this project helped you!


## 📝 License
Copyright © 2020 [Derek Peruo](https://github.com/dperuo).

This project is [MIT](https://github.com/dperuo/npm-carbon/blob/master/LICENSE) licensed.

***
_This README was generated with ❤️ by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)_
