Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 590AC5ACC4B
	for <lists+linux-omap@lfdr.de>; Mon,  5 Sep 2022 09:28:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235396AbiIEHV7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Sep 2022 03:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236506AbiIEHV1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Sep 2022 03:21:27 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2064.outbound.protection.outlook.com [40.107.21.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 686323ED41;
        Mon,  5 Sep 2022 00:17:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jIkuIJxb0c5mK3+YfBZpeWhNUiRLhlX+nnwFSh3nwnxf8MK2oCeMJ1tZGtlHho/ZA9ZABrV7AUYyizyRkwPfAtf/o+BgAfkGZ5r0OgBYk59ZdjnoMrRkk3dQvs8Lv93XB5qS/M5rFAkYwWTE6BelRSSyX/UEjWPlXcKNYeVBWrclhvBeckH8nHe3SzfrwoYM45VilqH8Q0zKehqNOVGJxjADs4nbwyyXc/gOvwouxW8shCKbm55UqLG3GxRQfGnq1ZyDH6NZefCm4izXt48Df8FJaUB3afMxbfOwKwjE6q5MB/wkqOMdeTaQ3bIj25HdntojgBqjwmHliBhrI+zNIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RMpuwlaHHRQJTVE9gEos8L3v62bK2ZXB9EdvwMCx4so=;
 b=Zo6EryT9UjFBpNN3o8cEajWBBymA30lHrsmxWYnXP2IWScYHpfJaG3MOmJolX+TzPJRbiDMIb9Lvkf/tJZd+d4GQM+gKrSTApi+iZAlC0wn8hiHQyw7MpiM1zKjf0bPusHdXYNT+B6HK57FifCfGXt1aY2BU4GalEPo1apYhDjbgIhDiXVlD4aDWaUmSUZxfUHmoyeHFOGPXkIkE22TIvlgcVjYXtjf739gK68+fMUkx1hD3wFHiYFW6Q/mzIJHZeMDmNIWH72LZeD5ckf5OoXNbs9L+FunZMokocPE+kLkIElZshycy+dCMjUNueXLKdwIG60vNcqP6PkOFbGW7Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.76) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMpuwlaHHRQJTVE9gEos8L3v62bK2ZXB9EdvwMCx4so=;
 b=ef1W8U/i1cf34DNr/zpRLWNAXSyzQlDZ11woyULQk+JB2SioxLbRpaol0BfGLXxmLYdr8XijZndvB7E08yP9PHW61eQbUqhL7owoEQsOdDiy5PQUDe+geTJi9pQlkAdlUXJieLyHDuhYVFDow7Viqvjhamn0yhluiusgbMBIW1SveUFkPoXLkMMRXhdi1XdqcYPczwLjcJHo2XBxEntibr5K7xYpAf2EB3Q44m4OKzFa6VDSVfv+KeQf+SHLAqwjtUR5X+JLn67SZ4+bRp9X5/jxcLadWZ6r/CITlnDIEujVOoKzLU93QXiz897z0L8Z1cDfefp460tTTKS5TSqxCQ==
Received: from DB6P193CA0006.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::16) by
 AS4PR10MB5174.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4c2::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10; Mon, 5 Sep 2022 07:17:28 +0000
Received: from DB5EUR01FT015.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:6:29:cafe::f7) by DB6P193CA0006.outlook.office365.com
 (2603:10a6:6:29::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Mon, 5 Sep 2022 07:17:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.76)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.76 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.76; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.76) by
 DB5EUR01FT015.mail.protection.outlook.com (10.152.5.0) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Mon, 5 Sep 2022 07:17:28 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC8VSA.ad011.siemens.net (194.138.21.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Mon, 5 Sep 2022 09:17:27 +0200
Received: from bennie-lenovo.fritz.box (139.21.146.182) by
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.12; Mon, 5 Sep 2022 09:17:27 +0200
From:   "B. Niedermayr" <benedikt.niedermayr@siemens.com>
To:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <rogerq@kernel.org>, <tony@atomide.com>,
        <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>
Subject: [PATCH v2 1/3] memory: omap-gpmc: allow shared wait pins
Date:   Mon, 5 Sep 2022 09:17:15 +0200
Message-ID: <20220905071717.1500568-2-benedikt.niedermayr@siemens.com>
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
X-MS-Office365-Filtering-Correlation-Id: 838c1be6-dd4d-4481-3c2d-08da8f0eb090
X-MS-TrafficTypeDiagnostic: AS4PR10MB5174:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uR0Lx1JKjz3aNhMf0+F16vef9umZZ7Kh3B5MLI63Pc6GK6yja4DoOLjiOC3BeWHfDwgKFFxNws1ANMQSzWn/ZqEGeSeLfdM9RPDxcZl6M6rWHsY2dgVNSZwyumilhJ+uXfL5bnd0RQEwe/njNNfZ4t5HMuoZA9OCS3hvGFA66ZXiMOGrBsBaK5TqVeCXuWC7cs3WUocOl0dV+K57HEBctZ/nBn4cZ6hbh31aMKd6OSydIItT+5EpSl2bRkhpXM9/l0Vq3CGaqt4vt/NXwTZqIx0n+bavLclH3mOt8YEQzweh9M3rDM/pF/C0pzAyyaFtQpWyujftqN6b3IGprJ936BvEsRQ1urheP7rQpkRSxioFbozXlexzD7/QoYnFX+N8f51drBKupP/iC8aKYUDdmZvEzfWmL5SEoQI4+A6CnSvpkYt7deH9w99C2lvT+oW9WDOd1pirneR6lkwACJTmG4bf/WqAI8z26xYR9eQYlGya+ZZRJ9VFioSvYN+30AloYEGQZXJEMOFJnxWgHF1R1a4lJTyzU4UWdo5LQcvfrM5dM2joTScqHer3KeiJyJG826UwYt3631XxSE2sHBjnO0aitOCcOYxod7ZU70H4odhCF8VyRZnBztb6rC8HYeuQBHvdNgEwkYdIYh/0As7ourG0FmyPRghLjLr1oXVaZxzRIF8v3B2QytcqdsYcPBn4Ynl3HHF+ygWVBEIaFP08Ndt5CH/EZivEt8nVI7WTldrbvZ5VjVGEkJUAEaa3+QpEsNh0DHOGJNEwV4/mFDJvoM3YZEHXOOw17KwYFIY5AyIuJqDKF6oM4AJXTRmDIDD9
X-Forefront-Antispam-Report: CIP:194.138.21.76;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(396003)(136003)(39860400002)(46966006)(36840700001)(40470700004)(478600001)(5660300002)(40460700003)(86362001)(8936002)(41300700001)(6666004)(82310400005)(40480700001)(81166007)(36860700001)(82740400003)(2906002)(83380400001)(956004)(110136005)(82960400001)(26005)(1076003)(2616005)(47076005)(186003)(356005)(336012)(54906003)(70206006)(36756003)(70586007)(8676002)(16526019)(316002)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 07:17:28.0122
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 838c1be6-dd4d-4481-3c2d-08da8f0eb090
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.76];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT015.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5174
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

Newer kernels refuse to probe when using the same wait pin for
different chipselect regions.

But this may be a usecase when connecting for example FPGA or ASIC
modules to the gpmc, which only got one wait pin installed.

Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
---
 drivers/memory/omap-gpmc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index 2351f2708da2..579903457415 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -2215,9 +2215,13 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
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

