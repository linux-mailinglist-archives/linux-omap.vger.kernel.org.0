Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D37602E9E62
	for <lists+linux-omap@lfdr.de>; Mon,  4 Jan 2021 20:58:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbhADT5a (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 4 Jan 2021 14:57:30 -0500
Received: from sender11-of-o51.zoho.eu ([31.186.226.237]:21152 "EHLO
        sender11-of-o51.zoho.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727520AbhADT5Y (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 4 Jan 2021 14:57:24 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1609790194; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=LUcWeICb7P3Lffusyw8GRvjFDdkjGaL2xpawtGA3vhh/8VOYfAwDpMgVPD10dTBVC0kJpSWauxQYbAvUzwteNV0UmE8dJQYZ2Tf723MxNeSjZdsBhG9TJwF9sCLvJHPtdUTh9BSmEkF8Nmkn1+Ov3cU4d6iqxJBCvY8NDlvBZ2I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1609790194; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=HL+4cO3hptPd2j/OGX2u1lxqjVoG1JGQy1mc6uj3aYM=; 
        b=TEWABq3zvY7qba4Y+dI4y0apvZkh9DSTBssuKeuFdX6CYnKnv6b/w08l8HAHN8CK91B0SXTbn6A/WvD3fxANO0if7Xu1lRs6Hw/rfzq1SD5gLMFYnCSwFMiJkRIIh7UENIqqx1G3JlMRF9TdjvDb2BFWzlZXTIbL1YfN3PVQj4U=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz> header.from=<philipp@uvos.xyz>
Received: from localhost.localdomain (ip-95-222-213-78.hsi15.unitymediagroup.de [95.222.213.78]) by mx.zoho.eu
        with SMTPS id 1609790192154642.5039466454091; Mon, 4 Jan 2021 20:56:32 +0100 (CET)
Date:   Mon, 4 Jan 2021 20:56:31 +0100
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     tony@atomide.com, bcousson@baylibre.com
Cc:     robh+dt@kernel.org, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH  v3 1/1] ARM: dts: omap443x: Correct sgx clock to 307.2MHz
 as used on motorola vendor kernel
Message-Id: <20210104205631.5db65991237a872b6525ed65@uvos.xyz>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The Android vendor kernel uses 307.2MHz or a divider ratio of /5 while active 
153600000 or /10 is only used when the sgx core is inactive.

Signed-off-by: Carl Philipp Klemm <philipp@uvos.xyz>
---
 arch/arm/boot/dts/omap443x.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/omap443x.dtsi b/arch/arm/boot/dts/omap443x.dtsi
index dd8ef58cbaed..8466161197ae 100644
--- a/arch/arm/boot/dts/omap443x.dtsi
+++ b/arch/arm/boot/dts/omap443x.dtsi
@@ -78,11 +78,11 @@ &cpu_thermal {
 /include/ "omap443x-clocks.dtsi"
 
 /*
- * Use dpll_per for sgx at 153.6MHz like droid4 stock v3.0.8 Android kernel
+ * Use dpll_per for sgx at 307.2MHz like droid4 stock v3.0.8 Android kernel
  */
 &sgx_module {
 	assigned-clocks = <&l3_gfx_clkctrl OMAP4_GPU_CLKCTRL 24>,
 			  <&dpll_per_m7x2_ck>;
-	assigned-clock-rates = <0>, <153600000>;
+	assigned-clock-rates = <0>, <307200000>;
 	assigned-clock-parents = <&dpll_per_m7x2_ck>;
 };
-- 
2.29.2
