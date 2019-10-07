Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4867CEA29
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2019 19:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728941AbfJGRIY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Oct 2019 13:08:24 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39454 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728796AbfJGRIY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Oct 2019 13:08:24 -0400
Received: from pendragon.ideasonboard.com (modemcable118.64-20-96.mc.videotron.ca [96.20.64.118])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 08699E40;
        Mon,  7 Oct 2019 19:08:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1570468102;
        bh=y+5LC6ALwE7C5KN97dMk1v9hgK4eMNd42J/ODWDDExE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cR3aLHfRP23QXhKxLbyz6+JmRWHic0RpAOtP3w4xHfaA6dWqjdqctUp6PQeeDqjey
         NiouJxyCRDIF4zuHMzFxn7RyheLuZdQk8s4T4Cc1EUbMTSazSSENOTIFbI6UAOUcMd
         0rZJENaepJaIUNFKvVWgoXny+jEih3TfcooiZ4M0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        thierry.reding@gmail.com, sam@ravnborg.org,
        letux-kernel@openphoenux.org, Tony Lindgren <tony@atomide.com>,
        Jyri Sarha <jsarha@ti.com>, linux-omap@vger.kernel.org
Subject: [PATCH 5/5] drm/panel: tpo-td043mtea1: Fix SPI alias
Date:   Mon,  7 Oct 2019 20:08:01 +0300
Message-Id: <20191007170801.27647-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191007170801.27647-1-laurent.pinchart@ideasonboard.com>
References: <20191007170801.27647-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The panel-tpo-td043mtea1 driver incorrectly includes the OF vendor
prefix in its SPI alias. Fix it, and move the manual alias to an SPI
module device table.

Fixes: dc2e1e5b2799 ("drm/panel: Add driver for the Toppoly TD043MTEA1 panel")
Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/panel/panel-tpo-td043mtea1.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c b/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
index 84370562910f..ba163c779084 100644
--- a/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
+++ b/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
@@ -491,9 +491,17 @@ static const struct of_device_id td043mtea1_of_match[] = {
 
 MODULE_DEVICE_TABLE(of, td043mtea1_of_match);
 
+static const struct spi_device_id td043mtea1_ids[] = {
+	{ "td043mtea1", 0 },
+	{ /* sentinel */ }
+};
+
+MODULE_DEVICE_TABLE(spi, td043mtea1_ids);
+
 static struct spi_driver td043mtea1_driver = {
 	.probe		= td043mtea1_probe,
 	.remove		= td043mtea1_remove,
+	.id_table	= td043mtea1_ids,
 	.driver		= {
 		.name	= "panel-tpo-td043mtea1",
 		.pm	= &td043mtea1_pm_ops,
@@ -503,7 +511,6 @@ static struct spi_driver td043mtea1_driver = {
 
 module_spi_driver(td043mtea1_driver);
 
-MODULE_ALIAS("spi:tpo,td043mtea1");
 MODULE_AUTHOR("Gražvydas Ignotas <notasas@gmail.com>");
 MODULE_DESCRIPTION("TPO TD043MTEA1 Panel Driver");
 MODULE_LICENSE("GPL");
-- 
Regards,

Laurent Pinchart

