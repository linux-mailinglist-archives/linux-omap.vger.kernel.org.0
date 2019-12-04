Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD4A6112E67
	for <lists+linux-omap@lfdr.de>; Wed,  4 Dec 2019 16:28:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728330AbfLDP2u (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 4 Dec 2019 10:28:50 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:60044 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728209AbfLDP2u (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 4 Dec 2019 10:28:50 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1icWa7-0000L2-JP; Wed, 04 Dec 2019 15:28:47 +0000
From:   Colin King <colin.king@canonical.com>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomi Valkeinen <tomi.valkeinen@nokia.com>,
        linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] OMAP: DSS2: remove non-zero check on variable r
Date:   Wed,  4 Dec 2019 15:28:47 +0000
Message-Id: <20191204152847.1435188-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable r is being initialized to zero, so the check of a non-zero
rv is redundant and can be removed.

It appears that the previous case statements set r to be -EINVAL
and the "Fallthrough" comment afterwards suggested it was going
to fall through to this non-zero check but won't because of the
break statement. Remove the confusion by removing the Fallthrough
comment too.

Addresses-Coverity: ("Logically dead code")
Fixes: b39a982ddecf ("OMAP: DSS2: omapfb driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/video/fbdev/omap2/omapfb/omapfb-main.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/omapfb-main.c b/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
index 858c2c011d19..a2a2c1b205d9 100644
--- a/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
+++ b/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
@@ -1154,16 +1154,12 @@ static int _setcolreg(struct fb_info *fbi, u_int regno, u_int red, u_int green,
 		   r = fbdev->ctrl->setcolreg(regno, red, green, blue,
 		   transp, update_hw_pal);
 		   */
-		/* Fallthrough */
 		r = -EINVAL;
 		break;
 	case OMAPFB_COLOR_RGB565:
 	case OMAPFB_COLOR_RGB444:
 	case OMAPFB_COLOR_RGB24P:
 	case OMAPFB_COLOR_RGB24U:
-		if (r != 0)
-			break;
-
 		if (regno < 16) {
 			u32 pal;
 			pal = ((red >> (16 - var->red.length)) <<
-- 
2.24.0

