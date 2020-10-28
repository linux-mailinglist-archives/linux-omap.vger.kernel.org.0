Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BC5E29D841
	for <lists+linux-omap@lfdr.de>; Wed, 28 Oct 2020 23:31:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387782AbgJ1Wat (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Oct 2020 18:30:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:44054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387770AbgJ1Wap (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 28 Oct 2020 18:30:45 -0400
Received: from kozik-lap.proceq-device.com (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9752B2071A;
        Wed, 28 Oct 2020 22:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603924244;
        bh=NcuGCp7psdo27lUEMs8BF/KiqmT2aaxB0ULJR4v6e7o=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=gPmiBVFZkjM8/PRhoi+g0DOY/qYr+lKQVs37NqNEDE/hbPWWta4wjmSb3gsXzFKFC
         Kor22J9trrqBXevjrtm1BPwjgzj1KmmuLzsC4t2w9Xu8MG1lhMb4iJMdMLZR/OYeiL
         7WwVBUsD2RSyKWZ5Mroke4aItrtxSQbjSHPGYuXw=
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
        Andy Shevchenko <andy@kernel.org>, Milo Kim <milo.kim@ti.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [RESEND PATCH 06/42] mfd: bcm2835: use PLATFORM_DEVID_NONE
Date:   Wed, 28 Oct 2020 23:29:33 +0100
Message-Id: <20201028223009.369824-6-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201028223009.369824-1-krzk@kernel.org>
References: <20201028223009.369824-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Use PLATFORM_DEVID_NONE define instead of "-1" value because:
 - it brings some meaning,
 - it might point attention why auto device ID was not used.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
Reviewed-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---
 drivers/mfd/bcm2835-pm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/bcm2835-pm.c b/drivers/mfd/bcm2835-pm.c
index 42fe67f1538e..a76014512bde 100644
--- a/drivers/mfd/bcm2835-pm.c
+++ b/drivers/mfd/bcm2835-pm.c
@@ -44,7 +44,7 @@ static int bcm2835_pm_probe(struct platform_device *pdev)
 	if (IS_ERR(pm->base))
 		return PTR_ERR(pm->base);
 
-	ret = devm_mfd_add_devices(dev, -1,
+	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
 				   bcm2835_pm_devs, ARRAY_SIZE(bcm2835_pm_devs),
 				   NULL, 0, NULL);
 	if (ret)
@@ -60,7 +60,7 @@ static int bcm2835_pm_probe(struct platform_device *pdev)
 		if (IS_ERR(pm->asb))
 			return PTR_ERR(pm->asb);
 
-		ret = devm_mfd_add_devices(dev, -1,
+		ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
 					   bcm2835_power_devs,
 					   ARRAY_SIZE(bcm2835_power_devs),
 					   NULL, 0, NULL);
-- 
2.25.1

