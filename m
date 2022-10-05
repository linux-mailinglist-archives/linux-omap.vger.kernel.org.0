Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 273A05F564F
	for <lists+linux-omap@lfdr.de>; Wed,  5 Oct 2022 16:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbiJEOWl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 5 Oct 2022 10:22:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbiJEOWi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 5 Oct 2022 10:22:38 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70088.outbound.protection.outlook.com [40.107.7.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5AA8786FE;
        Wed,  5 Oct 2022 07:22:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffhV6UYdFLXCDV49WkvIFrat34l9I6qkKgzIrQ4dRTIo4u1GIH5DuU6MK8Og3L7GuoB//UczGBeMietPcvqd0zoyKAr0fVR+/JQn/KOThtIvfuVtUjUclFhwvuuWSqapgPhsbQjSatX39n7UDWvz0anNkIqetxJyWSdBK3Sxd1KTrFhSlISUygBG/5o5Ail/Sx5JsXCOzMIoN7GblncsamoBXg6jFOB3T3x6NkZK6BrXX8XTe/kUmGMkaTYp2vNrE1o0xWaxPO4EY1RJT8vNOTiPBeOk4siS0s9B2AbcU3njaR+Nqvxyt+xFUOm5K7LIDQkncQmOxQuo/9GxqzoOoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqRT37DShCMkpGrg+Rvr8dgi3z30a3G8CVsLZKKWfcY=;
 b=ZR2xhmKF6thJPlzXgcKTLWJ56EAcqsJN/6/PA5cJ1Bkv+R+QxDctwiqws/0kCZyfT0JNICxoWmEM2ROmQqKh4Iu3Tj/s581kbM6QUiHaahkvEj2bQa3LOwSfAuR82kMtKKY9GhQfFAlMLJ0hX7RmhI/jphSSfUeLfv+0YNYhdh8jyXO/NkfE1IQrqdZ1W9CJfUdYpGIQ5xhV0HqsdXhSgYZfsEwWK1yAURh4kY5e7m0iLZIsyl1zhOdcdFhub1jXRj78tJVoFgzb2GYXClEKssZ7sTPHNZ0EJPR0VkyIn2YUjqg/MDYM7jiWUhUV3viKCY1h2dcIzN/IazrtKFB3Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.75) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iqRT37DShCMkpGrg+Rvr8dgi3z30a3G8CVsLZKKWfcY=;
 b=ciCFf6eI2gGwbhShmJ2mQLvTREPxvkeWpIvZLENPro98AhQwtDYQ64H2yyPRSzDJKPm5LYraTlab9eKQXu1dyWwesVuv0t9ddC60Sq8mc6vfSfj/w4O/Mt47+jT98ercOcQNXpF8y4oZE2hw7V54I5bAf9vRvfa7kEH5Dh4+KrVUmeA99u95ZiY9qaDOKlS6/Qln2tOMzqR6c2gP4gVVV/B6L8/M0JfUw+kT2Ru4LkfcjuQdjfOFk3hL7OowWQxvMCyRVv9mV9AoskBtCUlBbPQqLGt8GLSeUnkK3VyK5tGgMRnVlgPDQOfs0PoCeBcvRbRkH/+xetE787l0EnldeA==
Received: from GV3P280CA0080.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:a::29) by
 GV1PR10MB6049.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:9f::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.28; Wed, 5 Oct 2022 14:22:35 +0000
