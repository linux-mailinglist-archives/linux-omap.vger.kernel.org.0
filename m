Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B3505ACC6E
	for <lists+linux-omap@lfdr.de>; Mon,  5 Sep 2022 09:28:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235759AbiIEHWK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Sep 2022 03:22:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235590AbiIEHVj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Sep 2022 03:21:39 -0400
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50081.outbound.protection.outlook.com [40.107.5.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A53D402FF;
        Mon,  5 Sep 2022 00:17:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J5eb0wwyTCMghosQh0imzGsw+LO63oIHoW02BM7kmR9p/rCA3HNFCjuD7JZnpN1K59LGca90RtuibI448rAJ3UyBXLp9PkASd3DXELkVpWOuxE3AE5dh4LxRRJjEe09/cGaOf6gWdO3Hb6x3HOde+m3f+bnePIuWcCY0b4OCpLTY7Uc65xyA67RRVDCEy7Jxumpq2/4PVesPVxvCC6tKpSRkpTd6P1CyrPYTeXsxgPkwwyN1+/p1pogPLg3U1DB9CcdJijMwceadOQQZPrizNRak6Za2KIHv2ychja4e8wNJCBBoTd/m3npiP3JlUP9y2tiCiGxGqXXXYPaQv7y3sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FYJ+DnDcwvzKIB5SPuCxcJxEu1REjYn3keTA74iTLyE=;
 b=j3K9/uut15c8qjdJhnFF2Ln3QPNiunmJqqMiYPr7kBItYo98jmeSpd3/MZK5Kn4PcB/0hinTNkTK0GQx75R9v/BrBY/CqX68FUS+sHAvquq2Coc1CNjh+29WDNByInPb80OPRcPIskS7AFNfgq8NVhZDfPjCU2FbbD1hAqoB+boCOpeqzyngShQ2kiPTs05iTb5rdgjWUpSqnZr6vpy9mB1fEoSraYR5BsJA/+YuRe5HyBCsPjS1B6hrojuxkOmLeiK4GKCYwuwiS2a1ECZByq2qE/6Q56lRsn4C2Gv/BC3G9wH7jJvz5ljq93ML0F9c0TkzvbMAQ//+0ZSjGCdYaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.74) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FYJ+DnDcwvzKIB5SPuCxcJxEu1REjYn3keTA74iTLyE=;
 b=ZM4LCe1wS0sudaP4lg25aCmmW/lYeGOu+wbyw1hh3ivvGAj68mAqkveXSJYukZthV0SKXpKKog8iDaL4UJ89FzBRCe3ZPE++I+3nRjUkydu/QRqd43mimXfXPe+L8nmnrkYh7deHo0xQm24wetS8XdjRZuNtqf4TSUOOFP1UbInWYpkh1scxz5zb0a8XWsbfSSI1eHLOPpkQ4eG/X11/9aAqdBLRtcTtSHXu3EREiFqLBPYK5wlSQ6f91asD36UwCtB3Po98EVY3/yT6QHnym4gtTqMxz/rYnNPz4tR8jN/UUvHi8u0dTlYDTatx8hfTqWP28EqYsprPXROY7krYdA==
Received: from DB8P191CA0012.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::22)
 by AS2PR10MB6774.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5f2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 07:17:47 +0000
Received: from DB5EUR01FT008.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::a5) by DB8P191CA0012.outlook.office365.com
 (2603:10a6:10:130::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Mon, 5 Sep 2022 07:17:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.74)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.74; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.74) by
 DB5EUR01FT008.mail.protection.outlook.com (10.152.4.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Mon, 5 Sep 2022 07:17:47 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC8VQA.ad011.siemens.net (194.138.21.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Mon, 5 Sep 2022 09:17:34 +0200
Received: from bennie-lenovo.fritz.box (139.21.146.182) by
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.12; Mon, 5 Sep 2022 09:17:33 +0200
From:   "B. Niedermayr" <benedikt.niedermayr@siemens.com>
To:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <rogerq@kernel.org>, <tony@atomide.com>,
        <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>
Subject: [PATCH v2 3/3] dt-bindings: memory-controllers: gpmc-child: Add binding for wait-pin-polarity
Date:   Mon, 5 Sep 2022 09:17:17 +0200
Message-ID: <20220905071717.1500568-4-benedikt.niedermayr@siemens.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220905071717.1500568-1-benedikt.niedermayr@siemens.com>
References: <20220905071717.1500568-1-benedikt.niedermayr@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [139.21.146.182]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 084aee99-5654-4048-d3d6-08da8f0ebc50
X-MS-TrafficTypeDiagnostic: AS2PR10MB6774:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9wTRfFmoT2tM/aIvRpfEMXd9+L32uV006k9xTuONFIU0BEUKSiqVcFDbn2oQVEOaplf9fDhWkWZOyJvkXDnjKMP6wTunerNawRJ6MgUEWHMEvAPT1FvCc53or14QRRigaEs9VFM1MpCczWYJW+VLMJxVFOHMhlo4KnriFrcbFC8gAEuJC2fSSK1xSznYwaJzzSehr+lws6X0tIxu1OzqVeA2ZQn+8K0XpALVi1B+8TWT/D15jseNGIwtHvUkCnpkiwePJpXqpc+ufylMpapfAIq7mpAOqBaDJx6EZtAGu/T2rQ+Fveg0kvT3KvgvB+uXcQbCp/Bc8k18lKPZvBaK4vqAX4YoNNflEoJTGPLLOScv9udYYM36+wujGjMz+aHTks83uLLvkSsRUuuHGhtygy9h9grv60kcE8aHPh1Ouq9ttuNWmxOOERyVYmXu+UVdVQZuqk4DDwfCTEOafRZqgE4ZLwzVEZmGczMBElgg47J7hXrlytSvsqQOic2eE+Lnms3T704K7e996AcZHXRw71DBod5MV+CdrULdc4kGkAJt8YhLRKmZ+y1urKMtLXy+hb+C9Lk0B6UPK9ZTdzu8FcnCpXhJicnKSL4tEr6ZX6z5CPXTeIs2A6v1EPuO4OvgaHSPdTNEClgeWkJUeHfR8Bh1dGpnDi6JKxcEelWQHrE/hqr0AfwXYniNy8p/bTQwao/Pfa528bcPH7ps58YK3xVpl0v5DkIbWfOLu/AwXJYbKuRVCoswb12yNC22fqe/mZlVluFciI/OmAmi94PwIw==
X-Forefront-Antispam-Report: CIP:194.138.21.74;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(396003)(136003)(376002)(46966006)(40470700004)(36840700001)(5660300002)(478600001)(8676002)(70586007)(1076003)(956004)(2616005)(36860700001)(40480700001)(40460700003)(4326008)(82740400003)(26005)(2906002)(70206006)(7596003)(86362001)(82960400001)(356005)(47076005)(6666004)(82310400005)(110136005)(36756003)(316002)(54906003)(186003)(7636003)(336012)(41300700001)(16526019)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 07:17:47.7449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 084aee99-5654-4048-d3d6-08da8f0ebc50
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.74];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT008.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6774
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
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

