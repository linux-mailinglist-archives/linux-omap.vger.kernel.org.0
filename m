Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C85325B973A
	for <lists+linux-omap@lfdr.de>; Thu, 15 Sep 2022 11:15:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbiIOJO7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 15 Sep 2022 05:14:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbiIOJOe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 15 Sep 2022 05:14:34 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70045.outbound.protection.outlook.com [40.107.7.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4000B9A95E;
        Thu, 15 Sep 2022 02:13:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UhEPdt1IXClFF51DqegLobBS5O8H+Cb96PGxPAb3+8CU40CuYMx+u96zvlA4/dZifnOFnqCjNuxxCbVQ6U5cE+qpF/NjVLf1F7mXsY653BN2gV9sppS8mA4mSluWruLdJjGKLfcSq2FhL0+Ti3o6xpYpy8Rvn+dpUqsAC2fIgIHmoUwAG9VYBFOAbHVc8RHEdFu7S42UkurJzJTmSlZDjbkuTGjey+3MX1zPM9MKQ3qvYXaZwhh3SeO5KqPjBhjOQSzE4+HsbL7iaYKxO9BsFUiuf8vVyOPIY0HiPLc0a/3GyZ/Vrgwh+52/vaJ+aCT+a20L9WOgP68tR2XZ9qmd3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3LA31ygq1hMgtDmqoOcUjTmiJQyywdPZHGL4q1lx9sQ=;
 b=UpY4qZlN4vzoCiBQZaplr/Jfrkb3I0kwglc8sjdwPjCNLt5h8N/LXHSc62OhhspWiQH/jFRn6MHCDG7+2uAJGmwaiJNhURajtY0aZ/I7DgPsevhi3Sl//qkyuiPSV0hJUQh3za+sR39BPQ01nN80rrmrJ09t2Kq11Sbmujwd+CMSoSoDM4AlpY3oyMTevBbNGsHqq9KiPstPtBT1rMlSwNdHXYMMSWexl8bwb1TXgSGJ06Xgf06H9XXNg5LAO+6P3Pk0IpAuf2pOVzI752je7KiRU72zDbfV9odBHFfI2H/VNQJGWf4slu6UhBWlJOKsnXSnXZxzRdxRF6aJvwrAkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.75) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3LA31ygq1hMgtDmqoOcUjTmiJQyywdPZHGL4q1lx9sQ=;
 b=YcogvywqHZ0qh3qae9FAumV4Mtc+GLrdSg5zKK4HYH9LXWmyHmUnp3AlD1FeiGay2c5txqgJXfQn/I80ExvE2WpUbSYONMrNsDRnHR7TQRMuaPamZmewwwQwbWXntioguhxGonvj+SPsoNlT0pZVY38Nfuxg0lnpN4WTkuerw7yMt0rZVwl3DC9awXVn3WcbQAIn7yEJoDPm8BNtWGkAx3HmBvGNirdIS4uDs8eQMe7CIDIWgC5TfiGS0iXH9zPMy66kugyEBcyyMqxC72eHbS5Mky/e6/L3z7yJxP8ZXmXx3p58lbA58UUjS4fsxPXg5NpC+Z+ClfXryJghxwiYHA==
Received: from AM6PR02CA0032.eurprd02.prod.outlook.com (2603:10a6:20b:6e::45)
 by DU0PR10MB7406.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:445::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.16; Thu, 15 Sep
 2022 09:13:46 +0000
Received: from VE1EUR01FT046.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::6c) by AM6PR02CA0032.outlook.office365.com
 (2603:10a6:20b:6e::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15 via Frontend
 Transport; Thu, 15 Sep 2022 09:13:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.75)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.75; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.75) by
 VE1EUR01FT046.mail.protection.outlook.com (10.152.3.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.12 via Frontend Transport; Thu, 15 Sep 2022 09:13:44 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC8VRA.ad011.siemens.net (194.138.21.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Thu, 15 Sep 2022 11:13:43 +0200
Received: from bennie-lenovo.fritz.box (144.145.220.66) by
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.12; Thu, 15 Sep 2022 11:13:43 +0200
From:   "B. Niedermayr" <benedikt.niedermayr@siemens.com>
To:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <rogerq@kernel.org>, <tony@atomide.com>,
        <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>
Subject: [PATCH v4 1/3] memory: omap-gpmc: allow shared wait pins
Date:   Thu, 15 Sep 2022 11:13:31 +0200
Message-ID: <20220915091333.2425306-2-benedikt.niedermayr@siemens.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220915091333.2425306-1-benedikt.niedermayr@siemens.com>
References: <20220915091333.2425306-1-benedikt.niedermayr@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [144.145.220.66]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1EUR01FT046:EE_|DU0PR10MB7406:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f66d9f4-644e-43b7-8527-08da96fa96e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +YGGJuAszXpUO8v23N+1RaBV9YixgPPsDUWFPexKOsJ6/LPtiUAUwZBa5uP2aaWqheSFKoqRA3vXpgpxTBcY6K/hyXIJ0agN4FBFRfC6ZKh/2Z3nisc+HNaWl/977Ypw1LVyUHo2LOD/lkEwU4hnHq+cLirnUDOMsjsCkFhxo7yMbkX8xI4tcYTIr784C99hO8/Bunis7YDbWAS03SIGmBih9IRRyZl9sPmws5NFcmjB9FLhzTSKee8lD6hpkX88H7inuhPIV18WlzDUSFOiFyXCVpFWAOinbizM9y1ExBw9YTAIxUC91Yxc7FOF7LOT0azCsLPW8pB2CmaUBhXIoLJ20Vx1PQkP+ffkBNG9cjEwaD7qAuU1w2swtaLTYYPs8W+C4uH2BcjL/awnkdNtP8Qt65uEicJFK5yIbuiq4DmoBbHEKRi83+ZQhnXiphj8vO2Coz7CjZpIh379Nko5e0jqhGjdWotWQ5t/dEvnLYi7p57c+uIkWOb1UJhylah1se1/zoyPp3Q2q4VBxcTeWzAmC01AoXx32jxCpJdBamOFgKOdq7WaRjujfvRqjHut3cjLNZpKsSv2KBJrjkuYvZbg3O6UlipBDrP30mQfCHoYvqqcoMsYUmAk76xN5mZSudySUWPRJolu5LeQwffsBCexL/Fip9+vppwTJjQcUfpXwNNZeBkQS4xnKA4kOTzA9Mr+rLmtH+Eyk0HpkUO+Jvprrsvw92TWQ191s2AXRAbH5Fe1/X8CfiV5eWTWuntn86YWjQMVj0kx9DCVmYamDcMR76hIXLa8k+EDii6d2FK99lsQMq/mqjS++qLcC4Xc
X-Forefront-Antispam-Report: CIP:194.138.21.75;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(136003)(376002)(396003)(451199015)(36840700001)(46966006)(40470700004)(478600001)(8676002)(316002)(1076003)(40460700003)(6666004)(47076005)(110136005)(83380400001)(70206006)(336012)(16526019)(956004)(2616005)(40480700001)(36860700001)(36756003)(4326008)(356005)(5660300002)(186003)(82740400003)(41300700001)(86362001)(82960400001)(26005)(54906003)(2906002)(82310400005)(8936002)(81166007)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 09:13:44.3688
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f66d9f4-644e-43b7-8527-08da96fa96e8
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.75];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT046.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7406
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
2.34.1

