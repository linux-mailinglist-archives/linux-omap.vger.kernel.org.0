Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0AC640F166
	for <lists+linux-omap@lfdr.de>; Fri, 17 Sep 2021 06:40:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244777AbhIQEli (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Sep 2021 00:41:38 -0400
Received: from mx22.baidu.com ([220.181.50.185]:38234 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S244720AbhIQElZ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 17 Sep 2021 00:41:25 -0400
Received: from BC-Mail-Ex29.internal.baidu.com (unknown [172.31.51.23])
        by Forcepoint Email with ESMTPS id EF57B883484BA65A75EB;
        Fri, 17 Sep 2021 12:24:20 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex29.internal.baidu.com (172.31.51.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Fri, 17 Sep 2021 12:24:20 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Fri, 17 Sep 2021 12:24:20 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     <linux-fbdev@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/4] fbdev: omapfb: panel-lgphilips-lb035q02: Make use of the helper function dev_err_probe()
Date:   Fri, 17 Sep 2021 12:24:10 +0800
Message-ID: <20210917042414.17787-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex15.internal.baidu.com (172.31.51.55) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

When possible use dev_err_probe help to properly deal with the
PROBE_DEFER error, the benefit is that DEFER issue will be logged
in the devices_deferred debugfs file.
Using dev_err_probe() can reduce code size, and the error value
gets printed.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 .../fbdev/omap2/omapfb/displays/panel-lgphilips-lb035q02.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-lgphilips-lb035q02.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-lgphilips-lb035q02.c
index 1bec7a4422e8..6befd22dbd5c 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-lgphilips-lb035q02.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-lgphilips-lb035q02.c
@@ -244,10 +244,9 @@ static int lb035q02_probe_of(struct spi_device *spi)
 	struct gpio_desc *gpio;
 
 	gpio = devm_gpiod_get(&spi->dev, "enable", GPIOD_OUT_LOW);
-	if (IS_ERR(gpio)) {
-		dev_err(&spi->dev, "failed to parse enable gpio\n");
-		return PTR_ERR(gpio);
-	}
+	if (IS_ERR(gpio))
+		return dev_err_probe(&spi->dev, PTR_ERR(gpio),
+				     "failed to parse enable gpio\n");
 
 	ddata->enable_gpio = gpio;
 
-- 
2.25.1

