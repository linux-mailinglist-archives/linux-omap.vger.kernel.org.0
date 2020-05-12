Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2CE01CEADC
	for <lists+linux-omap@lfdr.de>; Tue, 12 May 2020 04:35:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728288AbgELCfN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 May 2020 22:35:13 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4394 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727892AbgELCfN (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 11 May 2020 22:35:13 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 3F0AFF321171ACDED613;
        Tue, 12 May 2020 10:35:11 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Tue, 12 May 2020 10:35:05 +0800
From:   Samuel Zou <zou_wei@huawei.com>
To:     <khilman@kernel.org>, <tony@atomide.com>, <linux@armlinux.org.uk>
CC:     <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Samuel Zou <zou_wei@huawei.com>
Subject: [PATCH -next] ARM: OMAP2+: pm33xx-core: Make am43xx_get_rtc_base_addr static
Date:   Tue, 12 May 2020 10:41:11 +0800
Message-ID: <1589251271-106359-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Fix the following sparse warning:

arch/arm/mach-omap2/pm33xx-core.c:270:14: warning: symbol 'am43xx_get_rtc_base_addr' was not declared.

The am43xx_get_rtc_base_addr has only call site within pm33xx-core.c
It should be static

Fixes: 8c5a916f4c88 ("ARM: OMAP2+: sleep33/43xx: Add RTC-Mode support")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Samuel Zou <zou_wei@huawei.com>
---
 arch/arm/mach-omap2/pm33xx-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/pm33xx-core.c b/arch/arm/mach-omap2/pm33xx-core.c
index 5455fc9..58236c7 100644
--- a/arch/arm/mach-omap2/pm33xx-core.c
+++ b/arch/arm/mach-omap2/pm33xx-core.c
@@ -267,7 +267,7 @@ static struct am33xx_pm_sram_addr *amx3_get_sram_addrs(void)
 		return NULL;
 }
 
-void __iomem *am43xx_get_rtc_base_addr(void)
+static void __iomem *am43xx_get_rtc_base_addr(void)
 {
 	rtc_oh = omap_hwmod_lookup("rtc");
 
-- 
2.6.2

