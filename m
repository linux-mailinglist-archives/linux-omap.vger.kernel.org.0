Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A6FB29904
	for <lists+linux-omap@lfdr.de>; Fri, 24 May 2019 15:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403779AbfEXNfW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 May 2019 09:35:22 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:55740 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391470AbfEXNfV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 May 2019 09:35:21 -0400
X-Greylist: delayed 915 seconds by postgrey-1.27 at vger.kernel.org; Fri, 24 May 2019 09:35:20 EDT
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1558704004; x=1561296004;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=htBm2Z1l/RpGwgrP/iupQ5lRtnAvKDrdd+EzKAZZ6Yw=;
        b=N9+3u7T7Pj5rLd2ohLNxYZxqaABOrzwJYQKASBT489AjKWmu6ass7OWr/JRyuq2t
        9YSxxof2JPZohr5vSjfw6UKxhiWX15sYCImWaCs7okYaFih5Ca4UfN0rGT15m8do
        IyDF6j5pc1gucswITNfiVQDpOtheCaIilpZdI3qiTf4=;
X-AuditID: c39127d2-6bdff70000000df6-be-5ce7ef84f8e3
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 9B.81.03574.48FE7EC5; Fri, 24 May 2019 15:20:04 +0200 (CEST)
Received: from augenblix2.phytec.de ([172.16.21.122])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2019052415200419-20935 ;
          Fri, 24 May 2019 15:20:04 +0200 
From:   Teresa Remmet <t.remmet@phytec.de>
To:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Schultz <d.schultz@phytec.de>
Subject: [PATCH 3/7] ARM: dts: am335x-phycore-som: Add emmc node
Date:   Fri, 24 May 2019 15:19:59 +0200
Message-Id: <1558704003-393769-4-git-send-email-t.remmet@phytec.de>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558704003-393769-1-git-send-email-t.remmet@phytec.de>
References: <1558704003-393769-1-git-send-email-t.remmet@phytec.de>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 24.05.2019 15:20:04,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 24.05.2019 15:20:04,
        Serialize complete at 24.05.2019 15:20:04
X-TNEFEvaluated: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLLMWRmVeSWpSXmKPExsWyRoCBS7fl/fMYg8dTtSzuzP/LajH/yDlW
        i02Pr7FazF7Sz2Kx9PpFJovWvUfYLfZf8XJg91gzbw2jx7evk1g83t9oZffYtKqTzWPzknqP
        z5vkAtiiuGxSUnMyy1KL9O0SuDLeb8gqWCxQMbthKVMDYyNfFyMnh4SAicTzSfsYQWwhgR2M
        EkcvG3QxcgHZFxgljsxuB0uwCWhIPF1xmqmLkYNDRCBB4tZLIZAaZoEzjBJ3+5exgdQICzhI
        rL05mRGkhkVAVeLflyyQMK+As8Tauf2sELvkJG6e62QGsTkFXCR+H37GCrHXWeLp+qNQNY1M
        Ejc/RUDYQhKnF59lnsDIt4CRYRWjUG5mcnZqUWa2XkFGZUlqsl5K6iZGYKAdnqh+aQdj3xyP
        Q4wCHIxKPLwJl5/HCLEmlhVX5h5ilOBgVhLhjd3/LEaINyWxsiq1KD++qDQntfgQozQHi5I4
        7wbekjAhgfTEktTs1NSC1CKYLBMHp1QDo4HPCv2Sf9NsI44xczZYrbNZtSd72SX12UenaRv0
        PrFc6mW+ouAu05OdZe98TEVuTuC4c2r/3Hkztq+Yekpzas4Xk+VzTNb4SOuXf95aYSmXeDxm
        OUfK9YiX0yqXnD1skSImnvpAvzxBPG6NonbU9Nx5S3ee4Sl46vnpqcqErJgFAveZNTfxtCix
        FGckGmoxFxUnAgDw53SmMAIAAA==
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Daniel Schultz <d.schultz@phytec.de>

The phyCORE-AM335x EMMC modules have an EMMC populated and are based
on the phyCORE-AM335x R2 SOM. Therefore, the EMMC node will be added to
the phycore-som devce tree but is by default disabled.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
Signed-off-by: Teresa Remmet <t.remmet@phytec.de>
---
 arch/arm/boot/dts/am335x-phycore-som.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/am335x-phycore-som.dtsi b/arch/arm/boot/dts/am335x-phycore-som.dtsi
index f5b53d30e9a9..2bc2265534e1 100644
--- a/arch/arm/boot/dts/am335x-phycore-som.dtsi
+++ b/arch/arm/boot/dts/am335x-phycore-som.dtsi
@@ -49,6 +49,33 @@
 	status = "okay";
 };
 
+/* EMMC */
+&am33xx_pinmux {
+	emmc_pins: pinmux_emmc_pins {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_CSN1, PIN_INPUT_PULLUP, MUX_MODE2)	/* gpmc_csn1.mmc1_clk */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_CSN2, PIN_INPUT_PULLUP, MUX_MODE2)	/* gpmc_csn2.mmc1_cmd */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD0, PIN_INPUT_PULLUP, MUX_MODE1)	/* gpmc_ad0.mmc1_dat0 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD1, PIN_INPUT_PULLUP, MUX_MODE1)	/* gpmc_ad1.mmc1_dat1 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD2, PIN_INPUT_PULLUP, MUX_MODE1)	/* gpmc_ad2.mmc1_dat2 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD3, PIN_INPUT_PULLUP, MUX_MODE1)	/* gpmc_ad3.mmc1_dat3 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD4, PIN_INPUT_PULLUP, MUX_MODE1)	/* gpmc_ad4.mmc1_dat4 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD5, PIN_INPUT_PULLUP, MUX_MODE1)	/* gpmc_ad5.mmc1_dat5 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD6, PIN_INPUT_PULLUP, MUX_MODE1)	/* gpmc_ad6.mmc1_dat6 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD7, PIN_INPUT_PULLUP, MUX_MODE1)	/* gpmc_ad7.mmc1_dat7 */
+		>;
+	};
+};
+
+&mmc2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&emmc_pins>;
+	vmmc-supply = <&vmmc_reg>;
+	bus-width = <8>;
+	ti,non-removable;
+	status = "disabled";
+};
+
 /* Ethernet */
 &am33xx_pinmux {
 	ethernet0_pins: pinmux_ethernet0 {
-- 
2.7.4

