Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06158792481
	for <lists+linux-omap@lfdr.de>; Tue,  5 Sep 2023 17:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231589AbjIEP7G (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Sep 2023 11:59:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354607AbjIEMxb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Sep 2023 08:53:31 -0400
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 726DB1A6
        for <linux-omap@vger.kernel.org>; Tue,  5 Sep 2023 05:53:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693918225; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=VYtshvKsNszhkW/RTGEGIwbgFCnPIFq7aqnHyYXbKC1xU6ZeysK6DLz/sP813j2J1N
    +4jANa3Rx3v2ZhuZ6MP69MtaqF7PL2oBx0RoYSkWyvlGRQuomAHKgFpVz7UZuJj5+wF9
    qZuVqAaigyngsSjGsD+k6BP1F0OyK9pL7CYG6tqP9VLCTuXuJ+XNOXLhI71Jaeipkn7u
    28eQddWpmLPMFTG2YjQdVk42giBRQVwDm8LRIQGv+V/hFYOZJD9Yt7ZJ82dIk6uggdNy
    pXo411jBIT1pZm1+njh24yS2ntJCad/UesEyKdaeOzRX9JIr5Fa7F2o4nn52bbHbZFHn
    uoLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1693918225;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Swn/M0GufsoQQ8tcNjfSJjPTQPXNruvk1DKccYgp+pQ=;
    b=tHPRkphKqf5xv41w3Qk2yX37oA1NpBWKaRmB62na3QtetZWPcNQYt7C0sa0UAsvLk6
    Ogx7ZUa4qgOhfffRis1UphJWWt4qYpChQNpchWpvo0XkHyUSom5W/eDSNjJOfCUF9ySY
    kMbcY0+dJ5lYg0ypEgWaPNRBoLp0w5H6vaV99ylk7jl5uQ+W+YZt/6txb8zQouENRMym
    nOLTq7vQz73g/jd+4ISI2XcpUosJHGH0Hp9EcQf0EcCoYppbUmYkShr9SiXbULK5eWZW
    XbRyLO+mF4oMrfE4SYBOLYCEch/qVwcEqWBcZ8Yt125a1Y0Qd53WuPYtaoIWBIrzwQEt
    bb3w==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1693918225;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Swn/M0GufsoQQ8tcNjfSJjPTQPXNruvk1DKccYgp+pQ=;
    b=FN19gDAHTFETjOOVnfHx6Qv3nnak7FBO4tmPzjo95txmTgY9j2aYGU2FtCYS7N+JGG
    TUwjHwBu0oduapDYJ1zGNBSdYM+MhAhh7KtnD0tjKnQdYBEs5temZ9zUcRB/t+dy2DIZ
    f+vrub8F5zplXdnTEqa/ohpAIdCRNEwKBnWT6McWB1cLP0Kln+NzcRNWA4kzhsmAY2Zm
    9X9PIAOVEtYwYoHl6sZAQOiaPBpKl0WokQrIWKXySZQRwmUpwnePxV3wuGoEXJasCG9/
    fZrhSyvHFowzIcBy61lhtLuzCLJYktYVCAwbI/tnxKcFCEDYFK1hMBh5GPQnWo7conHj
    WQIQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1693918225;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Swn/M0GufsoQQ8tcNjfSJjPTQPXNruvk1DKccYgp+pQ=;
    b=xhTUeW8D0dyYF/CVC6KmrqQBabrkToA3MXqKhjhNWanOYk+rliNe9TS+JbDdS5dXG9
    MkSksnBenh69kB4233Cw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1iTDUhfN4hi3qVZrW7J"
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 49.8.2 DYNA|AUTH)
    with ESMTPSA id 04cbadz85CoPLbL
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 5 Sep 2023 14:50:25 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Tony Lindgren <tony@atomide.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        =?UTF-8?q?Patrik=20Dahlstr=C3=B6m?= <risca@dalakolonin.se>,
        peter.ujfalusi@gmail.com
Cc:     letux-kernel@openphoenux.org, kernel@pyra-handheld.com,
        linux-omap@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [RFC 6/6] ARM: DTS: omap4-panda-common: enable aess, add phandles for aess and mcbsp1/2/3
Date:   Tue,  5 Sep 2023 14:50:15 +0200
Message-ID: <070fc6758feb53d2b66372d38924d96ad2822b64.1693918215.git.hns@goldelico.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1693918214.git.hns@goldelico.com>
References: <cover.1693918214.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

and extend audio-routing.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 .../boot/dts/ti/omap/omap4-panda-common.dtsi  | 22 +++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi b/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi
index f528511c2537b..3409cb693d1d5 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi
@@ -82,21 +82,31 @@ sound: sound {
 		ti,model = "PandaBoard";
 
 		ti,mclk-freq = <38400000>;
+		ti,mclk-freq = <38400000>;	// CHECKME: 19200000?
 
 		ti,mcpdm = <&mcpdm>;
+		ti,mcbsp1 = <&mcbsp1>;	/* bluetooth */
+		ti,mcbsp2 = <&mcbsp2>;	/* fm radio */
+		ti,mcbsp3 = <&mcbsp3>;	/* modem */
 
 		ti,twl6040 = <&twl6040>;
+		ti,aess = <&aess>;
 
 		/* Audio routing */
 		ti,audio-routing =
 			"Headset Stereophone", "HSOL",
 			"Headset Stereophone", "HSOR",
-			"Ext Spk", "HFL",
-			"Ext Spk", "HFR",
+			"Earphone Spk", "EP",
 			"Line Out", "AUXL",
 			"Line Out", "AUXR",
+			"Vibrator", "VIBRAL",
+			"Vibrator", "VIBRAR",
 			"HSMIC", "Headset Mic",
 			"Headset Mic", "Headset Mic Bias",
+			"MAINMIC", "Main Handset Mic",
+			"Main Handset Mic", "Main Mic Bias",
+			"SUBMIC", "Sub Handset Mic",
+			"Sub Handset Mic", "Main Mic Bias",
 			"AFML", "Line In",
 			"AFMR", "Line In";
 	};
@@ -227,6 +237,10 @@ hdmi_connector_in: endpoint {
 	};
 };
 
+&aess {
+	status = "okay";
+};
+
 &omap4_pmx_core {
 	pinctrl-names = "default";
 	pinctrl-0 = <
@@ -517,6 +531,10 @@ &mcbsp1 {
 	status = "okay";
 };
 
+&mcbsp2 {
+	status = "okay";
+};
+
 &twl_usb_comparator {
 	usb-supply = <&vusb>;
 };
-- 
2.42.0

