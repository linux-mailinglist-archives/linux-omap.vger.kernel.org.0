Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 064B96F6A1
	for <lists+linux-omap@lfdr.de>; Mon, 22 Jul 2019 01:25:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726238AbfGUXZM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 21 Jul 2019 19:25:12 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:57924 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726230AbfGUXZL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 21 Jul 2019 19:25:11 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 42B49284F69
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org, kernel@collabora.com,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH] ARM: dts: am335x-cm-t335: Remove regulator-boot-off property
Date:   Sun, 21 Jul 2019 20:24:54 -0300
Message-Id: <20190721232455.13709-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This property was never supported upstream. Get rid of it.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 arch/arm/boot/dts/am335x-cm-t335.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/am335x-cm-t335.dts b/arch/arm/boot/dts/am335x-cm-t335.dts
index ceecbfd29d2c..1fe3b566ba3d 100644
--- a/arch/arm/boot/dts/am335x-cm-t335.dts
+++ b/arch/arm/boot/dts/am335x-cm-t335.dts
@@ -44,7 +44,6 @@
 		regulator-name = "vwlan_fixed";
 		gpio = <&gpio0 20 GPIO_ACTIVE_HIGH>; /* gpio0_20 */
 		enable-active-high;
-		regulator-boot-off;
 	};
 
 	backlight {
-- 
2.22.0

