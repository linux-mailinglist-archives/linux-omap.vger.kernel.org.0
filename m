Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07C8F5AE8AE
	for <lists+linux-omap@lfdr.de>; Tue,  6 Sep 2022 14:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240076AbiIFMsG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 6 Sep 2022 08:48:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240089AbiIFMsF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 6 Sep 2022 08:48:05 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2048.outbound.protection.outlook.com [40.107.22.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E379257568;
        Tue,  6 Sep 2022 05:48:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WJqvUtdXcmcQQhHKB8oTLT7RzQ5N4SgTcQp/+QczTQtTzdh6296EKY4+vta1VUrkFlewZfDNgWwVV7xSzX7p78DpVlOVktxdHn7OjWvYcrPTSIb+vb5Yic83cJpsSt1ZquNJF0k0Wj/FtKJosvF7RcVj6V1ws5aI8OBxpKwZ1DyVIx9MOdmSDcs+XcqS90fnsxQJA/MDck6oXdE217usSOAPmyo9V6bBqvSdQSaJpg66npda/ZkAYaxogxxxZ1hW6W+S8YfkdQ6fahszJR2QSpQrCCC1Qea/8G3oJJSlrMCkxJWyqATMyq6D5q11xVugQACy6MWDNBm+E5X2Ul/Hhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DjlwsobtRk47B7QvgYdE49/bly2RFxQWNgiRflamabk=;
 b=Ezx9InJ9U0kxu2y/9L3Z5m3FtlrLEw1sec6spt/Al2LBe80cDa8aLZMCuJ/0wWizNkajOQpomXB4WLhJr7iNwcU40gIvTRNL1PDdOrbNwQKjGJvz8hOMlckAf+rUN8gHf3oyQ7Rz/PnEDLMll/1NnvXQ15L+nYKB0oqnMXm/wCmXyO/mxKkVfs6Dqu6AG87MiLnBG8/YYCs6msdsLq+KwGEOp1HUFYu7SBfY8CoDm5i7nKpls3OS0TzjWqZpaKJEXAba578z5RfR4qlmYMvgT6v2YLv3O5R2fQUl4U9VOeDb1tXOTo/YYDYmzzvr5fS11Vp2t+V5mYMQrKkDB0r2rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.75) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DjlwsobtRk47B7QvgYdE49/bly2RFxQWNgiRflamabk=;
 b=ELrF0NvIwoJS07H63U5a1vRWdS9MwC8LLclgBO5uLR/tAUOZu2cDlCkNCkSijarmEBFZ23dx3/0QobUySgXqTVhJsAh5uNX9XTOEsh857zqJrex/PK8GLCKzjQzZDKxP9/O8hTX4W7utPPiKjWl14m7s9zNMhtmH+S3Tt7OotEn59IJLOvboc0DPSOSZnysx0Ep4tD9XCchlcrtsK0NZw7zLSWWqHBxd9+mxYErHIWcD/Fawvj7OQlynTN0LPnuqGsUTAdKnR/mXb4p9ZEpviCx2bnvaHHvoseoJxwBAFPv3HnXgMbZPyfcF7NOyIQbE8WjvOF5UeWWFRSKSAh6JPg==
Received: from OS6P279CA0120.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:3c::19)
 by VE1PR10MB3887.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:161::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Tue, 6 Sep
 2022 12:48:01 +0000
