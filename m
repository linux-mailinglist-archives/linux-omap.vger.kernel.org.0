Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 815B65AE8B1
	for <lists+linux-omap@lfdr.de>; Tue,  6 Sep 2022 14:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240069AbiIFMsJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 6 Sep 2022 08:48:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240089AbiIFMsI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 6 Sep 2022 08:48:08 -0400
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (mail-eopbgr20061.outbound.protection.outlook.com [40.107.2.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3114B580B1;
        Tue,  6 Sep 2022 05:48:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IkdfeW/wsVLNfEDfwoUEt8yXHuuBspSYcWGqZv6OMBgGbMhQGRaTLRC0dptt60qOvhbpM8x1A3c5EDR/9Cz6EB0QvJz8rGpTXvEyQzvR+V2dVyDqzTFII1ky0GpFr4z/bOEXL1YkaO2FWIXWYSm/0lVN+TKc8ZMDWbRLlRBAJm7T+2HT0jjbDtbmhh4uwOB9o/ebviUrQF7OUUixyImnJXDDJNSWKH1pI3Ul6kdyejF4ZKvRqf9JNKaxslP+IlbmqACqBMpOkj/f/ZNSod5qfB/GCtLl3j3nSTh5U/vsndnQPA6ha4SDNG6jNidH7Zhx7iI2Leb+VWfew1qXU0PcaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FYJ+DnDcwvzKIB5SPuCxcJxEu1REjYn3keTA74iTLyE=;
 b=PMWaJ9VfhZBqZiet1+cbmoyD7EkOPe1yXJ+SiKgRlmdzfkCCw1KicZvTFJavnT3p2Sbxm9bQq3GVPNFt3dkLqcBp0C5a++33cU3NXX6YHiI4JwqhPPbPLQfuAprhvHNUnRdxn4vgdqwdwuwOcJbajCY+TNxN2xienDpKrsJ6LZoOtQMS4kuS6shRMPwsW9Mi17zhMSIjZYm+P1haiJMice5n63HfoUqZZU+eSWlBC/JFmAxA2ZjsHHd8MSqmhS5RwCrpcKmsPXg5Z8GjaXXvaya2xiDB+6s1WOyKLMLEV0yaM3eqATiOWDWodzEOa4OZJ3BkpLhQdiC+OEPT1ubgyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.76) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FYJ+DnDcwvzKIB5SPuCxcJxEu1REjYn3keTA74iTLyE=;
 b=jFROnylkMYEcNB6X3Ulpm33Ri0YKGecVs0X+g31xx4fJ8OWoFewcWCghyGyohn2oj90hffddGQTg5PHu2bGVlLi4qMAfhyJBe8XUzNUzAjjVB0csLnBe2BP+Y1FOGUThHsiWBfpsUVaABGvZzjTbPx4Yez5kn/kil39Af7xmpUH3An/YKGpz+gXITaW9huGbPqWYip64pMqSNJJnJqXk6NvyARfDqDVtJL1z0uezktSmwx1j5VctrHceFKOFmWVcDsWIGMyfc+82UU5RNuacEEqeEnKxG0T7AUswhRDJaGl7kL8v2eXJD3j1H64jEhzXGWAeLsWd/PHJ4R6F8j33mg==
Received: from OS6P279CA0151.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:39::8) by
 AM7PR10MB3591.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:13e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Tue, 6 Sep
 2022 12:48:03 +0000
