Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A148D1ACA
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2019 23:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731616AbfJIVV7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Oct 2019 17:21:59 -0400
Received: from muru.com ([72.249.23.125]:36566 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731155AbfJIVV6 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 9 Oct 2019 17:21:58 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 9E3808162;
        Wed,  9 Oct 2019 21:22:31 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Bin Liu <b-liu@ti.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>, Jacopo Mondi <jacopo@jmondi.org>,
        Marcel Partap <mpartap@gmx.net>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Michael Scott <hashcode0f@gmail.com>,
        NeKit <nekit1000@gmail.com>, Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 1/7] usb: musb: omap2430: Get rid of musb .set_vbus for omap2430 glue
Date:   Wed,  9 Oct 2019 14:21:38 -0700
Message-Id: <20191009212145.28495-2-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191009212145.28495-1-tony@atomide.com>
References: <20191009212145.28495-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We currently have musb_set_vbus() called from two different paths. Mostly
it gets called from the USB PHY via omap_musb_set_mailbox(), but in some
cases it can get also called from musb_stage0_irq() rather via .set_vbus:

(musb_set_host [musb_hdrc])
(omap2430_musb_set_vbus [omap2430])
(musb_stage0_irq [musb_hdrc])
(musb_interrupt [musb_hdrc])
(omap2430_musb_interrupt [omap2430])

This is racy and will not work with introducing generic helper functions
for musb_set_host() and musb_set_peripheral(). We want to get rid of the
busy loops in favor of usleep_range().

Let's just get rid of .set_vbus for omap2430 glue layer and let the PHY
code handle VBUS with musb_set_vbus(). Note that in the follow-up patch
we can completely remove omap2430_musb_set_vbus(), but let's do it in a
separate patch as this change may actually turn out to be needed as a
fix.

Reported-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/usb/musb/omap2430.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/musb/omap2430.c b/drivers/usb/musb/omap2430.c
--- a/drivers/usb/musb/omap2430.c
+++ b/drivers/usb/musb/omap2430.c
@@ -361,8 +361,6 @@ static const struct musb_platform_ops omap2430_ops = {
 	.init		= omap2430_musb_init,
 	.exit		= omap2430_musb_exit,
 
-	.set_vbus	= omap2430_musb_set_vbus,
-
 	.enable		= omap2430_musb_enable,
 	.disable	= omap2430_musb_disable,
 
-- 
2.23.0
