Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DD145BACFD
	for <lists+linux-omap@lfdr.de>; Fri, 16 Sep 2022 14:08:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230512AbiIPMIV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 16 Sep 2022 08:08:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231266AbiIPMIN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 16 Sep 2022 08:08:13 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2061d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7d00::61d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D5F1B07DD;
        Fri, 16 Sep 2022 05:08:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gOECUFYPrZm9XxVNcvhC4RAr+ZSXWCXmvzFBvEMBf77eXeTAvcoRzZxY4slEeRg2NYH+m2RPWFo3TfHzj0m6KlVRz3dKXdyG/Wuj8Juz1gFtz4nF5Mb/WFFrh6tHV8lXR0dkBXaKpPjh+tAYVJv68QdyJRJ/jlYHkQ9fjNSyJwxoaL0a1g+Mq2KAUK0KIThiCvFths8I0wOlAzvlhKFAso1E2FawMIJaTceG7EA5ty0Ox9QqvzyALBb/T8lYr+A6tEbbLi3CIyOLCmAjrEcS2mnXECqdSYPid/Dm0/DdytyqzqtPu+OJREpJNdxxp5R1i7tPm/Rq2UKamQXROzmkcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f8OSsBGWL2fu9pifgQy0rHy2ryaiWNNvHdS60SZAXM8=;
 b=IgJy9gpGfRuFLz8HwCPGa15Z6GGAhRo+K6HqUuOh2/lryz0KJ3yJftF1Mj4k6g0rlRY5PuQdSSOJxvwzSsMfwqlOZvqfXHi/3YuXO6O/0rLohw/R85UAZNTdxgAkhZgBdHdXdLH6+4ojgsUvyRgqSsbkT4DRe97zF5QKbdCYrfrdO8/EIOm5tZ6QKb5y1/kFUhouToxx5UbAblJC2MKLFH6VmenyPDE/q5Pr4eGT5ggWbyZnPT+WKRPQEOcqYvza9N5O/ixUtz8H3mZ/fpFukvXemBT/iaVVFTQ9JvPBzcw4r2kI1+cfoy1/WF+khS80hXRs0RhLGM7NN98MXTD6gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.76) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f8OSsBGWL2fu9pifgQy0rHy2ryaiWNNvHdS60SZAXM8=;
 b=Qs/a2COvQ28BFPoBp9iLRbLpLqnb+GLqqZ4hidpitxh1riwkM7z0R9n9xDvMht5VPtV/8wO7IYcJGfVR5lVyRdyKv/B5czyGEYduF7BBEHXMbD01C42TaYB+tKIxWUQCNChHJKcwZipmqafDt2/kIyF3FmijT3hokwfOmY48iCtkcgw2j9J1VdUIuKJUYabONldpSDLRtUcJFQXQjkMAbYHBwXD/G524Vv3RqtpeNflemK2THFRps3qoMZm+QHYWteaAMi40GV5oFpTQWejiYn+YyFiGx9YPozFGOkdyGeq72c5VwNAOJhg/JY2lUczc0NNHRwpOOipBzys4kV7kIQ==
