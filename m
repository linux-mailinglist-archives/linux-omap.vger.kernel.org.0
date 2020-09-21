Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9278273438
	for <lists+linux-omap@lfdr.de>; Mon, 21 Sep 2020 22:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727782AbgIUUxV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Sep 2020 16:53:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:59446 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727339AbgIUUxV (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 21 Sep 2020 16:53:21 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5F2FB23A03;
        Mon, 21 Sep 2020 20:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600721600;
        bh=Gd5L6OSoOltwRu1LJekfayeX7TBoV7+ZPquyuCTihUs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=yFDZPUhtdDXi2eGOkC/Kr9YCwTlRmiQaHGrq1t65W8Iwli6viP3MPo1u+Wjl2cs7o
         n6iZGZYjgAU4yYMOYgWbKLhgOVbUQfjh+w4YObVydvZDqK5zmNdIubLXrW0r1ud024
         U3I8aRti4esshB0PxBAYMlzBkqwiw1Agiy71PNBE=
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
Subject: [PATCH 29/42] mfd: sta2x11: use PLATFORM_DEVID_NONE
Date:   Mon, 21 Sep 2020 22:50:03 +0200
Message-Id: <20200921205016.20461-29-krzk@kernel.org>
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
 drivers/mfd/sta2x11-mfd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/sta2x11-mfd.c b/drivers/mfd/sta2x11-mfd.c
index 1819c8fe4d8f..fafb3292dce8 100644
--- a/drivers/mfd/sta2x11-mfd.c
+++ b/drivers/mfd/sta2x11-mfd.c
@@ -594,7 +594,7 @@ static int sta2x11_mfd_probe(struct pci_dev *pdev,
 
 	/* Just 2 bars for all mfd's at present */
 	for (i = 0; i < 2; i++) {
-		err = mfd_add_devices(&pdev->dev, -1,
+		err = mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE,
 				      setup_data->bars[i].cells,
 				      setup_data->bars[i].ncells,
 				      &pdev->resource[i],
-- 
2.17.1

