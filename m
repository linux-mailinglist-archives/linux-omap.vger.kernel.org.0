Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EB175AAAF1
	for <lists+linux-omap@lfdr.de>; Fri,  2 Sep 2022 11:10:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230317AbiIBJKs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 2 Sep 2022 05:10:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234776AbiIBJKr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 2 Sep 2022 05:10:47 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2053.outbound.protection.outlook.com [40.107.22.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4EBC50739;
        Fri,  2 Sep 2022 02:10:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WBzti276AIJFCOu2+Cxr5A8EJhJAB1P+EU5AXZfHjBmjoluDTg0+S/92uYqwke/LjEYTaL00q/G5FXk6bLB4b6W0rQGHr2tIeYTW0+5XcGOhBMJ7zyxQ+JmIgB2WmF50cBelHw/Az8IJSJ2yJ1V1+QGeH3J6oilsRK8VJrqV24FGt+LXs/9LcOndhhwKnyGzC5fgDtgx/Kr17epxirtdhuu1whin7cc5YvopSFSdSLmjnhfxEvlbhZJ5qnpwERwlr7nY+TvO9seMdQ4D20SCyAdUYbGHkAiwQAcMXr1Xtrbn7GKC/ebYEnl1HGto0Kx44lVMmkAWjfwCZ8J/x3mQ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RMpuwlaHHRQJTVE9gEos8L3v62bK2ZXB9EdvwMCx4so=;
 b=j2Lb/PMg2mzTOI67RotGp0Nnpj9dHJfpdKAMmckzZgB4QycdQHxLDuSsm3N6ncvIJLe7jv4T54S//0MwpVLYImGZ7EDZ7R5MkC1jcNXLlRJf3asa2EU1e0hUHEp5ny/uIlDpz176a4Fuu7L+cSaUZVgN3hdPN0vWthxrvif84/yfg4kFOKg/wlRHwiewTvfGIBNV+/Y5wUO58WB90g1SGPRhrDmPzuaJQ4XljUhDUB0TSQjRAF1kO7KyhzHd7TEjqyuGyg1zNgcTVNDOTmOBjpSFqtddFMSs7GPpXc+0uDAAJ2bMQ5hZ2dGpv99hg0fw3Im0hwWej7EUszQIKP3KdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.76) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMpuwlaHHRQJTVE9gEos8L3v62bK2ZXB9EdvwMCx4so=;
 b=m7rjaFkDif3R7IARpiuLg+G/WzGt5w86u8UEmT2H5mzdowPiYIgSw00yD0ca81+zCUkCOAHo9Xxtc9Vj/jO/Un05NjnymYg5lJh6NfK7kQ0cenWNL6S1ziBLyThAvMqNfKUCFKVQ0idHyoaGyWWx5uChnNHT6iCiKYsB6jakvUcAjX0sVhrn2y5xgWc/CvrcLQaRWoZQED0I8PRKT80EoXWlIGf60AikX2G8o25HFnKZFQafl0k8c9ZmcHS81Kh33IvTLPfwy16uziry3U0RKFNCuxhRU2/upwhnWQOsUoipBfaadYGmRxfzuyk/CkIfxxA1e8lF4Nr2TCQQec54VA==
Received: from DU2PR04CA0330.eurprd04.prod.outlook.com (2603:10a6:10:2b5::35)
 by GVXPR10MB5813.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:6d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Fri, 2 Sep
 2022 09:10:43 +0000
Received: from DB5EUR01FT092.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::a2) by DU2PR04CA0330.outlook.office365.com
 (2603:10a6:10:2b5::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15 via Frontend
 Transport; Fri, 2 Sep 2022 09:10:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.76)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.76 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.76; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.76) by
 DB5EUR01FT092.mail.protection.outlook.com (10.152.4.170) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Fri, 2 Sep 2022 09:10:43 +0000
Received: from DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) by
 DEMCHDC8VSA.ad011.siemens.net (194.138.21.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Fri, 2 Sep 2022 11:10:42 +0200
Received: from bennie-lenovo.fritz.box (139.21.146.191) by
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.7; Fri, 2 Sep 2022 11:10:40 +0200
From:   "B. Niedermayr" <benedikt.niedermayr@siemens.com>
To:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <rogerq@kernel.org>, <tony@atomide.com>, <krzk@kernel.org>,
        <robh+dt@kernel.org>
Subject: [PATCH v2 1/3] memory: omap-gpmc: allow shared wait pins
Date:   Fri, 2 Sep 2022 11:10:26 +0200
Message-ID: <20220902091028.1346952-2-benedikt.niedermayr@siemens.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220902091028.1346952-1-benedikt.niedermayr@siemens.com>
References: <20220902091028.1346952-1-benedikt.niedermayr@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [139.21.146.191]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a121e6a-3462-438a-9f7a-08da8cc303c3
X-MS-TrafficTypeDiagnostic: GVXPR10MB5813:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cvz0PMR4ZrCEgdWZJbMB7tE+qAiTEbUXumlXyXQKgtyuCK1hOEI420DnNKhZnQdJFaL/DLaeomB3Ry5VCn9koYrKxVld4Zu4wl254OtpryCzl8KZYrrdOPmXJFJg5AgxRxWTUSnlJgIQeBXdRWVR0JZrrjm/kxWJ7BrCGleRJqCQR5KcMyAmpUr7Whj77hWR8Q9ulY2KUcm85awRaZqV63rxenf4IC0Ev3tFhKV1AbcZI0dYsBHT46Wjru/2M7Iuwt4jdQ5mJH2qDaAeLSTYsYKYX0YI4VTzn9Dzm7I6D+N7WoLVsm/qNxTWSpB6eUamEVnsjylbWUAw2FkKEt3IreWF5Cgz7rAZL8ieklLBmF3NGYlU32HfnDwyhEXn1nlhL6Dx8PJB/mZ6MpR1Py0Jr4yKHd5BOo2hxmaWyRCSo1mm/R5fWYEuTyDn7BYgPXmazP3EsdlfsTT77kzSbl1TxCNxZ7QAy2895AqhI/CMOjkHSUgmXMXjdyCedxgpbvj3zgY/x49WJxmVLxhDqV8+y3lNo6Kq+d1xBH5QTVIwZd5Fr2fzFX8GoIWVPvQSdl3obvgpfQAlAsBw8KLLYMtgPAjHGN5XdH0ZZNSsuNO1IK5ggqUKgEV0TB12vxKIvh/dDftvCyDoQs+/eIBS4kAX+Th5i3KAuqV7Pg2/BiExUtFeDcurVyE6XEgpXxWMMqU3qaNacirBT5SiB4TnaShuQ5pqg1fyaGVVjpiYTeWIJk0e4q7aSMaFbzMNeSj6Mdg5KvF7gEYT+LiR0eyceDpYct35Wn9n4cqWJcqymYlJvQZLI4gbAONxRYiG+tXn1iwq
X-Forefront-Antispam-Report: CIP:194.138.21.76;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(346002)(136003)(39860400002)(36840700001)(46966006)(40470700004)(70586007)(4326008)(8676002)(47076005)(70206006)(41300700001)(956004)(2616005)(336012)(16526019)(83380400001)(186003)(1076003)(54906003)(478600001)(110136005)(316002)(6666004)(36756003)(26005)(40480700001)(356005)(40460700003)(86362001)(36860700001)(2906002)(82310400005)(8936002)(5660300002)(82740400003)(82960400001)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 09:10:43.4291
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a121e6a-3462-438a-9f7a-08da8cc303c3
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.76];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT092.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB5813
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

