Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4D587E378E
	for <lists+linux-omap@lfdr.de>; Tue,  7 Nov 2023 10:20:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233867AbjKGJUp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Nov 2023 04:20:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233945AbjKGJUk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 Nov 2023 04:20:40 -0500
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F4B711A
        for <linux-omap@vger.kernel.org>; Tue,  7 Nov 2023 01:20:37 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1r0IG1-0000IY-H6; Tue, 07 Nov 2023 10:20:25 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r0IG0-007FlI-5d; Tue, 07 Nov 2023 10:20:24 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r0IFz-00ENW4-S4; Tue, 07 Nov 2023 10:20:23 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Helge Deller <deller@gmx.de>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Sam Ravnborg <sam@ravnborg.org>,
        Atul Raut <rauji.raut@gmail.com>, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-omap@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Stephen Kitt <steve@sk2.org>, Rob Herring <robh@kernel.org>,
        Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH 00/22] fb: handle remove callbacks in .exit.text and convert to .remove_new
Date:   Tue,  7 Nov 2023 10:17:41 +0100
Message-ID: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4720; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=b9JMTrKqBb2VIzcV/RobzpM1TMAaE1qdU+fdXt29qgo=; b=owGbwMvMwMXY3/A7olbonx/jabUkhlQvhi09Db9nvGbZmpR6RebnDvFevVVc6RZV/QtMJLPDx K5Lx8V1MhqzMDByMciKKbLYN67JtKqSi+xc++8yzCBWJpApDFycAjCRE3M4GLocZtRMcOfpvRWl aGoQvUdZO0ZVUPKV+7QmCzGnP7a9aVvdvqsciVKq/XOxRiHrUW/Sp6nv2+f1SW++GraHYbJUhqB cwYcdgScSbd0jAgWMn/cdOfvF6d0Vza6ab5EKvj4HIrNdODSL3mbP+JvXW+swOXhfQBWbbNo/te rkozHnv5a739YTePE+UffA64PpXWe+Xzxw28FU4yyThNQP5ujVLR7WplEXXBUMmeqFwhxeT3nMM VsozOu98NO3G09XX2m9Z7xa+5ppxmfRWX0LgliKvZ+6WVzRbpRW+rdbim331T4n5pvWCQy75VoO /rFmi2zoy3cx4qrTvn4jPzHJL+M7j1zHHgbDR8qswQA=
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-omap@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello,

there are currently several platform drivers that have their .remove
callback defined in .exit.text. While this works fine, it comes with a
few downsides: Since commit f177cd0c15fc ("modpost: Don't let "driver"s
reference .exit.*") it triggers a modpost warning unless the driver
struct is marked with __refdata. None of the drivers in
drivers/video/fbdev get that right (which is understandable the warning
was added only recently). While it would be possible to add that marker,
that's also a bit ugly as this bypasses all other section checks that
modpost does. Having the remove callback in .exit.text also means that
the corresponding devices cannot be unbound at runtime which is
sometimes usefull for debugging purposes.

To fix the modpost warning I picked the progressive option and moved the
.remove() callbacks (and for two drivers also .probe()) into .text (i.e.
the default code section) and dropped .suppress_bind_attrs = true (which
is implicitly set for drivers using platform_driver_probe()).  Note even
though these patches fix a warning, it currently only happens with W=1,
so this isn't urgent and there is no need to apply these before v6.7.
The next merge window is fine (although I wouldn't object an earlier
application of course :-) The alternative is to add the __refdata
marker, ideally with a comment describing the need. (See e.g. commit
141626dbc2e6 ("rtc: sh: Mark driver struct with __refdata to prevent
section mismatch warning") .)

As a follow-up I converted the affected drivers to .remove_new(). There
was already a series doing this for the other drivers in
drivers/video/fb, but my coccinelle script missed these drivers as it
didn't handle

	.remove = __exit_p(removefunc),

. See commit 5c5a7680e67b ("platform: Provide a remove callback that
returns no value") for an extended explanation and the eventual goal. I
considered creating a second series for this conversion, but as the
patches conflict I put all patches in a single series to make it easier
to apply it.

Best regards
Uwe

Uwe Kleine-König (22):
  fb: amifb: Stop using platform_driver_probe()
  fb: atmel_lcdfb: Stop using platform_driver_probe()
  fb: omapfb/analog-tv: Don't put .remove() in .exit.text and drop
    suppress_bind_attrs
  fb: omapfb/dpi: Don't put .remove() in .exit.text and drop
    suppress_bind_attrs
  fb: omapfb/dsi-cm: Don't put .remove() in .exit.text and drop
    suppress_bind_attrs
  fb: omapfb/dvi: Don't put .remove() in .exit.text and drop
    suppress_bind_attrs
  fb: omapfb/hdmi: Don't put .remove() in .exit.text and drop
    suppress_bind_attrs
  fb: omapfb/opa362: Don't put .remove() in .exit.text and drop
    suppress_bind_attrs
  fb: omapfb/sharp-ls037v7dw01: Don't put .remove() in .exit.text and
    drop suppress_bind_attrs
  fb: omapfb/tfp410: Don't put .remove() in .exit.text and drop
    suppress_bind_attrs
  fb: omapfb/tpd12s015: Don't put .remove() in .exit.text and drop
    suppress_bind_attrs
  fb: amifb: Convert to platform remove callback returning void
  fb: atmel_lcdfb: Convert to platform remove callback returning void
  fb: omapfb/analog-tv: Convert to platform remove callback returning
    void
  fb: omapfb/dpi: Convert to platform remove callback returning void
  fb: omapfb/dsi-cm: Convert to platform remove callback returning void
  fb: omapfb/dvi: Convert to platform remove callback returning void
  fb: omapfb/hdmi: Convert to platform remove callback returning void
  fb: omapfb/opa362: Convert to platform remove callback returning void
  fb: omapfb/sharp-ls037v7dw01: Convert to platform remove callback
    returning void
  fb: omapfb/tfp410: Convert to platform remove callback returning void
  fb: omapfb/tpd12s015: Convert to platform remove callback returning
    void

 drivers/video/fbdev/amifb.c                         | 13 ++++++-------
 drivers/video/fbdev/atmel_lcdfb.c                   | 13 ++++++-------
 .../omap2/omapfb/displays/connector-analog-tv.c     |  7 ++-----
 .../fbdev/omap2/omapfb/displays/connector-dvi.c     |  7 ++-----
 .../fbdev/omap2/omapfb/displays/connector-hdmi.c    |  7 ++-----
 .../fbdev/omap2/omapfb/displays/encoder-opa362.c    |  7 ++-----
 .../fbdev/omap2/omapfb/displays/encoder-tfp410.c    |  7 ++-----
 .../fbdev/omap2/omapfb/displays/encoder-tpd12s015.c |  7 ++-----
 .../video/fbdev/omap2/omapfb/displays/panel-dpi.c   |  7 ++-----
 .../fbdev/omap2/omapfb/displays/panel-dsi-cm.c      |  7 ++-----
 .../omap2/omapfb/displays/panel-sharp-ls037v7dw01.c |  7 ++-----
 11 files changed, 30 insertions(+), 59 deletions(-)


base-commit: 3ff7a5781ceee3befb9224d29cef6e6a4766c5fe
-- 
2.42.0

