Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAEC22F9596
	for <lists+linux-omap@lfdr.de>; Sun, 17 Jan 2021 22:46:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729350AbhAQVp7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 17 Jan 2021 16:45:59 -0500
Received: from sender11-of-o51.zoho.eu ([31.186.226.237]:21150 "EHLO
        sender11-of-o51.zoho.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728042AbhAQVp7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 17 Jan 2021 16:45:59 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1610919905; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=fXg0ZedDL6F5+UCuX8qsi77ZJnh141juaryjFNEgnKLBL0ueaCvVL2tRv8Vyr9CVg0DeMUURzC9VXPApVundBPZImoUB6z67bH4maYnQdh+gzAONusyqqf8lQppezPvu0PXh4cgqy7scXHEbDC1jzLwm8B0NaRC68Ots+/ITxWQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1610919905; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=vmzPpgKfjlYcJGttA/ZWIIRDeigtax0pvHjvYoBwJMw=; 
        b=e3nlHWJ0LJu6MvTvbTdms2IMU/p/ohIyHZwLwl1iXsbQP/GJ0AheYxgJHQZXHvnELfjGqt9K6aSp2liyeIFHPH67UNwc5DTpLScDz8qXXLX9DHXU67NWcVILN8u6dufU/7x+4J+1Nooqqh8x2EBDVxMcw8wExXHQ2+jKKCg7bZo=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz> header.from=<philipp@uvos.xyz>
Received: from localhost.localdomain (ip-95-222-215-9.hsi15.unitymediagroup.de [95.222.215.9]) by mx.zoho.eu
        with SMTPS id 1610919903598607.1558062768164; Sun, 17 Jan 2021 22:45:03 +0100 (CET)
Date:   Sun, 17 Jan 2021 22:45:02 +0100
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     Sebastian Reichel <sre@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>, Pavel Machek <pavel@ucw.cz>
Subject: [PATCH 2/5] ARM: dts: add battery phandle to cpcap_charger
Message-Id: <20210117224502.0f9a0e80dfd4841ad26a9914@uvos.xyz>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This is required for 
	power: supply: cpcap-charger: get the battery inserted 
		infomation from cpcap-battery

Signed-off-by: Carl Philipp Klemm <philipp@uvos.xyz>
---
 arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi b/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
index 08a7d3ce383f..842eaa7b89e5 100644
--- a/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
+++ b/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
@@ -61,6 +61,7 @@ &cpcap_adc 2 &cpcap_adc 5
 			io-channel-names = "battdetb", "battp",
 					   "vbus", "chg_isense",
 					   "batti";
+			battery = <&cpcap_battery>;
 		};
 
 		cpcap_regulator: regulator {
-- 
2.29.2
