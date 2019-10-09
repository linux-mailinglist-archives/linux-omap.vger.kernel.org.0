Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEE42D15CD
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2019 19:25:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732504AbfJIRYz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Oct 2019 13:24:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:49922 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732487AbfJIRYy (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 9 Oct 2019 13:24:54 -0400
Received: from sasha-vm.mshome.net (unknown [167.220.2.234])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 31ECB20B7C;
        Wed,  9 Oct 2019 17:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570641893;
        bh=Pzc40gy2TSMKNQNDKKZmqku+u+iXqpnNmsAgWEeokFs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AU+iuRwVItDMN7zX6hlkBV3NdQ+HaOfz5uwp5+WOT0xWqSdwAp1ZI4tEvgjjHA9B7
         W8XeYRequGyOfOdrJfQ14bS52SQNZK53xxq7Foei24QYzggeFmoIsyJzJN5bt84ivR
         0gdy3UDTweZSKIHycNP5GffmegpugSUVEuAq3BXM=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Tony Lindgren <tony@atomide.com>, Sasha Levin <sashal@kernel.org>,
        linux-omap@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 04/11] ARM: OMAP2+: Fix missing reset done flag for am3 and am43
Date:   Wed,  9 Oct 2019 13:06:38 -0400
Message-Id: <20191009170646.696-4-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191009170646.696-1-sashal@kernel.org>
References: <20191009170646.696-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Tony Lindgren <tony@atomide.com>

[ Upstream commit 8ad8041b98c665b6147e607b749586d6e20ba73a ]

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
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
index b31ad596be795..6b09debcf4840 100644
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
@@ -1020,7 +1020,8 @@ static struct omap_hwmod_class_sysconfig am33xx_timer_sysc = {
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
2.20.1

