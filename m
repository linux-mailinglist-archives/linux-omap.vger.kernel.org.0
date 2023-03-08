Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9BAD6B0398
	for <lists+linux-omap@lfdr.de>; Wed,  8 Mar 2023 11:01:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbjCHKBO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 8 Mar 2023 05:01:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbjCHKBB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 8 Mar 2023 05:01:01 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06F883D0B4
        for <linux-omap@vger.kernel.org>; Wed,  8 Mar 2023 02:01:00 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZqao-0004X7-S0; Wed, 08 Mar 2023 11:00:18 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZqam-002gVd-7f; Wed, 08 Mar 2023 11:00:16 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZqal-003FiR-I2; Wed, 08 Mar 2023 11:00:15 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Russell King <linux@armlinux.org.uk>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Mark Brown <broonie@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>
Cc:     linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-omap@vger.kernel.org
Subject: [PATCH 0/8] ARM: Convert to platform remove callback returning void
Date:   Wed,  8 Mar 2023 11:00:04 +0100
Message-Id: <20230308100012.2539189-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2224; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=DVPEEwt+Erg75sOUx0iNnz/D3NpKF7CihLVGXzCiWb0=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkCFyLD7VADLR2kkd0Pgmmy9Y2Bd3jvm8lEmKH7 igU/SF21vyJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAhciwAKCRDB/BR4rcrs CYfoB/9JOM3bHtBzOCxYiJ37p9JehJ7dCH0P7PBTARFUvN/Ixh2ZgxCbEWN7GVOIuBcSgZHbknj /06dGCHBQ9JX3xGb+QZHPQmZ61Ab2ZCMe4/QV3gH1KdGCeLn3U1hMXiKtpB1hwkPBo0KgQm/Jt3 Dlr8h+3yWU59bKwSSVXO2rb2siAUAYnXk90sQjYC2AwAAj6UnIiEcrRCwwB5zjlffF37WUfwdS6 RtuUjDOy3ZcdgZsbIHO2DQKcB/OkIOw/ZRTOhGAg50FCy3/bLeEclJwTaqFY5p/nUyeInQs5nz3 3fiJJ9UBua9/LtG7m8PodXn4p1O6PngWIPNF29huWhqo0+g3
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

this patch series adapts the platform drivers below arch/arm to use the
.remove_new() callback. Compared to the traditional .remove() callback
.remove_new() returns no value. This is a good thing because the driver core
doesn't (and cannot) cope for errors during remove. The only effect of a
non-zero return value in .remove() is that the driver core emits a warning. The
device is removed anyhow and an early return from .remove() usually yields a
resource leak.

By changing the remove callback to return void driver authors cannot
reasonably assume any more that there is some kind of cleanup later.

All drivers in arch/arm returned zero unconditionally in their remove callback,
so they could all be converted trivially to .remove_new().

Note that this series depends on commit 5c5a7680e67b ("platform: Provide
a remove callback that returns no value") which is included in v6.3-rc1.

I'm unsure who will pick up this series. Will it go as a whole via arm-soc? Or
will the individual maintainers pick it up?

Best regards
Uwe

Uwe Kleine-König (8):
  ARM: locomo: Convert to platform remove callback returning void
  ARM: sa1111: Convert to platform remove callback returning void
  ARM: scoop: Convert to platform remove callback returning void
  ARM: imx: mmdc: Convert to platform remove callback returning void
  ARM: omap1: omap-dma: Convert to platform remove callback returning
    void
  ARM: pxa: sharpsl_pm: Convert to platform remove callback returning
    void
  ARM: sa1100: jornada720_ssp: Convert to platform remove callback
    returning void
  ARM: sa1100: neponset: Convert to platform remove callback returning
    void

 arch/arm/common/locomo.c              | 6 ++----
 arch/arm/common/sa1111.c              | 6 ++----
 arch/arm/common/scoop.c               | 6 ++----
 arch/arm/mach-imx/mmdc.c              | 5 ++---
 arch/arm/mach-omap1/omap-dma.c        | 6 ++----
 arch/arm/mach-pxa/sharpsl_pm.c        | 6 ++----
 arch/arm/mach-sa1100/jornada720_ssp.c | 5 ++---
 arch/arm/mach-sa1100/neponset.c       | 6 ++----
 8 files changed, 16 insertions(+), 30 deletions(-)

base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
-- 
2.39.1

