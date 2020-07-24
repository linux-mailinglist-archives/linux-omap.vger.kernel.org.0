Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6D2522CDAF
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 20:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727036AbgGXSYj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 14:24:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:33254 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726988AbgGXSYi (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 24 Jul 2020 14:24:38 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0DAD02070E;
        Fri, 24 Jul 2020 18:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595615078;
        bh=5ktWSQf2OJMglO4ygaUgTJ1Ba7h5629G/Zz5/4zxDMA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XBjUNT7l1oq+0hJwD2MqadgYTwGwuydK038bDcpD1LuwEDSGb69j5LKquC6bCgvh7
         fJBOgA/0C79hQ5cTAQv5R4fjb0UPp49shcH+ohBlLJs28GOooOaa9YcrOE6+Ii5KXx
         dSmUT5VhZj1QY09IxYk18cctDju8cxdg14kwLHWI=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Markus Mayer <mmayer@broadcom.com>,
        Roger Quadros <rogerq@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Kukjin Kim <kgene@kernel.org>,
        Lukasz Luba <lukasz.luba@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-pm@vger.kernel.org
Cc:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 06/16] memory: omap-gpmc: Use 'unsigned int' for consistency
Date:   Fri, 24 Jul 2020 20:23:18 +0200
Message-Id: <20200724182328.3348-7-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724182328.3348-1-krzk@kernel.org>
References: <20200724182328.3348-1-krzk@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Driver uses 'unsigned int' in other places instead of 'unsigned'.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/memory/omap-gpmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index 62577255ba0f..e4d2f359bcfa 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -243,7 +243,7 @@ static DEFINE_SPINLOCK(gpmc_mem_lock);
 /* Define chip-selects as reserved by default until probe completes */
 static unsigned int gpmc_cs_num = GPMC_CS_NUM;
 static unsigned int gpmc_nr_waitpins;
-static unsigned gpmc_capability;
+static unsigned int gpmc_capability;
 static void __iomem *gpmc_base;
 
 static struct clk *gpmc_l3_clk;
@@ -1289,7 +1289,7 @@ int gpmc_omap_onenand_set_timings(struct device *dev, int cs, int freq,
 }
 EXPORT_SYMBOL_GPL(gpmc_omap_onenand_set_timings);
 
-int gpmc_get_client_irq(unsigned irq_config)
+int gpmc_get_client_irq(unsigned int irq_config)
 {
 	if (!gpmc_irq_domain) {
 		pr_warn("%s called before GPMC IRQ domain available\n",
-- 
2.17.1

