Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90ABA222326
	for <lists+linux-omap@lfdr.de>; Thu, 16 Jul 2020 14:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728902AbgGPM5n (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Jul 2020 08:57:43 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45326 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728440AbgGPM5m (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 Jul 2020 08:57:42 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 3DAB32A570A
Received: by jupiter.universe (Postfix, from userid 1000)
        id CE51E480105; Thu, 16 Jul 2020 14:57:37 +0200 (CEST)
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
Subject: [PATCHv2 4/4] ARM: dts: omap4-droid4: add panel orientation
Date:   Thu, 16 Jul 2020 14:57:33 +0200
Message-Id: <20200716125733.83654-5-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200716125733.83654-1-sebastian.reichel@collabora.com>
References: <20200716125733.83654-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add information about panel orientation, so that the
system boots into a properly rotated shell.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm/boot/dts/motorola-mapphone-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/motorola-mapphone-common.dtsi b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
index 0e22fdfa42aa..e672e714fcbe 100644
--- a/arch/arm/boot/dts/motorola-mapphone-common.dtsi
+++ b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
@@ -218,6 +218,7 @@ lcd0: panel@0 {
 
 		width-mm = <50>;
 		height-mm = <89>;
+		rotation = <90>;
 
 		panel-timing {
 			clock-frequency = <0>;		/* Calculated by dsi */
-- 
2.27.0

