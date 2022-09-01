Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 720A85A970E
	for <lists+linux-omap@lfdr.de>; Thu,  1 Sep 2022 14:42:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233013AbiIAMmY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 1 Sep 2022 08:42:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231530AbiIAMmX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 1 Sep 2022 08:42:23 -0400
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2066.outbound.protection.outlook.com [40.107.105.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 302C06355;
        Thu,  1 Sep 2022 05:42:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XdirvZQTG9td9NLQGlxc6ZlQJ4TqSX5AR+ZpIXbH6XCiUMej12xE8QhSdavtM8GlNMhhoBPtHj05ShclB2i+i2F2JmUNLYi2xzIrees2rSJ6tiHA5P+4I6emjr9XLtIsV17MZrLk9V9rZNZIDrhkdzJ3TjHPfpnTVrwd+H4myR5P/ue+hb2HZy8s5UyhvgFSIa+zQR6AE+nzQDRZE42tdahqxj7BBorv1FaTSoIAWePiizPhQzGbEQaOj1eOop+JirojkYeMHnTNZfkE5ZkQZXDHTr+deauflzF8IANNq9yCL4soNqGihGwsZdBALPRTD1FoybaJDrezL/gANI6QEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FYJ+DnDcwvzKIB5SPuCxcJxEu1REjYn3keTA74iTLyE=;
 b=Wn7NunZIKOCAwAZ6Sqkn0Bfnv8WpWz3UwE5TiSPwOq5Xs87HgaH6fbqaaCTkY13xFdzZPKVGaFu57c8VMHKrWQR+tsJyczLA3K7nWt1lrRtH42ChF/qRPqcfjujXCKm+Dl14tF8rWGxaPAt3PtfWAewJm/yrEfJFPWvPjn7ebEuz5KECwtUD7QHTkVKZ9cmqSCH69igICY0lsTwH6vaFzkXfbCaL7s9HmcttSQHOpoSnEcu/mYd5nXf2GkPjcAKFdWoTWwZwb7YXSXGNXNs7zBVdgB4sdMOv5j+P3ktxPwt/khWkfjHeI8Uugnmw8AzqXqoOo7adppQLLpxRZt//7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.75) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FYJ+DnDcwvzKIB5SPuCxcJxEu1REjYn3keTA74iTLyE=;
 b=eh3F1NjRZFI8qrxlfI/gmtE3HBA4+cDhOXgQJp8N+i8h7VhfAacCJFU7F1qHpmHIA9ByLUx5Y1yT92OON4SY5RKqN6K493RUmrbaNjrvODTCHjfqwZHKXVEEE2JrrIQnvMCR0ZpDPR1Oh29g2rUobxdTRKJ6bUcHSjVpvGVgiJhWma3aI0ct36r2kxXKlRMkgBNzVy98gp7bqms09v3wMzAhUt+sY2biPfCBpdkHerkhNdLX2AAZXRhAdXMIPKR2AiG4oKPqV5iiAAkTKWka5BwWZ/xIlkrFny+g/SSiSPluqOpgNVWD4OGDHPqa3lgkSJosEd4YhhH3LsZu0GPxJg==
Received: from GV3P280CA0040.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:9::14) by
 GV1PR10MB5842.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:51::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.11; Thu, 1 Sep 2022 12:42:20 +0000
Received: from HE1EUR01FT055.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:150:9:cafe::b6) by GV3P280CA0040.outlook.office365.com
 (2603:10a6:150:9::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Thu, 1 Sep 2022 12:42:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.75)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.75; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.75) by
 HE1EUR01FT055.mail.protection.outlook.com (10.152.1.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Thu, 1 Sep 2022 12:42:19 +0000
Received: from DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) by
 DEMCHDC8VRA.ad011.siemens.net (194.138.21.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Thu, 1 Sep 2022 14:42:18 +0200
Received: from bennie-lenovo.fritz.box (139.23.126.196) by
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Thu, 1 Sep 2022 14:42:00 +0200
From:   "B. Niedermayr" <benedikt.niedermayr@siemens.com>
To:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <rogerq@kernel.org>, <tony@atomide.com>, <krzk@kernel.org>,
        <robh+dt@kernel.org>
Subject: [PATCH 3/3] dt-bindings: memory-controllers: gpmc-child: Add binding for wait-pin-polarity
Date:   Thu, 1 Sep 2022 14:41:44 +0200
Message-ID: <20220901124144.1006238-4-benedikt.niedermayr@siemens.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220901124144.1006238-1-benedikt.niedermayr@siemens.com>
References: <20220901124144.1006238-1-benedikt.niedermayr@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [139.23.126.196]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4599c037-16dc-461f-bd7d-08da8c1768d2
X-MS-TrafficTypeDiagnostic: GV1PR10MB5842:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bQkGJESgLZrPI5kqFhRdACJONVHHOIO4w7VNrmXP2viXrCzMk3SE9618wMczfM5EByHzzQAj2pXHlW9Er1Nc0d/ERI24P1o5vNmspWM1Mcl9Z41sgbjj5bZEZ96L/q8ffN3xAzBc9h0Ldj2ErgEV64rdcAuKchNknKG05lOJMPAF3IZGYCa4QIxwPQI9NYW5lBe2qah4EyKxUaJJea92stqY9hSIf4Now49tOg9l6DgO/S6XnRsGALymgGFo/obJ+0zF/6zJwL1stHGrOip+asFCQHRedOe9n3NtEIrPkkbyzc9oO3unv83QObj3/vA8FD8037U6ZzCQew/lFHtsjGFE9TuefBJqAtnDYoMXzCaRRZXlviySUA6Cpu4BBKhKx8cQGhgnG9pxH1uWPIQG6xYkiShiHXYnEGkdPXY7uUaURcdYjGyw2dQ+NXXAxRwX++2OXsvYHZGhfAMpet9IBbDoWIctlcrhUOmN3O4GbO0wjDbbtp0H1dtpJqozD73n6ZxlFBepz5msckDRf03bEqTQiqOuJeJIwwdK0wYvsZQC27gMiu70DH5r6NnvOmhQ0d8PRZ/rWnCPWJom3GOk1H2oAY7L6ZIuu33y5hD+ERba/3TXdm6wjQoAE9GAQw/n14FXw/wwfpFK8uIgfVUXk57XvhTEkaOVXF9dfP45f+G3IBgzclTxqfThBAHUuCW1lxCzN6msjxrN+v8ek73Jec0Bl0oTb1TzQyc9WrKfk12jkvGPO1Orwcc5L+P80FHFcIaOKpYBhqOr3LDVRqP+mFZPXf1RbJB8k5FmDE2cKsIBqOKBEN21VE3WJ3joGAcH
X-Forefront-Antispam-Report: CIP:194.138.21.75;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(39860400002)(376002)(346002)(36840700001)(46966006)(40470700004)(16526019)(47076005)(356005)(956004)(36756003)(81166007)(82310400005)(336012)(1076003)(186003)(54906003)(316002)(110136005)(478600001)(2616005)(70206006)(4326008)(8676002)(70586007)(40460700003)(26005)(41300700001)(5660300002)(8936002)(86362001)(2906002)(6666004)(82740400003)(40480700001)(82960400001)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 12:42:19.6030
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4599c037-16dc-461f-bd7d-08da8c1768d2
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.75];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT055.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB5842
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
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

