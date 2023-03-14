Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCF386B9DBD
	for <lists+linux-omap@lfdr.de>; Tue, 14 Mar 2023 19:00:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbjCNSAf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 14 Mar 2023 14:00:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjCNSAd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 14 Mar 2023 14:00:33 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7682698874
        for <linux-omap@vger.kernel.org>; Tue, 14 Mar 2023 11:00:32 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pc8wi-0000gB-Vp; Tue, 14 Mar 2023 19:00:25 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pc8wh-0047yB-Ls; Tue, 14 Mar 2023 19:00:23 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pc8wg-004sLM-Dx; Tue, 14 Mar 2023 19:00:22 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Baolin Wang <baolin.wang@linux.alibaba.com>,
        linux-omap@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] hwspinlock: Convert to platform remove callback returning void
Date:   Tue, 14 Mar 2023 19:00:20 +0100
Message-Id: <20230314180020.2865734-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1761; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=JYzczQ8X/PT/2KeGNGW0QPjekxWwXUc3X/tHSI7Ug8Y=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkELYsTuGZVKio8vyB/NDu7iicE4b4nR1fe9yYv kgSV2g0oI+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBC2LAAKCRDB/BR4rcrs CTkOB/4yAo7CnjbeFhcb4uo5BHim68SP/gpJormExr8rdNFTIEDGs6PqskLFxm84Gb+zyQm4Nlf jkiPbknG27+B84e2ai9iX6wu5vpCPo8qW5E9unr2Y3p6e1DXT42RQGAlyMme0R3v0wTw7HcufBP LCQi690rSlCAkNM+udStLOVEoS5M6w1mITliHXemFqSZM4hlWn8kP0SagjgSdSnVkO3nVTxBT34 byf9za6Hv04ga0fHEyCjVmQHaDv5jRhurCCFhBRM77f39M8wATO2sny1pf6B9RKeNJwTW5Kgffy rk9moLloqso65m2eyzgQYoBZeXDDYH6mdLxvd3y5HhQASE4M
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-omap@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello,

this patch series adapts the platform drivers below drivers/hwspinlock to use
the .remove_new() callback. Compared to the traditional .remove() callback
.remove_new() returns no value. This is a good thing because the driver core
doesn't (and cannot) cope for errors during remove. The only effect of a
non-zero return value in .remove() is that the driver core emits a warning. The
device is removed anyhow and an early return from .remove() usually yields a
resource leak.

By changing the remove callback to return void driver authors cannot reasonably
assume any more that there is some kind of cleanup later.

The omap driver could return -EBUSY. This is first changed to return
zero to drop the duplicated error message. I assume this error path is
dangerous. For sure the platform device binding goes away and so
devm_platform_ioremap_resource is undone. So probably the user of the
hwspinlock that prevented its removal will soon access an unmapped
virtual address resulting in an oops. This is true with and without my
patch. IMHO hwspin_lock_unregister() shouldn't return an error code but
care that all users go away and then return void.

After this change the two platform_drivers can be trivially converted to
.remove_new().

Best regards
Uwe

Uwe Kleine-König (3):
  hwspinlock: omap: Emit only one error message for errors in .remove()
  hwspinlock: omap: Convert to platform remove callback returning void
  hwspinlock: u8500: Convert to platform remove callback returning void

 drivers/hwspinlock/omap_hwspinlock.c | 8 +++-----
 drivers/hwspinlock/u8500_hsem.c      | 6 ++----
 2 files changed, 5 insertions(+), 9 deletions(-)

base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
-- 
2.39.2

