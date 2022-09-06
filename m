Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D5CC5AE8AC
	for <lists+linux-omap@lfdr.de>; Tue,  6 Sep 2022 14:48:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240080AbiIFMsG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 6 Sep 2022 08:48:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240076AbiIFMsE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 6 Sep 2022 08:48:04 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140080.outbound.protection.outlook.com [40.107.14.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D54F56BB5;
        Tue,  6 Sep 2022 05:48:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UlyQeCWuaijjwzsoZAR7vDsiin3VtpGFnytBOEm6uqkl5rrjRohGAaTuGXA/KJm2wXNYFVr9k7ezt0Ur4TKNv8P917iCDAu6pEeWJ7JFv5yQB1AUT13FJAoGcaZcSKhaEZBkJGjHHpJCiAok9YKr7fgPTJeDpHP2eZSmX90Jz1LuJaxfw2rb/l9KNZZRvalH6hdxs+pC14oUgX8UqFRN6NIb8SwD3ph0VG+1ATJCwnh2j6nOmUYtyS+GjaaM8aJ4GMArBPhrY7LNt8I/WD0bPZtzh0qnJRdUx4kOH4ErXE+1jhWwg+GyshyogRDEEV6RQw0MreqbJVGJKkfGHXrvhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yI4vhig3q55WMeGI2zum/94+oMaAT/0WCEHAGzlyXhQ=;
 b=Dn8nImGzRGhvPxpW8bBIpaOvVwNpCIIRmfYJoyccRWvDcXkebf2/er4tf/xIAhUGmqK45PVmRvmBBsHTPvVyAg0cF6LSK+ACByF9N8fmyVxi44BBx/zyutLwbekfekJpSPCdM5o5tEyk8EwnAVx/iQlHE9Dx79XlWO6YBBMMMJ5BeS13DOIfclwlaKseeIDG6jlkG72SzcHziD+E2gVCVHRiCbvr8HYliSQVzCPA0x1tblEUhaFjgoDq3DvH4H2nFkNPqRSllqgOGsHtM31Dy7Gp/vyCxMlN88twA1Ql7UXgcM/h0cUfuaYMICYgfOyyMraoklZyMwlB8H9UB16xnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.76) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yI4vhig3q55WMeGI2zum/94+oMaAT/0WCEHAGzlyXhQ=;
 b=sIg4JoAcferjXDwq3piRXHSMmhWK3nqdyX7rTyCE9kJ10UjjzWf9YV5TO/DdGppDAYzOaBH1e8unrCzRtSWDa/p/qPD97LQ+60kNfXnbsiawhrcCYiux8OxN4SSk8snUuKEb9+dwDrZ/W/ytdOhDD42DGCfig+HdD2B6uIBPWGXwXCB2lMm1L4Phu8nmzGcafKBYsLAGLYCUL20MdiTIS3oZYpgL+QGzEmwibjbqw6RISxCQd4q5/Xdzxtx86uEnaRDAxxRDqRnYGiHgS/k+Ezmz/UIHrD0/weDwH8+lKZxuwGYmmVfefnnyYhBxd9uj3snR3vbVrpkc62C5kvJ4LQ==
Received: from GV3P280CA0092.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:8::10) by
 VE1PR10MB3902.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:16d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 6 Sep
 2022 12:48:00 +0000
