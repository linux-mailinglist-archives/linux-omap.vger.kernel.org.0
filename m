Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7991CEA23
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2019 19:08:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728882AbfJGRIS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Oct 2019 13:08:18 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39390 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728796AbfJGRIR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Oct 2019 13:08:17 -0400
Received: from pendragon.ideasonboard.com (modemcable118.64-20-96.mc.videotron.ca [96.20.64.118])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE34FB90;
        Mon,  7 Oct 2019 19:08:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1570468096;
        bh=8mHvl+FnZn8l2sRe/56j9JYbdI6y/5hKzQ+ECvS49QY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=X56RAxqKG/YcjzEZYO90dRb4hzK9T5glzDOrDe8nqkHU34OpC+fo9JIFnRWtKTw6k
         JD7nNFwt75UrJUO0/NumLiheU7XkxJaFM7ToKnsPkF8LKIZ8TTqnIIhSigouy0WihU
         xEmowpiHT0lyx7RJRkZvWfIgta8wo/Rk+W2xDrN8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        thierry.reding@gmail.com, sam@ravnborg.org,
        letux-kernel@openphoenux.org, Tony Lindgren <tony@atomide.com>,
        Jyri Sarha <jsarha@ti.com>, linux-omap@vger.kernel.org
Subject: [PATCH 3/5] drm/panel: sony-acx565akm: Fix SPI alias
Date:   Mon,  7 Oct 2019 20:07:59 +0300
Message-Id: <20191007170801.27647-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191007170801.27647-1-laurent.pinchart@ideasonboard.com>
References: <20191007170801.27647-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The panel-sony-acx565akm driver incorrectly includes the OF vendor
prefix in its SPI alias. Fix it, and move the manual alias to an SPI
module device table.

Fixes: 1c8fc3f0c5d2 ("drm/panel: Add driver for the Sony ACX565AKM panel")
Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/panel/panel-sony-acx565akm.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-sony-acx565akm.c b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
index 305259b58767..3d5b9c4f68d9 100644
--- a/drivers/gpu/drm/panel/panel-sony-acx565akm.c
+++ b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
@@ -684,9 +684,17 @@ static const struct of_device_id acx565akm_of_match[] = {
 
 MODULE_DEVICE_TABLE(of, acx565akm_of_match);
 
+static const struct spi_device_id acx565akm_ids[] = {
+	{ "acx565akm", 0 },
+	{ /* sentinel */ }
+};
+
+MODULE_DEVICE_TABLE(spi, acx565akm_ids);
+
 static struct spi_driver acx565akm_driver = {
 	.probe		= acx565akm_probe,
 	.remove		= acx565akm_remove,
+	.id_table	= acx565akm_ids,
 	.driver		= {
 		.name	= "panel-sony-acx565akm",
 		.of_match_table = acx565akm_of_match,
@@ -695,7 +703,6 @@ static struct spi_driver acx565akm_driver = {
 
 module_spi_driver(acx565akm_driver);
 
-MODULE_ALIAS("spi:sony,acx565akm");
 MODULE_AUTHOR("Nokia Corporation");
 MODULE_DESCRIPTION("Sony ACX565AKM LCD Panel Driver");
 MODULE_LICENSE("GPL");
-- 
Regards,

Laurent Pinchart

