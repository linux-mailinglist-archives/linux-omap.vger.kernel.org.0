Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B8FD3154FE
	for <lists+linux-omap@lfdr.de>; Tue,  9 Feb 2021 18:25:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233056AbhBIRZE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 9 Feb 2021 12:25:04 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:37860 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233006AbhBIRYh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 9 Feb 2021 12:24:37 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 119HMp01085887;
        Tue, 9 Feb 2021 11:22:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1612891371;
        bh=gLPOWBcLoOIZsFLFYE62/TxqUqnYanN+WmoUGs4UKdg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=JPKuoJBN7GMY30i84UthXf1R9TwMi5fBGl/vAm8+zlQ2na1xfuDypSKyfGYq64JZG
         1RkmcuXhwxShCfhdkCx0taAxxhFnyp8v+nf7slG2sT9fnAPsXOO2QnCjlElBB75ril
         YavT5+kIHKZHLKyUKufPeSEsqm9Y/tlBXN9fQiLk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 119HMpWF002672
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 9 Feb 2021 11:22:51 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 9 Feb
 2021 11:22:51 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 9 Feb 2021 11:22:51 -0600
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 119HMpCg128865;
        Tue, 9 Feb 2021 11:22:51 -0600
Received: from localhost ([10.250.35.110])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 119HMplY007512;
        Tue, 9 Feb 2021 11:22:51 -0600
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH v2 1/2] dt-bindings: hwlock: Update OMAP HwSpinlock binding for AM64x SoCs
Date:   Tue, 9 Feb 2021 11:22:39 -0600
Message-ID: <20210209172240.2305-2-s-anna@ti.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210209172240.2305-1-s-anna@ti.com>
References: <20210209172240.2305-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Update the existing OMAP HwSpinlock binding to include the info for
AM64x SoCs. There are some minor IP integration differences between
the AM64x SoCs and the previous AM65x and J721E SoC families.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
v2:
 - Drop AM64x example as per Rob's comments
 - Update patch description accordingly
v1: https://patchwork.kernel.org/project/linux-arm-kernel/patch/20210125235653.24385-2-s-anna@ti.com/

 Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml
index ac35491a6f65..3c69dc78e6ee 100644
--- a/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml
+++ b/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml
@@ -14,6 +14,7 @@ properties:
     enum:
       - ti,omap4-hwspinlock  # for OMAP44xx, OMAP54xx, AM33xx, AM43xx, DRA7xx SoCs
       - ti,am654-hwspinlock  # for K3 AM65x, J721E and J7200 SoCs
+      - ti,am64-hwspinlock   # for K3 AM64x SoCs
 
   reg:
     maxItems: 1
-- 
2.29.2

