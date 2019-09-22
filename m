Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1F01BA38B
	for <lists+linux-omap@lfdr.de>; Sun, 22 Sep 2019 19:57:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388276AbfIVR5o (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 22 Sep 2019 13:57:44 -0400
Received: from muru.com ([72.249.23.125]:34162 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388220AbfIVR5o (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 22 Sep 2019 13:57:44 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 6DA2C804F;
        Sun, 22 Sep 2019 17:58:16 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: omap2plus_defconfig: Enable more droid4 devices as loadable modules
Date:   Sun, 22 Sep 2019 10:57:40 -0700
Message-Id: <20190922175740.26445-1-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Droid4 needs USB option serial driver for modem, and lm3532 for the
LCD backlight.

Note that the LCD backlight does not yet get enabled automatically,
but needs to be done manually with:

# echo 50 > /sys/class/leds/lm3532::backlight/brightness

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/configs/omap2plus_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -429,6 +429,7 @@ CONFIG_USB_SERIAL_GENERIC=y
 CONFIG_USB_SERIAL_SIMPLE=m
 CONFIG_USB_SERIAL_FTDI_SIO=m
 CONFIG_USB_SERIAL_PL2303=m
+CONFIG_USB_SERIAL_OPTION=m
 CONFIG_USB_TEST=m
 CONFIG_NOP_USB_XCEIV=m
 CONFIG_AM335X_PHY_USB=m
@@ -466,6 +467,7 @@ CONFIG_MMC_SDHCI_OMAP=y
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=m
 CONFIG_LEDS_CPCAP=m
+CONFIG_LEDS_LM3532=m
 CONFIG_LEDS_GPIO=m
 CONFIG_LEDS_PCA963X=m
 CONFIG_LEDS_PWM=m
-- 
2.23.0
