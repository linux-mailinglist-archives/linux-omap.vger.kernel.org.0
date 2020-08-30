Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0DD025704C
	for <lists+linux-omap@lfdr.de>; Sun, 30 Aug 2020 21:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726350AbgH3TvP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 30 Aug 2020 15:51:15 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:36881 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbgH3TvN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 30 Aug 2020 15:51:13 -0400
Received: from buildfff.adridolf.com ([188.192.134.246]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mlf8e-1kvBpG3Roo-00ilT1; Sun, 30 Aug 2020 21:51:08 +0200
From:   Adrian Schmutzler <freifunk@adrianschmutzler.de>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] ARM: dts: am43xx: replace status value "ok" by "okay"
Date:   Sun, 30 Aug 2020 21:50:09 +0200
Message-Id: <20200830195009.537-1-freifunk@adrianschmutzler.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:7KRaAiCJkOKuPq6YsvjRWUfY91PO69X2jzFnMpm+xKPp4imWsZI
 L/YgJoT/anl0rfDLRNzQ9s+7bCqj3MSHRuj1ez199mfLAIGKF/igvCdHIQXpmNDDZ5r/SHk
 ywW2klPrgweLv7rkZjoVowsxcPTgcJlXiHMFECR6mvwj/nWyJGD7nKYS4EKB1gyBIIB9d+L
 i1iZPswIfRv5nEJuwEbHw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FhfCCX8Hm4E=:iIUxCtmTxscTVOo6G/xhj0
 WCE/jtV1HFYUvCNSI8S3Tj3c7Vel0Q58+IcGHmAziqe2btXR+cnE1Lm43z9VBiSErLpW/D/N3
 2EyJn9LBDSKWHV2lmmaJaDRwqn7Ckbk3TUGpf2k18616n29wy3GOnZSdKWabkd4pfQINYQBDO
 ChCnhJYeqrj+xdaJw3evad0419TDaZFzYaD6Rh5mPz7GBDJZvDWFN0CTVpgbHTQQxphEkLjWN
 GpJKGadPP0VqUpefML+dJmMuVXcMuKHazH8dUmfL8lyC0N6giUpXWbK/PajTtLRL76nOCAyIN
 pa2lf3kQdPi+mKMrxBq+1Jba4PD+WlViYPRSPeWiV9Fm+GcJF6Ysz4z9ubCeYrNOZ/weL9nKS
 XYwUzc0G4PmvvaK9X0KRrQJ4MxBZsTjLYXL/F/5+7UW6IP3z0XlP+vtPfh3JTOmtl4LFpSEQu
 k6kT4a2V4MWbauDfG2SjoYe6st8dUjEZVXhNZ6a5a91QyIncl+AtXpywrtBuL3Pm17QH6XVrz
 KY5kHZWpRSi9955fxKpMKwTOeXXEOL+ebxhJC3tIFko9dggZh6c7yfNCbBN75HkR/PXJdPNAR
 ZJzz1cGJvVDJH7/9j9s5YO7vBeZ9DnWgk44l/GoIPBm1QhU+49rpdyhzodMwJ6YvohGEITwnK
 uADDRAEzbfLRpDNC9PttcBlpXf2c4EKxqU8i9SSVfTPS0PF/RJn6nFZsN+yu6kmNWPLmnzrCm
 5hBfFuKaH3p3H4MYpo+/3QTCqbrm9U6y/Zuu0hQM0MYYWxXUfaFX96Ljsr/iwN1CrH38Uidtu
 s9+7cmNJcwdycSgdKJUp7CpRqTdCD9L3evHZPFXtdjfS9he4JXuLRhekZgX8lr2zLXixzFQOP
 TN3cJ59wq6NWXlbadnEA==
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

While the DT parser recognizes "ok" as a valid value for the
"status" property, it is actually mentioned nowhere. Use the
proper value "okay" instead, as done in the majority of files
already.

Signed-off-by: Adrian Schmutzler <freifunk@adrianschmutzler.de>
---
 arch/arm/boot/dts/am437x-gp-evm.dts  | 2 +-
 arch/arm/boot/dts/am437x-sbc-t43.dts | 2 +-
 arch/arm/boot/dts/am43x-epos-evm.dts | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/am437x-gp-evm.dts b/arch/arm/boot/dts/am437x-gp-evm.dts
index b28e5c8cd02a..7c1ee35e6a1c 100644
--- a/arch/arm/boot/dts/am437x-gp-evm.dts
+++ b/arch/arm/boot/dts/am437x-gp-evm.dts
@@ -1024,7 +1024,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&dss_pins>;
diff --git a/arch/arm/boot/dts/am437x-sbc-t43.dts b/arch/arm/boot/dts/am437x-sbc-t43.dts
index 94cf07ea27f7..8ea3780f939d 100644
--- a/arch/arm/boot/dts/am437x-sbc-t43.dts
+++ b/arch/arm/boot/dts/am437x-sbc-t43.dts
@@ -136,7 +136,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&dss_pinctrl_default>;
diff --git a/arch/arm/boot/dts/am43x-epos-evm.dts b/arch/arm/boot/dts/am43x-epos-evm.dts
index de4fc78498a0..76f48ff051e8 100644
--- a/arch/arm/boot/dts/am43x-epos-evm.dts
+++ b/arch/arm/boot/dts/am43x-epos-evm.dts
@@ -948,7 +948,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&dss_pins>;
-- 
2.20.1

