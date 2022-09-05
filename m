Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AE8A5ACCB6
	for <lists+linux-omap@lfdr.de>; Mon,  5 Sep 2022 09:29:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234725AbiIEHWH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Sep 2022 03:22:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234907AbiIEHVj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Sep 2022 03:21:39 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2073.outbound.protection.outlook.com [40.107.20.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 752DD4055D;
        Mon,  5 Sep 2022 00:17:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RqCADJzzlLuTesNSxKmYQp9p0TqKFUz2gfRNlXEdWmIh6hmJJBHWvlmcYL8xcslOPASarDHCNtPEuNeUq91t3c/w4ZXlaTrmflNs08Mipl1Sx/lQFlgA420XG7WZ2tUJ7UdZI8uWmUGi9EQQJhANzt2qnEsym8MYtbYwpQ+9IAdnkzA+Y6RQ+XVTC500oEp2FLImorUjVW1CRtJ5AIhkXzuiUYL8RWgXcBHmzSPQqA8F47BQwRziRUHFdiExapfDfE+C3wQWJmyqKspmHKyUfEaT+b7OosEO41b3f7N4zZeVNSdptUwhlkormHPZWd8xRsdXsMxlv3iZQTSSmbigug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQci8OGPwu0VtGIdlc8daWUug6JPjw0Ngs/FapRI3wU=;
 b=GXT+XTIxNvg1dU9GbOZz5MQ6zr+ZJ3TIBbZ3LmMBHQ+yJ5x52ujGy2mENQGAU/ZcfkZgQBY1f7Vthx0ABon67sdaSUN0YP63w4/DDMtA9C/t8RoZ4O2IJCNbdoHIbQzE8wj7wzOAqqEqgf89IKKCdPKuDzrifVGu6nWzvN4XjFSRMWF4v1X6LAE6UhT/zK/vCys2yvDaML11e1ZQvpGPKRZcKCgDh/Owvr8GJ++RECpA1G8RWNGT3017Slj+uDSfa/vrPOGyEZxgLc0BAX3wyisDBEKkwKfImVwbavehkl3ISrX52o2NInAIqSWIBrH7xKGj3stsuGeu7fbNvI7Ssg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.74) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQci8OGPwu0VtGIdlc8daWUug6JPjw0Ngs/FapRI3wU=;
 b=UvNbhVRZP2KVgkvrEm5yb/mZRrwr99aJt3wNnkujDZfW9K29DG3yV9boJwrW61sTMh7UoX2Cya7/aF6G6WP5uIBCy8tIrZXArBrYBNlGC80hgPt/E+2IknRoLpxbMY9Lh37y8ajLMol0wF1hKt8x/aff61KRmq4JHrr+rD6yHnz1yHDyMLiSOzGiMAAeLL3u4vMDx1SKXpP9pRfhGgpC/4fD5A8KOxMCIVJULTiLqji5EhwxSHP0/KdrgGTGqmjXYg5af7xRF1sQFNh2YPQU+WbeljfsfrJcoYEhcZRSVYXUNcz+kxJm1WwrbDcXYHxB/i8Vm1sA9mnPcJeYlC1z2A==
Received: from DB6PR0301CA0069.eurprd03.prod.outlook.com (2603:10a6:6:30::16)
 by AS1PR10MB5315.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4a1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Mon, 5 Sep
 2022 07:17:45 +0000
Received: from DB5EUR01FT080.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::2) by DB6PR0301CA0069.outlook.office365.com
 (2603:10a6:6:30::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18 via Frontend
 Transport; Mon, 5 Sep 2022 07:17:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.74)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.74; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.74) by
 DB5EUR01FT080.mail.protection.outlook.com (10.152.5.234) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Mon, 5 Sep 2022 07:17:45 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC8VQA.ad011.siemens.net (194.138.21.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Mon, 5 Sep 2022 09:17:27 +0200
Received: from bennie-lenovo.fritz.box (139.21.146.182) by
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.12; Mon, 5 Sep 2022 09:17:26 +0200
From:   "B. Niedermayr" <benedikt.niedermayr@siemens.com>
To:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <rogerq@kernel.org>, <tony@atomide.com>,
        <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>
Subject: [PATCH v2 0/3] omap-gpmc wait pin additions
Date:   Mon, 5 Sep 2022 09:17:14 +0200
Message-ID: <20220905071717.1500568-1-benedikt.niedermayr@siemens.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [139.21.146.182]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4a36b2d-443c-4a0d-7913-08da8f0ebac8
X-MS-TrafficTypeDiagnostic: AS1PR10MB5315:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2qt4yLElU4nNQ7sc8AtBpm6ktrsIe8tnaAFt446obfZC6Y1X+X/+rsda6SyEp8XMbYMVUhiKl2rGnNLSMfKzFVXv9JWDWwhTUT9Innpo8t/n0X6zgN5Kn+wDmPoLbdArUzzufSsW/W/ejvWJyeef7eD/pLwyBXevbm0K9cAuk+j6DzUBx0CoKuFdA3S+6x3jm1SVMAF7rQi5j4Z6qXAcSlcopoQQ/njfgdQgxS1O/itCYsHRs6nBy2VQso1RWhud3WVrgDhYrYbYbbXC+wZ3wKxVMORrvz4wVo9oQpvMvTvqUXrfprwLkVA29MEfoe39ukEEYKEQHlVJQmHMvAtDl0bZ6cEXrh55VxxDd8JaIe3TqfrWpKVzXnNr3BGL9tVlpPnCG4D9mn/iRCEwhoVXXcppOysupaKG11wM/bACT1fI/nPcOQYfP7glhpY/aRz4ppc4McNCmBRqVc7eOyUqBiahh0PWAWohyi88wRu6KHLAIqS2XGPW2ImIqYC/V3rR20wUZ8P49OmRXDYuYGXPUjjjSaeIRtCDlztWOx9D0qJI1EcmnZ1uvhF3jVgDApJDcgV29zwubEzBVmzO6k/+e8KVab/w7gzsKQVtB93RTxeV4yBD080IQZNxKP2HSNOKZ+JKch/15Zhmx/KjQjPXo1e7xxOdizLlNQeI3NOL6jwH5uNt7NaMnKsbQpTwTD2ctz/5gTd2ybm0ifM+TQS3Gmi+EsphGTb/2CMpMsVo8U8sDKvT5plPAwPM5mZHOq7Al75ZDIr8mAa8ex+aP9j1uA==
X-Forefront-Antispam-Report: CIP:194.138.21.74;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(376002)(396003)(346002)(40470700004)(36840700001)(46966006)(83380400001)(4326008)(8676002)(336012)(70206006)(16526019)(47076005)(70586007)(8936002)(36860700001)(5660300002)(478600001)(26005)(1076003)(41300700001)(186003)(6666004)(956004)(2616005)(40480700001)(36756003)(316002)(54906003)(110136005)(86362001)(82310400005)(40460700003)(7596003)(356005)(7636003)(82740400003)(82960400001)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 07:17:45.1622
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4a36b2d-443c-4a0d-7913-08da8f0ebac8
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.74];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT080.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5315
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
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

Changes since v1: 
  * Rebase against recent 6.0.0-rc3 kernel, but the maintainers list
    stays the same!
  * Updated eMail recipients list


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

