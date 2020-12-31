Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1776F2E7F2C
	for <lists+linux-omap@lfdr.de>; Thu, 31 Dec 2020 11:01:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbgLaKBh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 31 Dec 2020 05:01:37 -0500
Received: from sender11-of-o51.zoho.eu ([31.186.226.237]:21134 "EHLO
        sender11-of-o51.zoho.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726155AbgLaKBc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 31 Dec 2020 05:01:32 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1609408843; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=YclOzYvfaHrRxvYfOI8xZcUcZxSB1wBiBwc2xqXVNDu6tuL3ypgiUvVaCSMV+jcdtrTekDLlj6XOrkrJf7IoKAUYxSz2CP7qU0rjyEstpULRjFlkPNXXiSMztPVl5FSDLCgkD7G7nCQukLR3dgPAyNhgDw3gbO9KXbYrgPaOBSI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1609408843; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=C1CwP4UlD2SxrCpielQQ6z+AnG+rM8N/SqUotv+d8/Y=; 
        b=LyPbjk1lE0c9LNoXbUkkqJf8Q+InqoFZ+hMczU4Nfxi8F5iM6XK2gz9s2P47TuHnK0xjHf8dDIpZSpWPtdIV0zuiiksZHDgwCFMNK6Y3keDXMz9OqL8M8tDIqzC6uNnRY1/80eBD2GplrGfQQM5UoaxXy+BmErIABiHij6WxATY=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz> header.from=<philipp@uvos.xyz>
Received: from localhost.localdomain (ip-95-222-215-197.hsi15.unitymediagroup.de [95.222.215.197]) by mx.zoho.eu
        with SMTPS id 1609408841333719.224545946543; Thu, 31 Dec 2020 11:00:41 +0100 (CET)
Date:   Thu, 31 Dec 2020 11:00:40 +0100
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     tony@atomide.com, bcousson@baylibre.com
Cc:     robh+dt@kernel.org, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH  v2 1/1] ARM: dts: omap443x: Correct sgx clock to 307.2MHz
 as used on motorola vendor kernel
Message-Id: <20201231110040.bdbb9788abd1723d68b67df0@uvos.xyz>
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

