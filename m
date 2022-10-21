Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 111F46071DE
	for <lists+linux-omap@lfdr.de>; Fri, 21 Oct 2022 10:16:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbiJUIQr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 Oct 2022 04:16:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbiJUIQp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 21 Oct 2022 04:16:45 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2078.outbound.protection.outlook.com [40.107.104.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59D8B24AE2A;
        Fri, 21 Oct 2022 01:16:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yy9qXXRZuPlMKjaUy08WnS447HgOOoe8wkOnn0MjUyd1k5HWYJrvL6KQhD05YNkki9RTxVJRxT4pSwMFGCY1w3OthknzTQRy+lkNYDEWr19UD3k/im+RdNNwUzUekkd50SMYTjMCP+M7c23HVFeirPmh4NLRdPGmrh0nyCaBPQZh57+Kp9ELVbYDPiya1PICytf+Dht8gkgAW0jmR0CVKZtrRIDr4bZ7BsJBm0YMx5SWwFJtcDxFl0PDzMGn+b3JCsRbOo8y7ZMQYNoQblws7x1bPZAzPRSawQGl2w44WrD3GnqDRpA5gD44VE8a8+1F9MhvDh/bqlot/0JOryiVYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e8uqO5sZrgF5m/2tyHjNJM1SnE8w4M3Lz0TPFQFWyms=;
 b=bu5hvuBX3e0RIk/eMMybgKZhQ8df6LcC9uXLu7BWSplBVY3mXOH7/f7bGQAm/2mswxIALgrqJtITfIxjI0dc5E2RgJZCGPMGak5OIwuRPPBdx3sa7qaFpWllX5Fq1QrGQKs36fR+9s9OgF15C2PH+xF8tM9V3RFGZ23ePxPAz0jHyw6fPqFyT1TNve+dKF/38VJ8oC3tI7ZeoRR7dydIWFZGaWShsjLq5+4KHtkJlNvwxaq4rB9LETsiUO47KLnXeJH1np7ZqyE4Q07ellFf+CA8jcS64hWYgzzujksMwXWG0/E+FOy5OA17VHkC6xRYeNZZL1qWxAeloWW2z294CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 194.138.21.75) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=siemens.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e8uqO5sZrgF5m/2tyHjNJM1SnE8w4M3Lz0TPFQFWyms=;
 b=HoZ4w9OQX1n5CZRq/IVHbJnrmk55ksGcCvBXRosGQ1lrs1PPsxzdOoNGf1ho97T2Yo9zGNveLInMzyDUHJnj1pobKceDoTaYt3QJ0I5LdztqeSV3asV6CAP23cfYOR95DxAJ2QsCOtSfC6TqXNf4Nz7N3tVj3NAqMdfnyV4q0tb2L9M4EE7eLw6q4hvXljml4wYPCMmjg5x9PEjPNao8soCPRYqf1QZQxF+T6Rasaaxrm/UQ269lWLASSkDabmxu2gZ0PqY7YIx+Xv5LfEytlXi/JL/P0o4hujHrkMuk50RUYWQxRfblHIITV3vpC5peml1DTixA9wjV2ePt0ca4Hw==
Received: from GV3P280CA0097.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:8::29) by
 AM8PR10MB4097.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1ec::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.35; Fri, 21 Oct 2022 08:16:30 +0000
Received: from HE1EUR01FT015.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:150:8:cafe::fb) by GV3P280CA0097.outlook.office365.com
 (2603:10a6:150:8::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35 via Frontend
 Transport; Fri, 21 Oct 2022 08:16:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 194.138.21.75)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=siemens.com;
