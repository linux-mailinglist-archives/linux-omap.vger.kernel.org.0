Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB97469649C
	for <lists+linux-omap@lfdr.de>; Tue, 14 Feb 2023 14:23:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232431AbjBNNXn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 14 Feb 2023 08:23:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232677AbjBNNXl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 14 Feb 2023 08:23:41 -0500
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88F5E4484
        for <linux-omap@vger.kernel.org>; Tue, 14 Feb 2023 05:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1676381002; x=1678973002;
        h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=WQ3nZyhpun324ptYC94xxk1/e/L5LRS43aUs6HwMRek=;
        b=IMOwVBr1PzrQrUEJfeexDyoiM8TN65VlmFP2iUsDZr/KUHL5yr+oH4MA8Xq376It
        eAfoIWQKLPz7s5uKMnv/spYKrApLf4w1Uro3Cp9vX3QSWlvrxfEly1e08YvyMipF
        CUyEJZVW3383VxuC8du/t1apml6isC7aPUDTYyUAdQU=;
X-AuditID: ac14000a-917fe70000007ecb-f1-63eb8b4a849b
Received: from florix.phytec.de (Unknown_Domain [172.25.0.13])
        (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 62.D9.32459.A4B8BE36; Tue, 14 Feb 2023 14:23:22 +0100 (CET)
Received: from llp-Hemer.phytec.de (172.25.0.11) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 14 Feb
 2023 14:23:22 +0100
From:   Steffen Hemer <s.hemer@phytec.de>
To:     <linux-omap@vger.kernel.org>
CC:     <upstream@lists.phytec.de>, <krzysztof.kozlowski+dt@linaro.org>,
        <robh+dt@kernel.org>, <tony@atomide.com>, <bcousson@baylibre.com>
Subject: [PATCH 8/8] ARM: dts: am335x-phycore-som: Remove superseded/invalid GPMC NAND type.
Date:   Tue, 14 Feb 2023 14:23:02 +0100
Message-ID: <20230214132302.39087-8-s.hemer@phytec.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230214132302.39087-1-s.hemer@phytec.de>
References: <20230214132302.39087-1-s.hemer@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Berlix.phytec.de (172.25.0.12) To Florix.phytec.de
 (172.25.0.13)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrALMWRmVeSWpSXmKPExsWyRpKBV9er+3WywevLyhZ35v9lteh78ZDZ
        YvaSfhaL1r1H2C32X/Gy6H6n7sDm8e3rJBaP9zda2T02repk87hzbQ+bR393C6vH501yAWxR
        XDYpqTmZZalF+nYJXBmfb25lLfjPWjGreTJjA2MTaxcjJ4eEgInEun+dTCC2kMBiJonVm1Ig
        7MeMEhuvi4LYbALqEvP3fmcHsUUEFCSOHAHp5eJgFuhglGie2Q2WEBaIkdhzeyUbiM0ioCqx
        +PJEZhCbV8BMYvK/F+wQy+Ql9h88CxbnFDCXWD7hDRvEMjOJ9sN3WCDqBSVOznwCZjMD1Tdv
        nc0MYUtIHHzxghmiXk5izqmPzDAzp517DWWHSnT+uc8ygVFoFpJRs5CMmoVk1AJG5lWMQrmZ
        ydmpRZnZegUZlSWpyXopqZsYQbEgwsC1g7FvjschRiYOxkOMEhzMSiK8wk9fJAvxpiRWVqUW
        5ccXleakFh9ilOZgURLnvd/DlCgkkJ5YkpqdmlqQWgSTZeLglGpgTBW0/yYr7uf993gKj9uG
        7ROvFB9bFGmUHf+jt9T3yMF/a+Jju5YsvnDxwJ6DhSJNOjfWKM202jSRf6FNLd/bClGnRskv
        BnxBJaapEzN7v3QbHQzmv3m5ZfWDc40bzt18EqcSKz33o8TfBoP6jqbChqin3YnN+Xu+2GhI
        Pz6lJT9RZUXDMscKJZbijERDLeai4kQAwtuoJnMCAAA=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

According to docu and dtschema check, 'gpmc,device-nand = true' is
no longer valid, so remove it.

Signed-off-by: Steffen Hemer <s.hemer@phytec.de>
---
 arch/arm/boot/dts/am335x-phycore-som.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/am335x-phycore-som.dtsi b/arch/arm/boot/dts/am335x-phycore-som.dtsi
index 5bb05620da56..034dc5181679 100644
--- a/arch/arm/boot/dts/am335x-phycore-som.dtsi
+++ b/arch/arm/boot/dts/am335x-phycore-som.dtsi
@@ -203,7 +203,6 @@ nandflash: nand@0,0 {
 		rb-gpios = <&gpmc 0 GPIO_ACTIVE_HIGH>; /* gpmc_wait0 */
 		nand-bus-width = <8>;
 		ti,nand-ecc-opt = "bch8";
-		gpmc,device-nand = "true";
 		gpmc,device-width = <1>;
 		gpmc,sync-clk-ps = <0>;
 		gpmc,cs-on-ns = <0>;
-- 
2.34.1

