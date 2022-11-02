Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32E146163DA
	for <lists+linux-omap@lfdr.de>; Wed,  2 Nov 2022 14:31:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231235AbiKBNbJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Nov 2022 09:31:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231234AbiKBNbI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 2 Nov 2022 09:31:08 -0400
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-eopbgr150050.outbound.protection.outlook.com [40.107.15.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E052E2AC5B;
        Wed,  2 Nov 2022 06:31:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AlGMuCKZAnl0ODT2iDiWTTQRKagunAgbUIRLI/8VZkMgwV4JpjR87Ji3DLxv3TDn8iuQd16+hTkp9G6OY1+PggczHR8kOh/M0sPMROLWsLI456ITVfHg2V0OaB+n6g1VDm0eGhgADUoOkMaFM/mf6J5bfrO2Hin3nNEIGGKYNp/BEGgMmF6RPO8jhAh2B0IgviR5Xqn8ej/jhUIxybSURfmVrs7yUkcePmWL5q5cha6KGAy8om7rz8W0rgRHdEjZexJj5LDiniTwIy5xp1p0c2aBDOJiVyUbt6l55AroTVjqkUG3t+qoqUbY+dR8KG3Ra4CRZJls9xPa0zKTRmuxYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYrYk5LZtukTvRnJZq7x/KiP6EdUDjzTysd/F7KD73U=;
 b=RkyqIYqDtQMMe6gBvw2fnNrObI1ShejPrlYcb+DwnKhBzr+yrn77Z/wZSFVCWJgCcKadVwzRejJz4t08qui3ObDjvCOpooj/nkzHpgxeFf7fNJl+Q3yS6YYMd0fLZ4idEOKinVpbp8xwTQVixJCVzXouYP7epLrr2Iqh65hsEs3iSrTBRke5B+TqK/9BhD2HxKjXVWG1e8GhJi2KVTdl1uOdc9iLJdYcJrf2cztvqVM/Acyq07Ao3gsDdWkzWum+CuEOlki8mJGzSmPr8j98AfxSCFgLsn9KebfMfj+Fw5JBO1PzpMnEMLAp8SbC9Ra6S3zOp+bJUtxQ/N5De/+xPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 194.138.21.74) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=siemens.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYrYk5LZtukTvRnJZq7x/KiP6EdUDjzTysd/F7KD73U=;
 b=tWMU1YzC8Hv+ibI3gpHzhIyVXEx4nXlMGnINEbsSynM2UeLkz3zHe719KLXbipWf8qkHEOGijknGuspg5EwkqWEMkqVtV8c/vvvU73LMifUp1wy4keCbKgMPCd89rxZgntSwLZbybDI6+eyAYhYdetQNJro8DEBPpTGbpVUSsZfBK2PHY19tsSPrzrtd7PRZ5/m3zLeI2gNuFtun7ox17lh0Aoo8UUMg76gZFNPtXQkc9k/lE9ms564ntcB89HExYbJQNLqnmSOO9r1R3AsdJiM6sRRD3kDHZztFnJtjuKofGAb+M61aFO+xXFxGFvN/ho5Qqd5jJNFR9saSJkJO4g==
Received: from DUZPR01CA0021.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::15) by AS8PR10MB7328.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:614::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Wed, 2 Nov
 2022 13:31:01 +0000
Received: from DB5EUR01FT054.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:46b:cafe::16) by DUZPR01CA0021.outlook.office365.com
 (2603:10a6:10:46b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23 via Frontend
 Transport; Wed, 2 Nov 2022 13:31:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 194.138.21.74)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=siemens.com;