Received: from HE1EUR01FT090.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:150:8:cafe::3a) by GV3P280CA0092.outlook.office365.com
 (2603:10a6:150:8::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Tue, 6 Sep 2022 12:48:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.76)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.76 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.76; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.76) by
 HE1EUR01FT090.mail.protection.outlook.com (10.152.0.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Tue, 6 Sep 2022 12:48:00 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC8VSA.ad011.siemens.net (194.138.21.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Tue, 6 Sep 2022 14:47:56 +0200
Received: from bennie-lenovo.fritz.box (139.23.126.196) by
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.12; Tue, 6 Sep 2022 14:47:56 +0200
From:   "B. Niedermayr" <benedikt.niedermayr@siemens.com>
To:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <rogerq@kernel.org>, <tony@atomide.com>,
        <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>
Subject: [PATCH v3 0/3] omap-gpmc wait pin additions 
Date:   Tue, 6 Sep 2022 14:47:42 +0200
Message-ID: <20220906124747.1767318-1-benedikt.niedermayr@siemens.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [139.23.126.196]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3f89ede-a2cd-47a2-2350-08da900607e4
X-MS-TrafficTypeDiagnostic: VE1PR10MB3902:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WqG0Iaiyr0hYAK3xmqoEV/D8PDsWQfKZmZvoeBMEWIdmURfXy56UQtPHHu6pcn91gLKxDreeIvDe0OcJSIxBCPFxk7sGS0nlE7bV8q/TzTlyT60gDyaJYg/9E8XtdB7RlTYLBd/FhxzvIFdd1//btB92POX00o+rpMedSn1aQFDy9EkzOa8nPCUkgv55V1DtneqR8Wfk0WPLohqZKd89NqV+G/RwjWG3aCFeACB7rFSilfnQlmpyQQ7WfhQQpUv146c+JFniKlV/M8q0DfkmJxmUG2DGWKCAxJ/t+7CrCZycyxwjeMdyNMLhaid00N0wAq6fBQ6oUwXzAZYHNOnl7yYkiM9+ZjnqNvSfirFtLQP0rZ0zsaXiN5HZRSMbyjjjzRTY7C9kQ+V980h0Zz7dPSUG3A6Yr5QG61CW1aALpqgsZEBNdrIQ/M5Zpf03M526zFIeN2l+sQPqCH+qqWI2+m1DjBG587vdL2z199ABaxmGBORKIffAAyzfZ+/qmUlitItprZ0mU34aCclOxijG0MpmNU7mzc3f4+I6CgUAnhnWUW9p+eb5Lucv+fzcWcrjyZP1YknIIVNTmHyVXm+nb0NNWs9mYYAvKaA48UOWoMrYey//vihf5kRenXB1mPEwQbV7LjMLWifwpHrlRMFKEkA6EhzcSe4JIs2gD+1h2GeeumRwGZmK8ymupS1/WAEb6/2R7N5Vv7MbOTwDc0daMsXfH+JVnnC+E5TWdbl43QYvB32gIB97H5o47v36FkZP3wYMPjXIuvYCLzZpEpNMdL2V0X728nE/Vb/vGxGgTmY=
X-Forefront-Antispam-Report: CIP:194.138.21.76;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(39860400002)(376002)(136003)(40470700004)(36840700001)(46966006)(8676002)(70586007)(36860700001)(5660300002)(478600001)(4326008)(47076005)(81166007)(8936002)(70206006)(83380400001)(41300700001)(4743002)(26005)(6666004)(2906002)(356005)(86362001)(40460700003)(82960400001)(16526019)(82310400005)(82740400003)(956004)(40480700001)(336012)(316002)(36756003)(110136005)(54906003)(2616005)(1076003)(186003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 12:48:00.1848
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3f89ede-a2cd-47a2-2350-08da900607e4
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.76];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT090.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3902
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
  * Remove the gpmc register configuration out of the gpiochip
    callbacks. In this case the memory interface configuration
    is not done via gpio bindings.
  * Some minor code fixes
  * Changed git commit descriptions


Benedikt Niedermayr (3):
  memory: omap-gpmc: allow shared wait pins
  memory: omap-gpmc: add support for wait pin polarity
  dt-bindings: memory-controllers: gpmc-child: add wait-pin polarity

 .../memory-controllers/ti,gpmc-child.yaml     |  6 +++++
 drivers/memory/omap-gpmc.c                    | 23 +++++++++++++++++--
 include/linux/platform_data/gpmc-omap.h       |  1 +
 3 files changed, 28 insertions(+), 2 deletions(-)

-- 
2.25.1