Received: from AM5PR1001CA0039.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::16) by VE1PR10MB3936.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:16a::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 12:08:07 +0000
Received: from VE1EUR01FT021.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::5b) by AM5PR1001CA0039.outlook.office365.com
 (2603:10a6:206:15::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16 via Frontend
 Transport; Fri, 16 Sep 2022 12:08:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.76)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.76 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.76; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.76) by
 VE1EUR01FT021.mail.protection.outlook.com (10.152.2.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.12 via Frontend Transport; Fri, 16 Sep 2022 12:08:06 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC8VSA.ad011.siemens.net (194.138.21.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Fri, 16 Sep 2022 14:08:06 +0200
Received: from bennie-lenovo.fritz.box (144.145.220.65) by
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.12; Fri, 16 Sep 2022 14:08:06 +0200
From:   "B. Niedermayr" <benedikt.niedermayr@siemens.com>
To:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <rogerq@kernel.org>, <tony@atomide.com>,
        <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>
Subject: [PATCH v5 3/3] dt-bindings: memory-controllers: gpmc-child: add wait-pin polarity
Date:   Fri, 16 Sep 2022 14:07:49 +0200
Message-ID: <20220916120749.2517727-4-benedikt.niedermayr@siemens.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220916120749.2517727-1-benedikt.niedermayr@siemens.com>
References: <20220916120749.2517727-1-benedikt.niedermayr@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [144.145.220.65]
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
X-TM-SNTS-SMTP: D6C2432536DEF1B57229023358F3385994EC9B5EE406E35E2474F5590CE04B8B2000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1EUR01FT021:EE_|VE1PR10MB3936:EE_
X-MS-Office365-Filtering-Correlation-Id: bcf16aac-2b3d-4a53-93a7-08da97dc1d86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PTeEIpnccWrRCTQ1fIsjTN6wbzEuVLC171f9aRmzQLeOcqmLdMfkBBA+FAmiBYc0rmOVme5jOJY0lXO+jet5lo1/Sz8bzr9XyuDKce5rPZDqocu5OYocKDuyaWxaJ0dPz5wdRfbFOtRznpssRHWc3x4nhied9LKGbipytkXor/MJ5p0T4V/vh3XO+EHivIF1Ur29Aa9XTxG5DWH3yXSQvjzeagioiEg4qtqxMImqL3rim5k3Wp7YNcBe7ln/mWnPEZMht92Gh4YMT1Kstx13zSQJpz78yQo2iV+gkYyf/RAo4ltwUkwSy6iKhbNJyyAcq8hqCa+0Uz+RCOVH199mBCx1vx5p2CuS+bpRQeA6MsZtEoeyGJdyqbxKn0mUDmw9KQIrWml1CikeIavSgDOq2sPyAx28x/zcrpIc8IAU7GudZPFPE5O4WB1D2SjOG6BrgY1qOc+QI1WYLyMeWHyDkPht2CtXR+j+DIlO6Se+HqvYhDffShqmIYDYjG5aex72AGwfNpEFe2ERTZ58M+4a0Bf+U0KeQCvf7iWJ7lo+wsUnWitfQXRahKZt6Gx8QkD7oRKtaji+Cca7/RBR5DuVICWGOqe6oJRXEs5cCO8E7WXSKuodjpvjU3Jaf5oZY5/EgmyWVkiJE0wcsDPg/++4ixhdRpXeu14TCVEmMyz0rtba3EjNbexATeTxRIMmGmBe3mpGiL2zJNXeyRB7t98mN+obRWHvChVo8qnDqXtfvrs6rpywYUp2hJCqv0hAaviD/UVwYLadeD5IVf1otWLjlWGAULnTioUDC79KIcVEUvFIdKyRiRO73f2odfGawsJj
X-Forefront-Antispam-Report: CIP:194.138.21.76;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199015)(40470700004)(36840700001)(46966006)(8676002)(316002)(8936002)(5660300002)(54906003)(86362001)(4326008)(70206006)(70586007)(110136005)(82960400001)(36860700001)(82740400003)(47076005)(40460700003)(41300700001)(6666004)(956004)(478600001)(26005)(2616005)(81166007)(16526019)(336012)(186003)(1076003)(356005)(40480700001)(82310400005)(36756003)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 12:08:06.9679
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf16aac-2b3d-4a53-93a7-08da97dc1d86
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.76];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT021.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3936
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
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
index 6e3995bb1630..8e541acdb1ff 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
@@ -230,6 +230,13 @@ properties:
       Wait-pin used by client. Must be less than "gpmc,num-waitpins".
     $ref: /schemas/types.yaml#/definitions/uint32
 
+  gpmc,wait-pin-polarity:
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
2.34.1