Received-SPF: Fail (protection.outlook.com: domain of siemens.com does not
 designate 194.138.21.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.74; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.74) by
 DB5EUR01FT054.mail.protection.outlook.com (10.152.5.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Wed, 2 Nov 2022 13:31:01 +0000
Received: from DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) by
 DEMCHDC8VQA.ad011.siemens.net (194.138.21.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.15; Wed, 2 Nov 2022 14:30:57 +0100
Received: from bennie-lenovo.fritz.box (139.21.146.184) by
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.15; Wed, 2 Nov 2022 14:30:57 +0100
From:   "B. Niedermayr" <benedikt.niedermayr@siemens.com>
To:     <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>
CC:     <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>,
        <rogerq@kernel.org>, <tony@atomide.com>
Subject: [PATCH v9 0/2] gpmc wait pin additions
Date:   Wed, 2 Nov 2022 14:30:45 +0100
Message-ID: <20221102133047.1654449-1-benedikt.niedermayr@siemens.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [139.21.146.184]
X-ClientProxiedBy: DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) To
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5EUR01FT054:EE_|AS8PR10MB7328:EE_
X-MS-Office365-Filtering-Correlation-Id: 36e21dbf-039d-41ee-4a3f-08dabcd67c32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IpKJEhOKfQGgTB2jXJYo1tJx0fl7AkCJk2N0eBn4bTZM40rERtn4Ocgb02kqymAcU/PHSOeRw5fKtmrrjQ9M8xX8GuZqA32d9DlrY5Aby0Lkfqmv+64RZk0+/dSl40m2Qm0HRHRxLeiOJEUKPAPWBPDTQ0t6XJmy+gkcbQ+YAComFiEHZISFM6XA4GnrDENFJ83YutLG4p+CYPpeflr2C4peNb8+Vhi5My80w2RM4OYlcEh+U6L722VZEUykjwlCOU/aMtzKIkUaeBLDHubEfj7EGouDJ2J+n6nWM+Kj6UMmXXy4j+inGT0rpm97PypzBrRPvLSVrhuErQ+J27FLf3oAZ5oX4ujsWu9o0UkKaH63kBnMPtqFQXktlLBNKRsvJBG69THUebQniB/DyLeXT5oCOD4KFY+8MllC++EGMVmYTyI55XPOO8uJZwIHZ680PnkK3ExWM2hT6Aqz6CYbqomnpMJ7PZKaZGdvDvdfMyglVIWefsxQBQlBsjaAWR2cV5MCjmua+S8bqPywt5YhRGLbByUICmIfSDEdSe/3F0BgY915GjikcugBGPRusSHSEwrrCOtpSAOtQgOz+4gCyDR5EPSaDprCpCEmMT8aCqVxd2HrFH5rV4tqvGF3HOl1c0HhbH4M6NgJww9ehJgYpbntFF+GmgjcJgipuSPcq6ics6kkglm0S+hu+5JlKW4H/vOjGqXJ/gLrtdTjGczLRWY/xAYcjcHkbof7UFznoyvEFb+/nVJFDADAR3CLWBH97z/8xRCWY6HosQnTvzjTzg==
X-Forefront-Antispam-Report: CIP:194.138.21.74;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199015)(36840700001)(46966006)(40470700004)(36756003)(186003)(5660300002)(54906003)(40480700001)(4326008)(316002)(47076005)(2616005)(16526019)(1076003)(110136005)(26005)(336012)(40460700003)(956004)(82960400001)(8936002)(41300700001)(36860700001)(2906002)(7636003)(6666004)(82740400003)(70586007)(86362001)(70206006)(8676002)(82310400005)(66899015)(478600001)(356005)(83380400001)(7596003);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 13:31:01.8259
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36e21dbf-039d-41ee-4a3f-08dabcd67c32
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.74];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT054.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7328
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
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
Changes since v8:
  * Fixed rebase against v6.0
  * Add correct patch series version to each patch

Benedikt Niedermayr (2):
  memory: omap-gpmc: wait pin additions
  dt-bindings: memory-controllers: gpmc-child: add wait-pin polarity

 .../memory-controllers/ti,gpmc-child.yaml     |   7 +
 drivers/memory/omap-gpmc.c                    | 122 ++++++++++++++++--
 include/linux/platform_data/gpmc-omap.h       |   8 ++
 3 files changed, 124 insertions(+), 13 deletions(-)

--
2.25.1

