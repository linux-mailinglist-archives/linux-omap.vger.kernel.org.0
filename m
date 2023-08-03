Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04AB676E447
	for <lists+linux-omap@lfdr.de>; Thu,  3 Aug 2023 11:24:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234377AbjHCJY0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Aug 2023 05:24:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231717AbjHCJYX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 3 Aug 2023 05:24:23 -0400
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E2E72684;
        Thu,  3 Aug 2023 02:24:21 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3739O59n122004;
        Thu, 3 Aug 2023 04:24:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1691054646;
        bh=zqbwm6MC4jGIsnXvhDBCNFfNtjyo4cmP300g52xJ8sI=;
        h=From:To:CC:Subject:Date;
        b=eRAVSn1k2cquhYbwU2UAWgjhKx6iu3+zzlbrb7XhVt18tFS5MvmXwl9nRlMmf1CjM
         618XFwTiwPZadQqdWXhmglLK2dAgONyHsB3cNfafXeywaXuiXQG6DdzP1eQGeNz9qM
         MFoRPAzQyM3dFvLP4Ke4NpDJ0XMm3mPRmbtHoEi4=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3739O5tt011655
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 3 Aug 2023 04:24:05 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 3
 Aug 2023 04:24:05 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 3 Aug 2023 04:24:05 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3739O4e8073795;
        Thu, 3 Aug 2023 04:24:05 -0500
From:   Dhruva Gole <d-gole@ti.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tony Lindgren <tony@atomide.com>
CC:     <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, Dhruva Gole <d-gole@ti.com>,
        Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH] dt-bindings: pinctrl: pinctrl-single: add am62x compatible
Date:   Thu, 3 Aug 2023 14:53:12 +0530
Message-ID: <20230803092311.604610-1-d-gole@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add the am62x compatible property to add support for the new
wakeup enable and status bits positions

Cc: Nishanth Menon <nm@ti.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
CC: Tony Lindgren <tony@atomide.com>
Signed-off-by: Dhruva Gole <d-gole@ti.com>
---

Base: tag: next-20230731 + below "depends on" patch
Depends on: https://lore.kernel.org/linux-omap/20230731061908.GG5194@atomide.com/T/

 Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
index b6b6bcd7074b..4c98035a1217 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
@@ -23,6 +23,7 @@ properties:
           - pinconf-single
       - items:
           - enum:
+              - ti,am6-padconf
               - ti,am437-padconf
               - ti,dra7-padconf
               - ti,omap2420-padconf
-- 
2.34.1

