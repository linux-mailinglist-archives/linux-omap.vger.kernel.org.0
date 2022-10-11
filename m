Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7AA85FB4DA
	for <lists+linux-omap@lfdr.de>; Tue, 11 Oct 2022 16:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbiJKOqd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 11 Oct 2022 10:46:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbiJKOqc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 11 Oct 2022 10:46:32 -0400
X-Greylist: delayed 902 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 11 Oct 2022 07:46:31 PDT
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76ED953A7D
        for <linux-omap@vger.kernel.org>; Tue, 11 Oct 2022 07:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1665498687; x=1668090687;
        h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=equtmR2d5OAipEVECfM56QMXz5HBC8fNB6XzPBn+joU=;
        b=VZWdkdpd18pHtgKa3YF+w+7dOJsrLhMW+N0/MlL/auWCTjR+xf/4HjcZ61MuHh3G
        8vepAzuj7y7gXZFyG4WbujXmjMdmkZGmm0zPAD2vRszyrHDObsEiMAdp9oqpyzsX
        P69TWP6JgqEFfeyHp/3atHoQjip4+JN6BdGq+YzNaQE=;
X-AuditID: ac14000a-83bf370000003940-aa-63457e3fbe91
Received: from florix.phytec.de (Unknown_Domain [172.25.0.13])
        (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id D2.9A.14656.F3E75436; Tue, 11 Oct 2022 16:31:27 +0200 (CEST)
Received: from lws-dhaller.phytec.de (172.25.0.11) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 11 Oct
 2022 16:31:27 +0200
From:   Dominik Haller <d.haller@phytec.de>
To:     <linux-omap@vger.kernel.org>
CC:     <bcousson@baylibre.com>, <tony@atomide.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <devicetree@vger.kernel.org>,
        <upstream@phytec.de>
Subject: [PATCH] ARM: dts: am335x-pcm-953: Define fixed regulators in root node
Date:   Tue, 11 Oct 2022 16:31:15 +0200
Message-ID: <20221011143115.248003-1-d.haller@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Florix.phytec.de (172.25.0.13) To Florix.phytec.de
 (172.25.0.13)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGLMWRmVeSWpSXmKPExsWyRpKBV9e+zjXZ4MtqfYs78/+yWsw/co7V
        ou/FQ2aL2Uv6WSxa9x5ht9h/xcuBzePb10ksHu9vtLJ7bFrVyeZx59oeNo/Pm+QCWKO4bFJS
        czLLUov07RK4MuY+ncdU8J63YvmFB+wNjIe4uxg5OSQETCTWzHrG2MXIxSEksIRJYsavFjYI
        5ymjxLSGScwgVWwCmhLTJ21lBLFFBBQkjhxpYgUpYhZYxCix/d9/NpCEsIC/xPap/8CKWARU
        Jf73v2UFsXkFLCRar39jh1gnLzHz0nd2iLigxMmZT1hAbGagePPW2cwQtoTEwRcvwGwhkPo1
        3awwvdPOvWaGsEMl5q/5zj6BUWAWklGzkIyahWTUAkbmVYxCuZnJ2alFmdl6BRmVJanJeimp
        mxhBYS3CwLWDsW+OxyFGJg7GQ4wSHMxKIryM852ShXhTEiurUovy44tKc1KLDzFKc7AoifPe
        72FKFBJITyxJzU5NLUgtgskycXBKNTAKGIQ5VD0/x/DOaPLOGzlF21NuiATVTPgi9zpxv6FA
        jbSmSp3t/zo9KyPHCrYKc/0Ii9UvwzWdI+acnHxIkFuoRcGh90nWi/LVx20P9CqyL9NorH64
        /K73cq/K/w9YPk+p1fqmIPb4uVrHp0nfFrKaL64+kt2n5epSd+YEq1CUdUPSnvccj5RYijMS
        DbWYi4oTAd2tSWtZAgAA
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Remove the regulators node and define fixed regulators in the root node.
Prevents the sdhci-omap driver from waiting in probe deferral forever
because of the missing vmmc-supply and keeps am335x-pcm-953 consistent with
the other Phytec AM335 boards.

Fixes: bb07a829ec38 ("ARM: dts: Add support for phyCORE-AM335x PCM-953 carrier board")
Signed-off-by: Dominik Haller <d.haller@phytec.de>
---
 arch/arm/boot/dts/am335x-pcm-953.dtsi | 28 +++++++++++++--------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-pcm-953.dtsi b/arch/arm/boot/dts/am335x-pcm-953.dtsi
index dae448040a97..947497413977 100644
--- a/arch/arm/boot/dts/am335x-pcm-953.dtsi
+++ b/arch/arm/boot/dts/am335x-pcm-953.dtsi
@@ -12,22 +12,20 @@ / {
 	compatible = "phytec,am335x-pcm-953", "phytec,am335x-phycore-som", "ti,am33xx";
 
 	/* Power */
-	regulators {
-		vcc3v3: fixedregulator@1 {
-			compatible = "regulator-fixed";
-			regulator-name = "vcc3v3";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-boot-on;
-		};
+	vcc3v3: fixedregulator1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+	};
 
-		vcc1v8: fixedregulator@2 {
-			compatible = "regulator-fixed";
-			regulator-name = "vcc1v8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-boot-on;
-		};
+	vcc1v8: fixedregulator2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
 	};
 
 	/* User IO */
-- 
2.25.1

