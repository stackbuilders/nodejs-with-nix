# Node.js with Nix

[![built with nix](https://builtwithnix.org/badge.svg)](https://builtwithnix.org)

This project showcases how to develop Node.js applications with Nix.

## Requirements

Install [Nix](https://nixos.org/nix) package manager.

## Getting Started

Spawn a new shell with all project dependencies:

```sh
nix-shell
```

Install project dependencies:

```sh
npm install
```

Start the application:

```sh
node start # regular node process
# or
node run start:dev # for hot-reloading
```

## Tips & Tricks

Build the project:

```sh
nix-build
```

Update [node-packages.nix](node-packages.nix):

```sh
nix-shell
node2nix
```

## Deployment

Install [nixops](https://nixos.org/nixops/manual):

```
nix-env -i nixops
```

Create a deployment:

```
nixops create ./nodejs-with-nix.nix ./nodejs-with-nix-vbox.nix -d nodejs-with-nix
```

Start the deployment:

```
nixops deploy -d nodejs-with-nix
```
