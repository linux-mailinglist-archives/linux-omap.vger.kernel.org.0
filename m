Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 467EEC9FA8
	for <lists+linux-omap@lfdr.de>; Thu,  3 Oct 2019 15:42:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730568AbfJCNmU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Oct 2019 09:42:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:53322 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729655AbfJCNmE (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 3 Oct 2019 09:42:04 -0400
Received: from jupiter.universe (dyndsl-037-138-174-173.ewe-ip-backbone.de [37.138.174.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 88A5920865;
        Thu,  3 Oct 2019 13:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570110123;
        bh=2YcAnzBdAV7qyRpwx2YdNckb96mGyoFb2wx9qLfpgi4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fiUS24t2tYDYlclxqzqVdyh8KBgheC5Zjm9ZeVnEGKotElY8AsuN5+F97TTpm160M
         bW9Qbo/J6ohiBwEadZ7Ahf/PQZFzpnfhdZ8t0dlQbYBTTA7sH+U90jo4Zvo6IWRo7Z
         wFHvdYgvjPV/mTH7NeRas7dxJAJxJ+1L/k5xGwLU=
Received: by jupiter.universe (Postfix, from userid 1000)
        id 8F9CE4800C3; Thu,  3 Oct 2019 15:42:01 +0200 (CEST)
From:   Sebastian Reichel <sre@kernel.org>
To:     Sebastian Reichel <sre@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Tony Lindgren <tony@atomide.com>
Cc:     Adam Ford <aford173@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        linux-bluetooth@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCHv2 2/4] ARM: dts: IGEP: Add WiLink UART node
Date:   Thu,  3 Oct 2019 15:41:45 +0200
Message-Id: <20191003134147.9458-3-sre@kernel.org>
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

Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm/boot/dts/omap3-igep0020-rev-f.dts | 8 ++++++++
 arch/arm/boot/dts/omap3-igep0030-rev-g.dts | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/omap3-igep0020-rev-f.dts b/arch/arm/boot/dts/omap3-igep0020-rev-f.dts
index 03dcd05fb8a0..001decc20b3d 100644
--- a/arch/arm/boot/dts/omap3-igep0020-rev-f.dts
+++ b/arch/arm/boot/dts/omap3-igep0020-rev-f.dts
@@ -49,3 +49,11 @@
 		interrupts = <17 IRQ_TYPE_EDGE_RISING>; /* gpio 177 */
 	};
 };
+
+&uart2 {
+	bluetooth {
+		compatible = "ti,wl1835-st";
+		enable-gpios = <&gpio5 9 GPIO_ACTIVE_HIGH>; /* gpio 137 */
+		max-speed = <300000>;
+	};
+};
diff --git a/arch/arm/boot/dts/omap3-igep0030-rev-g.dts b/arch/arm/boot/dts/omap3-igep0030-rev-g.dts
index 060acd1e803a..9a8975799e16 100644
--- a/arch/arm/boot/dts/omap3-igep0030-rev-g.dts
+++ b/arch/arm/boot/dts/omap3-igep0030-rev-g.dts
@@ -71,3 +71,11 @@
 		interrupts = <8 IRQ_TYPE_EDGE_RISING>; /* gpio 136 */
 	};
 };
+
+&uart2 {
+	bluetooth {
+		compatible = "ti,wl1835-st";
+		enable-gpios = <&gpio5 9 GPIO_ACTIVE_HIGH>; /* gpio 137 */
+		max-speed = <300000>;
+	};
+};
-- 
2.23.0

