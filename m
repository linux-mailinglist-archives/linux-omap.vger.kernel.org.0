Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 319125BACFA
	for <lists+linux-omap@lfdr.de>; Fri, 16 Sep 2022 14:08:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231278AbiIPMIT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 16 Sep 2022 08:08:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231345AbiIPMIM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 16 Sep 2022 08:08:12 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2052.outbound.protection.outlook.com [40.107.21.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51917B07C5;
        Fri, 16 Sep 2022 05:08:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SNNtAYYyjDQGpKUS6StcLkojBH/w6wzz3MO3/wQpsIclqlIztMQ5WnbVnwC1EBpUc7KMB/26yl7gKHAAMvDuZi73jOldzRO97U7ZBtvfrUZAs3G8GtelgycFkTfNDXzXmGBAaI0Dbb1No6AdK8IlRFgoY1pPIxD08a0y5cY1eNv6XHFerqveH1N+fm1vM0n0dHI4/6jknR1170SuMljE9rRyx7y0fcTAUnLp2YkXpLt1qtH8W6O3sCtG9lpq8RTLKZslk0Itc37ccNWFswYJA4aukLCXM2WOp335xOAFGlFm1qM48MAqEJ2pYAOGdTiWHMUCoOPKI9wVeluH0lIULQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6D2/AMkYHn+KZavGFlD0rLcXg0yhvIfTwy8S1DS3Ld4=;
 b=WMNV0hEx0/aCpTtAgaYUULCuWV5QBDEznuQAaVXgr1OMNmfxTzqzFKX9S+zqxHV4hgPNWMsKHIHfw2DWedsVCzEQU4gRG8keBai9cJV/Pr3e/yXtw27S6HF0WVJZT4THmmNPTJCt4+2dPe2QO+XHTGi8thV8hls2J2v5hyNpnN19AJy+/l9itLnHYtJblS2TDrGsUQ245phasfqS6m9IeGQHTo8lrSQbtcWBdeysieLXEKmT68AiirxrTQKLi938vTI6EeX1VsVp8fyqW9VWNJ8URu87AvOiiVA2RIyt08Y4b+H6spKAHBxcQ+73sjUIlw9/8UedXzmV9aMSyiHz7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.74) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6D2/AMkYHn+KZavGFlD0rLcXg0yhvIfTwy8S1DS3Ld4=;
 b=i8hQBgey+RAK912U9jtxITp5FqKAZzr42b3Hox0JAOnFFX/OE4gRRnTiUK9oIU639fB6HJOO7qnguCHS0bu8x2HkUB5o0lwGj358FuoAI7hmJ2h+5gAOdYAYIghEDakFgx2I3ahPZtPh8Kabe3Ssn4FCn5y+BRQdCkk8KfLaCZY3GOtVhDEbgDu0/HassADPo0IJW9jSm3PEa7H3KF6FE2Ok9UkTw8MAMtkv6F0fhuY0uG0iLKAK84G7agmETkprSEHbluGWYATOOhTmhoMZpaQPBgYy5TpxMWzlcUpUkHHZ/h4yOVknbZNU3mHhC+jZ4ig1jhikfq2Uh3jAowUh7w==
Received: from GV3P280CA0055.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:9::27) by
 AM0PR10MB3652.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:15c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 12:08:06 +0000
