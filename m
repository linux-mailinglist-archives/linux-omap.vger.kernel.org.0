Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23B0FCEA1F
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2019 19:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728528AbfJGRIN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Oct 2019 13:08:13 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39360 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728083AbfJGRIN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Oct 2019 13:08:13 -0400
Received: from pendragon.ideasonboard.com (modemcable118.64-20-96.mc.videotron.ca [96.20.64.118])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 18AA9B2E;
        Mon,  7 Oct 2019 19:08:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1570468091;
        bh=8qIKk1eew0c4jGZQgmEeECkNYKpgTWKyG09QpbsGa4g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ukdzvodvOXZGSHWy0Xscsx3JfIMaitgZO0QJEGwjHi9TXZQgELZseuIAz/6c5by4r
         9I78xY+g25FZ++lafpRI8j+hOGD68iMcYD05WaIWfV30tl134sRiQP6EahnGqot+zb
         G3wr/sueXGhRpL0ZxYxMUb5pskEMY2OXWjzF9pTM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        thierry.reding@gmail.com, sam@ravnborg.org,
        letux-kernel@openphoenux.org, Tony Lindgren <tony@atomide.com>,
        Jyri Sarha <jsarha@ti.com>, linux-omap@vger.kernel.org
Subject: [PATCH 1/5] drm/panel: lg-lb035q02: Fix SPI alias
Date:   Mon,  7 Oct 2019 20:07:57 +0300
Message-Id: <20191007170801.27647-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191007170801.27647-1-laurent.pinchart@ideasonboard.com>
References: <20191007170801.27647-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The panel-lg-lb035q02 driver incorrectly includes the OF vendor prefix
in its SPI alias. Fix it, and move the manual alias to an SPI module
device table.

Fixes: f5b0c6542476 ("drm/panel: Add driver for the LG Philips LB035Q02 panel")
Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/panel/panel-lg-lb035q02.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-lb035q02.c b/drivers/gpu/drm/panel/panel-lg-lb035q02.c
index fc82a525b071..ee4379729a5b 100644
--- a/drivers/gpu/drm/panel/panel-lg-lb035q02.c
+++ b/drivers/gpu/drm/panel/panel-lg-lb035q02.c
@@ -220,9 +220,17 @@ static const struct of_device_id lb035q02_of_match[] = {
 
 MODULE_DEVICE_TABLE(of, lb035q02_of_match);
 
+static const struct spi_device_id lb035q02_ids[] = {
+	{ "lb035q02", 0 },
+	{ /* sentinel */ }
+};
+
+MODULE_DEVICE_TABLE(spi, lb035q02_ids);
+
 static struct spi_driver lb035q02_driver = {
 	.probe		= lb035q02_probe,
 	.remove		= lb035q02_remove,
+	.id_table	= lb035q02_ids,
 	.driver		= {
 		.name	= "panel-lg-lb035q02",
 		.of_match_table = lb035q02_of_match,
@@ -231,7 +239,6 @@ static struct spi_driver lb035q02_driver = {
 
 module_spi_driver(lb035q02_driver);
 
-MODULE_ALIAS("spi:lgphilips,lb035q02");
 MODULE_AUTHOR("Tomi Valkeinen <tomi.valkeinen@ti.com>");
 MODULE_DESCRIPTION("LG.Philips LB035Q02 LCD Panel driver");
 MODULE_LICENSE("GPL");
-- 
Regards,

Laurent Pinchart

