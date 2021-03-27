Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F09334B5C3
	for <lists+linux-omap@lfdr.de>; Sat, 27 Mar 2021 10:53:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231143AbhC0JxH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 27 Mar 2021 05:53:07 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:14168 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231458AbhC0Jwt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 27 Mar 2021 05:52:49 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F6vG63c8lznTWs;
        Sat, 27 Mar 2021 17:50:06 +0800 (CST)
Received: from huawei.com (10.67.174.78) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0; Sat, 27 Mar 2021
 17:52:31 +0800
From:   Chen Lifu <chenlifu@huawei.com>
To:     <chenlifu@huawei.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>
CC:     <heying24@huawei.com>, <yuehaibing@huawei.com>,
        <weiyongjun1@huawei.com>, <johnny.chenyi@huawei.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] ARM: OMAP: Use DEFINE_SPINLOCK() for spinlock
Date:   Sat, 27 Mar 2021 17:52:27 +0800
Message-ID: <20210327095227.105081-1-chenlifu@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.174.78]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Lifu Chen <chenlifu@huawei.com>

spinlock can be initialized automatically with DEFINE_SPINLOCK()
rather than explicitly calling spin_lock_init().

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Lifu Chen <chenlifu@huawei.com>
---
 arch/arm/plat-omap/dma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/plat-omap/dma.c b/arch/arm/plat-omap/dma.c
index 1eb59003bdec..9f11de46aaa9 100644
--- a/arch/arm/plat-omap/dma.c
+++ b/arch/arm/plat-omap/dma.c
@@ -85,7 +85,7 @@ static int dma_lch_count;
 static int dma_chan_count;
 static int omap_dma_reserve_channels;
 
-static spinlock_t dma_chan_lock;
+static DEFINE_SPINLOCK(dma_chan_lock);
 static struct omap_dma_lch *dma_chan;
 
 static inline void disable_lnk(int lch);
@@ -902,7 +902,6 @@ static int omap_system_dma_probe(struct platform_device *pdev)
 	if (!dma_chan)
 		return -ENOMEM;
 
-	spin_lock_init(&dma_chan_lock);
 	for (ch = 0; ch < dma_chan_count; ch++) {
 		omap_clear_dma(ch);
 

