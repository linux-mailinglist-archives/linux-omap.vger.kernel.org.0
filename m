Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 394DD5AAAF9
	for <lists+linux-omap@lfdr.de>; Fri,  2 Sep 2022 11:11:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235531AbiIBJLd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 2 Sep 2022 05:11:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234836AbiIBJLc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 2 Sep 2022 05:11:32 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2073.outbound.protection.outlook.com [40.107.20.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3209979FB;
        Fri,  2 Sep 2022 02:11:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UVy1EmRO2Ijnd8s0c3GcLQMkpWSNW77d3Ntp+H9dM6Uh4huNIRDzioRzp5NL+27aoGDfhBsFz7ItGk4RMONw51TMa/GckxorKrkb/kl3XgyRaCtP5JB+H2jFr1nPeVszHGA9+x8LupzH7FX2o6Wd1RU+epL35SIVoP6qOvHNLOK/HgwUqrHgJAE3ahP50VBc2aATSnvTP1RFo61OJcdlV0MU22OEV2jGEGB1W/IJE9wNODxju0zO/BA/otmNDu2PAgT9criHamRAKas1p8Vys5oJvkjKe+4a9cq/InqUdqSF0dfZi8v8tCe4vEy0s90R6JnALWoyTlzzhr2vy6QRvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FYJ+DnDcwvzKIB5SPuCxcJxEu1REjYn3keTA74iTLyE=;
 b=PN/Vvz5x4NWFvqPbJtJNoxbniK0SqK0yjk3gS+YXdrOBSzArGdWRwz3EREruE7pOljrLNGmvo0weHwbfeP/G7txThDnRDNAxEOLdju5iWz0wxpBp46fi6CQQHBzaePfiMFZJndwUILqt3uWDa094lhH2HtE4ZL/uE69C13LCunJw/BexSt8PR6wC21eZxMxuucjYJoZfzyTTes6GHG2BTPmC30ZcwxMJgkRELY3Fu7DU18eil94e20uxCyjXAyVPGJz7+BWWr0n2ERwZLATOCZju4sCjn88PiGzNogjhbIBtp+91bikCGFG+N0VqQOdmYSec6jagmeHJRd/dNiGgDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.74) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FYJ+DnDcwvzKIB5SPuCxcJxEu1REjYn3keTA74iTLyE=;
 b=tcw3WAHGLzKwE520M7vqTq1SqAgE6/usKQhIIVNXWfQTXIWYqYKFTHxzj68MPfIPwTzCrOrexaDSbzU3gxKCbBSxRlcQKV0hKnYPk7y8I+GNBdBeLL7u+KyMYLAXEU9MuUGBbg6OxOq8vqO5Q4TSP8kxRXqMVIIyMIGFu6r6mZPD8UgAA+5M+byjLghSHDRBDPqks6pYCwqlKgqmbhslotJHB1qZdJpYivsyF+wbWcHgnp6aL5MGxzzZ1OCvkWP2S6WS4c3Gm598e4nWJ/E7fRGxuCViR4fkcYTIO6GCOsRxVhF+Pa4O3cKwGtVPgNXNGgobVCsUyALxNTkxFGkUyw==
Received: from DB7PR02CA0021.eurprd02.prod.outlook.com (2603:10a6:10:52::34)
 by GVXPR10MB5933.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 09:11:30 +0000
Received: from DB5EUR01FT024.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::f2) by DB7PR02CA0021.outlook.office365.com
 (2603:10a6:10:52::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14 via Frontend
 Transport; Fri, 2 Sep 2022 09:11:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.74)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.74; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.74) by
 DB5EUR01FT024.mail.protection.outlook.com (10.152.4.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Fri, 2 Sep 2022 09:11:29 +0000
Received: from DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) by
 DEMCHDC8VQA.ad011.siemens.net (194.138.21.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Fri, 2 Sep 2022 11:11:29 +0200
Received: from bennie-lenovo.fritz.box (139.21.146.191) by
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Fri, 2 Sep 2022 11:10:47 +0200
From:   "B. Niedermayr" <benedikt.niedermayr@siemens.com>
To:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <rogerq@kernel.org>, <tony@atomide.com>, <krzk@kernel.org>,
        <robh+dt@kernel.org>
Subject: [PATCH v2 3/3] dt-bindings: memory-controllers: gpmc-child: Add binding for wait-pin-polarity
Date:   Fri, 2 Sep 2022 11:10:28 +0200
Message-ID: <20220902091028.1346952-4-benedikt.niedermayr@siemens.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220902091028.1346952-1-benedikt.niedermayr@siemens.com>
References: <20220902091028.1346952-1-benedikt.niedermayr@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [139.21.146.191]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 915d2e49-b9f0-4fff-7494-08da8cc31f3e
X-MS-TrafficTypeDiagnostic: GVXPR10MB5933:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m3wJTSQ4SE/GKWGwKtgbYYVRB08o+d//+Sf0LvelG+dXNVUjU+yKpMH/Q789WtH58zyGoql/nv4xt9JFpgoYjkk7QbbodOpCI3wah7QIQu5z8q8G7q+Vyrh2zv2fXwGBBMhn81eF98ibDLGE3s0Ra1Q+EW7d++sO3OR4nIi1cttH6sNElx6xyCcVvhBE87KbseJkzc0eZY6ejxcDFtp0WnlORTavgKSYEt0ARVHA/JUEqPfqmYO7F7QQ8qMLuhGl9Ik1tGRbL8YEhkDEsl61+2CEjNWxvZcVh1PgNtZNed+Y4N8JFWCsYKIGchoDyY1wmPyhObRP9/SxeDjGuX2Gt3CGkhOsPgtKk+IotoGENmDqdQ3qVv7S/YSFSWf12oZEvz9UZZ0Yh5nmqwnBH2bVXV9k6JMegOo+xwQhjCiaMGVeVlDnBUhLPxhB/m9wz3Rn+DjH/RQyXLIcPy2YrTBIh+iWA4oFWseseWUeD2PyZQVSo9UUIfW9e7xf8VOMiCZIuE17F1lZdsXc24cxPz+/2Z0+iJ0Jg73JeQiFaix5ahLZNrnUy+HawVmAjgimsJI4aZuASg65hgM1135tF1wmvG736EawQXLtcK9Zrbl3FWI6K8CUFzrZP9oUbrU1qEExZjxy5tbDE900k2xEFC7QWLnNNICD/QFCL+RbBIDbyuRUxGiZ3djAacEjIFOtnqXOHzuZhYfAHLicfxUAzUds++JfnLXe10XiIWSP5P738416fr3ew40QxXoJDHA46tcEOL3JX5ssYql3ZKZP7kzaIA==
X-Forefront-Antispam-Report: CIP:194.138.21.74;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(396003)(39860400002)(36840700001)(40470700004)(46966006)(47076005)(1076003)(86362001)(8676002)(956004)(16526019)(2616005)(336012)(186003)(82960400001)(356005)(82740400003)(7636003)(7596003)(8936002)(5660300002)(36860700001)(2906002)(40460700003)(36756003)(4326008)(70586007)(70206006)(40480700001)(6666004)(82310400005)(478600001)(26005)(110136005)(54906003)(316002)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 09:11:29.6263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 915d2e49-b9f0-4fff-7494-08da8cc31f3e
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.74];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT024.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB5933
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

