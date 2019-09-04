Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFF46A8C02
	for <lists+linux-omap@lfdr.de>; Wed,  4 Sep 2019 21:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732235AbfIDQIk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 4 Sep 2019 12:08:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:36804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732997AbfIDQB1 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 4 Sep 2019 12:01:27 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 964022339D;
        Wed,  4 Sep 2019 16:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567612886;
        bh=9msoC85KjAkTZ+3NyTfzwtqHQ+ihqnOm2jDZUcXZ8B4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=2bZZliP3fE9m9JvoCVD3qISjBMHpXGoYALxN6ltrKv4+3EYocxEi5fUrQm7plzUAE
         Gu7iF4cJO1XEOiZJU6BKgJkn0VLGkF8+Sol3aBnM5DxGASkyiz7/2VahWNPwde/APV
         8f5WFz8SJa2oIu5q7OMleOIZQhIAIsDxX3YDnQjY=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Tony Lindgren <tony@atomide.com>, Sasha Levin <sashal@kernel.org>,
        linux-omap@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 03/36] ARM: OMAP2+: Fix omap4 errata warning on other SoCs
Date:   Wed,  4 Sep 2019 12:00:49 -0400
Message-Id: <20190904160122.4179-3-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190904160122.4179-1-sashal@kernel.org>
References: <20190904160122.4179-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Tony Lindgren <tony@atomide.com>

[ Upstream commit 45da5e09dd32fa98c32eaafe2513db6bd75e2f4f ]

We have errata i688 workaround produce warnings on SoCs other than
omap4 and omap5:

omap4_sram_init:Unable to allocate sram needed to handle errata I688
omap4_sram_init:Unable to get sram pool needed to handle errata I688

This is happening because there is no ti,omap4-mpu node, or no SRAM
to configure for the other SoCs, so let's remove the warning based
on the SoC revision checks.

As nobody has complained it seems that the other SoC variants do not
need this workaround.

Signed-off-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/mach-omap2/omap4-common.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/mach-omap2/omap4-common.c b/arch/arm/mach-omap2/omap4-common.c
index cf65ab8bb0046..e5dcbda20129d 100644
--- a/arch/arm/mach-omap2/omap4-common.c
+++ b/arch/arm/mach-omap2/omap4-common.c
@@ -131,6 +131,9 @@ static int __init omap4_sram_init(void)
 	struct device_node *np;
 	struct gen_pool *sram_pool;
 
+	if (!soc_is_omap44xx() && !soc_is_omap54xx())
+		return 0;
+
 	np = of_find_compatible_node(NULL, NULL, "ti,omap4-mpu");
 	if (!np)
 		pr_warn("%s:Unable to allocate sram needed to handle errata I688\n",
-- 
2.20.1

