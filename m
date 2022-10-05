Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67DAB5F564D
	for <lists+linux-omap@lfdr.de>; Wed,  5 Oct 2022 16:22:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbiJEOWk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 5 Oct 2022 10:22:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbiJEOWi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 5 Oct 2022 10:22:38 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2047.outbound.protection.outlook.com [40.107.21.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEF3178BCA;
        Wed,  5 Oct 2022 07:22:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Om+WyKNqOK+JSYTbSLDafFc+kua/gneSd8Oe/14GeHsm72lFUnuWR9yebuh/fo/JATsGIynNmzhWS+9m6biZhGKLJqjRKE0ds+Zy7mBhutArhBUIXLbv9gk2UHWjnfhjwEJr/EKzdbkqKVBrVTS8pZQVlexIU7AqiYE7xbNRWjlfoFiL+DPNlQG+EjovNb4efJdv5IWY4yieo0EYEoOuAHxXfsd9GBp8BUq6tBUzSgEBna0HZdYeEtVNLNe9lsq/0LokxciEoXVZUOIPUYVz5OTtDaaZiqHuLNNyutJInIPkRv+F222U7aRtGy42tkS4eha0p6+9GVNbfBqx0VBlpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NZtnFuqgOa72q0pgvjU1YQHviKTQlWGFTuBxhvDypxI=;
 b=fS2IFcCMvWv1/BkSLPVgZ8NYw9EuvpP5i1PNks7EWZzFzWq0j6pOgDhCONERlPHC9+YSPT3GTGrvZU3xXc4TftkH2TWHpVoUMMb3Em0lcXDU7VjR2FD7AKNiWZ/Knj1PUPzR2HH0EI/sw+UsYm1wg2OWtwRCsLpcEHwpH7hHpJGx6bMr8Na9CxGCMRjfMrjqYBk2abDVJlr/mJvDNt+0HAkzBtyTgStIFPX3ZUiOzSiJgwK4j7nz0d3C2t34nr/JtCm+3T2Oi/1yKEuu2WseZdtlF2N0ZlKjtAL0fhvNCSvBKXXBfn7evXGQkOtxm8xIfoWaMbK9BM8WZ3gb5YNIbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.76) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZtnFuqgOa72q0pgvjU1YQHviKTQlWGFTuBxhvDypxI=;
 b=SrmwJHWfAo2ht6mrkOlqUB40VHrYAIQCea/z8p/k4sncXpENpXgQhozX+5dK+EopP/AlRb8/CJ9wOs+XnAXnm8/qUumVbWtOG9nAcedpsdR6Eg0AxKT07WZ0l4KMbFPtDERciq3wdrCVILpBtEpt5XBacKM0KRE9jkkj0H26GszU3aHEVFqSxhUaykdpLbBbEo0KWm/ZxIH6Vy1HyDaGoSnPx3esdwzxXnbSdNKdRm6ug6t6z53yTwS50/Du4a5V2Im+Q12ReYJUF/SfaWNhZxM4YCwpN84PLO3BAlOw2X2c7jVtRrpCOEeOeCXZQGsDERfEL0o1EVId+EP2FUx8uQ==
Received: from DB6PR0202CA0005.eurprd02.prod.outlook.com (2603:10a6:4:29::15)
 by AM7PR10MB3525.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:140::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Wed, 5 Oct
 2022 14:22:35 +0000
