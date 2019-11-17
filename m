Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 528F7FF841
	for <lists+linux-omap@lfdr.de>; Sun, 17 Nov 2019 08:11:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725978AbfKQHLF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 17 Nov 2019 02:11:05 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50904 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbfKQHLE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 17 Nov 2019 02:11:04 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 9647528FCB7
Received: by earth.universe (Postfix, from userid 1000)
        id 6D9463C0CB5; Sun, 17 Nov 2019 03:41:40 +0100 (CET)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [RFCv1 41/42] ARM: dts: omap4-droid4: add panel compatible
Date:   Sun, 17 Nov 2019 03:40:27 +0100
Message-Id: <20191117024028.2233-42-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191117024028.2233-1-sebastian.reichel@collabora.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add Droid 4 specific compatible value in addition to the
generic one, so that we have the ability to add panel
specific quirks in the future.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm/boot/dts/omap4-droid4-xt894.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/omap4-droid4-xt894.dts b/arch/arm/boot/dts/omap4-droid4-xt894.dts
index 6af0a9288940..d5668998aa9d 100644
--- a/arch/arm/boot/dts/omap4-droid4-xt894.dts
+++ b/arch/arm/boot/dts/omap4-droid4-xt894.dts
@@ -203,7 +203,7 @@
 	};
 
 	lcd0: panel@0 {
-		compatible = "panel-dsi-cm";
+		compatible = "motorola,droid4-panel", "panel-dsi-cm";
 		reg = <0>;
 		label = "lcd0";
 		vddi-supply = <&lcd_regulator>;
-- 
2.24.0

