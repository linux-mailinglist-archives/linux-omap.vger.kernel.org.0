Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA13C5AE8B2
	for <lists+linux-omap@lfdr.de>; Tue,  6 Sep 2022 14:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240120AbiIFMsL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 6 Sep 2022 08:48:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240089AbiIFMsK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 6 Sep 2022 08:48:10 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2084.outbound.protection.outlook.com [40.107.20.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7985456BBD;
        Tue,  6 Sep 2022 05:48:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PklNm5ZX+6RO12gjLv7UVpBcvfLMd7VzCfLSpjem+ZsZO/uBZfNTziT1cAiPqJCZpAvyO2ZoJigthXTwoYszspu10K7R4JOMtCe3rIy1NlDz8vJozSmVtFwkRXXzpKFjmpQ9UhQNIG5FmkWwGwZjLj2ZqEtO+vJqOwabUJ9bkqfcUsqVfUHVvwsAWCjLHeN6St3MLraBKhvZAOEp76ktjoZT9NAkHrASMQDD4IscG4pAfPDYvEc0lcgfoiXJjDFxAMeGE1Q7mooRixGDaX3ocZlFTYMqJexG+i/ne+GMro11raNYxKSIJxOj6w6bhsw5/k7Ng/22eqZNG1Emn5hqsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YM/JpLffCvhXUc7F9/6MimoUHlZePua1XdTpo2iAH98=;
 b=ngPmz4jFK1UgU+chpYa5icXFvNdlreTS4juMm6Lo7jcsND6drvjohVn7IfB6RF7fn4paXHOLkcNvMydJdS1rgvZCeX3lZv5NdTm7StZz2GxuABmMkMnNVyHCYly2TEUmdk9aFDtkoSCIurj575rf8cVqOSJUvpi8E7cWk3FiFsyskpWOD3EHQUXt45FMES/2kdq1g/Y1GENG7uecox7b80LQ/HF6fvcGGlDgtJ2A9y1ZU1dCSkpHMv7826gdQz6G2JWKNZ4xYKU2ClxE/Y/oMKFS6PgvAv+v6eqfat8Xf7m2wXlSS6S6UDSJ4y6HDgusvOfLefR3FiNNW4VFaPe+Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.75) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YM/JpLffCvhXUc7F9/6MimoUHlZePua1XdTpo2iAH98=;
 b=F2KaArC0T5g2SRnXhzNIL7SZyqKMihbrqsVkZ2MUbSa3nDzWHvO2MFc0c8nSaAbI0oKn1RGJ7wtFICXjHkqsoKQFcllPOU6+UlzB/ZfKPDCfML09GL9IVxlcpAMFlD9fBBtkkB2dyBrpGUTX0oJNfPYzfgatCAD765FL9JqYVgOxjJy4/ftheRMFkYVGd7gq/DTiPpeECBbfEf/6T3/gyjYgI51gt6Mc3oKoCVLQTyfsAS9eb/rApfrG0+jNiDkb5sTA12kpBDQ2yjPlykWx3AoMPUZrBd3mjg8SusucsUNwoQ2tKAgtUJ7cm6N/HcIvqjxX3gjdgBwTNvWVT1SfVw==
Received: from OS6P279CA0115.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:3c::11)
 by AS4PR10MB5872.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:517::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Tue, 6 Sep
 2022 12:48:04 +0000
Received: from HE1EUR01FT037.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:e10:3c:cafe::a7) by OS6P279CA0115.outlook.office365.com
 (2603:10a6:e10:3c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Tue, 6 Sep 2022 12:48:04 +0000
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
 15.1.2507.12; Tue, 6 Sep 2022 14:48:03 +0200
From:   "B. Niedermayr" <benedikt.niedermayr@siemens.com>
To:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <rogerq@kernel.org>, <tony@atomide.com>,
        <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>
Subject: [PATCH v3 0/3] omap-gpmc wait pin additions
Date:   Tue, 6 Sep 2022 14:47:47 +0200
Message-ID: <20220906124747.1767318-6-benedikt.niedermayr@siemens.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2d05fdfd-429e-4644-20fc-08da90060a2a
X-MS-TrafficTypeDiagnostic: AS4PR10MB5872:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UD96PN8FazLlossbjru3TKNAk17Vk2aloxCSNaUf0KMJgfc1AtI/WLHn4DrZIuJ3Vo8aBS4rS3iCt1fCFGvip1/e1YtSsGa1w3ecN6DOjJVOxDc7mjrScKwzc0ypGwXD2l+VgvrUDZiVLh7HNElgKy2uSl15uokfkmDbSHq4BF2dEcsT5JunF+rU8aSAMdVNfald3k9xxwZAhsJZ6gslblP+0G5q2G+BeFCVv92P8sYPtOYtbTAnGZKXSNbwm7t3QhJGFxHQHDPjNymuR8WpO7bGbEznPMvNvDIciUG03BNRaXDuktbsDkF+qp9vQ2fnK2ypn6FmIxjPeQXUNaXCYXkRXxRLXwvXYPIkngFclpe4+DEGQQDDOaFSHu6cSfVK4mMQVNjyU5JA/E9pU6j2YK46Aw4LPwMcSTV8BdjN0VKvPgn/q0As2g/3BNz2bT4ZbU5dFBD0P8T0Dh/wVWAkIYeCxbwdX4Z+0nNaiuGKxbFwpOYDVhsBdLyJjgPO8DzsN8yLoDw86sID3mSXDyHlwDLybrSD1N5V6gL4bs4F5I70Yu3MnB7MdWwYNGf8p9xJKYKsWhXh/ERzhLtTMdUtd2wIggymUmuQGdza9bYuFKUWo4EACb+v0ers2G9IDygtA09br92XIz1DQHAzoUBR37r/9xmZDLKinKCeGQIIAFq+0Vfqz+fIi67cpjMvvbuHV+DCKT35Q0AgOeaa+QYSqBitkidQEqOcip92QNBmcGNkbUz3ucMyR/jlVaJxPW/KxiX13t+II3CDTRuC14TwGCrJALAUFbfmJr+jY7y1LmbISHHFrDhR6KPPNGbiVnFi9a4O2lLMS7Xfo1LUQngCV+2eO4rsPb6I3wr2HWfcOq4=
X-Forefront-Antispam-Report: CIP:194.138.21.75;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(396003)(136003)(376002)(36840700001)(46966006)(40470700004)(336012)(186003)(478600001)(36860700001)(6666004)(956004)(83380400001)(16526019)(1076003)(2616005)(26005)(47076005)(40480700001)(4326008)(5660300002)(40460700003)(70586007)(70206006)(86362001)(41300700001)(8936002)(2906002)(81166007)(82740400003)(82960400001)(36756003)(8676002)(356005)(54906003)(82310400005)(316002)(110136005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 12:48:03.9989
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d05fdfd-429e-4644-20fc-08da90060a2a
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.75];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT037.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5872
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

 .../memory-controllers/ti,gpmc-child.yaml     |  6 ++++
 drivers/memory/omap-gpmc.c                    | 36 +++++++++++++++----
 include/linux/platform_data/gpmc-omap.h       |  1 +
 3 files changed, 36 insertions(+), 7 deletions(-)

-- 
2.25.1

