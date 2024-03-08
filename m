Return-Path: <linux-omap+bounces-845-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 41036875E9A
	for <lists+linux-omap@lfdr.de>; Fri,  8 Mar 2024 08:35:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 732EE1C21054
	for <lists+linux-omap@lfdr.de>; Fri,  8 Mar 2024 07:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92914F1F6;
	Fri,  8 Mar 2024 07:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="twiXQSWe"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EA2E555
	for <linux-omap@vger.kernel.org>; Fri,  8 Mar 2024 07:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709883326; cv=none; b=l42K58EkUictEFc+MYcZorivAqPGGhYeHtx9xa0OJf0fA3qbVMZzhOhIGFiPhVCrJ1aZvDo8vw0GWOiNmpzrOUUXJfDft55vMe0Ihq6oIQku4oWBDtOi7ZoPUZEkbln7zTSygk/LNEopTHIdOSqO6wYa6cSa6eLwrC32t+TJRow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709883326; c=relaxed/simple;
	bh=gnPbyhN/avmBLR1//LMZdeqyYtsYkkl4WXb8r3MEd/M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PUkT8Kr5aQjEoAVrThAf98RdTC38i7chQoTLztECQNMsxypo5pzJ7eisE++tM7IaC/e/DeuzKUK6EFy8WiXdpC/lsUHsgW49q9yHvzgs4I450HbhmiaGqjzGRQGG2bdw1hhuRBotsDlE9kBEdPh3F/2McHNJhswA9vizXptQjLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=twiXQSWe; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 86CFF60540;
	Fri,  8 Mar 2024 07:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1709883317;
	bh=gnPbyhN/avmBLR1//LMZdeqyYtsYkkl4WXb8r3MEd/M=;
	h=From:To:Cc:Subject:Date:From;
	b=twiXQSWeNc9M2pG/a8Bo8tHZ8RXvWcsJPSO6my7Eg/75zpcsXEuy2hj2FR3wu+J+0
	 HJNqPEdF3DBrnb5xvGmzpbj1+guj4MlWAzldDNbhgcEbGaSMmqfY7JoV4tpnX+fgz7
	 cyycdkMoG8iXkTTAakRGnIE/LRamtHLVGPR0dXO+4p/F1sPYrNn5i0r376Z5+wwHCp
	 NbN8hLcF4FXDyd5qtV7PF8IEvMGIwmiZOiE28nyr8ef79AHanuQ2nV/XDnDdimdn98
	 Cd7nzHqmMTf/GUBQkiUvBuefFYrPJkcvasSNAm4Qe+bik4YqzBRZr2uAcu6EPW5rkQ
	 JSRz036+7O4dw==
From: Tony Lindgren <tony@atomide.com>
To: linux-omap@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Matthias Michel <matthias.michel@siemens.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] ARM: OMAP2+: prm33xx.c: Fix kerneldoc warnings
Date: Fri,  8 Mar 2024 09:35:00 +0200
Message-ID: <20240308073501.3699-1-tony@atomide.com>
X-Mailer: git-send-email 2.43.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 6521f6a195c7 ("ARM: AM33xx: PRM: Implement REBOOT_COLD")
added a new kerneldoc warning as the function name changed:

warning: expecting prototype for am33xx_prm_global_warm_sw_reset().
Prototype was for am33xx_prm_global_sw_reset() instead

Turns out prm33xx.c produces a few other kerneldoc warnings so let's
fix them all.

Fixes: 6521f6a195c7 ("ARM: AM33xx: PRM: Implement REBOOT_COLD")
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Cc: Matthias Michel <matthias.michel@siemens.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/prm33xx.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm/mach-omap2/prm33xx.c b/arch/arm/mach-omap2/prm33xx.c
--- a/arch/arm/mach-omap2/prm33xx.c
+++ b/arch/arm/mach-omap2/prm33xx.c
@@ -48,8 +48,7 @@ static u32 am33xx_prm_rmw_reg_bits(u32 mask, u32 bits, s16 inst, s16 idx)
  * @part: PRM partition, ignored for AM33xx
  * @inst: CM instance register offset (*_INST macro)
  * @rstctrl_offs: RM_RSTCTRL register address offset for this module
- *
- * Returns 1 if the (sub)module hardreset line is currently asserted,
+ * @return: 1 if the (sub)module hardreset line is currently asserted,
  * 0 if the (sub)module hardreset line is not currently asserted, or
  * -EINVAL upon parameter error.
  */
@@ -70,14 +69,14 @@ static int am33xx_prm_is_hardreset_asserted(u8 shift, u8 part, s16 inst,
  * @shift: register bit shift corresponding to the reset line to assert
  * @part: CM partition, ignored for AM33xx
  * @inst: CM instance register offset (*_INST macro)
- * @rstctrl_reg: RM_RSTCTRL register address for this module
+ * @rstctrl_offs: RM_RSTCTRL register address offset for this module
+ * @return: Returns 0 upon success or -EINVAL upon an argument error
  *
  * Some IPs like dsp, ipu or iva contain processors that require an HW
  * reset line to be asserted / deasserted in order to fully enable the
  * IP.  These modules may have multiple hard-reset lines that reset
  * different 'submodules' inside the IP block.  This function will
- * place the submodule into reset.  Returns 0 upon success or -EINVAL
- * upon an argument error.
+ * place the submodule into reset.
  */
 static int am33xx_prm_assert_hardreset(u8 shift, u8 part, s16 inst,
 				       u16 rstctrl_offs)
@@ -96,17 +95,18 @@ static int am33xx_prm_assert_hardreset(u8 shift, u8 part, s16 inst,
  * @st_shift: reset status register bit shift corresponding to the reset line
  * @part: PRM partition, not used for AM33xx
  * @inst: CM instance register offset (*_INST macro)
- * @rstctrl_reg: RM_RSTCTRL register address for this module
- * @rstst_reg: RM_RSTST register address for this module
+ * @rstctrl_offs: RM_RSTCTRL register address offset for this module
+ * @rstst_offs: RM_RSTST register address offset for this module
+ * @return: Returns 0 upon success or -EINVAL upon an argument error,
+ * -EEXIST if the submodule was already out of reset, or -EBUSY if the
+ * submodule did not exit reset promptly
  *
  * Some IPs like dsp, ipu or iva contain processors that require an HW
  * reset line to be asserted / deasserted in order to fully enable the
  * IP.  These modules may have multiple hard-reset lines that reset
  * different 'submodules' inside the IP block.  This function will
  * take the submodule out of reset and wait until the PRCM indicates
- * that the reset has completed before returning.  Returns 0 upon success or
- * -EINVAL upon an argument error, -EEXIST if the submodule was already out
- * of reset, or -EBUSY if the submodule did not exit reset promptly.
+ * that the reset has completed before returning.
  */
 static int am33xx_prm_deassert_hardreset(u8 shift, u8 st_shift, u8 part,
 					 s16 inst, u16 rstctrl_offs,
@@ -315,7 +315,7 @@ static int am33xx_check_vcvp(void)
 }
 
 /**
- * am33xx_prm_global_warm_sw_reset - reboot the device via warm reset
+ * am33xx_prm_global_sw_reset - reboot the device via warm reset
  *
  * Immediately reboots the device through warm reset.
  */
-- 
2.43.1

