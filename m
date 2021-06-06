Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F5FD39D162
	for <lists+linux-omap@lfdr.de>; Sun,  6 Jun 2021 22:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbhFFUZR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 6 Jun 2021 16:25:17 -0400
Received: from smtp-35-i2.italiaonline.it ([213.209.12.35]:40281 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230161AbhFFUZR (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 6 Jun 2021 16:25:17 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([79.17.119.101])
        by smtp-35.iol.local with ESMTPA
        id pzIbl3WgQsptipzIslrvUr; Sun, 06 Jun 2021 22:23:26 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1623011006; bh=hqdToKdXep6rD2t3+5/OUkGokVRGwUGIXwri9qp4guU=;
        h=From;
        b=rPrVsZPbCKhA8xnbWHqplA2YAj+B5Jeu6JF5sFNSKbuwBPTXTyyNAbx8lNIx0Iroy
         BUKtO4U6rfj6D9LubPySefmaETlbCOl0XZK2ub1tA6z78rYc/cp7xc8GVTdQ5VSmnD
         J1WKkxYQcgw4sC8VvtQ/fKMXhMmFfE9fcKLBPMCHx9BnOQDfWLEWc5DF4eYl8+k0ao
         S5n9imbGOyp9NxXuZ9sSPJJVHQR4EIU8vA4FpaJfTo8/LRauCmlt8tIhQJJM7L4ATs
         WGnxL3KlqsgrlheERcCUEKic6HEq0b18aMhB4fMfPJjHPP8ufy4sXjnWIxZZW/8Z9G
         ZSKaVkamfk1eA==
X-CNFS-Analysis: v=2.4 cv=Bo1Yfab5 c=1 sm=1 tr=0 ts=60bd2ebe cx=a_exe
 a=do1bHx4A/kh2kuTIUQHSxQ==:117 a=do1bHx4A/kh2kuTIUQHSxQ==:17 a=VwQbUJbxAAAA:8
 a=IXkOJODCewQtKEFu2i4A:9 a=5yUOnwQy5QICz8m5uxDm:22 a=AjGcO6oz07-iQ99wixmX:22
 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-clk@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>, Tony Lindgren <tony@atomide.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Dario Binacchi <dariobin@libero.it>,
        linux-omap@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tero Kristo <kristo@kernel.org>, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [RESEND PATCH v7 2/5] dt-bindings: ti: dpll: add spread spectrum support
Date:   Sun,  6 Jun 2021 22:22:50 +0200
Message-Id: <20210606202253.31649-3-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210606202253.31649-1-dariobin@libero.it>
References: <20210606202253.31649-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfIxXsTUKj5ZkJsb8xHFyxnlq3udr8fqR5FHUxDoGXjJh/Lry0M7V+ld07KY3wYxW0qiC6dWDvSb9qXGmGBplc3JjoeVokJwGiP2/Ku020CIBgN7KS1oi
 mr7w3qNsFS7NgDWXKyHvctmXx/93hrhGorAXaFxUWAFPS+pRJ//MRQ4nIvzpCT6TPJiNwDG0sAjOtd4BtTSK4ipEQ8e9R7KEiZXwQUE3FpUTyWTfxHolJykm
 A0bObYZmm/+2oTLYpf7GjJkW7Mne8Xzeig0CF9GFYGALXg6bin7AlcFvn1gg/kJyK7PkusJFgF/PqYXB+EqxIL2q/dptm8yQbqOr0MRXtwmHz/uJTtuTM/ni
 mmyYvrRCv6FFkjV6/Z6xwXdcqzEKCVJk+/msflviUNHR0GTHT/NgZItZXQHHitfvBT9W1wr4CTmDsvzXWEXLyqVy8cdZW6SSjH5VAqHUnrpCVlHcKx+B/bec
 QFSMHuF2mw4C+0XSnIeoMdBJsJj/lyc644bN0U/rN5VugrbAM0ZqK5QHZRIJ8Qy+1rf2I3eH3jD+d8S6V2bCEGOOp7snnf0g2TbrziAOgV/PBzGz1mV8q7De
 5QY5XAfkB7dhZVZNguyKHWnYM6vmemnlr/8wI54XXrINzQ==
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

DT bindings for enabling and adjusting spread spectrum clocking have
been added.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
Reviewed-by: Rob Herring <robh@kernel.org>

---

(no changes since v4)

Changes in v4:
- Add Rob Herring review tag.

Changes in v3:
- Add '-hz' suffix to "ti,ssc-modfreq" binding.

 .../devicetree/bindings/clock/ti/dpll.txt     | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/ti/dpll.txt b/Documentation/devicetree/bindings/clock/ti/dpll.txt
index df57009ff8e7..37a7cb6ad07d 100644
--- a/Documentation/devicetree/bindings/clock/ti/dpll.txt
+++ b/Documentation/devicetree/bindings/clock/ti/dpll.txt
@@ -42,6 +42,11 @@ Required properties:
 	"idlest" - contains the idle status register base address
 	"mult-div1" - contains the multiplier / divider register base address
 	"autoidle" - contains the autoidle register base address (optional)
+	"ssc-deltam" - DPLL supports spread spectrum clocking (SSC), contains
+		       the frequency spreading register base address (optional)
+	"ssc-modfreq" - DPLL supports spread spectrum clocking (SSC), contains
+		        the modulation frequency register base address
+			(optional)
   ti,am3-* dpll types do not have autoidle register
   ti,omap2-* dpll type does not support idlest / autoidle registers
 
@@ -51,6 +56,14 @@ Optional properties:
 	- ti,low-power-stop : DPLL supports low power stop mode, gating output
 	- ti,low-power-bypass : DPLL output matches rate of parent bypass clock
 	- ti,lock : DPLL locks in programmed rate
+	- ti,min-div : the minimum divisor to start from to round the DPLL
+		       target rate
+	- ti,ssc-deltam : DPLL supports spread spectrum clocking, frequency
+			  spreading in permille (10th of a percent)
+	- ti,ssc-modfreq-hz : DPLL supports spread spectrum clocking, spread
+			      spectrum modulation frequency
+	- ti,ssc-downspread : DPLL supports spread spectrum clocking, boolean
+			      to enable the downspread feature
 
 Examples:
 	dpll_core_ck: dpll_core_ck@44e00490 {
@@ -83,3 +96,10 @@ Examples:
 		clocks = <&sys_ck>, <&sys_ck>;
 		reg = <0x0500>, <0x0540>;
 	};
+
+	dpll_disp_ck: dpll_disp_ck {
+		#clock-cells = <0>;
+		compatible = "ti,am3-dpll-no-gate-clock";
+		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
+		reg = <0x0498>, <0x0448>, <0x0454>, <0x044c>, <0x0450>;
+	};
-- 
2.17.1

