// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// NOAUTOUPDATE

package ExplorerTest api;

fn Main() -> i32 {
  // TODO: The error here should be that we aren't allowed to refer to 'a' yet.
  // CHECK:STDERR: COMPILATION ERROR: fail_use_in_init.carbon:[[@LINE+1]]: could not resolve 'a'
  var a: auto = a;
  return 0;
}