Received: from HE1EUR01FT093.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:e10:39:cafe::5) by OS6P279CA0151.outlook.office365.com
 (2603:10a6:e10:39::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11 via Frontend
 Transport; Tue, 6 Sep 2022 12:48:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.76)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.76 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.76; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.76) by
 HE1EUR01FT093.mail.protection.outlook.com (10.152.0.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Tue, 6 Sep 2022 12:48:03 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC8VSA.ad011.siemens.net (194.138.21.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Tue, 6 Sep 2022 14:48:02 +0200
Received: from bennie-lenovo.fritz.box (139.23.126.196) by
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.12; Tue, 6 Sep 2022 14:48:02 +0200
From:   "B. Niedermayr" <benedikt.niedermayr@siemens.com>
To:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <rogerq@kernel.org>, <tony@atomide.com>,
        <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>
Subject: [PATCH 3/3] dt-bindings: memory-controllers: gpmc-child: Add binding for wait-pin-polarity
Date:   Tue, 6 Sep 2022 14:47:45 +0200
Message-ID: <20220906124747.1767318-4-benedikt.niedermayr@siemens.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220906124747.1767318-1-benedikt.niedermayr@siemens.com>
References: <20220906124747.1767318-1-benedikt.niedermayr@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [139.23.126.196]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd29b7e8-4943-412f-9fd0-08da900609d6
X-MS-TrafficTypeDiagnostic: AM7PR10MB3591:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yx6EfpNlAWUpphTpAyBzeQe64cZmKCt69so8ABtR5I8ZY6Oe2t3yxhjY25vShPGYTHUSnvHBNu0cWuR3+Ya/9vz912fuLcH9IyVodoWUI/t9iRbVH7uQS3KgqCVmVN1EdUhckv3dtng9gnsJ6igY+sd2lOM0SGcGYwifECeCAdIvblX1iTBnTyq0yYfJxamIpjHLy7ZzqwvqszBWqn4D9cxxZvI5Lq5fcPqsSBd6v21n+5g5NMT23pVBUZoSHVLk6VJHU18lOIxvvE6PhaPmv6QNRULCfWY7GcVrHXA6TjxHEWKcv9fOLOyms7SHdmbXZArxUQXMjMhoK+wyY+RXHuE9OvjPFb2XEa/lGsJd9KoreLu2xjb6pdZU/22UnYqZtXMgxWF6kxnSQo0Ak7WFtRs0kZGD/clCIuUpFGt3qDfflwCjc3XzXh2culKEKznfUhxJq/JLWUTYf4sxc31qF4AYt46LYjKoRI0UJ1rYml/weak2s7TpBMwCk45xaGZ1E+ofmBF4H7se/Zg/JxPEPNYFD+7Dc2QNRnQgKIZV44kmfClD5lhq1NzjnI+Ma9pNHGwLEJ/H6DKP9pTKnLJc82rCRp8sIxFExGCXfc4yi3FzW7b8XMCPjO7b8fd8sPrZZeO47i7teE2+xO0/C5DVOcisymiYg7zANa263HiTR3ApJvb2pylfjQON2G95iFAr8BfK2N3/t5s6Z6CUA38pHo+boHoiJ+/daH9OG50J4MxOYeLvXR6eVWS2A01+heSB9wzWDrcF4P74rWZQ5GSRIHpvLa+1WS9dTuirXnijusaINxs0sBrxf024OXSjELds
X-Forefront-Antispam-Report: CIP:194.138.21.76;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(136003)(346002)(376002)(46966006)(36840700001)(40470700004)(36860700001)(54906003)(316002)(5660300002)(36756003)(70206006)(70586007)(8936002)(2906002)(8676002)(4326008)(47076005)(478600001)(82310400005)(40480700001)(6666004)(41300700001)(26005)(2616005)(336012)(186003)(1076003)(16526019)(81166007)(86362001)(956004)(356005)(82740400003)(40460700003)(110136005)(82960400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 12:48:03.4673
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd29b7e8-4943-412f-9fd0-08da900609d6
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.76];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT093.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3591
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>

Add a new dt-binding for the wait-pin-polarity property

Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
---
 .../bindings/memory-controllers/ti,gpmc-child.yaml         | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
index 6e3995bb1630..7c721206f10b 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
@@ -230,6 +230,13 @@ properties:
       Wait-pin used by client. Must be less than "gpmc,num-waitpins".
     $ref: /schemas/types.yaml#/definitions/uint32
 
+  gpmc,wait-pin-polarity:
+    description: |
+      Wait-pin polarity used by the clien. It relates to the pin defined
+      with "gpmc,wait-pin".
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0
+
   gpmc,wait-on-read:
     description: Enables wait monitoring on reads.
     type: boolean
-- 
2.25.1

