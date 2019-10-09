Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70A75D1ACC
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2019 23:22:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731751AbfJIVWA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Oct 2019 17:22:00 -0400
Received: from muru.com ([72.249.23.125]:36570 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731072AbfJIVWA (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 9 Oct 2019 17:22:00 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 6174181CA;
        Wed,  9 Oct 2019 21:22:33 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Bin Liu <b-liu@ti.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Marcel Partap <mpartap@gmx.net>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Michael Scott <hashcode0f@gmail.com>,
        NeKit <nekit1000@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 2/7] usb: musb: omap2430: Wait on enable to avoid babble
Date:   Wed,  9 Oct 2019 14:21:39 -0700
Message-Id: <20191009212145.28495-3-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191009212145.28495-1-tony@atomide.com>
References: <20191009212145.28495-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can babble interrupt if we attempt to switch to USB host mode too
soon after enabling musb. Let's fix the issue by waiting a bit in
runtime_resume.

Cc: Jacopo Mondi <jacopo@jmondi.org>
Cc: Marcel Partap <mpartap@gmx.net>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Michael Scott <hashcode0f@gmail.com>
Cc: NeKit <nekit1000@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/usb/musb/omap2430.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/musb/omap2430.c b/drivers/usb/musb/omap2430.c
--- a/drivers/usb/musb/omap2430.c
+++ b/drivers/usb/musb/omap2430.c
@@ -550,6 +550,9 @@ static int omap2430_runtime_resume(struct device *dev)
 	musb_writel(musb->mregs, OTG_INTERFSEL,
 		    musb->context.otg_interfsel);
 
+	/* Wait for musb to get oriented. Otherwise we can get babble */
+	usleep_range(200000, 250000);
+
 	return 0;
 }
 
-- 
2.23.0
