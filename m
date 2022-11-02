Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E0166163DD
	for <lists+linux-omap@lfdr.de>; Wed,  2 Nov 2022 14:31:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231280AbiKBNbP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Nov 2022 09:31:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231234AbiKBNbM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 2 Nov 2022 09:31:12 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140053.outbound.protection.outlook.com [40.107.14.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA93C2AC7E;
        Wed,  2 Nov 2022 06:31:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MHtTrg6vZPrPOeTiaO85YLHkd/TdU/l6CKGO3xpH/GEzTHGLqs1REUu9G6idmxSwDbcoLtl03CtDkAvGWYyBRM8V+Ye6hheY2xwRKTdfaUQ3rtrYZVpXZvA6YZwFVP80ej3wLOUKAgjgbFZlbHrnElcy72VP3VTI78r6LOwkz5hVrdX29sL5qgys/j20U1XbLaDoIP2AJEW0s31PM55IjtBQNdCg7LmshXTyz7W6lZmP5sMfkL/Ttj2PjGRRKJ3wzlrIPTz6rx2wK1zU9SH1E1x0KsLhnaBDbemD6ttn5MbMpWKgRHotcThgta3QqvcLc0Ko//ofRRBpR0ezsauTBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56RldKWZuolPzOyTc6UT2P2oP1CwTeYgXTjxt0/wnZM=;
 b=K6/MY8zQ0KK3JNXHaWlsvmIWT8FZ1P9+/2CTA/nJAcpezO+szu/sC06J6huZLQBjn4YSLj9i4gmImWxUk2IVWZ1VmEgRF696PPXPnLAmnryAQMAsMZEMY99L1VLIRGJ72O7SZNnyIksP5Oe7iRueQ6nNdAH9gU8Y3ovE9qR6wTlB16drevjBCf5JrEzKAb7mjMPHCiu/oHHSKzlIhnS2xzi8FXLdNsfulJN023o9UL5focsTOWBk80BbgbuETWB796kt/3aHnHr/s5vwZivLOsI/rYrPdIpaRckZIYaCYRZdiXO4ckia0yAZNvrcXtQ5lsb//vAqU31/3tcXQBwMBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.75) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56RldKWZuolPzOyTc6UT2P2oP1CwTeYgXTjxt0/wnZM=;
 b=mJRCXG5XoS/oBGEnxpBXh/tfbltw9nt9jM2dTmCCzoFaw4+BwlQukgHgeqaGMtNJ40AEU9Ck5G7Rh8oAr2ZtdVEZ8YSuxUs+SqMmK0rSvuSWG9mmIQSrw14ORjDdHHwldk7lf6AWbm66wW9MuvM+0056Dr+vDBzfDzDeihuLI7k/kayxQthsg3A9iwWP80JGjg/BsoO9ozimaExdrFSeO21Qxp+wV2f2cExtUCjuCuWIPaBc+j0eUFgUZcl3IG+vc1taxlJ7zxH6BDCbFUNzvEsKSDwUCQ0NlRDKQn6+TipY3x7aTyFgYzZyb8Welh6MDEb9/dh5Z76EyFQ6pqa34Q==
Received: from GV3P280CA0107.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:8::9) by
 AM7PR10MB3701.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:13a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Wed, 2 Nov
 2022 13:31:09 +0000
Received: from HE1EUR01FT018.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:150:8:cafe::15) by GV3P280CA0107.outlook.office365.com
 (2603:10a6:150:8::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20 via Frontend
 Transport; Wed, 2 Nov 2022 13:31:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.75)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.75; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.75) by
 HE1EUR01FT018.mail.protection.outlook.com (10.152.0.175) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Wed, 2 Nov 2022 13:31:09 +0000
