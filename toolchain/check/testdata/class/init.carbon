// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// AUTOUPDATE
// TIP: To test this file alone, run:
// TIP:   bazel test //toolchain/testing:file_test --test_arg=--file_tests=toolchain/check/testdata/class/init.carbon
// TIP: To dump output, run:
// TIP:   bazel run //toolchain/testing:file_test -- --dump_output --file_tests=toolchain/check/testdata/class/init.carbon

class Class {
  var n: i32;
  var next: Class*;
}

fn Make(n: i32, next: Class*) -> Class {
  return {.n = n, .next = next};
}

fn MakeReorder(n: i32, next: Class*) -> Class {
  return {.next = next, .n = n};
}

// CHECK:STDOUT: --- init.carbon
// CHECK:STDOUT:
// CHECK:STDOUT: constants {
// CHECK:STDOUT:   %Class: type = class_type @Class [template]
// CHECK:STDOUT:   %Int32.type: type = fn_type @Int32 [template]
// CHECK:STDOUT:   %.1: type = tuple_type () [template]
// CHECK:STDOUT:   %Int32: %Int32.type = struct_value () [template]
// CHECK:STDOUT:   %.2: type = unbound_element_type %Class, i32 [template]
// CHECK:STDOUT:   %.3: type = ptr_type %Class [template]
// CHECK:STDOUT:   %.4: type = unbound_element_type %Class, %.3 [template]
// CHECK:STDOUT:   %.5: type = struct_type {.n: i32, .next: %.3} [template]
// CHECK:STDOUT:   %.6: <witness> = complete_type_witness %.5 [template]
// CHECK:STDOUT:   %Make.type: type = fn_type @Make [template]
// CHECK:STDOUT:   %Make: %Make.type = struct_value () [template]
// CHECK:STDOUT:   %.7: type = ptr_type %.5 [template]
// CHECK:STDOUT:   %MakeReorder.type: type = fn_type @MakeReorder [template]
// CHECK:STDOUT:   %MakeReorder: %MakeReorder.type = struct_value () [template]
// CHECK:STDOUT:   %.8: type = struct_type {.next: %.3, .n: i32} [template]
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: imports {
// CHECK:STDOUT:   %Core: <namespace> = namespace file.%Core.import, [template] {
// CHECK:STDOUT:     .Int32 = %import_ref
// CHECK:STDOUT:     import Core//prelude
// CHECK:STDOUT:     import Core//prelude/operators
// CHECK:STDOUT:     import Core//prelude/types
// CHECK:STDOUT:     import Core//prelude/operators/arithmetic
// CHECK:STDOUT:     import Core//prelude/operators/as
// CHECK:STDOUT:     import Core//prelude/operators/bitwise
// CHECK:STDOUT:     import Core//prelude/operators/comparison
// CHECK:STDOUT:     import Core//prelude/types/bool
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %import_ref: %Int32.type = import_ref Core//prelude/types, inst+4, loaded [template = constants.%Int32]
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: file {
// CHECK:STDOUT:   package: <namespace> = namespace [template] {
// CHECK:STDOUT:     .Core = imports.%Core
// CHECK:STDOUT:     .Class = %Class.decl
// CHECK:STDOUT:     .Make = %Make.decl
// CHECK:STDOUT:     .MakeReorder = %MakeReorder.decl
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %Core.import = import Core
// CHECK:STDOUT:   %Class.decl: type = class_decl @Class [template = constants.%Class] {} {}
// CHECK:STDOUT:   %Make.decl: %Make.type = fn_decl @Make [template = constants.%Make] {
// CHECK:STDOUT:     %n.patt: i32 = binding_pattern n
// CHECK:STDOUT:     %next.patt: %.3 = binding_pattern next
// CHECK:STDOUT:   } {
// CHECK:STDOUT:     %int.make_type_32: init type = call constants.%Int32() [template = i32]
// CHECK:STDOUT:     %.loc16_12.1: type = value_of_initializer %int.make_type_32 [template = i32]
// CHECK:STDOUT:     %.loc16_12.2: type = converted %int.make_type_32, %.loc16_12.1 [template = i32]
// CHECK:STDOUT:     %n.param: i32 = param n, runtime_param0
// CHECK:STDOUT:     %n: i32 = bind_name n, %n.param
// CHECK:STDOUT:     %Class.ref.loc16_23: type = name_ref Class, file.%Class.decl [template = constants.%Class]
// CHECK:STDOUT:     %.loc16_28: type = ptr_type %Class [template = constants.%.3]
// CHECK:STDOUT:     %next.param: %.3 = param next, runtime_param1
// CHECK:STDOUT:     %next: %.3 = bind_name next, %next.param
// CHECK:STDOUT:     %Class.ref.loc16_34: type = name_ref Class, file.%Class.decl [template = constants.%Class]
// CHECK:STDOUT:     %return: ref %Class = var <return slot>
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %MakeReorder.decl: %MakeReorder.type = fn_decl @MakeReorder [template = constants.%MakeReorder] {
// CHECK:STDOUT:     %n.patt: i32 = binding_pattern n
// CHECK:STDOUT:     %next.patt: %.3 = binding_pattern next
// CHECK:STDOUT:   } {
// CHECK:STDOUT:     %int.make_type_32: init type = call constants.%Int32() [template = i32]
// CHECK:STDOUT:     %.loc20_19.1: type = value_of_initializer %int.make_type_32 [template = i32]
// CHECK:STDOUT:     %.loc20_19.2: type = converted %int.make_type_32, %.loc20_19.1 [template = i32]
// CHECK:STDOUT:     %n.param: i32 = param n, runtime_param0
// CHECK:STDOUT:     %n: i32 = bind_name n, %n.param
// CHECK:STDOUT:     %Class.ref.loc20_30: type = name_ref Class, file.%Class.decl [template = constants.%Class]
// CHECK:STDOUT:     %.loc20_35: type = ptr_type %Class [template = constants.%.3]
// CHECK:STDOUT:     %next.param: %.3 = param next, runtime_param1
// CHECK:STDOUT:     %next: %.3 = bind_name next, %next.param
// CHECK:STDOUT:     %Class.ref.loc20_41: type = name_ref Class, file.%Class.decl [template = constants.%Class]
// CHECK:STDOUT:     %return: ref %Class = var <return slot>
// CHECK:STDOUT:   }
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: class @Class {
// CHECK:STDOUT:   %int.make_type_32: init type = call constants.%Int32() [template = i32]
// CHECK:STDOUT:   %.loc12_10.1: type = value_of_initializer %int.make_type_32 [template = i32]
// CHECK:STDOUT:   %.loc12_10.2: type = converted %int.make_type_32, %.loc12_10.1 [template = i32]
// CHECK:STDOUT:   %.loc12_8: %.2 = field_decl n, element0 [template]
// CHECK:STDOUT:   %Class.ref: type = name_ref Class, file.%Class.decl [template = constants.%Class]
// CHECK:STDOUT:   %.loc13_18: type = ptr_type %Class [template = constants.%.3]
// CHECK:STDOUT:   %.loc13_11: %.4 = field_decl next, element1 [template]
// CHECK:STDOUT:   %.loc14: <witness> = complete_type_witness %.5 [template = constants.%.6]
// CHECK:STDOUT:
// CHECK:STDOUT: !members:
// CHECK:STDOUT:   .Self = constants.%Class
// CHECK:STDOUT:   .n = %.loc12_8
// CHECK:STDOUT:   .next = %.loc13_11
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: fn @Int32() -> type = "int.make_type_32";
// CHECK:STDOUT:
// CHECK:STDOUT: fn @Make(%n: i32, %next: %.3) -> %return: %Class {
// CHECK:STDOUT: !entry:
// CHECK:STDOUT:   %n.ref: i32 = name_ref n, %n
// CHECK:STDOUT:   %next.ref: %.3 = name_ref next, %next
// CHECK:STDOUT:   %.loc17_31.1: %.5 = struct_literal (%n.ref, %next.ref)
// CHECK:STDOUT:   %.loc17_31.2: ref i32 = class_element_access %return, element0
// CHECK:STDOUT:   %.loc17_31.3: init i32 = initialize_from %n.ref to %.loc17_31.2
// CHECK:STDOUT:   %.loc17_31.4: ref %.3 = class_element_access %return, element1
// CHECK:STDOUT:   %.loc17_31.5: init %.3 = initialize_from %next.ref to %.loc17_31.4
// CHECK:STDOUT:   %.loc17_31.6: init %Class = class_init (%.loc17_31.3, %.loc17_31.5), %return
// CHECK:STDOUT:   %.loc17_32: init %Class = converted %.loc17_31.1, %.loc17_31.6
// CHECK:STDOUT:   return %.loc17_32 to %return
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: fn @MakeReorder(%n: i32, %next: %.3) -> %return: %Class {
// CHECK:STDOUT: !entry:
// CHECK:STDOUT:   %next.ref: %.3 = name_ref next, %next
// CHECK:STDOUT:   %n.ref: i32 = name_ref n, %n
// CHECK:STDOUT:   %.loc21_31.1: %.8 = struct_literal (%next.ref, %n.ref)
// CHECK:STDOUT:   %.loc21_31.2: ref i32 = class_element_access %return, element1
// CHECK:STDOUT:   %.loc21_31.3: init i32 = initialize_from %n.ref to %.loc21_31.2
// CHECK:STDOUT:   %.loc21_31.4: ref %.3 = class_element_access %return, element0
// CHECK:STDOUT:   %.loc21_31.5: init %.3 = initialize_from %next.ref to %.loc21_31.4
// CHECK:STDOUT:   %.loc21_31.6: init %Class = class_init (%.loc21_31.3, %.loc21_31.5), %return
// CHECK:STDOUT:   %.loc21_32: init %Class = converted %.loc21_31.1, %.loc21_31.6
// CHECK:STDOUT:   return %.loc21_32 to %return
// CHECK:STDOUT: }
// CHECK:STDOUT:
