Return-Path: <linux-omap+bounces-5120-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D45CA31C6
	for <lists+linux-omap@lfdr.de>; Thu, 04 Dec 2025 10:57:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8426A303AEA0
	for <lists+linux-omap@lfdr.de>; Thu,  4 Dec 2025 09:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A0E52D3A6A;
	Thu,  4 Dec 2025 09:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uRw/dW+v"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D1D29E109;
	Thu,  4 Dec 2025 09:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764842040; cv=none; b=S1ujNaO1NKHcF1jco079xxLXbo0zlViMLfBFQv9CqrhEzEQ6/nuc+WLGPj5h5sx/uR4UqLOrmLeCpr8mqwJlLZu9vAwdO4EDkH3rkweDbHBJrzl2ziSe1xctywcuQAWUQloy6fC7nS2uCiZlDSC8Ap7Cq46IJVbJdLWX7gwBPeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764842040; c=relaxed/simple;
	bh=GS/k0U4iAQ8wizfHFCeeqa07LgcPPHjcnZCXp5vD9ko=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kchCQEQ7ADHYWRoDt2O3bnpYsJhZGLBniJIhHdhoe0/gjqQFxg+Iq6kV8OyPpk4otEC6LreoJCLxgRXc7JgCJNG8raki1Ju2EjWrqGrLTi6r0eFtCA9TNgRtBNypz2I5ca92mkRBnIk2zg8zPh6iJhy7E0mvKy/zbG9CpTZH040=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uRw/dW+v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6022C4CEFB;
	Thu,  4 Dec 2025 09:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764842039;
	bh=GS/k0U4iAQ8wizfHFCeeqa07LgcPPHjcnZCXp5vD9ko=;
	h=From:To:Cc:Subject:Date:From;
	b=uRw/dW+v1MhAkgEtfmyA8lY7GaZXdTi+hRyTFFKAyHVQCHeALTl/LVpFr8eBEsU+Q
	 3REnaJ3dmHeg32IU/l0tiaC9lF0oe34CndIVG1I2X3HUoRQ8IC8xf7O2qRH6/vPj6P
	 ZcvxjjaVeTlZH7Y2pQne8xEy2UlFNBgN458dpL+xMK9MxHceNnB9ZpimAuc2us2AMg
	 hiqdDB1gimpkgDF5UsjlsO2/U9g5CVHKdnKaoDcDUZVO9nfdUXg/vbuqWmmV/qX8Vl
	 d5w4yaYlza0BcOX0xGjpLWXKr/MXu7aTyPXLldca4ygmHf8oy0XXJnDFx+XsLvza9g
	 vxVLgYNiiA/KQ==
From: Arnd Bergmann <arnd@kernel.org>
To: soc@lists.linux.dev,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: omap1: avoid symbol clashes in fiq handler
Date: Thu,  4 Dec 2025 10:53:47 +0100
Message-Id: <20251204095355.1032786-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The ams-delta-fiq-handler.S file has a number of symbols with fairly
generic names, including one named 'exit' that causes a compiler warning
in some configuration options:

vmlinux.o: error: exit() function name creates ambiguity with -ffunction-sections

