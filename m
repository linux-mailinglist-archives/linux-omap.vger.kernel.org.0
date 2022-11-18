Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B77862F2C5
	for <lists+linux-omap@lfdr.de>; Fri, 18 Nov 2022 11:42:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241106AbiKRKmo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Nov 2022 05:42:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229743AbiKRKmn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Nov 2022 05:42:43 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 171CD942FB
        for <linux-omap@vger.kernel.org>; Fri, 18 Nov 2022 02:42:43 -0800 (PST)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 1795F8125;
        Fri, 18 Nov 2022 10:32:35 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sicelo Mhlongo <absicsz@gmail.com>
Subject: [PATCH 1/3] bus: ti-sysc: Add otg quirk flags for omap3 musb
Date:   Fri, 18 Nov 2022 12:42:24 +0200
Message-Id: <20221118104226.46223-2-tony@atomide.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118104226.46223-1-tony@atomide.com>
References: <20221118104226.46223-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

To prepare for probing omap3 musb with ti-sysc, these quirk flags are
needed similar to what we have for omap4.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
Cc: Sicelo Mhlongo <absicsz@gmail.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -1610,6 +1610,12 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 		   SYSC_QUIRK_SWSUP_SIDLE | SYSC_QUIRK_SWSUP_MSTANDBY),
 	SYSC_QUIRK("usb_host_hs", 0, 0, 0x10, -ENODEV, 0x50700101, 0xffffffff,
 		   SYSC_QUIRK_SWSUP_SIDLE | SYSC_QUIRK_SWSUP_MSTANDBY),
+	SYSC_QUIRK("usb_otg_hs", 0, 0x400, 0x404, 0x408, 0x00000033,
+		   0xffffffff, SYSC_QUIRK_SWSUP_SIDLE | SYSC_QUIRK_SWSUP_MSTANDBY |
+		   SYSC_MODULE_QUIRK_OTG),
+	SYSC_QUIRK("usb_otg_hs", 0, 0x400, 0x404, 0x408, 0x00000040,
+		   0xffffffff, SYSC_QUIRK_SWSUP_SIDLE | SYSC_QUIRK_SWSUP_MSTANDBY |
+		   SYSC_MODULE_QUIRK_OTG),
 	SYSC_QUIRK("usb_otg_hs", 0, 0x400, 0x404, 0x408, 0x00000050,
 		   0xffffffff, SYSC_QUIRK_SWSUP_SIDLE | SYSC_QUIRK_SWSUP_MSTANDBY |
 		   SYSC_MODULE_QUIRK_OTG),
-- 
2.38.1
