Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38B285AE8B0
	for <lists+linux-omap@lfdr.de>; Tue,  6 Sep 2022 14:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240102AbiIFMsI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 6 Sep 2022 08:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240069AbiIFMsH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 6 Sep 2022 08:48:07 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60046.outbound.protection.outlook.com [40.107.6.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B87BD57568;
        Tue,  6 Sep 2022 05:48:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bh+/GoHcQbEiiB9DdDY1dRUao7FbvIFZ6finDwx0zknpGWs0ZyPySV6b0w6O2zM7fdfzfOBByyWLMoJ8e0ByeKSVuWugLctCXSmsZ8TgMyP+qgNwIBph9yGTZnCvCiCI/Dss457WtwFc20bAYnKAW6Oy3i4nyQQiaffSckj+vgSvfvu7EHkiazUgp+4a6m2og5QT8eT5veWOTUZ1N0Ys7KRPrqrh3WRdZ/M3Jp5iI2Ux8YwakXdrrSEhnOucsl2gbg5DBSN/oA+/42wlI5fRtNm/K7M+fxwnR3vAHyRof1j9q3Nrt7EQB6iMl0oGeBNl7MTsqRnpCD+YpMpDNabIEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RWSNCGu8JlxKi3Kf8Hc4P7Ax6fTBEjg1fRI+cYncSgc=;
 b=ncsydyzsOYv8aq141RM5VdGG9eMykW7Y5MsyQNdODSXhTg6ziusMRMVhOGwLNEJqBNnbFc22ST9w+cxLWa3pBjFvCzcTAXYOP4o6vR0Zmbi77JrtAFzZUd0iMojXuH29tmPLcRliDQ7RNHkTu4Ca23kmFgPIsZeUUcNPuw2TKx84fOc+WgVQCr2tNGKJmA1Nyne1ae0CKGBIWlj1+ZuYQJntRRCMndKq2aeJvvuO7GPaIaBi2BeXApGLRwjnFfFUpKJ/HlB7ZjOoOu72u0wSTQa0PWRIPEkE5qi9jTyovg98p+RbNdatF9zYb6Iap82RhQ79kr8PxHszhEHEbqVEsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.75) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RWSNCGu8JlxKi3Kf8Hc4P7Ax6fTBEjg1fRI+cYncSgc=;
 b=HMOjQsEddyQxRnRP4TX89T1QrEXek2uZHZ7EBuaUgpOpKjO97JieqzYaKBYmvrdlqHX5w7/rY+neJ/hNCuDm4AjczWtREHw28Ao9EH/o1eoQ5j9teb5cQ2RXSiAdSPdwDsJmcdiIiKBs+limC7/VSrXhpO0YQmGLpUboZx8bxQKC5hHq4IXkkelFX8gVvnvdaq8rOHJk5KKPgt+gL+0DOi58kfKbptqmUTxIbfLRDHWuRbR35nJzvZcvQd79hS7Z4dAo5ti91c4fBvJMggNcM0JPnqOk+2nBKXQvZp0XfdU1WIY8RJkHtVi6uNGeMh86dDAbJk/xihCTdKGk+wCbdQ==
Received: from OS6P279CA0106.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:3c::8) by
 PA4PR10MB5636.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:265::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14; Tue, 6 Sep
 2022 12:48:03 +0000
