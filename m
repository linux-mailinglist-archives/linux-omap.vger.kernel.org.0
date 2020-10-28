Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A8CB29D8D2
	for <lists+linux-omap@lfdr.de>; Wed, 28 Oct 2020 23:37:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388368AbgJ1WgU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Oct 2020 18:36:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:47572 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388431AbgJ1Wdn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 28 Oct 2020 18:33:43 -0400
Received: from kozik-lap.proceq-device.com (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8DA7B20728;
        Wed, 28 Oct 2020 22:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603924422;
        bh=5p3nyiDcMBCIxUJoFfO1loAwC4zdnTa9lfo72yb+87s=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=oOZITDT9J0uxHgDbx/B8Uk1eE+Lns9GGtl4JEvqoH7aSz8I62UlSfv/4+PUfOaQ8+
         aAaRCU1FitwwSSPB/SjcK9eR15lhp4URWC3+FM6aVu8flE/7wg5CMD2PDvAW0xxvYz
         r6wNr0zKd9lL/sHJXz4ckqEs20PYWtaJVZIapvqE=
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
Subject: [RESEND PATCH 39/42] mfd: vx855: use PLATFORM_DEVID_NONE
Date:   Wed, 28 Oct 2020 23:30:06 +0100
Message-Id: <20201028223009.369824-39-krzk@kernel.org>
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
 drivers/mfd/vx855.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/vx855.c b/drivers/mfd/vx855.c
index 985f81c1739c..a53fb4c1ebdb 100644
--- a/drivers/mfd/vx855.c
+++ b/drivers/mfd/vx855.c
@@ -86,8 +86,8 @@ static int vx855_probe(struct pci_dev *pdev,
 	vx855_gpio_resources[1].start = gpio_io_offset + VX855_PMIO_R_GPO;
 	vx855_gpio_resources[1].end = vx855_gpio_resources[1].start + 3;
 
-	ret = mfd_add_devices(&pdev->dev, -1, vx855_cells, ARRAY_SIZE(vx855_cells),
-			NULL, 0, NULL);
+	ret = mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE, vx855_cells,
+			      ARRAY_SIZE(vx855_cells), NULL, 0, NULL);
 
 	/* we always return -ENODEV here in order to enable other
 	 * drivers like old, not-yet-platform_device ported i2c-viapro */
-- 
2.25.1

