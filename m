Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B59763B2573
	for <lists+linux-omap@lfdr.de>; Thu, 24 Jun 2021 05:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbhFXDbC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 23 Jun 2021 23:31:02 -0400
Received: from m12-18.163.com ([220.181.12.18]:42892 "EHLO m12-18.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229822AbhFXDae (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 23 Jun 2021 23:30:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Fe+e1
        wtZxwC1qjG0jmHrW9KDp4hy5111Lx6noDteteQ=; b=NPJ4LPwzij1Fu6puwpcsJ
        lYKt1TPY27iGuWRwCRhaWZPMc2PHi6QzYKShXOUUyC4UdTyEQEz6G4+BpjX5p5rt
        cU0RMiKsA9/EjRav/sTJjyueGHsQhRcSTCVPo1jN12Pp0fovLEmH92RJBs/+1qla
        or+tfu7Ui7OAYeNc8Wno7o=
Received: from ubuntu.localdomain (unknown [218.17.89.92])
        by smtp14 (Coremail) with SMTP id EsCowAA3RAi5+9NguxvLrA--.14217S2;
        Thu, 24 Jun 2021 11:27:53 +0800 (CST)
From:   13145886936@163.com
To:     tony@atomide.com, linux@armlinux.org.uk,
        linux-arm-kernel@lists.infradead.org
Cc:     linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        gushengxian <gushengxian@yulong.com>
Subject: [PATCH] ARM: omap2: remove unneeded variable: "errata"
Date:   Wed, 23 Jun 2021 20:27:51 -0700
Message-Id: <20210624032751.24315-1-13145886936@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EsCowAA3RAi5+9NguxvLrA--.14217S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XrWkJrW5CFyxWry5trWrKrg_yoWfAwbEyw
        n7tw4kuan5Jwn2vr1UtanIyr1Ig3Z0gFZFga4vqFy5KFy5Jr13C34vkrZ7Ary5Xr40yrZx
        ur93ArWYk3ZrtjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU55KsUUUUUU==
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: 5zrdx5xxdq6xppld0qqrwthudrp/1tbiGhm7g1aD+N-cwgAAsX
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: gushengxian <gushengxian@yulong.com>

Remove unneeded variable: "errata".

Signed-off-by: gushengxian <gushengxian@yulong.com>
---
 arch/arm/mach-omap2/dma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/mach-omap2/dma.c b/arch/arm/mach-omap2/dma.c
index dfc9b21ff19b..ba4a48e3d264 100644
--- a/arch/arm/mach-omap2/dma.c
+++ b/arch/arm/mach-omap2/dma.c
@@ -79,7 +79,6 @@ static const struct omap_dma_reg reg_map[] = {
 
 static unsigned configure_dma_errata(void)
 {
-	unsigned errata = 0;
 
 	/*
 	 * Errata applicable for OMAP2430ES1.0 and all omap2420
@@ -158,7 +157,7 @@ static unsigned configure_dma_errata(void)
 	if (cpu_is_omap34xx() && (omap_type() != OMAP2_DEVICE_TYPE_GP))
 		SET_DMA_ERRATA(DMA_ROMCODE_BUG);
 
-	return errata;
+	return 0;
 }
 
 static const struct dma_slave_map omap24xx_sdma_dt_map[] = {
-- 
2.25.1


