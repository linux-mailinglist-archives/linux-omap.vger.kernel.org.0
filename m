Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC1625A9706
	for <lists+linux-omap@lfdr.de>; Thu,  1 Sep 2022 14:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232950AbiIAMmA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 1 Sep 2022 08:42:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbiIAMl7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 1 Sep 2022 08:41:59 -0400
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (mail-eopbgr20083.outbound.protection.outlook.com [40.107.2.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46F2CC43;
        Thu,  1 Sep 2022 05:41:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qr3p6N1DvSb0vpy+NMEb9J/MNmUwxjGUos/7W6I1AawYQz+yimUpJnv5B7tLba6qZDeQcKePZd43ZCEQSkWTNNzmwyBZFoqCJUkinWUgECnRjLCuEdPZipul63k+8Z0GJN0kJSWVCGBBR5wxSMB68A3Is2CBH24z2j0SzThuRyphwKetl1dEJYSPdvQnEPFTZ+14/n+SphqEnr/yvUHWqyn8KPW0rNvFPirIxzP4MC2yRj68ffmGCvSvnhfc6/ZuOGgjxke/1P3zZdgZbKlyFY+5oqBRDtG8NO7hF9NP/2DpQI0YgoJaJnxRjfXIDPfXwJ9O+qNMx1wn2NrlS7ToPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DjlwsobtRk47B7QvgYdE49/bly2RFxQWNgiRflamabk=;
 b=mSTYljKDqcGOR5R8z+r/63/tUMBngInbvCSkbeGYgo/ojc9FHK6SbaZ2fVzZKTgof7Kd9OGS6B8sj+LD2+U11pPMm0xjs56jLyJyH+Ecoqb4fXje56u9KmonzSZj9YE8jn6bj1I+QoFdsw/Y65oLpC4MnyEtsEMzgaaLRml2Z5/nt54REG601e8IhChLgI6TaF6xj2reI6b8kGzqADWp/Ba/s1j4Ne2UkpzN05gHPbmNgilU72mrPfOMJhS/srP9AKho1xZHzGlvSW0PJBVkJg7HALcq8+5qmtFlehrgmbAbc1oHgoluJlpRLYZV8XfRDn036SOeiAB8yimP5LrJrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.76) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DjlwsobtRk47B7QvgYdE49/bly2RFxQWNgiRflamabk=;
 b=QE9LAtZDqKJtsmN1pjkL3ErfqvdPEDNKNEB4s03ynJm5TsIYYlJTKZsEVM9fGFw5X2JMbAzSWAVbsOQjh/ioewExHQjgD9J6tHQ/e91DB6WIWCO5icekEWJF2ak+3JHRPtSplIiZxB2odTiz+E/Cp9v+AJz3DG/1QwIQB2xbyg74aJdFiFOFr6tk5qeDgTqWSuL71hZgtxlcIywBpafgazSPjW0vNMUYMbeTzNB/sL9lb7K7BhWWJm91Uog2iNaagmtQsXP3nPp1JyN0ubSZxry9U9FtZseQNgqMGkwebCsdSpawCdFYn8GMkQPeTRkBMtGfEwTWV/Bv1eZoHOvBjQ==
Received: from AS9PR06CA0564.eurprd06.prod.outlook.com (2603:10a6:20b:485::29)
 by DB8PR10MB3161.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:117::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Thu, 1 Sep
 2022 12:41:55 +0000
Received: from VE1EUR01FT074.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:485:cafe::7f) by AS9PR06CA0564.outlook.office365.com
 (2603:10a6:20b:485::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Thu, 1 Sep 2022 12:41:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.76)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.76 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.76; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.76) by
 VE1EUR01FT074.mail.protection.outlook.com (10.152.2.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Thu, 1 Sep 2022 12:41:55 +0000
Received: from DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) by
 DEMCHDC8VSA.ad011.siemens.net (194.138.21.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Thu, 1 Sep 2022 14:41:54 +0200
Received: from bennie-lenovo.fritz.box (139.23.126.196) by
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.7; Thu, 1 Sep 2022 14:41:54 +0200
From:   "B. Niedermayr" <benedikt.niedermayr@siemens.com>
To:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <rogerq@kernel.org>, <tony@atomide.com>, <krzk@kernel.org>,
        <robh+dt@kernel.org>
Subject: [PATCH 1/3] memory: omap-gpmc: allow shared wait pins
Date:   Thu, 1 Sep 2022 14:41:42 +0200
Message-ID: <20220901124144.1006238-2-benedikt.niedermayr@siemens.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220901124144.1006238-1-benedikt.niedermayr@siemens.com>
References: <20220901124144.1006238-1-benedikt.niedermayr@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [139.23.126.196]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d28a166f-7e0f-4364-454f-08da8c175a73
X-MS-TrafficTypeDiagnostic: DB8PR10MB3161:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xgELM1ex7b/1ByrLMCqmBVeZ3vtiL7KE67IpPgSC4dn6P1JxumZ5b6swsgs4iUBsqyu/nUJq7wDhpFtR2smDMKhMXtsNcVuHGgoz19jQzl0Xtqg3qBTPAXQqg+5Cl5Th+nxh8r8Xc9CH24WYY3SwcTeQOLilZodjY70azcNT6xWkYu67iuKN5uZBd+lAASFp9zLRrL1WRmO4hhMgE91cskHpmjizyO3zy8RkcKCq+85hHaSfwjAujntMkBDEAAp8sfR1PVwlMKl/QupSktJ5McZQVzH8cyZoq0TxXs9MugesB19dBOI30nYju+OdVdd34SVmjYM6rvkkYuc+NB0Ss3ARc9771lBMJxla46wX7rSJCGXykAqKloOwEooTAmpmZq9qNLFA9ghQvvZpk80fBqtvaxaLwfS5vJf71bVX2fRrmLsklPgwcsg5nLcjL4z8PRs5N5xWwSN816cLAhilICGrG2JPI0XAvew69cD70n3DLY0eVqCWVqN38xDR2YZxYpt0404rA17XScFglvHRJkuqHLZAesTnVQMy5ZWPK3uWkK6jZwY/bfbela/lW3fjYbTg4uFmqky4firs5w9s73rm2KsTxQ8Kw9lpT2LLEFjzM0JVvrfFoZfVVV3bV7JerSQ5K1b6RRxXoeMOdbdcAJCallp54451XoYDDqoO4zeJHtRHrfJBJyzxVAT1lxjvh9maqnDnsKNSoqhqHt+/c8MnOgg4xm+6FrDOGgcqOswwC/ZDMIIizyqrIXyTouusTgjaulfjqQrfx5m2wW650bxyw8RW+t7M7y5Q18B6go8y/iECocUOov+Gtdv0IFgV
X-Forefront-Antispam-Report: CIP:194.138.21.76;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(136003)(346002)(39860400002)(36840700001)(46966006)(40470700004)(82310400005)(83380400001)(82960400001)(40480700001)(82740400003)(110136005)(316002)(4326008)(8676002)(70586007)(478600001)(70206006)(54906003)(36756003)(6666004)(1076003)(8936002)(41300700001)(16526019)(336012)(86362001)(2616005)(5660300002)(956004)(47076005)(186003)(40460700003)(81166007)(36860700001)(356005)(26005)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 12:41:55.5518
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d28a166f-7e0f-4364-454f-08da8c175a73
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.76];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT074.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3161
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

