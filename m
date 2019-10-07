Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E324CE976
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2019 18:41:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728048AbfJGQly (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Oct 2019 12:41:54 -0400
Received: from mail.andi.de1.cc ([85.214.55.253]:43478 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727801AbfJGQly (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 7 Oct 2019 12:41:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=vcGbSzQpd1TeTGagYBxvd1qotNo5UEYywORlC/ZOCyk=; b=MLzWT1osbcLQsxYkuVhd/rxpPR
        0bGgrA/3eWQKRd02P+O8Yu0i9tyCdMXzkY4f9GZvYZnA6JqZa+XvFu7jER3oWKHdoQy3xyJA1pMtP
        azjWe5s6eyzus7uwxGCZJLJfAhRINe8h9qJuvf4ptL0cjTuhn2BkgT0X6ZoxlcG3EfS8=;
Received: from p200300ccff0a88001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0a:8800:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iHW4t-0000lS-29; Mon, 07 Oct 2019 18:41:43 +0200
Received: from andi by aktux with local (Exim 4.92)
        (envelope-from <andreas@kemnade.info>)
        id 1iHW4s-0008Fy-MJ; Mon, 07 Oct 2019 18:41:42 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
        daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        omi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, Tony Lindgren <tony@atomide.com>,
        Jyri Sarha <jsarha@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH] drm: panels: fix spi aliases of former omap panels
Date:   Mon,  7 Oct 2019 18:41:30 +0200
Message-Id: <20191007164130.31534-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0 (-)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

When the panels were moved from omap/displays/ to panel/
omapdss prefix was stripped, which cause spi modalias
to not contain the vendor-prefix anymore.

so we had e.g. in former times:
compatible=omapdss,tpo,td028ttec1 -> modalias=spi:tpo,td028ttec1
now:
compatible=tpo,td028ttec1 -> modalias=spi:td028ttec1

This is consistent with other drivers. Tested the td028ttec.c
only, but the pattern looks the same for the other ones.

Fixes: 45f16c82db7e8 ("drm/omap: displays: Remove unused panel drivers")
Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 drivers/gpu/drm/panel/panel-lg-lb035q02.c       | 2 +-
 drivers/gpu/drm/panel/panel-nec-nl8048hl11.c    | 2 +-
 drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c | 2 +-
 drivers/gpu/drm/panel/panel-sony-acx565akm.c    | 2 +-
 drivers/gpu/drm/panel/panel-tpo-td028ttec1.c    | 3 +--
 drivers/gpu/drm/panel/panel-tpo-td043mtea1.c    | 2 +-
 6 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-lb035q02.c b/drivers/gpu/drm/panel/panel-lg-lb035q02.c
index fc82a525b071b..8423684a0557e 100644
--- a/drivers/gpu/drm/panel/panel-lg-lb035q02.c
+++ b/drivers/gpu/drm/panel/panel-lg-lb035q02.c
@@ -231,7 +231,7 @@ static struct spi_driver lb035q02_driver = {
 
 module_spi_driver(lb035q02_driver);
 
-MODULE_ALIAS("spi:lgphilips,lb035q02");
+MODULE_ALIAS("spi:lb035q02");
 MODULE_AUTHOR("Tomi Valkeinen <tomi.valkeinen@ti.com>");
 MODULE_DESCRIPTION("LG.Philips LB035Q02 LCD Panel driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/panel/panel-nec-nl8048hl11.c b/drivers/gpu/drm/panel/panel-nec-nl8048hl11.c
index 299b217c83e18..71b07ef2a62dd 100644
--- a/drivers/gpu/drm/panel/panel-nec-nl8048hl11.c
+++ b/drivers/gpu/drm/panel/panel-nec-nl8048hl11.c
@@ -242,7 +242,7 @@ static struct spi_driver nl8048_driver = {
 
 module_spi_driver(nl8048_driver);
 
-MODULE_ALIAS("spi:nec,nl8048hl11");
+MODULE_ALIAS("spi:nl8048hl11");
 MODULE_AUTHOR("Erik Gilling <konkers@android.com>");
 MODULE_DESCRIPTION("NEC-NL8048HL11 Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c b/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c
index 46cd9a2501298..838d39a263f53 100644
--- a/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c
@@ -204,7 +204,7 @@ static int ls037v7dw01_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id ls037v7dw01_of_match[] = {
-	{ .compatible = "sharp,ls037v7dw01", },
+	{ .compatible = "ls037v7dw01", },
 	{ /* sentinel */ },
 };
 
diff --git a/drivers/gpu/drm/panel/panel-sony-acx565akm.c b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
index 305259b587670..a8af9340f89ee 100644
--- a/drivers/gpu/drm/panel/panel-sony-acx565akm.c
+++ b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
@@ -695,7 +695,7 @@ static struct spi_driver acx565akm_driver = {
 
 module_spi_driver(acx565akm_driver);
 
-MODULE_ALIAS("spi:sony,acx565akm");
+MODULE_ALIAS("spi:acx565akm");
 MODULE_AUTHOR("Nokia Corporation");
 MODULE_DESCRIPTION("Sony ACX565AKM LCD Panel Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c b/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
index d7b2e34626efe..3ab66b4d3ea27 100644
--- a/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
+++ b/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
@@ -375,8 +375,7 @@ static const struct of_device_id td028ttec1_of_match[] = {
 MODULE_DEVICE_TABLE(of, td028ttec1_of_match);
 
 static const struct spi_device_id td028ttec1_ids[] = {
-	{ "tpo,td028ttec1", 0},
-	{ "toppoly,td028ttec1", 0 },
+	{ "td028ttec1", 0},
 	{ /* sentinel */ }
 };
 
diff --git a/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c b/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
index 84370562910ff..7e6cf0890600c 100644
--- a/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
+++ b/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
@@ -503,7 +503,7 @@ static struct spi_driver td043mtea1_driver = {
 
 module_spi_driver(td043mtea1_driver);
 
-MODULE_ALIAS("spi:tpo,td043mtea1");
+MODULE_ALIAS("spi:td043mtea1");
 MODULE_AUTHOR("Gražvydas Ignotas <notasas@gmail.com>");
 MODULE_DESCRIPTION("TPO TD043MTEA1 Panel Driver");
 MODULE_LICENSE("GPL");
-- 
2.20.1

