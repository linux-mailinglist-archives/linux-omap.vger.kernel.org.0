Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C2AB20E8CE
	for <lists+linux-omap@lfdr.de>; Tue, 30 Jun 2020 01:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727817AbgF2We5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 29 Jun 2020 18:34:57 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53942 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726756AbgF2We4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 29 Jun 2020 18:34:56 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id AFBD22A134B
Received: by jupiter.universe (Postfix, from userid 1000)
        id C3430480105; Tue, 30 Jun 2020 00:34:50 +0200 (CEST)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Tony Lindgren <tony@atomide.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Merlijn Wajer <merlijn@wizzup.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCHv1 3/4] ARM: dts: omap4-droid4: add panel compatible
Date:   Tue, 30 Jun 2020 00:33:14 +0200
Message-Id: <20200629223315.118256-4-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200629223315.118256-1-sebastian.reichel@collabora.com>
References: <20200629223315.118256-1-sebastian.reichel@collabora.com>
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
 arch/arm/boot/dts/motorola-mapphone-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/motorola-mapphone-common.dtsi b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
index 4ffe461c3808..0e22fdfa42aa 100644
--- a/arch/arm/boot/dts/motorola-mapphone-common.dtsi
+++ b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
@@ -208,7 +208,7 @@ dsi1_out_ep: endpoint {
 	};
 
 	lcd0: panel@0 {
-		compatible = "panel-dsi-cm";
+		compatible = "motorola,droid4-panel", "panel-dsi-cm";
 		reg = <0>;
 		label = "lcd0";
 		vddi-supply = <&lcd_regulator>;
-- 
2.27.0