Received: from HE1EUR01FT037.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:e10:3c:cafe::ce) by OS6P279CA0106.outlook.office365.com
 (2603:10a6:e10:3c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12 via Frontend
 Transport; Tue, 6 Sep 2022 12:48:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.75)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.75; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.75) by
 HE1EUR01FT037.mail.protection.outlook.com (10.152.1.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Tue, 6 Sep 2022 12:48:03 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC8VRA.ad011.siemens.net (194.138.21.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Tue, 6 Sep 2022 14:48:03 +0200
Received: from bennie-lenovo.fritz.box (139.23.126.196) by
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.12; Tue, 6 Sep 2022 14:48:02 +0200
From:   "B. Niedermayr" <benedikt.niedermayr@siemens.com>
To:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <rogerq@kernel.org>, <tony@atomide.com>,
        <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>
Subject: [PATCH v3 3/3] dt-bindings: memory-controllers: gpmc-child: add wait-pin polarity
Date:   Tue, 6 Sep 2022 14:47:46 +0200
Message-ID: <20220906124747.1767318-5-benedikt.niedermayr@siemens.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7d7c97b5-4a50-4ca7-8932-08da900609cf
X-MS-TrafficTypeDiagnostic: PA4PR10MB5636:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i1gk7t4ZMqnMstm7Dwz1vIawaguYsUepPqmEmnJScAXv91uFpGlznfHapgEcYU4SEjVxMjdyfAcn+S84h0tj/nfsQYtpwPEdEbpL0mSJnpeFu9vYlNMkDkvQQ4AUcGVN1BJskylYzQDC4+jhre4K5qiExXCosBGl7fK4q99Xtfy8C8OvH/+AR93BpbNtQ8AJ9HCMX9tN8WEMJ7QaSmqVHaKBav36BE+mgFeFo+d06IUWcFLeWFooARcAlRqzNoBeZmiLwlLMDuWlQyltZcGb4LrCWwdhgNdsLdH/itYkYnuYe38L25tkhK/UwS6YfGhAQIfk1ESO6VlWe5YGldb7U+9sLKAkmxEaWVpno7JMudAXfhjUD4NdtgZ5I263Vt3n7n9EX7ieY2lyZYlB55iECP5C4r0DqoasSBMjePwdsTOoNOHmH7272pwZfkmF8rIxH0zEB0GJdEy+/qPszqssz6FOCmWN+qazBSDjvn9AR/9hwP7AEHYsvMHlQEVNWeyK4qbBgwp/IDbgdnad7gSq8WV9bDW9WYBK1EKMp1hFf8DqtbnRLU5MMxIbkYoAVVrRZKJzjccrUz4jnbySAAVva63iuTftn52cUH2DykxRv3T3fm6ItkAKklXtwUbf8fZw02N50wO/3N0Lr4IQUsY7+5Q/jn3bgE3s4GkjFmqAC4meTqnOiVO7yl+fmvrHKbr6adEl3QkPC3zNmQ14PoN+esCkPtrW+LglxKuBVMql653tclWkKCtUbeMmG4AdGvPL65p1u8oW1AM0V0GkqtbhhX9pJFJid45BcP1abJKW95K1hkCt4ycGzEE/Qx9A3IBL
X-Forefront-Antispam-Report: CIP:194.138.21.75;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(39860400002)(396003)(40470700004)(36840700001)(46966006)(81166007)(82740400003)(110136005)(54906003)(356005)(82310400005)(70206006)(316002)(70586007)(40480700001)(36860700001)(36756003)(82960400001)(2906002)(8676002)(4326008)(26005)(6666004)(47076005)(86362001)(336012)(1076003)(16526019)(186003)(5660300002)(8936002)(478600001)(40460700003)(41300700001)(2616005)(956004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 12:48:03.4208
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d7c97b5-4a50-4ca7-8932-08da900609cf
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.75];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT037.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5636
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

The GPMC controller has the ability to configure the polarity for the
wait pin. The current properties do not allow this configuration.
This binding directly configures the WAITPIN<X>POLARITY bit
in the GPMC_CONFIG register.

Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
---
 .../bindings/memory-controllers/ti,gpmc-child.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
index 6e3995bb1630..a115b544a407 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
@@ -230,6 +230,12 @@ properties:
       Wait-pin used by client. Must be less than "gpmc,num-waitpins".
     $ref: /schemas/types.yaml#/definitions/uint32
 
+  gpmc,wait-pin-active-low:
+    description: |
+      Set the polarity for the selected wait pin to active low.
+      Defaults to active high if this is not set.
+    type: boolean
+
   gpmc,wait-on-read:
     description: Enables wait monitoring on reads.
     type: boolean
-- 
2.25.1