Received-SPF: Fail (protection.outlook.com: domain of siemens.com does not
 designate 194.138.21.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.75; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.75) by
 HE1EUR01FT015.mail.protection.outlook.com (10.152.0.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.16 via Frontend Transport; Fri, 21 Oct 2022 08:16:29 +0000
Received: from DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) by
 DEMCHDC8VRA.ad011.siemens.net (194.138.21.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.15; Fri, 21 Oct 2022 10:16:28 +0200
Received: from bennie-lenovo.fritz.box (144.145.220.65) by
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Fri, 21 Oct 2022 10:16:22 +0200
From:   "B. Niedermayr" <benedikt.niedermayr@siemens.com>
To:     <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>
CC:     <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>,
        <rogerq@kernel.org>, <tony@atomide.com>
Subject: [PATCH v8 0/2] gpmc wait pin additions
Date:   Fri, 21 Oct 2022 10:16:10 +0200
Message-ID: <20221021081612.591613-1-benedikt.niedermayr@siemens.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [144.145.220.65]
X-ClientProxiedBy: DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) To
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1EUR01FT015:EE_|AM8PR10MB4097:EE_
X-MS-Office365-Filtering-Correlation-Id: 32fd07d4-1f22-4a25-9503-08dab33c8e9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BTNrwuuZnubazlByHEz3zIO4WPrHbpqharYAbtVK7bRXqs6IMt/RJkylkma//Wid/NBYJGicDsv7/cEkuST10ExYZcxWkwyo5vDMnOtny371zAegyvgNzEn1T/hmLu71Epqxf6woPY3JFXh2dlOckGc1mHuUac9yiSmwoA4P+5ge+Uep8DZfryFLydcLFhuhxeuWM8NssH4JStORSP9aSd20YwCvu/1JVmlve7DWBCF2FVjVwCA3XxXthQ+DfVkmZNkxTgKKY+UCdQsv9W936czxUvoBrS54kAKwTjINk/Aq+sDwTYrpNI6/FBXtMcqcZG/QFk5zqnVVPGqZLkJbuquOZD9Hm84yYHjGyK+bcsCfdO/qyFnJWSmXmxE7k2g4M669Z6JCpy3qhHL60FigDKYEDyBwru8TkQwUE9J/SBOVBPVHmZOrQqZMwRDce6aIKLqRlJ2bOGmv0brYds/WewY4BNLyb4Y8hzvcVjjORGc/YOU7ye4a0FRuowhFkgNUCdq/oiCeEsU/GOxNR8JtS3f0dH3rG80oqgKmUF8jjVLLHWl2SaNfZLislevzB3PRbt3+18yeJqvGF7ckyt0pxwcEoZCE0efKWR2/KQ+WVd2q0rLo2rCvhJOnwWuehZ54Q5sD4upG0PHLXmCLizEOy3kdHGfAOBAM1RgPEKevLSvvp8fSKVCUUjf0NW+70Fj3A8NJYdP9dvxJbeJEplAe4NTnTMG9yB9WPMpWFFg/UYCoEfgNiYJ583+SqKy54GqX2mMDirLjUwvJq7WBpKr7nPDv4ik/CJDcxyQ9kIzGvAo57YK+INtr9zm0dlhLUzqwbna2kvK0o55fKJV1qZdn/w==
X-Forefront-Antispam-Report: CIP:194.138.21.75;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199015)(40470700004)(46966006)(36840700001)(186003)(2906002)(336012)(16526019)(2616005)(1076003)(956004)(5660300002)(26005)(41300700001)(8936002)(356005)(81166007)(86362001)(82740400003)(40460700003)(82960400001)(40480700001)(82310400005)(83380400001)(36756003)(36860700001)(47076005)(34020700004)(66899015)(110136005)(316002)(4326008)(8676002)(6666004)(478600001)(54906003)(70206006)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 08:16:29.7510
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32fd07d4-1f22-4a25-9503-08dab33c8e9d
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.75];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT015.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4097
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham
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
  * Rebase against recent 6.0.0-rc3 kernel
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
Changes since v5:
  * Tracking of wait-pin allocations with polarity change detection
    * Introduced a new struct gpmc_waitpin
  * Add GPMC_* to global header definitions
  * Don't allow GPMC_WAITPINPOLARITY_DEFAULT when parsing dt-properties
  * Squashed wait-pin-polarity and shared-wait-pin patches, since they
    should not be separated
Changes since v6:
  * Move wait-pin allocation into gpmc_probe()
  * Fix s/gpmc/GPMC/ in commit description
  * use ti,wait-pin-polarity instead of gpmc,wait-pin-polarity
  * Refactored if clause in gpmc_alloc_waitpin()
  * Revert values for GPMC_WAITPINPOLARITY_ACTIVE_LOW and
    GPMC_WAITPINPOLARITY_ACTIVE_HIGH.
    Use the exact same values which are written into the register.
Changes since v7:
  * Renamed GPMC_WAITPINPOLARITY_DEFAULT to GPMC_WAITPINPOLARITY_INVALID
  * Call gpiochip_request_own_desc() only on first wait-pin allocation
  * Fixed use of old "gpmc,wait-pin-polarity" property.

Benedikt Niedermayr (2):
  memory: omap-gpmc: wait pin additions
  dt-bindings: memory-controllers: gpmc-child: add wait-pin polarity

 .../memory-controllers/ti,gpmc-child.yaml     |   7 +
 drivers/memory/omap-gpmc.c                    | 122 ++++++++++++++++--
 include/linux/platform_data/gpmc-omap.h       |   8 ++
 3 files changed, 124 insertions(+), 13 deletions(-)

--
2.25.1

