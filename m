Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16A7A3B9297
	for <lists+linux-omap@lfdr.de>; Thu,  1 Jul 2021 16:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232422AbhGAODQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 1 Jul 2021 10:03:16 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:9317 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231342AbhGAODQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 1 Jul 2021 10:03:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625148030;
    s=strato-dkim-0002; d=goldelico.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=jdajgCtb8y8FBueJJb4PCu1MS3sUAvqVQcmmtwiQ4ug=;
    b=gcansIWQTjqc6gmrNeOZs+66+/NogM4f4GQaBp4cbqd8X2/zV0RgJIClWznE1pKz4b
    kdS9cJCdP1DSLg/YzZrn6Zg3kWARrKMVq+HdnKATfTXXRkPaKCYzkd1LMDtbimHLdjMp
    ktzcwGvchwnz25Yrx4nxzwGLlWQz6IV53oOZnjnOmMFNNnzLtwg0r9qCqsaUNh6BY+X9
    gqu8SuCWaogGucQEo3LGVNVI1l4G+4yCetQNVf+fSgJZt0kX1BIGu3q7tdcVq2LXSWfI
    vVoH05kMF7exnkFDdOoPkmRgOzxWoUigvq2leuJDUvPMIndOrZeMtk9Yh5Q0GKcxkJK7
    SaqA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH7F/39n3sa"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 47.28.1 DYNA|AUTH)
    with ESMTPSA id h06665x61E0U64w
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 1 Jul 2021 16:00:30 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Tony Lindgren <tony@atomide.com>, gg@slimlogic.co.uk,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Nishanth Menon <nm@ti.com>,
        peter.ujfalusi@gmail.com,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        letux-kernel@openphoenux.org, kernel@pyra-handheld.com,
        devicetree@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v2] omap5-board-common: remove not physically existing vdds_1v8_main fixed-regulator
Date:   Thu,  1 Jul 2021 16:00:22 +0200
Message-Id: <e836d5d98b028bdbb8805bcf79489e0df28add6c.1625148021.git.hns@goldelico.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This device tree include file describes a fixed-regulator
connecting smps7_reg output (1.8V) to some 1.8V rail and
consumers (vdds_1v8_main).

This regulator does not physically exist.

I assume it was introduced as a wrapper around smps7_reg
to provide a speaking signal name "vdds_1v8_main" as label.

This fixed-regulator without real function was not an issue
in driver code until

  Commit 98e48cd9283d ("regulator: core: resolve supply for boot-on/always-on regulators")

introduced a new check for regulator initialization which
makes Palmas regulator registration fail:

[    5.407712] ldo1: supplied by vsys_cobra
[    5.412748] ldo2: supplied by vsys_cobra
[    5.417603] palmas-pmic 48070000.i2c:palmas@48:palmas_pmic: failed to register 48070000.i2c:palmas@48:palmas_pmic regulator

The reason is that the supply-chain of regulators is too
long and goes from ldo3 through the virtual vdds_1v8_main
regulator and then back to smps7. This adds a cross-dependency
of probing Palmas regulators and the fixed-regulator which
leads to probe deferral by the new check and is no longer
resolved.

Since we do not control what device tree files including this
one reference (either &vdds_1v8_main or &smps7_reg or both)
we keep both labels for smps7 for compatibility.

Fixes: 98e48cd9283d ("regulator: core: resolve supply for boot-on/always-on regulators")
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/arm/boot/dts/omap5-board-common.dtsi | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/omap5-board-common.dtsi b/arch/arm/boot/dts/omap5-board-common.dtsi
index d8f13626cfd1..3a8f10231475 100644
--- a/arch/arm/boot/dts/omap5-board-common.dtsi
+++ b/arch/arm/boot/dts/omap5-board-common.dtsi
@@ -30,14 +30,6 @@ vsys_cobra: fixedregulator-vsys_cobra {
 		regulator-max-microvolt = <5000000>;
 	};
 
-	vdds_1v8_main: fixedregulator-vdds_1v8_main {
-		compatible = "regulator-fixed";
-		regulator-name = "vdds_1v8_main";
-		vin-supply = <&smps7_reg>;
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-	};
-
 	vmmcsd_fixed: fixedregulator-mmcsd {
 		compatible = "regulator-fixed";
 		regulator-name = "vmmcsd_fixed";
@@ -487,6 +479,7 @@ smps6_reg: smps6 {
 					regulator-boot-on;
 				};
 
+				vdds_1v8_main:
 				smps7_reg: smps7 {
 					/* VDDS_1v8_OMAP over VDDS_1v8_MAIN */
 					regulator-name = "smps7";
-- 
2.31.1

