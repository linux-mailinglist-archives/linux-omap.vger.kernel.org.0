Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3ABC35A970A
	for <lists+linux-omap@lfdr.de>; Thu,  1 Sep 2022 14:42:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232743AbiIAMmL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 1 Sep 2022 08:42:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232507AbiIAMmK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 1 Sep 2022 08:42:10 -0400
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50045.outbound.protection.outlook.com [40.107.5.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C17AFD24;
        Thu,  1 Sep 2022 05:42:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdgahpvojun1btnFfrvnDoC6CbBv4TVvlLgbAP3gu3uO+mtCw04/yFxOdCSm2cq3FVgOjBBMqO4E7TE16xkRA12HW/F1+N38Z7AO0gw2S1MnruV+0Jd64711uCsUNI0x7hqVQD4iZCUHZpJFmqOLmbok5MyjylvgHUIK5ytIhkJGT9+gBpNwVHOW7AjAvCXRqQZsP18LTeQiCiPlrxz7SqI6MIDeQXsfxmdrzd1r6U/qHTHiApLG6ly3aIn60/UZ7Dqk7l+yANGOtwV6P4KIz6jHainPeVb4KqXaIFnCdmW2bVSpvak/zlp95QUzd5y+YljddxqqdeccKvux2byEiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2NGkuWcWRSo8l2N5Buv3yl8ObHLIQ7hx8jv3j8M2Dpg=;
 b=oGJH04q8XzkFKgSbkopHyEv8P4jTC00hAGwJxzzjmz/z/BvhrohpDqmZMAoCn3T7dXfodzUZ9uRmiFqlIpI8bXvyCPHuqD8harzN3zTQ/AntovgsBIODTQ6oBMKY3G+UDM2IqJqAInA918rYtmzbQskqDSWGIWKJHE0rwjhjoHDC4yYB/BPjMmivtDYXzS5Sd6TVe/CAupPAtM3wg6ON/Cw2lILeXHP3mKKpTFVzByqtjQJYNBPIO2z18IhrvkTgxG+BsO01xKfzhgnYvlKuAmi2p8X/CoA/D9cQIAtG7M7qkupA7tQthC9xsSMGO+U/yMHehGAOBT6fnc+7JIF+5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.74) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2NGkuWcWRSo8l2N5Buv3yl8ObHLIQ7hx8jv3j8M2Dpg=;
 b=MYPkx8oppJq+rW2dn5Tt/cNAl1WbzQIJHRQK4qjSdAq11Pk4fvOaHH1F+w5fBhKKp2zaou6R7Ga9Z38GkDPBBwuiED9ZN15k6H5fX/2tlmCEBKpm/EAMJJ57Za2/7mJmBqWayodJm1haKe9F4nD+AuAPSxAVmt4QK7sCg3ygC5t3jQx0yA7pCNBqKq9/PO3NONPFeq/awf4uvm5EATDijIiBZPzGmI22fTvDmLVVKVOls4pRLqTKJR+T3HL7Z/1h5YRBHZDNP+kfaHs1Eh/IoE2tzKDrHKblABipyJAZiyioXF1XrEhoe5hi6QIMQOU3OV4EIoNnFf9e1pUWCys+uw==
Received: from AM6PR08CA0046.eurprd08.prod.outlook.com (2603:10a6:20b:c0::34)
 by VI1PR10MB3678.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:13b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Thu, 1 Sep
 2022 12:42:07 +0000
Received: from VE1EUR01FT084.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::ec) by AM6PR08CA0046.outlook.office365.com
 (2603:10a6:20b:c0::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Thu, 1 Sep 2022 12:42:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.74)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.74; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.74) by
 VE1EUR01FT084.mail.protection.outlook.com (10.152.3.48) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Thu, 1 Sep 2022 12:42:06 +0000
