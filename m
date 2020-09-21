Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A825C27343A
	for <lists+linux-omap@lfdr.de>; Mon, 21 Sep 2020 22:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727809AbgIUUx1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Sep 2020 16:53:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:59580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727339AbgIUUx1 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 21 Sep 2020 16:53:27 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 52C1123A04;
        Mon, 21 Sep 2020 20:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600721606;
        bh=ma7yjwLc8yk7sb1IlZOrRcZ6FpTnWzSvH+VuumuxwNM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=2k3YGd9RjzvwF9ecI0gy1b1sHXUvUTRGToUYpjIDMjv5AAMb950oJIbrQSHseBM5V
         tuvjNHzPiPhTwKROuWFZRxkakmU1z6b8NbkYiEDexTj7uq8ofJ6GzAlvDUtlntDpfv
         fwU0q0OSV7U44sPJbQvFP1S3eER2tvorU3jZ7cu0=
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
Subject: [PATCH 30/42] mfd: tc3589x: use PLATFORM_DEVID_NONE
Date:   Mon, 21 Sep 2020 22:50:04 +0200
Message-Id: <20200921205016.20461-30-krzk@kernel.org>
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
 drivers/mfd/tc3589x.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/tc3589x.c b/drivers/mfd/tc3589x.c
index 7882a37ffc35..22821112cc6b 100644
--- a/drivers/mfd/tc3589x.c
+++ b/drivers/mfd/tc3589x.c
@@ -287,7 +287,8 @@ static int tc3589x_device_init(struct tc3589x *tc3589x)
 	unsigned int blocks = tc3589x->pdata->block;
 
 	if (blocks & TC3589x_BLOCK_GPIO) {
-		ret = mfd_add_devices(tc3589x->dev, -1, tc3589x_dev_gpio,
+		ret = mfd_add_devices(tc3589x->dev, PLATFORM_DEVID_NONE,
+				      tc3589x_dev_gpio,
 				      ARRAY_SIZE(tc3589x_dev_gpio), NULL,
 				      0, tc3589x->domain);
 		if (ret) {
@@ -298,7 +299,8 @@ static int tc3589x_device_init(struct tc3589x *tc3589x)
 	}
 
 	if (blocks & TC3589x_BLOCK_KEYPAD) {
-		ret = mfd_add_devices(tc3589x->dev, -1, tc3589x_dev_keypad,
+		ret = mfd_add_devices(tc3589x->dev, PLATFORM_DEVID_NONE,
+				      tc3589x_dev_keypad,
 				      ARRAY_SIZE(tc3589x_dev_keypad), NULL,
 				      0, tc3589x->domain);
 		if (ret) {
-- 
2.17.1