Received: from HE1EUR01FT029.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:150:a:cafe::ef) by GV3P280CA0080.outlook.office365.com
 (2603:10a6:150:a::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32 via Frontend
 Transport; Wed, 5 Oct 2022 14:22:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.75)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.75; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.75) by
 HE1EUR01FT029.mail.protection.outlook.com (10.152.0.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Wed, 5 Oct 2022 14:22:35 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC8VRA.ad011.siemens.net (194.138.21.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Wed, 5 Oct 2022 16:22:33 +0200
Received: from bennie-lenovo.fritz.box (144.145.220.67) by
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.12; Wed, 5 Oct 2022 16:22:33 +0200
From:   "B. Niedermayr" <benedikt.niedermayr@siemens.com>
To:     <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>
CC:     <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>,
        <rogerq@kernel.org>, <tony@atomide.com>
Subject: [PATCH v7 0/2] gpmc wait pin additions
Date:   Wed, 5 Oct 2022 16:22:22 +0200
Message-ID: <20221005142224.287982-1-benedikt.niedermayr@siemens.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [144.145.220.67]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--18.918900-8.000000
X-TMASE-MatchedRID: aHurFR/IMCmdIa4Z4akFf4mIDnzSS8mZtE4rffipOm437vkU5XIl4H+s
        iCf/QKJTsS0sZEB7c8b8MCBvciFjZ6ZSzaLPCwndmx4L2mG7WWDEzah3MhwU3YlSWYvdSPSY5GN
        m5cTRaUfMApOK4R8F4vSCiap+6KvtkKwzGM++sccw3q04xc4gVuJPyge9irBS9FQh3flUIh4mKH
        /Kj46+VdWM2x6EZ/S9sHT5iFhz4jxhnmcId02xRZbK9NqUDMpYRwPZcL7YQSYqsMfMfrOZReP6p
        +9mEWlCCkj/fxzeZUlyaFXX6mMMNKH09cXH1xDU0VfJE+eWWu2AHpj6bMSfhZK9FvwQx1hFXs5n
        qGvDCfNeGtGjUrjdVes1XiKPajyATRz19mxfC6Z1HaMcqvsGUDitWLlLR1M9brJ9gVnOsZ14rH1
        GvyxGG99RlPzeVuQQ2yTG00/Sv0158guN4Rnv3+9ychVPnFVz/vmGAw/1f5fi8zVgXoAltsIJ+4
        gwXrEtwrbXMGDYqV8CpgETeT0ynA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--18.918900-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 87E613A834F9B287D7DAD8B755D23CB5D777A091DD6AE7C66146FCF3CA393A3F2000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1EUR01FT029:EE_|GV1PR10MB6049:EE_
X-MS-Office365-Filtering-Correlation-Id: 84f4a6f7-1721-4d01-c3e6-08daa6dd0ca1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DVe0RjS+4gHUncdk0hm8M2kmbXgpbIF4Zl8EIYjWlgBF4r3cQbQeaVQkwgbqFnTuvTdKTji0NwvCdpqB2Ukz9Mm96jIyxTaM9rsMOxloWu43s9Cle1XG5KCWUd4o6WWH2NNW/XEDQwIz5CsQiGBNoeGxIGDtTqIx5FzSQvh3mcr0/Gewqe7jAKl801pzdsoX+dAbpHQjxZE1C/h3zc/apFkyaIlAfWzz+0+d4B1ufI06bi2L7Ms/cBmVblFNi9M/KXRZYxeQ8/eaFZWMInAjI/s4O9XjKOI1yQhG0IVfbigORH1hIT10/5Po31kWBiv0oCl9sByS3nZXfSO75YU2Jgad0+n/VXVMKE59u5s0HdHXlSejtzGnBUsxr39brwc1KglelhMVubjiBdScvbEQmOnwg1w77vcEPbks0deqxxEmIMi1RA4gqdWp2njIPB8SlDN83h7RNBh5wzuB9X2qkmW8Vri/RSjezhyQZK3N4o1/YsgtzVDUtwb1chJtp95tlDE5ayUmmezogbyrsrfjJhcFeV9nHRFXleQgMNTgaNDhWTTqNdk+Ga/tJHg4aMGJWa/6y2T3ynK2R3giIdnkiZHuaDRtYOIKF/LmFo8JM6ehnZ8N6x+NHqFtO6XBk48Ab6afUrucgBpJVLtn4wMosawAeJU2cg4hJ6pCiIdg6jdvEbNw/ZWfaBhdXOxjKxijVWhKqBV7K/I0WC1gzpXEx60g+qHokoqgcXBbXjMNZ21iazdZxURWhEB/ql7hD9B15XnVkLTwEEv/nxrdkQXunVDzCcs9liPxupAxWD6AoHoe2cOpAulCyhW0q+ofDSCw
X-Forefront-Antispam-Report: CIP:194.138.21.75;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(39860400002)(376002)(136003)(451199015)(46966006)(40470700004)(36840700001)(40480700001)(66899015)(2906002)(5660300002)(8936002)(41300700001)(70586007)(70206006)(4326008)(81166007)(8676002)(356005)(82740400003)(82960400001)(82310400005)(316002)(36756003)(110136005)(6666004)(26005)(54906003)(40460700003)(2616005)(86362001)(47076005)(336012)(186003)(16526019)(956004)(36860700001)(1076003)(478600001)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 14:22:35.5274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84f4a6f7-1721-4d01-c3e6-08daa6dd0ca1
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.75];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT029.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6049
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

Benedikt Niedermayr (2):
  memory: omap-gpmc: wait pin additions
  dt-bindings: memory-controllers: gpmc-child: add wait-pin polarity

 .../memory-controllers/ti,gpmc-child.yaml     |   7 +
 drivers/memory/omap-gpmc.c                    | 123 ++++++++++++++++--
 include/linux/platform_data/gpmc-omap.h       |   8 ++
 3 files changed, 125 insertions(+), 13 deletions(-)

--
2.25.1

