Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4043CEA27
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2019 19:08:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728939AbfJGRIV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Oct 2019 13:08:21 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39414 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728796AbfJGRIV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Oct 2019 13:08:21 -0400
Received: from pendragon.ideasonboard.com (modemcable118.64-20-96.mc.videotron.ca [96.20.64.118])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59EFAE1D;
        Mon,  7 Oct 2019 19:08:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1570468099;
        bh=DXdHuGh8L2hvuyVt4J3SlyqfqGITckjLGcMAX0Jhy5E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AWkS7D8wNuqDcGGyhIqz6tPrkGJwcfhlg/h41upSjqi3gW5GHc2SFKJ2+Ou9S85mp
         IsuIfTYYLNw3LeD9ALtdk2eSyw0iKpTlYo2h/vGgXgNCn26Zq5FkKVO63d8PTzM7tO
         GauLau72STmLetONwoRKfEg610U0Yux9rcon1t28=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        thierry.reding@gmail.com, sam@ravnborg.org,
        letux-kernel@openphoenux.org, Tony Lindgren <tony@atomide.com>,
        Jyri Sarha <jsarha@ti.com>, linux-omap@vger.kernel.org
Subject: [PATCH 4/5] drm/panel: tpo-td028ttec1: Fix SPI alias
Date:   Mon,  7 Oct 2019 20:08:00 +0300
Message-Id: <20191007170801.27647-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191007170801.27647-1-laurent.pinchart@ideasonboard.com>
References: <20191007170801.27647-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The panel-tpo-td028ttec1 driver incorrectly includes the OF vendor
prefix in its SPI alias. Fix it.

Fixes: 415b8dd08711 ("drm/panel: Add driver for the Toppoly TD028TTEC1 panel")
Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/panel/panel-tpo-td028ttec1.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c b/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
index d7b2e34626ef..f2baff827f50 100644
--- a/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
+++ b/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
@@ -375,8 +375,7 @@ static const struct of_device_id td028ttec1_of_match[] = {
 MODULE_DEVICE_TABLE(of, td028ttec1_of_match);
 
 static const struct spi_device_id td028ttec1_ids[] = {
-	{ "tpo,td028ttec1", 0},
-	{ "toppoly,td028ttec1", 0 },
+	{ "td028ttec1", 0 },
 	{ /* sentinel */ }
 };
 
-- 
Regards,

Laurent Pinchart

