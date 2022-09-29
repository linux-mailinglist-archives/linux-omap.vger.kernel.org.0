Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81F025EF5D2
	for <lists+linux-omap@lfdr.de>; Thu, 29 Sep 2022 14:57:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235314AbiI2M4y (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 29 Sep 2022 08:56:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234687AbiI2M4x (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 29 Sep 2022 08:56:53 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60040.outbound.protection.outlook.com [40.107.6.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F2BB16706C;
        Thu, 29 Sep 2022 05:56:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F1B/XaCuEJogtc4jpI7eu2UrVQ4M65XWV3W3m0nyh0d9pDtX2024CQmXhTOWd9P3XBSY+zMBQzvxjqNlltCGSbW5+Fm9OeLGpcq7A7z93nSTru1ijfY+XphEtLW+e1NwjAREgMvWFqfGHVvTtXgkNXvNs2NvTmnwuq3qdJOhcc7v/UHKJ9UkJU1GqmAF3pCLJaDUDanHf2PPNiU1/HKwDT0t1+wEz9N8oDWhCYPwohSRqUp6qpBbVO4e3fkqT2sxYjAIjT0qAFN20st+KcHBJ7iC0ijr/GC+tlYNereLc7o2lsnNy91uhXSW0yDCnZEUD+mhbC94r4+zNt/IoYzkpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LhsHlVVMZxcQsLzBWBJOzjae1N+s6RK78SaF9v/+Rj8=;
 b=LdJqwTjgYuD8/wAKyqDhey7MOXIV1p0G2SXwQI6nys+eB2VAnsc/GHkGqO9eMCrbRthHxsKHg39N/rIR54AQobDga4A45SZEkh5nIBe7HWVECjWi8oxnZNA5Vx3Q0YGcfJempQPalINVDxGRIvazRQ8r3/OZRkRu0KZyvVAQ5VMfFZnZ6N4V6yRsy2CW/67Q/zfZHKYSKLYGCwWByypUBa6z7AI3NpV4mZLv0eAf0kcVIfZcl3bfd1dE3DIXOmmdsB1+STOxyE2h76i8mq84ayh6AaqFWN/FmroX34SjkFky3AxwoBhV0DIqyWIqv8kmWlVObYvOCotwENrhoLW9Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.74) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LhsHlVVMZxcQsLzBWBJOzjae1N+s6RK78SaF9v/+Rj8=;
 b=lqz0XaZ4luhiBWwBBYOQLvtHW26lnVdhepj1enHVkasL6ZErTfbh7AqWNPqXKoTJUDbIYqzejXMCSjbdloSKe7SC5iPU25Fxcg3B1bZ2vmS7fdoQJ4oIR7kEgRGJGPF6Wf1o8uKi9bowq9rSB3h5inZ3r3sjkjCW0DXZO+ZpoE0sy5jtOLq3KV6zl6LyilSVp9uxwxQXOs0vbP6xognWTflMnv4rNWwPtAjVk7fho48Gs55bDRMYAOKRWaO8s8CqYpkOcZoKtS/QFiKdxBasgKwDtkU8BUEeajiaKKgZJ8T+ae9pKrCCJzPd5oI9Bdy5mxRqArDLLsIphawV4ESkEA==
Received: from AS9PR06CA0649.eurprd06.prod.outlook.com (2603:10a6:20b:46f::25)
 by VE1PR10MB3838.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:160::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Thu, 29 Sep
 2022 12:56:50 +0000
Received: from VE1EUR01FT046.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:46f:cafe::d0) by AS9PR06CA0649.outlook.office365.com
 (2603:10a6:20b:46f::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26 via Frontend
 Transport; Thu, 29 Sep 2022 12:56:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.74)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.74; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.74) by
 VE1EUR01FT046.mail.protection.outlook.com (10.152.3.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.14 via Frontend Transport; Thu, 29 Sep 2022 12:56:49 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC8VQA.ad011.siemens.net (194.138.21.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Thu, 29 Sep 2022 14:56:49 +0200
Received: from bennie-lenovo.ad001.siemens.net (139.23.126.196) by
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.12; Thu, 29 Sep 2022 14:56:48 +0200
From:   "B. Niedermayr" <benedikt.niedermayr@siemens.com>
To:     <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>
CC:     <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>,
        <rogerq@kernel.org>, <tony@atomide.com>
Subject: [PATCH v6 2/2] dt-bindings: memory-controllers: gpmc-child: add wait-pin polarity
Date:   Thu, 29 Sep 2022 14:56:39 +0200
Message-ID: <20220929125639.143953-3-benedikt.niedermayr@siemens.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220929125639.143953-1-benedikt.niedermayr@siemens.com>
References: <20220929125639.143953-1-benedikt.niedermayr@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [139.23.126.196]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1EUR01FT046:EE_|VE1PR10MB3838:EE_
X-MS-Office365-Filtering-Correlation-Id: 5757885a-51ab-468e-eec5-08daa21a12ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7NDIuGJx8GJC87NJacO/w8Cdh2TSo4OLYxDbScK3dkcRiSJ7Rhhh3l+KoObcXHF4d5mykTpoz7WLxR6a773emdnGlyHEUtmEbkxDOn/D1Xp2P7jJlrKlIEhtvjQsNAR9fh4flBPwaRjBXZwHynnfG6sMUnc6eFP0D9aU1dv+DUP/kmBRrYz7UBgGGutI0/xQYgHuCXEcrKysVIoEzNZ5v2E2sXxBlCEq8Hjz2Y2SXHDoLqqcxkCId3ZLLN0MpobOLRztOZuXC2GUesFsYFibGqgkcj7geA5LMLf+fBPoMOu/1zl8+qBm8DoSZ8dpSC1j3svlf3QNeNIiYHbXG+QO2lNfwRueSyupRLG8Vj2TjBY+bC8tolqlM1wpjjSYu0ZVr4U5kd0NIzkXd7zPJHzam/ci5djjO25a0zHTpBzhni6L2OpcoljQOKIgHNjwN2qJUrKn76d0rrdAhmPQD398EV4FePJ6cTmp6+JFtKtKgb4B4rbx2JcIkI5p/kbJ+u/JzLKan5Vvr/PpCcWdnwriaA5TVqZHC8nFlv5dUAKgzvfxAntmHMHDIMTm8JLQdnAu7e9Le7mTpxhPydYRlswSGjla9GbHTIzbz41IMRIyVLzatun+6qQwHw5iTJ6sK2ofKEUfPi1flPYxRtUv6r5gqWWdbpPkr1buNbBsLktofASmxmXTEslCn0CFmY65Fpy/xZJ+NLgjLbzZOT81EGE3N8woaEV+E0cRd0kwpVuzD1AveenYeG36USzwC9C82RPl4wKiZoimwg03lOaudq7dHA==
X-Forefront-Antispam-Report: CIP:194.138.21.74;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(136003)(376002)(396003)(451199015)(36840700001)(40470700004)(46966006)(7596003)(86362001)(36860700001)(356005)(82740400003)(40460700003)(7636003)(316002)(82960400001)(36756003)(8936002)(2906002)(70586007)(110136005)(40480700001)(5660300002)(41300700001)(4326008)(8676002)(70206006)(82310400005)(1076003)(16526019)(186003)(47076005)(336012)(6666004)(478600001)(54906003)(2616005)(26005)(956004);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 12:56:49.6113
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5757885a-51ab-468e-eec5-08daa21a12ea
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.74];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT046.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3838
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>

The GPMC controller has the ability to configure the polarity for the
wait pin. The current properties do not allow this configuration.
This binding directly configures the WAITPIN<X>POLARITY bit
in the GPMC_CONFIG register by setting the gpmc,wait-pin-polarity
dt-property.

Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
---
 .../bindings/memory-controllers/ti,gpmc-child.yaml         | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
index 6e3995bb1630..477189973334 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
@@ -230,6 +230,13 @@ properties:
       Wait-pin used by client. Must be less than "gpmc,num-waitpins".
     $ref: /schemas/types.yaml#/definitions/uint32
 
+  gpmc,wait-pin-polarity:
+    description: |
+      Set the desired polarity for the selected wait pin.
+      1 for active low, 0 for active high.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+
   gpmc,wait-on-read:
     description: Enables wait monitoring on reads.
     type: boolean
-- 
2.25.1