Received: from HE1EUR01FT063.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:150:9:cafe::94) by GV3P280CA0055.outlook.office365.com
 (2603:10a6:150:9::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15 via Frontend
 Transport; Fri, 16 Sep 2022 12:08:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.74)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.74; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.74) by
 HE1EUR01FT063.mail.protection.outlook.com (10.152.1.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.12 via Frontend Transport; Fri, 16 Sep 2022 12:08:05 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC8VQA.ad011.siemens.net (194.138.21.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Fri, 16 Sep 2022 14:08:01 +0200
Received: from bennie-lenovo.fritz.box (144.145.220.65) by
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.12; Fri, 16 Sep 2022 14:07:59 +0200
From:   "B. Niedermayr" <benedikt.niedermayr@siemens.com>
To:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <rogerq@kernel.org>, <tony@atomide.com>,
        <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>
Subject: [PATCH v5 0/3] gpmc wait-pin additions
Date:   Fri, 16 Sep 2022 14:07:46 +0200
Message-ID: <20220916120749.2517727-1-benedikt.niedermayr@siemens.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [144.145.220.65]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--17.586200-8.000000
X-TMASE-MatchedRID: bAH4BEb3OaKdIa4Z4akFf4mIDnzSS8mZtE4rffipOm437vkU5XIl4H+s
        iCf/QKJTsS0sZEB7c8b8MCBvciFjZ6ZSzaLPCwndmx4L2mG7WWDEzah3MhwU3YlSWYvdSPSY5GN
        m5cTRaUfMApOK4R8F4vSCiap+6KvtkKwzGM++sccw3q04xc4gVuJPyge9irBS9FQh3flUIh4mKH
        /Kj46+VdWM2x6EZ/S9sHT5iFhz4jxhnmcId02xRZbK9NqUDMpYRwPZcL7YQSYqsMfMfrOZReP6p
        +9mEWlCIFYJ0Vciv4/qzkhCUQRGlwK7UFMzsbiB59JoNf8FRHhiWV0DQ85LUqiUivh0j2PvjWP6
        asaL88WXuKyHuSLTfHxZFXOgydpQfS0Ip2eEHnwj/1Rbkzl1EymDnI5x2hWC9xS3mVzWUuBk431
        H65J9AA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--17.586200-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 2C33C451ADE99D9D5CB74F3DD155B9FF06A153ECDE12C31819AE177D8C5DF31D2000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1EUR01FT063:EE_|AM0PR10MB3652:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ddf7de0-6d6c-4b8c-2f89-08da97dc1cc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k6Wtg3k9S9QL7IgMk5aoMPZGy9w1vmyglqr6qNXUT4daWX2YJsDuF7Uz2b7kbLGxMuzeeAGlNvUs1gguSObl5jmxU1NIfcWg5aBEHuL2BHXc5o1aSkz2p5E41eDH8Y90qBDwSXGa1yzP9nO/90/4VbZa7ssxrTo+n6J3n14S+7lUfHV1kAUVbghnugVhK1HNPowPz8hkNJlUvXaK6nqA707kyJ0vwhcQV/Ek5xjOrXU7cITHGRidLqvtSNmyks2KWfakgS6VA1z0ryvRURLRNIyPtQUujPEXaomdcie7qMxCpGSNF08h6Z5MTAYuY0cOaBjIq/U6YzPYQVbfz0GcFsvhD8KTcyYp11OCY1SpItZ1mYUNZx1r9aEssWrrMSZfAYMP2CvBLOzHR0H/Qb6h23jPZdnuJ95OG43WPbqboP4nM5oDm8BuPEOcDTGqr/Ed+rXaFYjqZMC7A2y8oPlm7LSrkIw2InCfblyVgeZZxjGsiA/Ts4DW+XJrY0ceJbRhuJHcvv47f6ZmDOe1Ui0vNMZfmMaadsODmGZCGg1JiJw7SbNylK6qPPcADdgeS3MoqQ99lpjFtNZtjxzigLE/LBhcyHgXmLkvsbJTJJJT7XuFs8vhXiJeft0jfyxOm4pScl0RfSKyzSoRibW+lMOi7ApRVZY0lItc/GbA7BLYBToy9zovsT3I9FT0fm5qxF3mtF2KaO0+TpOtlKPDwNx2i9V9E/0ao3/9f2rdtAjth8ykNJaxoLDtRovGYPn3eeZ2sHrQDEOFy2Zj50eoqoyabQ==
X-Forefront-Antispam-Report: CIP:194.138.21.74;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39860400002)(136003)(396003)(451199015)(40470700004)(36840700001)(46966006)(36860700001)(36756003)(478600001)(70206006)(70586007)(41300700001)(4326008)(6666004)(86362001)(8676002)(7596003)(82310400005)(8936002)(356005)(26005)(7636003)(40480700001)(54906003)(82740400003)(82960400001)(47076005)(186003)(1076003)(110136005)(40460700003)(83380400001)(5660300002)(316002)(336012)(956004)(2616005)(16526019)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 12:08:05.6889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ddf7de0-6d6c-4b8c-2f89-08da97dc1cc8
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.74];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT063.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3652
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
Changes since v4:
  * Use checkpatch with "--strict" option
  * Moved wait-pin sanity checks to gpmc_read_settings_dt()
  * Always assign WAITPINPOLARITY_DEFAULT on error cases
  * Track waitpin allocation within gpmc for determine
    allocation origin


Benedikt Niedermayr (3):
  memory: omap-gpmc: allow shared wait pins
  memory: omap-gpmc: add support for wait pin polarity
  dt-bindings: memory-controllers: gpmc-child: add wait-pin polarity

 .../memory-controllers/ti,gpmc-child.yaml     |  7 ++++
 drivers/memory/omap-gpmc.c                    | 39 ++++++++++++++++++-
 include/linux/platform_data/gpmc-omap.h       |  6 +++
 3 files changed, 50 insertions(+), 2 deletions(-)

--
2.34.1

