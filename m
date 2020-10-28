Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2965029DC8A
	for <lists+linux-omap@lfdr.de>; Thu, 29 Oct 2020 01:31:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388568AbgJ1WdF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Oct 2020 18:33:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:46920 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388494AbgJ1WdA (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 28 Oct 2020 18:33:00 -0400
Received: from kozik-lap.proceq-device.com (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6CD602072E;
        Wed, 28 Oct 2020 22:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603924379;
        bh=ifer0qFpmgpScVnZn7aVvw9lQMczxYrypi1yqr3rAwI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=NNULfFQLt/FTEQpuj0ZA9HTeU4TE3UfyQnnDWSDk74jLAnDEr22kWibODAsFZE2Ji
         qtGRZOoGN9JwyoPKIHfdBKQojSnDD9lEY2ROWnNOmBIRcxKlw4Ur+gQtXewnT1BGCw
         /GdULCATmV6cCysRHQ4Yy1kenbTnJ6ZX1bWfzkXI=
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
Subject: [RESEND PATCH 31/42] mfd: timberdale: use PLATFORM_DEVID_NONE
Date:   Wed, 28 Oct 2020 23:29:58 +0100
Message-Id: <20201028223009.369824-31-krzk@kernel.org>
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
2.25.1

