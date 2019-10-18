Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC1ADD038
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2019 22:27:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2443437AbfJRU06 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Oct 2019 16:26:58 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.168]:19918 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2506015AbfJRU06 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Oct 2019 16:26:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1571430346;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=zcdfWj+2+6EC1O3T7iHzLiOQtZr9s+nZaO5ZI9hQu2A=;
        b=OfmdxeXTcDrN4hxe1L52IM1+XRPu2hq3vREfUrhQ8azpIYI/rAGJegOJemey+g/yn3
        57toC18yNapsfLF8wotYBKq7wdsBEiB1PlFcZTnW719YlyUu6OUULqQMDndfBUrwLSNH
        SfsbsLD4dq5i3RgmO5IL5UUJbjb5hnD4Fs7eLQGRm/+9wtukL//9iitM5RenimJLBdjv
        EnCgRweGAkHSuxyy1giqtEOuYl1F+HsA6jEG6oARCDORjN8cnSwKg1Me/IYDvmaPEdhB
        wYoytokW04y0wxu1BnW2q4sEd6110Cn2bJNgDiQ+T1AYH6LPJFOPP15fUni0MGphX2Bx
        CjUQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6F3CFF60="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 44.28.1 DYNA|AUTH)
        with ESMTPSA id R0b2a8v9IKPXDUn
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Fri, 18 Oct 2019 22:25:33 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        David Sterba <dsterba@suse.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Petr Mladek <pmladek@suse.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        John Stultz <john.stultz@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
Subject: [PATCH 1/9] Documentation: dt: wireless: update wl1251 for sdio
Date:   Fri, 18 Oct 2019 22:25:22 +0200
Message-Id: <55f79e39c13586ebd579b37e8b0055003611a2b2.1571430329.git.hns@goldelico.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1571430329.git.hns@goldelico.com>
References: <cover.1571430329.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The standard method for sdio devices connected to
an sdio interface is to define them as a child node
like we can see with wlcore.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 .../bindings/net/wireless/ti,wl1251.txt       | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/ti,wl1251.txt b/Documentation/devicetree/bindings/net/wireless/ti,wl1251.txt
index bb2fcde6f7ff..88612ff29f2d 100644
--- a/Documentation/devicetree/bindings/net/wireless/ti,wl1251.txt
+++ b/Documentation/devicetree/bindings/net/wireless/ti,wl1251.txt
@@ -35,3 +35,29 @@ Examples:
 		ti,power-gpio = <&gpio3 23 GPIO_ACTIVE_HIGH>; /* 87 */
 	};
 };
+
+&mmc3 {
+	vmmc-supply = <&wlan_en>;
+
+	bus-width = <4>;
+	non-removable;
+	ti,non-removable;
+	cap-power-off-card;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc3_pins>;
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	wlan: wl1251@1 {
+		compatible = "ti,wl1251";
+
+		reg = <1>;
+
+		interrupt-parent = <&gpio1>;
+		interrupts = <21 IRQ_TYPE_LEVEL_HIGH>;	/* GPIO_21 */
+
+		ti,wl1251-has-eeprom;
+	};
+};
-- 
2.19.1

