// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// NOAUTOUPDATE

package ExplorerTest api;

fn Main() -> i32 {
  var x: auto = {.x = 10, .y = 1};
  var p: i32* = &x.x;
  *p = 0;

  return x.x;
}

// CHECK:STDOUT: result: 0
