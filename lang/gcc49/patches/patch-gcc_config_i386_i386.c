$NetBSD: patch-gcc_config_i386_i386.c,v 1.1 2017/07/28 23:41:51 maya Exp $

Incorrect codegen from rdseed intrinsic use (CVE-2017-11671)

We should not expand call arguments in between flags reg setting and
flags reg using instructions, as it may expand with flags reg
clobbering insn (ADD in this case).

Attached patch moves expansion out of the link. Also, change
zero-extension to non-flags reg clobbering sequence in case we perform
zero-extension with and.

2017-03-25  Uros Bizjak

Disable -fomit-frame-pointer.
Add support for -fstrict-calling-conventions.

--- gcc/config/i386/i386.c.orig	2016-08-01 16:03:41.000000000 +0000
+++ gcc/config/i386/i386.c
@@ -3857,7 +3857,7 @@ ix86_option_override_internal (bool main
     }
 
   /* Keep nonleaf frame pointers.  */
-  if (opts->x_flag_omit_frame_pointer)
+  if (0)
     opts->x_target_flags &= ~MASK_OMIT_LEAF_FRAME_POINTER;
   else if (TARGET_OMIT_LEAF_FRAME_POINTER_P (opts->x_target_flags))
     opts->x_flag_omit_frame_pointer = 1;
@@ -5636,6 +5636,7 @@ ix86_function_regparm (const_tree type,
 	 and callee not, or vice versa.  Instead look at whether the callee
 	 is optimized or not.  */
       && opt_for_fn (decl, optimize)
+      && (TARGET_64BIT || !flag_strict_calling_conventions)
       && !(profile_flag && !flag_fentry))
     {
       /* FIXME: remove this CONST_CAST when cgraph.[ch] is constified.  */
@@ -5713,6 +5714,7 @@ ix86_function_sseregparm (const_tree typ
   /* For local functions, pass up to SSE_REGPARM_MAX SFmode
      (and DFmode for SSE2) arguments in SSE registers.  */
   if (decl && TARGET_SSE_MATH && optimize
+      && (TARGET_64BIT || !flag_strict_calling_conventions)
       && !(profile_flag && !flag_fentry))
     {
       /* FIXME: remove this CONST_CAST when cgraph.[ch] is constified.  */
@@ -10650,7 +10652,7 @@ ix86_finalize_stack_realign_flags (void)
   if (stack_realign
       && frame_pointer_needed
       && crtl->is_leaf
-      && flag_omit_frame_pointer
+      && 0
       && crtl->sp_is_unchanging
       && !ix86_current_function_calls_tls_descriptor
       && !crtl->accesses_prior_frames
@@ -35540,9 +35540,6 @@ ix86_expand_builtin (tree exp, rtx targe
       mode0 = DImode;
 
 rdrand_step:
-      op0 = gen_reg_rtx (mode0);
-      emit_insn (GEN_FCN (icode) (op0));
-
       arg0 = CALL_EXPR_ARG (exp, 0);
       op1 = expand_normal (arg0);
       if (!address_operand (op1, VOIDmode))
@@ -35550,6 +35547,10 @@ rdrand_step:
 	  op1 = convert_memory_address (Pmode, op1);
 	  op1 = copy_addr_to_reg (op1);
 	}
+
+      op0 = gen_reg_rtx (mode0);
+      emit_insn (GEN_FCN (icode) (op0));
+
       emit_move_insn (gen_rtx_MEM (mode0, op1), op0);
 
       op1 = gen_reg_rtx (SImode);
@@ -35558,8 +35559,20 @@ rdrand_step:
       /* Emit SImode conditional move.  */
       if (mode0 == HImode)
 	{
-	  op2 = gen_reg_rtx (SImode);
-	  emit_insn (gen_zero_extendhisi2 (op2, op0));
+	  if (TARGET_ZERO_EXTEND_WITH_AND
+	      && optimize_function_for_speed_p (cfun))
+	    {
+	      op2 = force_reg (SImode, const0_rtx);
+
+	      emit_insn (gen_movstricthi
+			 (gen_lowpart (HImode, op2), op0));
+	    }
+	  else
+	    {
+	      op2 = gen_reg_rtx (SImode);
+
+	      emit_insn (gen_zero_extendhisi2 (op2, op0));
+	    }
 	}
       else if (mode0 == SImode)
 	op2 = op0;
@@ -35591,9 +35604,6 @@ rdrand_step:
       mode0 = DImode;
 
 rdseed_step:
-      op0 = gen_reg_rtx (mode0);
-      emit_insn (GEN_FCN (icode) (op0));
-
       arg0 = CALL_EXPR_ARG (exp, 0);
       op1 = expand_normal (arg0);
       if (!address_operand (op1, VOIDmode))
@@ -35601,6 +35611,10 @@ rdseed_step:
 	  op1 = convert_memory_address (Pmode, op1);
 	  op1 = copy_addr_to_reg (op1);
 	}
+
+      op0 = gen_reg_rtx (mode0);
+      emit_insn (GEN_FCN (icode) (op0));
+
       emit_move_insn (gen_rtx_MEM (mode0, op1), op0);
 
       op2 = gen_reg_rtx (QImode);
