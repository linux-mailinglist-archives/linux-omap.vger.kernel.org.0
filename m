Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A667289F41
	for <lists+linux-omap@lfdr.de>; Mon, 12 Aug 2019 15:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728876AbfHLNKR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 12 Aug 2019 09:10:17 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:40782 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728861AbfHLNKQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 12 Aug 2019 09:10:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=abqDwA1+NPvPfsymvfg9Fw4bxsOpFClMApymY/K0pG8=; b=IMbKDpz9B+Um
        VPrxqxZNvtzJUDMsMN8PJ+ex2S0COqBaXphq2Njipkm+u2/TZpZCH7+eDDjJKlIkyfuiKJL0gkwMN
        7tRxDvLVsO/ZvURrleKY3hQsSuJWuup5cvnnlA7h/tAp33QmlNi1MnEmDCOadzTjoDllsvQvFGVKs
        5R0WY=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1hxA5T-0001R0-Bv; Mon, 12 Aug 2019 13:10:11 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 7FA002740CED; Mon, 12 Aug 2019 14:10:09 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Gregory CLEMENT <gregory.clement@bootlin.com>
Cc:     devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Tony Lindgren <tony@atomide.com>
Subject: Applied "dt-bindings: regulator: twl6030: Add retain-on-reset property" to the regulator tree
In-Reply-To: <20190725094542.16547-2-gregory.clement@bootlin.com>
X-Patchwork-Hint: ignore
Message-Id: <20190812131009.7FA002740CED@ypsilon.sirena.org.uk>
Date:   Mon, 12 Aug 2019 14:10:09 +0100 (BST)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The patch

   dt-bindings: regulator: twl6030: Add retain-on-reset property

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 906c4d5c939b4d8ebe7be357121271df7b8c9582 Mon Sep 17 00:00:00 2001
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Thu, 25 Jul 2019 11:45:40 +0200
Subject: [PATCH] dt-bindings: regulator: twl6030: Add retain-on-reset property

During reset the VMMC regulator doesn't reach 0V and only drops to
1.8V, furthermore the pulse width is under 200us whereas the SD
specification expect 1ms.

For this 2 reasons being able to no reset at all the VMMC during warm
reset and keep the current voltage is a good workaround. The TWL6030
allows this but needs to be aware of it and this configuration should
also be shared with the bootloader.

This is the purpose of this new property: ti,retain-on-reset

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
Link: https://lore.kernel.org/r/20190725094542.16547-2-gregory.clement@bootlin.com
Signed-off-by: Mark Brown <broonie@kernel.org>
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