Received: from DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) by
 DEMCHDC8VRA.ad011.siemens.net (194.138.21.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.15; Wed, 2 Nov 2022 14:30:58 +0100
Received: from bennie-lenovo.fritz.box (139.21.146.184) by
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.15; Wed, 2 Nov 2022 14:30:58 +0100
From:   "B. Niedermayr" <benedikt.niedermayr@siemens.com>
To:     <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>
CC:     <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>,
        <rogerq@kernel.org>, <tony@atomide.com>
Subject: [PATCH v9 2/2] dt-bindings: memory-controllers: gpmc-child: add wait-pin polarity
Date:   Wed, 2 Nov 2022 14:30:47 +0100
Message-ID: <20221102133047.1654449-3-benedikt.niedermayr@siemens.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221102133047.1654449-1-benedikt.niedermayr@siemens.com>
References: <20221102133047.1654449-1-benedikt.niedermayr@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [139.21.146.184]
X-ClientProxiedBy: DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) To
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1EUR01FT018:EE_|AM7PR10MB3701:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d43027e-468f-4937-4e91-08dabcd680c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZX9y4p8LTbVoDxsKZ/8JJ90QaStAPX6n/WrKxgZd/cdmGbNZgcsIt3cw/zt9Ha3qZ40mOw9rC9DD9UNVjV7lFVF/wt+zYSJ3dGgI/Xx08wh8SaXddXYsEKDMP+NI7ayTDQk9TF5FOj3W+95gttTjbSsG1uUT1fEExRBDtyI9XAA34byLqa4cWIKXQZzoiuRuQsz+qVeWhydbChCX9QBsEfyTYnDo/bWt+bEuq50WjiqtSPmUoMgl8shsr9/I3pmI3Dl38eA7XktgmKphE/hCuvGN2okY3ZB2TkHjVQ10b74nvQd+K3eGuUh/MBxraOExBViobPr8kxRoVRtj/+dQL3Yu1NKH8Crx17Mo+h6WalD1Ji2VviEmrXitjZQRc/GwHrwEYKQ3ANXAUwVCgxVeRjcZKKAe5AMiS08vFoKTj4N8bHPJM0Q+Jf6rwP61GZf4NxU07gNQdsOvVaGsm09idRb4NAUaOcjxDtT/pt6TP0sNFTs+X3eWlc4blvsKScNEbR5Jgwh02UknyFYvWhVRTESO4jX2oBITRhusCi2Xwt61wg4MAg3TKlw9uX+iAaD7AGJg97kVDRV5lVv+3kggIkDCff/jGX0V+mawUttILj4nDBGdy7YdfgE8swxEYsKzQ0fF38jfh/hbcb7gSnpc6Rb7Sfju3nl8EyrVu9WdN/IAIOv+X+ME2Z3zhAoI8CRGsyjGltBPxuYCq9s6Kn53m6niX+omR5G/1e8O1nS0JbYjaLWK2fkf20fUTbC0tWuGWHxPwTtWDdivxlul7ZJPNFE5o1SDeVtkE0C5Yddt3wmYK9ZGUJE1ZdxkSFwPtKAb
X-Forefront-Antispam-Report: CIP:194.138.21.75;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(136003)(376002)(451199015)(46966006)(40470700004)(36840700001)(82310400005)(36756003)(16526019)(356005)(40480700001)(316002)(478600001)(81166007)(2906002)(5660300002)(8936002)(41300700001)(70206006)(8676002)(70586007)(4326008)(110136005)(54906003)(2616005)(40460700003)(47076005)(26005)(956004)(336012)(1076003)(186003)(82960400001)(82740400003)(36860700001)(86362001)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 13:31:09.4493
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d43027e-468f-4937-4e91-08dabcd680c2
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.75];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT018.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3701
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
in the GPMC_CONFIG register by setting the "ti,wait-pin-polarity"
dt-property.

Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/memory-controllers/ti,gpmc-child.yaml         | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
index 6e3995bb1630..4a257fac577e 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
@@ -230,6 +230,13 @@ properties:
       Wait-pin used by client. Must be less than "gpmc,num-waitpins".
     $ref: /schemas/types.yaml#/definitions/uint32
 
+  ti,wait-pin-polarity:
+    description: |
+      Set the desired polarity for the selected wait pin.
+      0 for active low, 1 for active high.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+
   gpmc,wait-on-read:
     description: Enables wait monitoring on reads.
     type: boolean
-- 
2.25.1

