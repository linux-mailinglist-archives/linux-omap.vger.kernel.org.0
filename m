Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42ED35B9739
	for <lists+linux-omap@lfdr.de>; Thu, 15 Sep 2022 11:15:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbiIOJOz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 15 Sep 2022 05:14:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229993AbiIOJOe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 15 Sep 2022 05:14:34 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03lp2171.outbound.protection.outlook.com [104.47.51.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E813C9A94A;
        Thu, 15 Sep 2022 02:13:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Au9dUrFeLZET1/a08L97199WWNM3GBO8LDhwvCwQzxy41zMESYl8U30BXtL42L69dkjnKWgZLjzOybagwoebckvRL5H44COdOw7VgJL006bn7sfYvvH9GpRkFvt6D9spcjUL4X08WtyCMOnPIacS2lNsq6R9l7Z6YgIjKfF6Bj25uzNhefxCkt/KI7hSlR9UJqO8rirW3/edPDpdXWgdi3CcDblV2fEfcTTNbFim7RJsZUO5lgSwmsBjxarONpnCjeqm/jje3kqLZn3WrAiPH3R1Bl36c9AalFWF8WqL1o71HYy10sB3yC7G6lFU8mhkqh97ThLdsPp+c9YrxRAOEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cjm2yOeu5bflkRWpOsHcJ5Bo7gL9KIPB1d9+ZwfX464=;
 b=Ha0pIFZHNnUun0Rv2+n6YBbygvboF1Gx2+QjWrs0vn2DEQXW/0oVgE+48EzgjEBT1cfF+h+i9ykcw06d48mqPmEbKtez9ozl6XzHYDSOPx84IlHZB1/RACgh2Xl+bdlYb3iYhtg/GSKyq/qzAyXAMeR3/u8Mmdws0WM0+JrHmric8qyAS+f45ASmEXf3aW6kbof0cKnznuT2w4eEZY5r9e7k4LT91/biQ96DgzGzG1IFw5q17UATCaKKht7ONlT7h12A2gmMGOtPUypWgpFfaJQg9mnXzedY2bgSok4WuBFL1czXd4cxEzGtNSiDE+0cTW4tG/j6A64pqwY+tBHdCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.76) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cjm2yOeu5bflkRWpOsHcJ5Bo7gL9KIPB1d9+ZwfX464=;
 b=g4qjqOC/7PcdMZL2aJisBAePTIwS8zXockWEtz+O6qUGFLGJTWmaBk5Bhy3SGwe1kTS2K3keIzc/ZpoDSMMDg07vKlc2x2lEFJdntG2AxLuOLm+swlpnxQX7S2XAk42FiCui53kOzhKva7nc154FbLISPDcrhdm3ObbEUlAkkJfrbn+SPNpH+u5JaiHqnh5IiGrtwQRyfNg4+gKYk1L5oPsI2dMjpwoxmnrJ6mZ/SGWcTU0bur8JAO/NPk7QFH2v7zkJ3QCr4kzhi1wxssXTKjMbhM1/SR3bnkdG9Yvd7Fw7IwYapbyLuLb+BcFE2gKX2mH8FytR4A7UeH8a6nVpVw==
Received: from DB9PR02CA0026.eurprd02.prod.outlook.com (2603:10a6:10:1d9::31)
 by PAVPR10MB7115.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:316::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Thu, 15 Sep
 2022 09:13:44 +0000
