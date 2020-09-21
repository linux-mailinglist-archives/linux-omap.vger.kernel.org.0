Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCEFF273420
	for <lists+linux-omap@lfdr.de>; Mon, 21 Sep 2020 22:52:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727338AbgIUUwk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Sep 2020 16:52:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:58622 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726471AbgIUUwk (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 21 Sep 2020 16:52:40 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CCC082396F;
        Mon, 21 Sep 2020 20:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600721559;
        bh=BzfE2Whd2U7I4lvlW4ZlgaA3TzQPIBadcLxzR76dqV4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=0xrrNERPAOjcnJfTnvx8zXTdqI4QtH/KkJEc5ISWZ892Da9Pvj2pt+RB9CdLPMviW
         Wx9sMVz/GbBrg7dascbeY3nGZkPjUwrc3XeHPXpAZ+mKbzY8DeDh3w53Z/Beu1xoQR
         WYfvkwxrtDqc19xINy0aRq9eZ8k6nmWQ4MB+jUvU=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Support Opensource <support.opensource@diasemi.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Milo Kim <milo.kim@ti.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sangbeom Kim <sbkim73@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [PATCH 22/42] mfd: mc13xxx: use PLATFORM_DEVID_NONE
Date:   Mon, 21 Sep 2020 22:49:56 +0200
Message-Id: <20200921205016.20461-22-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921205016.20461-1-krzk@kernel.org>
References: <20200921205016.20461-1-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Use PLATFORM_DEVID_NONE define instead of "-1" value because:
 - it brings some meaning,
 - it might point attention why auto device ID was not used.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/mfd/mc13xxx-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/mc13xxx-core.c b/drivers/mfd/mc13xxx-core.c
index 1abe7432aad8..659e72cdac3d 100644
--- a/drivers/mfd/mc13xxx-core.c
+++ b/drivers/mfd/mc13xxx-core.c
@@ -379,8 +379,8 @@ static int mc13xxx_add_subdevice_pdata(struct mc13xxx *mc13xxx,
 	if (!cell.name)
 		return -ENOMEM;
 
-	return mfd_add_devices(mc13xxx->dev, -1, &cell, 1, NULL, 0,
-			       regmap_irq_get_domain(mc13xxx->irq_data));
+	return mfd_add_devices(mc13xxx->dev, PLATFORM_DEVID_NONE, &cell, 1, NULL,
+			       0, regmap_irq_get_domain(mc13xxx->irq_data));
 }
 
 static int mc13xxx_add_subdevice(struct mc13xxx *mc13xxx, const char *format)
-- 
2.17.1