Received: from DB5EUR01FT022.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:4:29:cafe::b4) by DB6PR0202CA0005.outlook.office365.com
 (2603:10a6:4:29::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32 via Frontend
 Transport; Wed, 5 Oct 2022 14:22:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.76)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.76 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.76; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.76) by
 DB5EUR01FT022.mail.protection.outlook.com (10.152.4.244) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Wed, 5 Oct 2022 14:22:35 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC8VSA.ad011.siemens.net (194.138.21.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Wed, 5 Oct 2022 16:22:34 +0200
Received: from bennie-lenovo.fritz.box (144.145.220.67) by
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.12; Wed, 5 Oct 2022 16:22:34 +0200
From:   "B. Niedermayr" <benedikt.niedermayr@siemens.com>
To:     <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>
CC:     <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>,
        <rogerq@kernel.org>, <tony@atomide.com>
Subject: [PATCH v7 2/2] dt-bindings: memory-controllers: gpmc-child: add wait-pin polarity
Date:   Wed, 5 Oct 2022 16:22:24 +0200
Message-ID: <20221005142224.287982-3-benedikt.niedermayr@siemens.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221005142224.287982-1-benedikt.niedermayr@siemens.com>
References: <20221005142224.287982-1-benedikt.niedermayr@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [144.145.220.67]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--9.764200-8.000000
X-TMASE-MatchedRID: FgBlj4RFa/fEuqVdWhBa8X8otomh/kVbH9B97WCZlj2VyEX4i+SWU0yQ
        5fRSh265B0L0/Ut7x1D47Xv617HbR+THRSYVdIx5q9dxv4TizKefv2cITmCgNtfeP+V/VXwsm2C
        Uy/KcAJ4RxZBQI0dbZ/WKGThQ2qZNfKZSSl2fkbJNVVoqlq60cKPFjJEFr+oldywMrbEEeHuNo+
        PRbWqfRMprJP8FBOIaSV75InlJNiVWinQHdvOEPaUSlfmMuqTbB6/NalQ+MetfLg8e3/TOYg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.764200-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: EC0BCEFD6C11C31192EE0C83D6863A64A78E4B9F3940594630BED8592DF7D71E2000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5EUR01FT022:EE_|AM7PR10MB3525:EE_
X-MS-Office365-Filtering-Correlation-Id: 91b68b10-735d-4db1-bb4b-08daa6dd0c98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mnCq0uD0ZRa1dsxaIzTp0ME8URoR4GqEo5hcKaIBlNjpS4XKHIIEIaM629chRK0O8U5alwYPt/OF2/Nva8hAuAEpW1T+imHE0jocQ3wrbAyKMcEcXnSWkER1nTZes5au0/MI2TSnvi0RW/bk7mVfDVy/mHT2Q3MBuH8YMsGpzwPOAQedzJY5zmY06UqPjjo/M64Of+J+j0Ac/P0CYwe448Wq52RkJSfFyYg7p2zcQn30J2aJ9zMwvKprLNVgmG9UjR7EEJBXVkWQk05m5TPiAMI0YNDMkZ7iK0q4kcQU9xuECL3kbUVzF4PtWDEJIPLOlGwwdMsk6Zm/rQVmZPRAKNCdZa1JjGtsEpKgv3W+7lXDG3vka8WOksyCRCXzXs3LTzrDjL1RRcuTtqy6RNePhgEj36FKttWHeyFeZe9JEDbQOayOvgNTKyRRdszO9AuZgRg59VRsjp+2UAXDFz/8pzzg3OxS49pCsTdBX4GcGVPixjBGNfv2dEXazBSitsJICKsIHu9DYGwhsGa0FXAWJlF+xJAC9kBUDB5w8Ug47nHovHedp35rHjXiG0oKqJB+fELMf2YXq7MJTeV0x8Eyjx1214WW6sAQn88KNTr/V30N7aryr8x5lK0JdliRHMQFZJXjlI7xBu+mFfImRxtudvJEW7TpsNCqoqPUBZj7mfBjf9kVvqsvdtTb9gtqMMza6MPkFASHHA1sJxsfMAGBMo07Og/dOgeO+tTtEwNvfRwQI3aDB1U9/OU9ABoXEgQIDkOXqn7MzyrfwGnrMzHmiFC84rCXddut4wtfhe1b4tK+eWBlg+wMdl+vi+iUA8MS
X-Forefront-Antispam-Report: CIP:194.138.21.76;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(376002)(396003)(451199015)(36840700001)(46966006)(40470700004)(36756003)(36860700001)(81166007)(5660300002)(2906002)(336012)(16526019)(2616005)(1076003)(956004)(4326008)(70206006)(356005)(82740400003)(82960400001)(186003)(47076005)(6666004)(478600001)(26005)(86362001)(316002)(110136005)(8676002)(70586007)(82310400005)(40480700001)(8936002)(41300700001)(54906003)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 14:22:35.4572
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91b68b10-735d-4db1-bb4b-08daa6dd0c98
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.76];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT022.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3525
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

