Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B4CE5EF5CF
	for <lists+linux-omap@lfdr.de>; Thu, 29 Sep 2022 14:57:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235265AbiI2M4x (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 29 Sep 2022 08:56:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234352AbiI2M4w (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 29 Sep 2022 08:56:52 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80075.outbound.protection.outlook.com [40.107.8.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A251013BCDD;
        Thu, 29 Sep 2022 05:56:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ws1Kqx7ccQ6oDe7jRX0tzMpuHK3sqS6Bhw2EDWghT7p39Y1h5EL7fLUbUxNAw/HLG+0Ix7SLXC1POo5b93NRWT3X1tRkvpQLNHd1vprl4vJJGMB3Z2wY+tNmLQGzBXs5yZmJ5uBEnwNNXumdgJrolA9lDXP3wZVpgiOP2Rm8YrZLUZ/iWwSVa1W6xp9Nh2o36eqv/sktAsdDTfzN1cW1W23UdovGwf5ZN8ymSf61aUuTs7AaP2N1FNhTftiQkogOvwCZDT2RodHstARbdvX+5R1VbEOrwDDWz86hHeRswFkuUjk8aatlSxOANip+hFQShPRgw/W91pZveTnHC+EBlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B0gJYUuMQqK7Kd+A66u/xPhN5e2AU0n5PlYDVrJDOjk=;
 b=n2iIzQIaa4pq6YAeSP6u0ke0xLmTOVxh2xdFKSC9L2vulQr5slAKFlQSnu4YKW+XcCG40zjKrIfCSssiTmSk5NgAqa69iXp9fay9baLgqvBQdB7NDXRSEp3VPKN4ERtSRUibibdaHhpkaKVnmFMLHu1htm6jidbs6/TAsAGQ0+JO5Ad++Km3GEF58UPVkM0MugrPHd5b+R2lGDYGlW4QRYT9ZZRbNRQbe9nnnEGIWmg+zQPgvjKdkzPRw355EGy0rCvV0zFxsn/OwAyuh1cePMLAlOJQJcaJ6XhSscsjEADrDPULRs+2hVWOYYn47JKMf9mQpvFabySveEyJqyZDGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.76) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0gJYUuMQqK7Kd+A66u/xPhN5e2AU0n5PlYDVrJDOjk=;
 b=EemMqubtqDI/t8NAnnSV/0SfOEjTakymQxB+WMzMRdMUS4J/Iv7nRy3mCkZEkf9cNSEinGsq7OAa7aleRRlD/pdqEyFNV9oLNSTjkwxFIYvfVYvPIN125DN04uBXVp1JKWBR1V01aLKIbNEtiJ4Pk5mjkd8rGW2i4P1emDHRtT7vt/4MHtTy06bAVIB0GB3Mo7Am1PyOasrrjZXS61oa/SSVO0TjULQOlzD6aM5KtSovqQd4wQ6QP2tHlyO92UEzZrPrm3ytfyPDbt2aMVTBrNR+QEcBc+zUeW5IgTyBeLWUSCrvd1k4u2+Pk9t/zAb5PC06mIytjR17cq8LbAQRSw==
Received: from DB9PR06CA0016.eurprd06.prod.outlook.com (2603:10a6:10:1db::21)
 by GV2PR10MB6113.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:aa::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Thu, 29 Sep
 2022 12:56:49 +0000
Received: from DB5EUR01FT060.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::ee) by DB9PR06CA0016.outlook.office365.com
 (2603:10a6:10:1db::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.19 via Frontend
 Transport; Thu, 29 Sep 2022 12:56:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.76)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.76 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.76; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.76) by
 DB5EUR01FT060.mail.protection.outlook.com (10.152.5.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.14 via Frontend Transport; Thu, 29 Sep 2022 12:56:49 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC8VSA.ad011.siemens.net (194.138.21.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Thu, 29 Sep 2022 14:56:48 +0200
Received: from bennie-lenovo.ad001.siemens.net (139.23.126.196) by
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.12; Thu, 29 Sep 2022 14:56:48 +0200
From:   "B. Niedermayr" <benedikt.niedermayr@siemens.com>
To:     <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>
CC:     <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>,
        <rogerq@kernel.org>, <tony@atomide.com>
Subject: [PATCH v6 0/2] gpmc wait pin additions
Date:   Thu, 29 Sep 2022 14:56:37 +0200
Message-ID: <20220929125639.143953-1-benedikt.niedermayr@siemens.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [139.23.126.196]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5EUR01FT060:EE_|GV2PR10MB6113:EE_
X-MS-Office365-Filtering-Correlation-Id: 68183508-84d5-4848-e96d-08daa21a1297
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IvvMPcnsl3h76mgImbfYzyiqqVk2QuwP2LnCvFPSwF+lZ0SjYeL23ZHWHlbEhCjb+fwcfsIC7gg67bpLbI2zFdC2uQTey6qsM0Y8djA1yCeumUJfBXUClZOIXSPQee7QJ/mo/Awwv5iFR1Trcs+rLFSiytjxtiIbZub2w6xqu5GjGpIT/ACxY87/tdF6SZm7sfSkBoYLuBBkWSzioC/Wh9VRM9EXQ+AHv+fOCAQCW5gOyvVq6tSin3d1JS/pZOvCu44ejvFIblisL3O4LX7C47Lplhg7EetXZJeUbYg6LyrLgwDnj9DEkMG6qAnaoUOSctm1uYXH3gaS7peEjtV7FngCTFD7580OtJyWGCf70z3bVHa1T1EQBJSU3pHg1NQu6TbPJsVELVEKZajWgRG3V59VEPn2EfTqYVB9FImZQFi0ya/FNVE23dyEuZ1jen3RnYNw1Qn3y1AL2isWAlzoyrlytAddePRLQSpqycHnZm8URmhNGtDwjpzyjqIGwYnaeh6hl2RizsXc/2pOHi6BVTw6ZlkK5hnAHONF5u4x7Dnf3LGr/wIkLsBWmcQiMRJt2/Ou2VRPKKTaco9v/ngrwz3zjPHhmpjmFNODjjdXLYol5Vrl65xuNbJEeAA1PJ45dou27ukYkniTFGlMXwRn9in18jelhssvpCYKEn1yaYJY3RVxpVNgFBgoy6E0ju3n+MIbbn9O8mIAnhRjUy8UgvoQJ7LR4ZqG99tbXKSbwT6HyBK53enaEsSg0MzwUG1w5G9+Ek6OCVusihWY9jYmHBu6ZP3hSZqZdaJ3Y/CYq1Q=
X-Forefront-Antispam-Report: CIP:194.138.21.76;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199015)(40470700004)(36840700001)(46966006)(8676002)(83380400001)(47076005)(36756003)(956004)(26005)(2616005)(336012)(54906003)(16526019)(186003)(110136005)(1076003)(316002)(2906002)(70586007)(5660300002)(82740400003)(82960400001)(356005)(4326008)(86362001)(70206006)(40460700003)(41300700001)(40480700001)(81166007)(36860700001)(8936002)(82310400005)(478600001)(66899015)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 12:56:49.0360
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68183508-84d5-4848-e96d-08daa21a1297
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.76];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT060.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6113
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
Changes since v5:
  * Tracking of wait-pin allocations with polarity change detection
    * Introduced a new struct gpmc_waitpin
  * Add GPMC_* to global header definitions
  * Don't allow GPMC_WAITPINPOLARITY_DEFAULT when parsing dt-properties
  * Squashed wait-pin-polarity and shared-wait-pin patches, since they
    should not be separated

Benedikt Niedermayr (2):
  memory: omap-gpmc: wait pin additions
  dt-bindings: memory-controllers: gpmc-child: add wait-pin polarity

 .../memory-controllers/ti,gpmc-child.yaml     |   7 ++
 drivers/memory/omap-gpmc.c                    | 115 ++++++++++++++++--
 include/linux/platform_data/gpmc-omap.h       |   8 ++
 3 files changed, 118 insertions(+), 12 deletions(-)

--
2.25.1

