Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D4F42733E0
	for <lists+linux-omap@lfdr.de>; Mon, 21 Sep 2020 22:50:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbgIUUua (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Sep 2020 16:50:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:55928 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726427AbgIUUua (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 21 Sep 2020 16:50:30 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 83C24216C4;
        Mon, 21 Sep 2020 20:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600721429;
        bh=597brXyKYL9knRl5IXCbOkwWT5omN1r2wldc4AeP01U=;
        h=From:To:Subject:Date:From;
        b=BzSIY24V5jzxPB3N1CYINObIL3OJfd86izbjWTwoq2NXiuBa73dXq8JeJYjr52I4W
         dliiYx+ltUkvOvmSWqMCnJ1KVYIJL0WbE+eVv7ekpf+hkEE1Ftp239JMEFKWmr3pxR
         9luKEPfvy+Tne5gwf9cABPAKIbFoZKAkInkKoH8Q=
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
Subject: [PATCH 01/42] mfd: arizona: use PLATFORM_DEVID_NONE
Date:   Mon, 21 Sep 2020 22:49:35 +0200
Message-Id: <20200921205016.20461-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Use PLATFORM_DEVID_NONE define instead of "-1" value because:
 - it brings some meaning,
 - it might point attention why auto device ID was not used.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/mfd/arizona-core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/arizona-core.c b/drivers/mfd/arizona-core.c
index 000cb82023e3..bf48372db605 100644
--- a/drivers/mfd/arizona-core.c
+++ b/drivers/mfd/arizona-core.c
@@ -1043,8 +1043,9 @@ int arizona_dev_init(struct arizona *arizona)
 	case CS47L24:
 		break; /* No LDO1 regulator */
 	default:
-		ret = mfd_add_devices(arizona->dev, -1, early_devs,
-				      ARRAY_SIZE(early_devs), NULL, 0, NULL);
+		ret = mfd_add_devices(arizona->dev, PLATFORM_DEVID_NONE,
+				      early_devs, ARRAY_SIZE(early_devs),
+				      NULL, 0, NULL);
 		if (ret != 0) {
 			dev_err(dev, "Failed to add early children: %d\n", ret);
 			return ret;
-- 
2.17.1

