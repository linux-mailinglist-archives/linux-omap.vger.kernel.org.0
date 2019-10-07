Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA7FCEA21
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2019 19:08:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728915AbfJGRIP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Oct 2019 13:08:15 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39366 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728083AbfJGRIP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Oct 2019 13:08:15 -0400
Received: from pendragon.ideasonboard.com (modemcable118.64-20-96.mc.videotron.ca [96.20.64.118])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1BE64B60;
        Mon,  7 Oct 2019 19:08:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1570468094;
        bh=N/mmucB350SX/DP14F3sFCwA5JqU9+oM8mzOXZZ2O4k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sLZtLdud9IJgHMTLgox+zob/Eb2HUlss+X6PcgyWLKYhKZQOl+042lWkzWfDKnUDL
         QOcFK1alQ+E5TPpc287IcA812yIe05wLr1y90rRH3qcWZxEVnul1odYnTV9jpeyWFO
         2sGC9+8PYgArjk/TKFCP0zQoMGKFBV/9/2WFuFWA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        thierry.reding@gmail.com, sam@ravnborg.org,
        letux-kernel@openphoenux.org, Tony Lindgren <tony@atomide.com>,
        Jyri Sarha <jsarha@ti.com>, linux-omap@vger.kernel.org
Subject: [PATCH 2/5] drm/panel: nec-nl8048hl11: Fix SPI alias
Date:   Mon,  7 Oct 2019 20:07:58 +0300
Message-Id: <20191007170801.27647-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191007170801.27647-1-laurent.pinchart@ideasonboard.com>
References: <20191007170801.27647-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The panel-nec-nl8048hl11 driver incorrectly includes the OF vendor
prefix in its SPI alias. Fix it, and move the manual alias to an SPI
module device table.

Fixes: df439abe6501 ("drm/panel: Add driver for the NEC NL8048HL11 panel")
Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/panel/panel-nec-nl8048hl11.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-nec-nl8048hl11.c b/drivers/gpu/drm/panel/panel-nec-nl8048hl11.c
index 299b217c83e1..20f17e46e65d 100644
--- a/drivers/gpu/drm/panel/panel-nec-nl8048hl11.c
+++ b/drivers/gpu/drm/panel/panel-nec-nl8048hl11.c
@@ -230,9 +230,17 @@ static const struct of_device_id nl8048_of_match[] = {
 
 MODULE_DEVICE_TABLE(of, nl8048_of_match);
 
+static const struct spi_device_id nl8048_ids[] = {
+	{ "nl8048hl11", 0 },
+	{ /* sentinel */ }
+};
+
+MODULE_DEVICE_TABLE(spi, nl8048_ids);
+
 static struct spi_driver nl8048_driver = {
 	.probe		= nl8048_probe,
 	.remove		= nl8048_remove,
+	.id_table	= nl8048_ids,
 	.driver		= {
 		.name	= "panel-nec-nl8048hl11",
 		.pm	= &nl8048_pm_ops,
@@ -242,7 +250,6 @@ static struct spi_driver nl8048_driver = {
 
 module_spi_driver(nl8048_driver);
 
-MODULE_ALIAS("spi:nec,nl8048hl11");
 MODULE_AUTHOR("Erik Gilling <konkers@android.com>");
 MODULE_DESCRIPTION("NEC-NL8048HL11 Driver");
 MODULE_LICENSE("GPL");
-- 
Regards,

Laurent Pinchart

