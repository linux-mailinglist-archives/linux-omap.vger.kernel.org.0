Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 806BDC9F9B
	for <lists+linux-omap@lfdr.de>; Thu,  3 Oct 2019 15:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730524AbfJCNmE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Oct 2019 09:42:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:53344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730509AbfJCNmE (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 3 Oct 2019 09:42:04 -0400
Received: from jupiter.universe (dyndsl-037-138-174-173.ewe-ip-backbone.de [37.138.174.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9D3ED215EA;
        Thu,  3 Oct 2019 13:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570110123;
        bh=05Bgr78pOG3wspZTxe4PBM+L/UnEye5T6LMVFGmo/lc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pLRN3JpLTN8QlfpSY7S71yhj3/ePXdU7sXG/Q+tfq2Lb16M9eksoMZvb6RoZgoaXE
         05YyqroJnHv2rrYgFcQqiezzYi/mAGEBwdo7keIXA6YsyhIV5z4TMjyLeSFFCBdP2o
         UibGe9SIOTiW02XLVtOiQUpyz/U5LsY/owsh3QLA=
Received: by jupiter.universe (Postfix, from userid 1000)
        id 8E5504800BE; Thu,  3 Oct 2019 15:42:01 +0200 (CEST)
From:   Sebastian Reichel <sre@kernel.org>
To:     Sebastian Reichel <sre@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Tony Lindgren <tony@atomide.com>
Cc:     Adam Ford <aford173@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        linux-bluetooth@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCHv2 1/4] ARM: dts: LogicPD Torpedo: Add WiLink UART node
Date:   Thu,  3 Oct 2019 15:41:44 +0200
Message-Id: <20191003134147.9458-2-sre@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191003134147.9458-1-sre@kernel.org>
References: <20191003134147.9458-1-sre@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Sebastian Reichel <sebastian.reichel@collabora.com>

Add a node for the UART part of WiLink chip.

This is compile tested only!

Cc: Adam Ford <aford173@gmail.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts b/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts
index 18c27e85051f..c34ba0ef8b4d 100644
--- a/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts
+++ b/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts
@@ -50,6 +50,14 @@
 	};
 };
 
+&uart2 {
+	bluetooth {
+		compatible = "ti,wl1283-st";
+		enable-gpios = <&gpio6 2 GPIO_ACTIVE_HIGH>; /* gpio 162 */
+		max-speed = <3000000>;
+	};
+};
+
 &omap3_pmx_core {
 	mmc3_pins: pinmux_mm3_pins {
 		pinctrl-single,pins = <
-- 
2.23.0

