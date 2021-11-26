Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 422C245EFFE
	for <lists+linux-omap@lfdr.de>; Fri, 26 Nov 2021 15:37:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348296AbhKZOk1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 26 Nov 2021 09:40:27 -0500
Received: from mslow1.mail.gandi.net ([217.70.178.240]:44199 "EHLO
        mslow1.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377766AbhKZOiZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 26 Nov 2021 09:38:25 -0500
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 092ACD2E8C
        for <linux-omap@vger.kernel.org>; Fri, 26 Nov 2021 14:26:38 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id DA1D7FF810;
        Fri, 26 Nov 2021 14:24:15 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     bcousson@baylibre.com, Tony Lindgren <tony@atomide.com>
Cc:     Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        linux-omap@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        <linux-kernel@vger.kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [RESEND v6 3/3] ARM: dts: am437x-gp-evm: enable ADC1
Date:   Fri, 26 Nov 2021 15:24:13 +0100
Message-Id: <20211126142413.354770-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211126142413.354770-1-miquel.raynal@bootlin.com>
References: <20211126142413.354770-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

ADC0 and ADC1 pins are available on external connector J22.

Enable ADC1 which was missing.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 arch/arm/boot/dts/am437x-gp-evm.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/am437x-gp-evm.dts b/arch/arm/boot/dts/am437x-gp-evm.dts
index c2e4896076e7..4416ddb559e4 100644
--- a/arch/arm/boot/dts/am437x-gp-evm.dts
+++ b/arch/arm/boot/dts/am437x-gp-evm.dts
@@ -775,6 +775,14 @@ adc {
 	};
 };
 
+&magadc {
+	status = "okay";
+
+	adc {
+		ti,adc-channels = <0 1 2 3 4 5 6 7>;
+	};
+};
+
 &ecap0 {
 	status = "okay";
 	pinctrl-names = "default";
-- 
2.27.0

