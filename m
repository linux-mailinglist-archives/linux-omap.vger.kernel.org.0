Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E47562E79CF
	for <lists+linux-omap@lfdr.de>; Wed, 30 Dec 2020 14:52:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726547AbgL3NwF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 30 Dec 2020 08:52:05 -0500
Received: from sender11-of-o51.zoho.eu ([31.186.226.237]:21105 "EHLO
        sender11-of-o51.zoho.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726412AbgL3NwF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 30 Dec 2020 08:52:05 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1609336277; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=QjGhdD6EWGp06wwivV2Zmi4LsLFrPaHxeyYj8/X9LaAbaLLX7aRL1dBfEYWf/d1kmMuqURimmLQIp9DAiWFJV16fzDaFBgfWcGo3ku6TBIvAnBZ+h/tUzR5JlzI8aOlxtViQwMD+EnZdDthRwcRb+XIcToxvtGDD5h8rVzLwdQE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1609336277; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=as2epJK+1brfBBs/4Iz5rsidAXMjCRi10mQgGkykLQw=; 
        b=Rr26YQL7go35vY+ENG84Nu0ZmHPONYDJ9y3EzbBpNnvpT8ocizeDegzsFFwnSfDmWk/Ydt/xN2t+etTENO8GZt48Y1GEMfm2da7y7l080KkSg2u+VAHQuVGN5aH/Txj14RA+Ia79UScKkmHBJgydQuuhUTzQVmgHyfBCVkzrxuE=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz> header.from=<philipp@uvos.xyz>
Received: from localhost.localdomain (ip-95-222-213-179.hsi15.unitymediagroup.de [95.222.213.179]) by mx.zoho.eu
        with SMTPS id 160933627607382.34662944915351; Wed, 30 Dec 2020 14:51:16 +0100 (CET)
Date:   Wed, 30 Dec 2020 14:51:15 +0100
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     tony@atomide.com, bcousson@baylibre.com
Cc:     robh+dt@kernel.org, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 1/1] ARM: dts: omap443x: Correct sgx clock to 307.2MHz as
 used on motorola vendor kernel
Message-Id: <20201230145115.239b4e1d50db37fce3560007@uvos.xyz>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The Android vendor kernel uses 307.2MHz or a devider ratio of /5 while active 
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
+ * Use dpll_per for sgx at   like droid4 stock v3.0.8 Android kernel
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
