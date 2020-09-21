Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2248627343F
	for <lists+linux-omap@lfdr.de>; Mon, 21 Sep 2020 22:53:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728593AbgIUUxe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Sep 2020 16:53:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:59674 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728591AbgIUUxd (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 21 Sep 2020 16:53:33 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5054023A02;
        Mon, 21 Sep 2020 20:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600721612;
        bh=vSy8YmQ7rMfM5gLA126GFQJXpLeU/lgw/zMliEK3SNE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=0b8YLwhSR25s08K6K3VIQv8gf0CHWCOkUjWK+7fUVSw5u6ixUSqp7WJXhs1CGI99X
         U7tUJKfLfR65YwpxpXsfeR0W3Vai0heNWWPRDwE9mGx250fEc2uDCQmQztNpeFJW+E
         6HJ606+1we8DiViFLx+X8zeQQmnoqfLJkd/968MQ=
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
Subject: [PATCH 31/42] mfd: timberdale: use PLATFORM_DEVID_NONE
Date:   Mon, 21 Sep 2020 22:50:05 +0200
Message-Id: <20200921205016.20461-31-krzk@kernel.org>
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
 drivers/mfd/timberdale.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/timberdale.c b/drivers/mfd/timberdale.c
index faecbca6dba3..de1589fa2120 100644
--- a/drivers/mfd/timberdale.c
+++ b/drivers/mfd/timberdale.c
@@ -740,25 +740,25 @@ static int timb_probe(struct pci_dev *dev,
 	ip_setup = priv->fw.config & TIMB_HW_VER_MASK;
 	switch (ip_setup) {
 	case TIMB_HW_VER0:
-		err = mfd_add_devices(&dev->dev, -1,
+		err = mfd_add_devices(&dev->dev, PLATFORM_DEVID_NONE,
 			timberdale_cells_bar0_cfg0,
 			ARRAY_SIZE(timberdale_cells_bar0_cfg0),
 			&dev->resource[0], msix_entries[0].vector, NULL);
 		break;
 	case TIMB_HW_VER1:
-		err = mfd_add_devices(&dev->dev, -1,
+		err = mfd_add_devices(&dev->dev, PLATFORM_DEVID_NONE,
 			timberdale_cells_bar0_cfg1,
 			ARRAY_SIZE(timberdale_cells_bar0_cfg1),
 			&dev->resource[0], msix_entries[0].vector, NULL);
 		break;
 	case TIMB_HW_VER2:
-		err = mfd_add_devices(&dev->dev, -1,
+		err = mfd_add_devices(&dev->dev, PLATFORM_DEVID_NONE,
 			timberdale_cells_bar0_cfg2,
 			ARRAY_SIZE(timberdale_cells_bar0_cfg2),
 			&dev->resource[0], msix_entries[0].vector, NULL);
 		break;
 	case TIMB_HW_VER3:
-		err = mfd_add_devices(&dev->dev, -1,
+		err = mfd_add_devices(&dev->dev, PLATFORM_DEVID_NONE,
 			timberdale_cells_bar0_cfg3,
 			ARRAY_SIZE(timberdale_cells_bar0_cfg3),
 			&dev->resource[0], msix_entries[0].vector, NULL);
-- 
2.17.1

