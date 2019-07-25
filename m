Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF98074A34
	for <lists+linux-omap@lfdr.de>; Thu, 25 Jul 2019 11:46:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729018AbfGYJp7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 25 Jul 2019 05:45:59 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:49557 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728748AbfGYJp6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 25 Jul 2019 05:45:58 -0400
X-Originating-IP: 92.137.69.152
Received: from localhost (alyon-656-1-672-152.w92-137.abo.wanadoo.fr [92.137.69.152])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id DE75820008;
        Thu, 25 Jul 2019 09:45:55 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH 1/3] dt-bindings: regulator: twl6030: Add retain-on-reset property
Date:   Thu, 25 Jul 2019 11:45:40 +0200
Message-Id: <20190725094542.16547-2-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190725094542.16547-1-gregory.clement@bootlin.com>
References: <20190725094542.16547-1-gregory.clement@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

During reset the VMMC regulator doesn't reach 0V and only drops to
1.8V, furthermore the pulse width is under 200us whereas the SD
specification expect 1ms.

For this 2 reasons being able to no reset at all the VMMC during warm
reset and keep the current voltage is a good workaround. The TWL6030
allows this but needs to be aware of it and this configuration should
also be shared with the bootloader.

This is the purpose of this new property: ti,retain-on-reset

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 .../devicetree/bindings/regulator/twl-regulator.txt        | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/twl-regulator.txt b/Documentation/devicetree/bindings/regulator/twl-regulator.txt
index 74a91c4f8530..549f80436deb 100644
--- a/Documentation/devicetree/bindings/regulator/twl-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/twl-regulator.txt
@@ -71,3 +71,10 @@ Example:
 		regulator-min-microvolt  = <1000000>;
 		regulator-max-microvolt  = <3000000>;
 	};
+
+For twl6030 regulators/LDOs:
+
+ - ti,retain-on-reset: Does not turn off the supplies during warm
+                       reset. Could be needed for VMMC, as TWL6030
+                       reset sequence for this signal does not comply
+                       with the SD specification.
-- 
2.20.1

