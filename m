Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DCA416843B
	for <lists+linux-omap@lfdr.de>; Fri, 21 Feb 2020 17:56:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726387AbgBUQ4X (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 Feb 2020 11:56:23 -0500
Received: from muru.com ([72.249.23.125]:56702 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726132AbgBUQ4X (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 21 Feb 2020 11:56:23 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 8B7F7807E;
        Fri, 21 Feb 2020 16:57:06 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>,
        Lee Jones <lee.jones@linaro.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Pavel Machek <pavel@ucw.cz>
Subject: [GIT PULL] Fix LCD backlight issue for droid4
Date:   Fri, 21 Feb 2020 08:55:55 -0800
Message-Id: <pull-1582303901-96693@atomide.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.6/droid4-lcd-fix-signed

for you to fetch changes up to 10dc62d0ae4167770e9ab150fc1ab55baa82e010:

  ARM: dts: droid4: Configure LED backlight for lm3532 (2020-02-20 06:51:13 -0800)

----------------------------------------------------------------
Fix LCD backlight issue for droid4 for v5.6

There was a bit of an integration glitch with the LED backlight series.
The LED related parts got merged into v5.6-rc1, but the actual backlight
driver got left out.

This caused an issue on at least droid4 where the LCD backlight can not
yet be enabled automatically. And the LCD backlight can no longer be
enabled manually either via sysfs.

The integration glitch happened because some pending comments from me.
There was some confusion on which device tree property we should use for
the default brightness property.

After discussing how to fix this on the mailing lists, we came to the
conclusion that it's best to fix this issue properly by adding the
missing driver.

The other solutions would mean backpedaling and try to come up with some
temporary solution that really does not solve the issue for users. The
patch for led_bl.c has been around for quite a while and tested by many
users and was assumed to be merged as part of the LED backlight series.

For the brightness property to use, we ended up using the more common
"default-brightness-level" rather than "default-brightness" used by
some backlight drivers.

----------------------------------------------------------------
Tomi Valkeinen (1):
      backlight: add led-backlight driver

Tony Lindgren (1):
      ARM: dts: droid4: Configure LED backlight for lm3532

 arch/arm/boot/dts/motorola-mapphone-common.dtsi |  13 +-
 arch/arm/configs/omap2plus_defconfig            |   1 +
 drivers/video/backlight/Kconfig                 |   7 +
 drivers/video/backlight/Makefile                |   1 +
 drivers/video/backlight/led_bl.c                | 260 ++++++++++++++++++++++++
 5 files changed, 280 insertions(+), 2 deletions(-)
 create mode 100644 drivers/video/backlight/led_bl.c
