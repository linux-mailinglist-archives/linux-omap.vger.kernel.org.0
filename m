Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0859FBCC8A
	for <lists+linux-omap@lfdr.de>; Tue, 24 Sep 2019 18:36:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390219AbfIXQgV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Sep 2019 12:36:21 -0400
Received: from muru.com ([72.249.23.125]:34424 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389444AbfIXQgU (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 24 Sep 2019 12:36:20 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 2350280E2;
        Tue, 24 Sep 2019 16:36:53 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: OMAP2+: Fix missing reset done flag for am3 and am43
Date:   Tue, 24 Sep 2019 09:36:18 -0700
Message-Id: <20190924163618.25534-1-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

For ti,sysc-omap4 compatible devices with no sysstatus register, we do have
reset done status available in the SOFTRESET bit that clears when the reset
is done. This is documented for example in am437x TRM for DMTIMER_TIOCP_CFG
register. The am335x TRM just says that SOFTRESET bit value 1 means reset is
ongoing, but it behaves the same way clearing after reset is done.

With the ti-sysc driver handling this automatically based on no sysstatus
register defined, we see warnings if SYSC_HAS_RESET_STATUS is missing in the
legacy platform data:

ti-sysc 48042000.target-module: sysc_flags 00000222 != 00000022
ti-sysc 48044000.target-module: sysc_flags 00000222 != 00000022
ti-sysc 48046000.target-module: sysc_flags 00000222 != 00000022
...

Let's fix these warnings by adding SYSC_HAS_RESET_STATUS. Let's also
remove the useless parentheses while at it.

If it turns out we do have ti,sysc-omap4 compatible devices without a
working SOFTRESET bit we can set up additional quirk handling for it.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
@@ -811,7 +811,8 @@ static struct omap_hwmod_class_sysconfig am33xx_timer_sysc = {
 	.rev_offs	= 0x0000,
 	.sysc_offs	= 0x0010,
 	.syss_offs	= 0x0014,
-	.sysc_flags	= (SYSC_HAS_SIDLEMODE | SYSC_HAS_SOFTRESET),
+	.sysc_flags	= SYSC_HAS_SIDLEMODE | SYSC_HAS_SOFTRESET |
+			  SYSC_HAS_RESET_STATUS,
 	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
 			  SIDLE_SMART_WKUP),
 	.sysc_fields	= &omap_hwmod_sysc_type2,
-- 
2.23.0
