Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD7DE115B5
	for <lists+linux-omap@lfdr.de>; Thu,  2 May 2019 10:47:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726191AbfEBIrz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 May 2019 04:47:55 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:55252 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbfEBIrz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 2 May 2019 04:47:55 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x428lfoD048401;
        Thu, 2 May 2019 03:47:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1556786861;
        bh=ljZGVs3PL5c7yipHfJeHIKWuZiAOsmyLXizubexGNtw=;
        h=From:To:CC:Subject:Date;
        b=UGYzq+JtX4bOHSTZQt37bQLdLJCVahH1rn8CBzy5FTbwpEBfuKiRjWtZ0IYVfgqTL
         GqbLQ2BhbDeY0/3jKdBva/CCEboHt6mjnPpRgjh6pFR5ati+b1TMJEE6bXLjLrAvJI
         FbhvqRzY4ZXo8A6wZlQEO6dAT8ug/GEAs5ZrHkh8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x428lflG099312
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 2 May 2019 03:47:41 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 2 May
 2019 03:47:41 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 2 May 2019 03:47:41 -0500
Received: from a0230074-OptiPlex-7010.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x428lbWD015763;
        Thu, 2 May 2019 03:47:38 -0500
From:   Faiz Abbas <faiz_abbas@ti.com>
To:     <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-omap@vger.kernel.org>
CC:     <mark.rutland@arm.com>, <robh+dt@kernel.org>, <tony@atomide.com>,
        <bcousson@baylibre.com>, <ulf.hansson@linaro.org>,
        <adrian.hunter@intel.com>
Subject: [PATCH] ARM: dts: am57xx-idk: Remove support for voltage switching for SD card
Date:   Thu, 2 May 2019 14:17:48 +0530
Message-ID: <20190502084748.22518-1-faiz_abbas@ti.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

If UHS speed modes are enabled, a compatible SD card switches down to
1.8V during enumeration. If after this a software reboot/crash takes
place and on-chip ROM tries to enumerate the SD card, the difference in
IO voltages (host @ 3.3V and card @ 1.8V) may end up damaging the card.

The fix for this is to have support for power cycling the card in
hardware (with a PORz/soft-reset line causing a power cycle of the
card). Since am571x-, am572x- and am574x-idk don't have this
capability, disable voltage switching for these boards.

The major effect of this is that the maximum supported speed
mode is now high speed(50 MHz) down from SDR104(200 MHz).

Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
---
 arch/arm/boot/dts/am57xx-idk-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/am57xx-idk-common.dtsi b/arch/arm/boot/dts/am57xx-idk-common.dtsi
index f7bd26458915..42e433da79ec 100644
--- a/arch/arm/boot/dts/am57xx-idk-common.dtsi
+++ b/arch/arm/boot/dts/am57xx-idk-common.dtsi
@@ -420,6 +420,7 @@
 	vqmmc-supply = <&ldo1_reg>;
 	bus-width = <4>;
 	cd-gpios = <&gpio6 27 GPIO_ACTIVE_LOW>; /* gpio 219 */
+	no-1-8-v;
 };
 
 &mmc2 {
-- 
2.19.2