Received: from DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) by
 DEMCHDC8VQA.ad011.siemens.net (194.138.21.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Thu, 1 Sep 2022 14:42:06 +0200
Received: from bennie-lenovo.fritz.box (139.23.126.196) by
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.7; Thu, 1 Sep 2022 14:41:53 +0200
From:   "B. Niedermayr" <benedikt.niedermayr@siemens.com>
To:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <rogerq@kernel.org>, <tony@atomide.com>, <krzk@kernel.org>,
        <robh+dt@kernel.org>
Subject: [PATCH 0/3] omap-gpmc wait pin additions
Date:   Thu, 1 Sep 2022 14:41:41 +0200
Message-ID: <20220901124144.1006238-1-benedikt.niedermayr@siemens.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [139.23.126.196]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd8bc45e-c09a-4925-df7e-08da8c17613e
X-MS-TrafficTypeDiagnostic: VI1PR10MB3678:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: guFFi5mx+upRplXPoV6JB4oGMsygldjnATmsWFPj/Twb33WnMs36/Ssry6nvbiEg9cxvI4tIlXTFXXwla4U87URAsFeY08f2Gq+l/IvfQPgxRA5Jkttucmpte0+cRkuvucBbecafpDgouWtJYjMdixg28SUpqLheY0wPN/75fwPMwTyDUYkbSh9TvjMyKFLqizLrJt5uU87bcM85Qqte1fgAwxhomAZxoZ4cgtp04EeER6UDMcFTMrb2oIML47f/MfyQH4JrsMKqmBBPYFlJmVSxbca2I43eLuoUWhBGf2njxlCHNX0X+gQb2/cVJNOw5xThRzjXdwlVyQQ/KVaE5WdkskH0r41KZfggMOEg5NqP3KdhBYXso2R4/dIhlvibvonjUPeb/b31TzHa9xM6fznW0fJ1LVgo8TOhpZh82SFa5TM9ow1N9u7WyHqw5yBnmgEUyzs5Ut6ibbNP463YMTgmpxY/fTaVBjGCceNeiNFNIzVc6uqeoOCgbHtwl62ERSZCUHd2DI4A02EZ0WTp2CHvcB7uCRtgwMoMWjANa9Z/mM6kat/zZhibm8xWy1C15BWW7XjRygkb8yeM9XNeo5+MeLhaYpXnVwGm7m5zWGNWpdm2hM2w/0BVAohepyfsvt+9ncXHzWoGFZP/WM49V1Eb27/9pcxzxEPrNZSWffwcby32oOY7zs0vOfvEpk1lsZ5R0oHCa5xm45d47UvkFUKRe2UTIKI0H96vy7YrwSjowiKEO77PCnbV0TuTtPlCkF+/P2hc27H+gc02QxoN7A==
X-Forefront-Antispam-Report: CIP:194.138.21.74;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(136003)(376002)(39860400002)(46966006)(36840700001)(40470700004)(70206006)(8936002)(5660300002)(40480700001)(70586007)(8676002)(36756003)(2906002)(4326008)(316002)(54906003)(110136005)(478600001)(82310400005)(82960400001)(41300700001)(356005)(26005)(83380400001)(47076005)(86362001)(1076003)(186003)(6666004)(336012)(16526019)(7636003)(7596003)(2616005)(956004)(82740400003)(40460700003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 12:42:06.9368
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd8bc45e-c09a-4925-df7e-08da8c17613e
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.74];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT084.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3678
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

There is currently no possibility for the gpmc to set either the
waitp-pin polarity or use the same wait-pin for different cs-regions.

While the current implementation may fullfill most usecases, it may not
be sufficient for more complex setups (e.g. FPGA/ASIC interfaces), where 
more complex interfacing options where possible.

For example interfacing an ASIC which offers multiple cs-regions but
only one waitpin the current driver and dt-bindings are not sufficient.

While using the same waitpin for different cs-regions worked for older
kernels (4.14) the omap-gpmc.c driver refused to probe (-EBUSY) with
newer kernels (>5.10). 


Benedikt Niedermayr (3):
  memory: omap-gpmc: allow shared wait pins
  memory: omap-gpmc: add support for wait pin polarity
  dt-bindings: memory-controllers: gpmc-child: Add binding for
    wait-pin-polarity

 .../memory-controllers/ti,gpmc-child.yaml     |  7 ++++
 drivers/memory/omap-gpmc.c                    | 38 +++++++++++++++----
 include/linux/platform_data/gpmc-omap.h       |  1 +
 3 files changed, 39 insertions(+), 7 deletions(-)

-- 
2.25.1

