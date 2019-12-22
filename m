Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AF45128F45
	for <lists+linux-omap@lfdr.de>; Sun, 22 Dec 2019 19:17:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726733AbfLVSRV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 22 Dec 2019 13:17:21 -0500
Received: from muru.com ([72.249.23.125]:49338 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725919AbfLVSRU (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 22 Dec 2019 13:17:20 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 70D64818C;
        Sun, 22 Dec 2019 18:18:00 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-omap@vger.kernel.org, Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 3/3] phy: cpcap-usb: Drop extra write to usb2 register
Date:   Sun, 22 Dec 2019 10:17:04 -0800
Message-Id: <20191222181704.61511-3-tony@atomide.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191222181704.61511-1-tony@atomide.com>
References: <20191222181704.61511-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We are currently writing the same register twice. Let's enable the USB
PHY only at the end of the function.

Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/phy/motorola/phy-cpcap-usb.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/phy/motorola/phy-cpcap-usb.c b/drivers/phy/motorola/phy-cpcap-usb.c
--- a/drivers/phy/motorola/phy-cpcap-usb.c
+++ b/drivers/phy/motorola/phy-cpcap-usb.c
@@ -489,12 +489,6 @@ static int cpcap_usb_set_usb_mode(struct cpcap_phy_ddata *ddata)
 	if (error)
 		goto out_err;
 
-	error = regmap_update_bits(ddata->reg, CPCAP_REG_USBC2,
-				   CPCAP_BIT_USBXCVREN,
-				   CPCAP_BIT_USBXCVREN);
-	if (error)
-		goto out_err;
-
 	error = regmap_update_bits(ddata->reg, CPCAP_REG_USBC3,
 				   CPCAP_BIT_PU_SPI |
 				   CPCAP_BIT_DMPD_SPI |
-- 
2.24.1
