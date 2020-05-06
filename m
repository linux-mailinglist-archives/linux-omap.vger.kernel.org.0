Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5DA61C6864
	for <lists+linux-omap@lfdr.de>; Wed,  6 May 2020 08:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726863AbgEFGTq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 May 2020 02:19:46 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3811 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726480AbgEFGTq (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 6 May 2020 02:19:46 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 31ABBB1B4892FA1B686D;
        Wed,  6 May 2020 14:19:44 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Wed, 6 May 2020
 14:19:37 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <tony@atomide.com>, <linux@armlinux.org.uk>,
        <peter.ujfalusi@ti.com>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     Jason Yan <yanaijie@huawei.com>
Subject: [PATCH] ARM: OMAP2+: remove unneeded variable "errata" in configure_dma_errata()
Date:   Wed, 6 May 2020 14:19:00 +0800
Message-ID: <20200506061900.19832-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Fix the following coccicheck warning:

arch/arm/mach-omap2/dma.c:82:10-16: Unneeded variable: "errata". Return
"0" on line 161

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 arch/arm/mach-omap2/dma.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/mach-omap2/dma.c b/arch/arm/mach-omap2/dma.c
index 8cc109cc242a..ef5022bc91a2 100644
--- a/arch/arm/mach-omap2/dma.c
+++ b/arch/arm/mach-omap2/dma.c
@@ -79,8 +79,6 @@ static const struct omap_dma_reg reg_map[] = {
 
 static unsigned configure_dma_errata(void)
 {
-	unsigned errata = 0;
-
 	/*
 	 * Errata applicable for OMAP2430ES1.0 and all omap2420
 	 *
@@ -158,7 +156,7 @@ static unsigned configure_dma_errata(void)
 	if (cpu_is_omap34xx() && (omap_type() != OMAP2_DEVICE_TYPE_GP))
 		SET_DMA_ERRATA(DMA_ROMCODE_BUG);
 
-	return errata;
+	return 0;
 }
 
 static const struct dma_slave_map omap24xx_sdma_dt_map[] = {
-- 
2.21.1

