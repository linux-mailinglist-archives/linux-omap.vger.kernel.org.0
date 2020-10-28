Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8929E29D8A8
	for <lists+linux-omap@lfdr.de>; Wed, 28 Oct 2020 23:35:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387922AbgJ1Weo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Oct 2020 18:34:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:46842 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388355AbgJ1Wcy (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 28 Oct 2020 18:32:54 -0400
Received: from kozik-lap.proceq-device.com (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5668720725;
        Wed, 28 Oct 2020 22:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603924374;
        bh=/opRYDoUP2hkyGCV09IodIsiWsmlN0SL1QF+3h41Rxg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=HhVzhSypvTcVdlYW7mJb/nTs+cnlDhpx9f/4lKsHv4R2JCiW7xHQKXZk39ERzB8/p
         DwB7MRY32DiuHCEqGT8LBQ2k18rpAgAx8TC+BwK5Ciz9y+sR1l0mCWyJkqSnbHtwx3
         V7/k2+yRH42jUNTIoXJQ4y2rce9kqC8gJtdhefOM=
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
Subject: [RESEND PATCH 30/42] mfd: tc3589x: use PLATFORM_DEVID_NONE
Date:   Wed, 28 Oct 2020 23:29:57 +0100
Message-Id: <20201028223009.369824-30-krzk@kernel.org>
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
2.25.1

