// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// NOAUTOUPDATE

package ExplorerTest api;

fn Main() -> i32 {
  // CHECK:STDERR: SYNTAX ERROR: fail_invalid_integer.carbon:[[@LINE+1]]: Invalid integer literal: 11111111111111111111111111
  return 11111111111111111111111111;
}
