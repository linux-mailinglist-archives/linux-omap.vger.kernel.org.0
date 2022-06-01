Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4876D53A85C
	for <lists+linux-omap@lfdr.de>; Wed,  1 Jun 2022 16:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354260AbiFAOIF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 1 Jun 2022 10:08:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343551AbiFAOEv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 1 Jun 2022 10:04:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9F9A8BD31;
        Wed,  1 Jun 2022 06:58:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 245AE6163F;
        Wed,  1 Jun 2022 13:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D9D1C3411D;
        Wed,  1 Jun 2022 13:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654091896;
        bh=0vLOqckxqz6FAn6Yj85sK+G/Bi0voXu2VUuWxkW7Bm4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lC5d4Lh9qtas4S0iu2YYA5sI9fdneDx7k0C+QV3B9QIe2/U86ZiQ7fHQvUEJHI1uL
         5fGWANpql/s2rp0Xop2MwpkSiVtjawGjzUUwWw+AVW8HRl0iCptoPeK3s7Ho2SPHid
         Q5530QcycOUr25rFpUxqBCHS57u/QL3daH+nSlPceIDxAYysYRfpuzmDnxkJM8P3h/
         +jIDrOMXYu1YY7foRJFkkq5rZ3XCzP12QsZpBSqFEDqcq7Yhk0bn4GRKKOCqNsYkCn
         We6PWbXEil0Fgl2NIxWzUR8MQzyRz69GksaX2jfBZziEVyI42WRguz2y103i4NGHl9
         nduPgBtM1P6JA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Arnd Bergmann <arnd@arndb.de>, Sasha Levin <sashal@kernel.org>,
        paul@pwsan.com, aaro.koskinen@iki.fi, linux@armlinux.org.uk,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 10/26] ARM: OMAP1: clock: Fix UART rate reporting algorithm
Date:   Wed,  1 Jun 2022 09:57:43 -0400
Message-Id: <20220601135759.2004435-10-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220601135759.2004435-1-sashal@kernel.org>
References: <20220601135759.2004435-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Janusz Krzysztofik <jmkrzyszt@gmail.com>

[ Upstream commit 338d5d476cde853dfd97378d20496baabc2ce3c0 ]

Since its introduction to the mainline kernel, omap1_uart_recalc() helper
makes incorrect use of clk->enable_bit as a ready to use bitmap mask while
it only provides the bit number.  Fix it.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Acked-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/mach-omap1/clock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap1/clock.c b/arch/arm/mach-omap1/clock.c
index bd5be82101f3..d89bda12bf3c 100644
--- a/arch/arm/mach-omap1/clock.c
+++ b/arch/arm/mach-omap1/clock.c
@@ -41,7 +41,7 @@ static DEFINE_SPINLOCK(clockfw_lock);
 unsigned long omap1_uart_recalc(struct clk *clk)
 {
 	unsigned int val = __raw_readl(clk->enable_reg);
-	return val & clk->enable_bit ? 48000000 : 12000000;
+	return val & 1 << clk->enable_bit ? 48000000 : 12000000;
 }
 
 unsigned long omap1_sossi_recalc(struct clk *clk)
-- 
2.35.1