Received: from HE1EUR01FT037.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:e10:3c:cafe::72) by OS6P279CA0120.outlook.office365.com
 (2603:10a6:e10:3c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11 via Frontend
 Transport; Tue, 6 Sep 2022 12:47:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.75)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.75; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.75) by
 HE1EUR01FT037.mail.protection.outlook.com (10.152.1.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Tue, 6 Sep 2022 12:47:57 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC8VRA.ad011.siemens.net (194.138.21.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Tue, 6 Sep 2022 14:47:57 +0200
Received: from bennie-lenovo.fritz.box (139.23.126.196) by
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.12; Tue, 6 Sep 2022 14:47:56 +0200
From:   "B. Niedermayr" <benedikt.niedermayr@siemens.com>
To:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <rogerq@kernel.org>, <tony@atomide.com>,
        <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>
Subject: [PATCH v3 1/3] memory: omap-gpmc: allow shared wait pins
Date:   Tue, 6 Sep 2022 14:47:43 +0200
Message-ID: <20220906124747.1767318-2-benedikt.niedermayr@siemens.com>
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
X-MS-Office365-Filtering-Correlation-Id: e806a05b-949c-4f45-abdb-08da90060677
X-MS-TrafficTypeDiagnostic: VE1PR10MB3887:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OVt2ILiyMiZYzJxUdWfKWTCE2MI9DdA8UC+YvMFX0SeV5aunsBiPZn2izS5Ube1MHa/gVKBqx2s+f64quFXI0nS0coUTS/XxdKkNioaMdBF4DNCG1dQmY0wJK8N1l0DaG/Nr68qG/ZjZziQVFpM2D+54fbPWXQBJuwIhhK/+Z5+Ik4l3FuDL52DZ23bOzw3+I1LaihuJ7Irl6LHBIc6fDpdGaRV6KPWVKj/TD3VkVYweCq8R7nuIFN4xBclXoK/QdokHgFQZI0SwyGnZbQ77e6LONQPn/VJitKKIn0BaBsl6tdTxjnI1Z/O4KA80lAHYn5+GGAka/AGedaq3weX/j/us9HCi/mJLT6asLbe6/NhlLZon5Pp3taSzFMochGsLHxD1/WMR6L/8Xz/gY7HeJW+YkSynv5Bhh/gSj2P1daEIaBYHYQFqgw/9XuDM7o2/qlS+yrIB2Y2t8W+DTDpXvvdftYSzBNa0l+U1OK5ZwzehV49QG8b2DdUbzY1LRGmLNwCz7IoDo92riV1dC7azZxEsPvCYTiY89iRFgjMECIyYhHG+ZT1USc0diOq3OdC+YuCb0ycePKqiwV7QIL5s8r9qugSSupTuGed45ArCaP51kHeCLrjIsKtCWgZqq+FbB0nFI4shUVrBsf1ltvDvafrq5y+Jdg7+xOvfHP2uxYX/fXyvO89oQ5MtRfvGTkOtxZH3X+VSqICM/sdfulYtLYExTh95VQLdarXm12pttZ9aUHYv/87dTQ0tbuUA2ExHvnj/bf1/DejZHRHcmDKGLhxOsNBKADinVInTHVtq27yT3fC7UtjozWQ24iA0SWZV
X-Forefront-Antispam-Report: CIP:194.138.21.75;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(396003)(346002)(376002)(40470700004)(46966006)(36840700001)(40480700001)(26005)(86362001)(82310400005)(41300700001)(478600001)(82960400001)(6666004)(356005)(2616005)(40460700003)(81166007)(83380400001)(82740400003)(336012)(47076005)(186003)(956004)(16526019)(36860700001)(2906002)(316002)(110136005)(4326008)(8676002)(70206006)(70586007)(54906003)(36756003)(1076003)(5660300002)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 12:47:57.7962
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e806a05b-949c-4f45-abdb-08da90060677
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.75];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT037.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3887
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

Newer kernels refuse to probe when using the same wait pin for
different chipselect regions.

But this may be a usecase when connecting for example FPGA or ASIC
modules to the gpmc, which only got one wait pin installed.

Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
---
 drivers/memory/omap-gpmc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index d9bf1c2ac319..e3674a15b934 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -2221,9 +2221,13 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
 							 GPIO_ACTIVE_HIGH,
 							 GPIOD_IN);
 		if (IS_ERR(waitpin_desc)) {
-			dev_err(&pdev->dev, "invalid wait-pin: %d\n", wait_pin);
 			ret = PTR_ERR(waitpin_desc);
-			goto err;
+			if (ret == -EBUSY) {
+				dev_info(&pdev->dev, "shared wait-pin: %d\n", wait_pin);
+			} else {
+				dev_err(&pdev->dev, "invalid wait-pin: %d\n", wait_pin);
+				goto err;
+			}
 		}
 	}
 
-- 
2.25.1

