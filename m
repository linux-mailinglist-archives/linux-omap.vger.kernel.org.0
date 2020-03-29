Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FFCC197049
	for <lists+linux-omap@lfdr.de>; Sun, 29 Mar 2020 22:33:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727903AbgC2UdS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 29 Mar 2020 16:33:18 -0400
Received: from mail.kmu-office.ch ([178.209.48.109]:37406 "EHLO
        mail.kmu-office.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727370AbgC2UdS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 29 Mar 2020 16:33:18 -0400
Received: from zyt.lan (unknown [IPv6:2a02:169:3df5::564])
        by mail.kmu-office.ch (Postfix) with ESMTPSA id 31BFD5C0208;
        Sun, 29 Mar 2020 22:33:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
        t=1585513997;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:
         content-transfer-encoding:content-transfer-encoding:in-reply-to:
         references; bh=WMqksSgxVOthWzaH63j2MuQI5jeE8U6IXhHfj4YbpXI=;
        b=yHWrWNpJUOPcgE+eGxUW0uIkdkKgg+ZAMnJpyS+wLPZ3FC6LWIVx+8d5ANApGyLOvsbMd/
        JrGNWDN2sbHPxUoxIhppR4cQ3MfIpdLT1lyeJEU25HGo+crkf35tMj5gHqIbSoFke3kPOP
        6rh5HcfsftSGTs4wV7BrK906IpepgB0=
From:   Stefan Agner <stefan@agner.ch>
To:     tony@atomide.com
Cc:     linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com, Stefan Agner <stefan@agner.ch>
Subject: [PATCH] ARM: OMAP2+: drop unnecessary adrl
Date:   Sun, 29 Mar 2020 22:33:14 +0200
Message-Id: <5a6807f19fd69f2de6622c794639cc5d70b9563a.1585513949.git.stefan@agner.ch>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The adrl instruction has been introduced with commit dd31394779aa ("ARM:
omap3: Thumb-2 compatibility for sleep34xx.S"), back when this assembly
file was considerably longer. Today adr seems to have enough reach, even
when inserting about 60 instructions between the use site and the label.
Replace adrl with conventional adr instruction.

This allows to build this file using Clang's integrated assembler (which
does not support the adrl pseudo instruction).

Link: https://github.com/ClangBuiltLinux/linux/issues/430
Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/mach-omap2/sleep34xx.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/sleep34xx.S b/arch/arm/mach-omap2/sleep34xx.S
index ac1324c6453b..c4e97d35c310 100644
--- a/arch/arm/mach-omap2/sleep34xx.S
+++ b/arch/arm/mach-omap2/sleep34xx.S
@@ -72,7 +72,7 @@ ENTRY(enable_omap3630_toggle_l2_on_restore)
 	stmfd	sp!, {lr}	@ save registers on stack
 	/* Setup so that we will disable and enable l2 */
 	mov	r1, #0x1
-	adrl	r3, l2dis_3630_offset	@ may be too distant for plain adr
+	adr	r3, l2dis_3630_offset
 	ldr	r2, [r3]		@ value for offset
 	str	r1, [r2, r3]		@ write to l2dis_3630
 	ldmfd	sp!, {pc}	@ restore regs and return
-- 
2.25.1