Received: from DB5EUR01FT034.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::8c) by DB9PR02CA0026.outlook.office365.com
 (2603:10a6:10:1d9::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15 via Frontend
 Transport; Thu, 15 Sep 2022 09:13:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.76)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.76 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.76; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.76) by
 DB5EUR01FT034.mail.protection.outlook.com (10.152.4.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.12 via Frontend Transport; Thu, 15 Sep 2022 09:13:43 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC8VSA.ad011.siemens.net (194.138.21.76) with Microsoft SMTP Server
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
Subject: [PATCH v4 0/3] omap-gpmc wait pin additions 
Date:   Thu, 15 Sep 2022 11:13:30 +0200
Message-ID: <20220915091333.2425306-1-benedikt.niedermayr@siemens.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [144.145.220.66]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5EUR01FT034:EE_|PAVPR10MB7115:EE_
X-MS-Office365-Filtering-Correlation-Id: daed6ec1-d7f6-4fff-8717-08da96fa96b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wEEea+qt4S6Th4WgrC5gKZNvOYpW9rq3JcbOQPI5LhzfvVHeILR5Jw1a/ZX/yHqjGUzNdnLzJzOMM5d7o+oYMchBF7PJZqtN9SefGh8mizKeJ/vyPtnya23QbwtV8VByD6eUZcStrqZblFBse17UD/r4Sf1wCqrXw/tESsEdIYUaMnuT5NFJdPxKQ9dOTh2Ce4br9rhxpUpLbSC4HRRQWiCASuP3YYAzeJJiPjRxjGVgPmY6XKq95ljzvo07irx4waq0pPjxnfb/UGXtTnhYZQTWBmVxrhodUBCUWKBEwZq6wGbHe8DFJRvyvMHEE/HCoH2dAgKuI2cnSGbth1861jGQYG19fwhsU/3uhy/FcWbMKi7QJ0RpylyLnAid0iRk9IdW+NVYuaD3xthjjYjpjZuxvvLvhM7i7GQ26ntYPudguQOrKtVAkuw8Y0jyB9g2ZzT4gOgHaWkkS0a2a9DfbKVJ21MJdZszPRfigxMUk6EfdiKYb650lm4fbptDIL/8qxsaM7t99qlfjEFJxbRLDyjf2le//eB75riNwUOaIHwnl/2UNvupNqmXZfsEul5JT2E4TfUGSXTxe+7GqMO0RVM7IOrxcbqP4J8jpolrli0ZZBA0B+oilJwIjB/ydUC4uo9GPBZQajF/G+T6+orJ+DC2CS95Z8ho+L3oIXgZR6NIxoYLHuZpHO8zDLzwEek+zlYu/3o8VdyKpoBUFa5bcOdvK5C8ijf0B78tEBnWC3g/Ds79NTNW/OKZKUGRAWiFOuqbEMRzEEOR/iOhkz3rWdFZ/KOc22zTKCTn9ZjkcIA=
X-Forefront-Antispam-Report: CIP:194.138.21.76;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(39860400002)(376002)(136003)(451199015)(36840700001)(46966006)(40470700004)(82960400001)(81166007)(110136005)(4326008)(316002)(26005)(54906003)(86362001)(4743002)(356005)(40460700003)(5660300002)(478600001)(6666004)(8676002)(36860700001)(82310400005)(36756003)(956004)(2616005)(1076003)(82740400003)(186003)(40480700001)(8936002)(70206006)(47076005)(70586007)(16526019)(83380400001)(41300700001)(336012)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 09:13:43.9706
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: daed6ec1-d7f6-4fff-8717-08da96fa96b0
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.76];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT034.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7115
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>

Currently it is not possible to configure the WAIT0PINPOLARITY and 
WAIT1PINPOLARITY bits of the GPMC_CONFIG register directly via 
device tree properties.

It is also not possible to use the same wait-pin for different 
cs-regions.

While the current implementation may fullfill most usecases, it may not
be sufficient for more complex setups (e.g. FPGA/ASIC interfaces), where 
more complex interfacing options where possible.

For example interfacing an ASIC which offers multiple cs-regions but
only one waitpin the current driver and dt-bindings are not sufficient.

While using the same waitpin for different cs-regions worked for older
kernels (4.14) the omap-gpmc.c driver refused to probe (-EBUSY) with
newer kernels (>5.10).

Changes since v1: 
  * Rebase against recent 6.0.0-rc3 kernel, but the maintainers list
    stays the same!
  * Updated eMail recipients list
Changes since v2:
  * Remove the gpmc register configuration out of the gpiochip
    callbacks. In this case the memory interface configuration
    is not done via gpio bindings.
  * Some minor code fixes
  * Changed git commit descriptions
Change since v3:
  * Use a uint32 dt-property instean a boolean one
  * If the dt-property is not set, then don't touch the
    GPMC_CONFIG register
  * Changed git commit descriptions


Benedikt Niedermayr (3):
  memory: omap-gpmc: allow shared wait pins
  memory: omap-gpmc: add support for wait pin polarity
  dt-bindings: memory-controllers: gpmc-child: add wait-pin polarity

 .../memory-controllers/ti,gpmc-child.yaml     |  7 +++++
 drivers/memory/omap-gpmc.c                    | 30 +++++++++++++++++--
 include/linux/platform_data/gpmc-omap.h       |  6 ++++
 3 files changed, 41 insertions(+), 2 deletions(-)

-- 
2.34.1