Change all these symbols to use a .L prefix to make them local to
the fiq handler.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/ams-delta-fiq-handler.S | 38 ++++++++++-----------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm/mach-omap1/ams-delta-fiq-handler.S b/arch/arm/mach-omap1/ams-delta-fiq-handler.S
index 35c2f9574dbd..5cf6fcca602c 100644
--- a/arch/arm/mach-omap1/ams-delta-fiq-handler.S
+++ b/arch/arm/mach-omap1/ams-delta-fiq-handler.S
@@ -97,7 +97,7 @@ ENTRY(qwerty_fiqin_start)
 
 	ldr r13, [r12, #IRQ_ITR_REG_OFFSET]	@ fetch interrupts status
 	bics r13, r13, r11			@ clear masked - any left?
-	beq exit				@ none - spurious FIQ? exit
+	beq .Lexit				@ none - spurious FIQ? exit
 
 	ldr r10, [r12, #IRQ_SIR_FIQ_REG_OFFSET]	@ get requested interrupt number
 
@@ -105,25 +105,25 @@ ENTRY(qwerty_fiqin_start)
 	str r8, [r12, #IRQ_CONTROL_REG_OFFSET]
 
 	cmp r10, #(INT_GPIO_BANK1 - NR_IRQS_LEGACY)	@ is it GPIO interrupt?
-	beq gpio				@ yes - process it
+	beq .Lgpio				@ yes - process it
 
 	mov r8, #1
 	orr r8, r11, r8, lsl r10		@ mask spurious interrupt
 	str r8, [r12, #IRQ_MIR_REG_OFFSET]
-exit:
+.Lexit:
 	subs	pc, lr, #4			@ return from FIQ
 	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
 
 
 	@@@@@@@@@@@@@@@@@@@@@@@@@@@
-gpio:	@ GPIO bank interrupt handler
+.Lgpio:	@ GPIO bank interrupt handler
 	ldr r12, omap1510_gpio_base		@ set base pointer to GPIO bank
 
 	ldr r11, [r12, #OMAP1510_GPIO_INT_MASK]	@ fetch GPIO interrupts mask
-restart:
+.Lrestart:
 	ldr r13, [r12, #OMAP1510_GPIO_INT_STATUS]	@ fetch status bits
 	bics r13, r13, r11			@ clear masked - any left?
-	beq exit				@ no - spurious interrupt? exit
+	beq .Lexit				@ no - spurious interrupt? exit
 
 	orr r11, r11, r13			@ mask all requested interrupts
 	str r11, [r12, #OMAP1510_GPIO_INT_MASK]
@@ -131,7 +131,7 @@ restart:
 	str r13, [r12, #OMAP1510_GPIO_INT_STATUS] @ ack all requested interrupts
 
 	ands r10, r13, #KEYBRD_CLK_MASK		@ extract keyboard status - set?
-	beq hksw				@ no - try next source
+	beq .Lhksw				@ no - try next source
 
 
 	@@@@@@@@@@@@@@@@@@@@@@
@@ -145,10 +145,10 @@ restart:
 
 	ldr r10, [r9, #BUF_STATE]		@ fetch kbd interface state
 	cmp r10, #0				@ are we expecting start bit?
-	bne data				@ no - go to data processing
+	bne .Ldata				@ no - go to data processing
 
 	ands r8, r8, #KEYBRD_DATA_MASK		@ check start bit - detected?
-	beq hksw				@ no - try next source
+	beq .Lhksw				@ no - try next source
 
 	@ r8 contains KEYBRD_DATA_MASK, use it
 	str r8, [r9, #BUF_STATE]		@ enter data processing state
@@ -162,9 +162,9 @@ restart:
 	mvn r11, #KEYBRD_CLK_MASK		@ prepare all except kbd mask
 	str r11, [r12, #OMAP1510_GPIO_INT_MASK]	@ store into the mask register
 
-	b restart				@ restart
+	b .Lrestart				@ restart
 
-data:	ldr r10, [r9, #BUF_MASK]		@ fetch current input bit mask
+.Ldata:	ldr r10, [r9, #BUF_MASK]		@ fetch current input bit mask
 
 	@ r8 still contains GPIO input bits
 	ands r8, r8, #KEYBRD_DATA_MASK		@ is keyboard data line low?
@@ -175,7 +175,7 @@ data:	ldr r10, [r9, #BUF_MASK]		@ fetch current input bit mask
 	mov r10, r10, lsl #1			@ shift mask left
 	bics r10, r10, #0x800			@ have we got all the bits?
 	strne r10, [r9, #BUF_MASK]		@ not yet - store the mask
-	bne restart				@ and restart
+	bne .Lrestart				@ and restart
 
 	@ r10 already contains 0, reuse it
 	str r10, [r9, #BUF_STATE]		@ reset state to start
@@ -189,7 +189,7 @@ data:	ldr r10, [r9, #BUF_MASK]		@ fetch current input bit mask
 	ldr r10, [r9, #BUF_KEYS_CNT]		@ get saved keystrokes count
 	ldr r8, [r9, #BUF_BUF_LEN]		@ get buffer size
 	cmp r10, r8				@ is buffer full?
-	beq hksw				@ yes - key lost, next source
+	beq .Lhksw				@ yes - key lost, next source
 
 	add r10, r10, #1			@ incremet keystrokes counter
 	str r10, [r9, #BUF_KEYS_CNT]
@@ -213,9 +213,9 @@ data:	ldr r10, [r9, #BUF_MASK]		@ fetch current input bit mask
 	@@@@@@@@@@@@@@@@@@@@@@@@
 
 
-hksw:	@Is hook switch interrupt requested?
+.Lhksw:	@Is hook switch interrupt requested?
 	tst r13, #HOOK_SWITCH_MASK 		@ is hook switch status bit set?
-	beq mdm					@ no - try next source
+	beq .Lmdm				@ no - try next source
 
 
 	@@@@@@@@@@@@@@@@@@@@@@@@
@@ -230,9 +230,9 @@ hksw:	@Is hook switch interrupt requested?
 	@@@@@@@@@@@@@@@@@@@@@@@@
 
 
-mdm:	@Is it a modem interrupt?
+.Lmdm:	@Is it a modem interrupt?
 	tst r13, #MODEM_IRQ_MASK 		@ is modem status bit set?
-	beq irq					@ no - check for next interrupt
+	beq .Lirq				@ no - check for next interrupt
 
 
 	@@@@@@@@@@@@@@@@@@@@@@@@
@@ -245,13 +245,13 @@ mdm:	@Is it a modem interrupt?
 	@@@@@@@@@@@@@@@@@@@@@@@@
 
 
-irq:	@ Place deferred_fiq interrupt request
+.Lirq:	@ Place deferred_fiq interrupt request
 	ldr r12, deferred_fiq_ih_base		@ set pointer to IRQ handler
 	mov r10, #DEFERRED_FIQ_MASK		@ set deferred_fiq bit
 	str r10, [r12, #IRQ_ISR_REG_OFFSET] 	@ place it in the ISR register
 
 	ldr r12, omap1510_gpio_base		@ set pointer back to GPIO bank
-	b restart				@ check for next GPIO interrupt
+	b .Lrestart				@ check for next GPIO interrupt
 	@@@@@@@@@@@@@@@@@@@@@@@@@@@
 
 
-- 
2.39.5


