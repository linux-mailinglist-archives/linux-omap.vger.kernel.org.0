Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B282C5AAAF4
	for <lists+linux-omap@lfdr.de>; Fri,  2 Sep 2022 11:11:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235442AbiIBJLB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 2 Sep 2022 05:11:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235491AbiIBJK7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 2 Sep 2022 05:10:59 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2062.outbound.protection.outlook.com [40.107.22.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA59C88DDB;
        Fri,  2 Sep 2022 02:10:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eo3RIxylwa8RP4T3bMdGckdipr8CJpcy8egLsI2RQlP2mOGrTQKep28v2xaNUQt2RB+Nz5CElub66L8H+w7i6SKxq9gcTnH7J06Mmmo6BkZ6LfwX9qowKjDix3FNSrA63c+43/KXD2kfbU2DewM90sh0WRzubNL4fto3zdfVrVhvRhtH3i3BVowtmLJ6hQsDfDR3fWtVKChfiIYAhaKoWGtBIhgFCeMMvK7NCCBQe52u0HUDOapF40EojlwXcrv2vbVSUCq4kJle/zEiX48ie9/V7jvl1T4YcjAniSgh8xEaAGc8sQq0XRUUdUmSXP6Es4AhM2+a1bfWKHhclID2Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJ5tAbJLZk+ZyqZCNksiBK4p+m/7edpy4RSvixl0PZ4=;
 b=a3mfyRn5m02wCHAdYo9Qe4znfLdZUAV7Nwhb67xdrNnV7kIggFSl8ajPHS3gVtalyfsB3to/jRIQXTYYv2BMRnIzJW7YdDRpKCGjmaRt4wyFbL9qhV5WYMqtmfQEmAtZ1+6mRq6zAaI7CC2NQVvfDU1uhtzqIwitqiSWR6b5SW3o0zgRIRjyrxp0rYVRAeZaLVGDI/r4sTjQ/Gbh4qiA/kEdKTpaCtJGXguQzHaDs3syMwzSq9GGvrfwAJEDSra7y/DgzzcYS8DcrSpsr43wHgizfCAM5j4gl2FeI4jE+ef6KD7fMdWKtj2fBae+VZqxXKfPbF/ZeDAZdUQxVVIwlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.75) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJ5tAbJLZk+ZyqZCNksiBK4p+m/7edpy4RSvixl0PZ4=;
 b=H3d+VgcgrNd8w/u/R/GNKjh8JxEfTnhZoK7CiiNEMsHJ+JRtPq6kHaoIEQItDWVcNuGUDA8S6luLLaX7dO4+hOHj3cMQ4ikpRvbokiDxTtBMc3hOYiztQLy5L8IUfYjmOLIeg2F2BWvz8cHWYxzgZFen/NrTDRTqoZh9D2IXHNI1Q5UqS/Uw4o/duLGAPkT/ubbekQcvNk5dz5Nrq2kezpjl80TchsIfPyMA6Q2Wcze64P6muoMJxxdgHwWytNu3xO5uNonlFViMPMc0xn3/khdLUOa208W2XolXJtyoIHfNGxz0IWMwvqeqK+NlkWwZzRcNSkRM5QFIfbAZmyED6g==
Received: from AS9PR06CA0150.eurprd06.prod.outlook.com (2603:10a6:20b:467::16)
 by VI1PR10MB3341.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:13b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 09:10:56 +0000
Received: from VE1EUR01FT033.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:467:cafe::db) by AS9PR06CA0150.outlook.office365.com
 (2603:10a6:20b:467::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Fri, 2 Sep 2022 09:10:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.75)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.75; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.75) by
 VE1EUR01FT033.mail.protection.outlook.com (10.152.2.230) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Fri, 2 Sep 2022 09:10:56 +0000
Received: from DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) by
 DEMCHDC8VRA.ad011.siemens.net (194.138.21.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Fri, 2 Sep 2022 11:10:55 +0200
Received: from bennie-lenovo.fritz.box (139.21.146.191) by
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.7; Fri, 2 Sep 2022 11:10:39 +0200
From:   "B. Niedermayr" <benedikt.niedermayr@siemens.com>
To:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <rogerq@kernel.org>, <tony@atomide.com>, <krzk@kernel.org>,
        <robh+dt@kernel.org>
Subject: [PATCH v2 0/3] omap-gpmc wait pin additions
Date:   Fri, 2 Sep 2022 11:10:25 +0200
Message-ID: <20220902091028.1346952-1-benedikt.niedermayr@siemens.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [139.21.146.191]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c220124-acf9-42ff-ddbb-08da8cc30b30
X-MS-TrafficTypeDiagnostic: VI1PR10MB3341:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /EvneLEmN6zlwx7bw/GFi8kqoV8rqgdVgQTBiC39+uGIEtG5wwe2s4n4RPttvgjMR5wEgSkcSbegLQGPSJxxAVhi10mxN+ncv5vR8er7BaHfnXoQfF0pT+TR1lzmdQym4VbRcnHJuHJO7VTuGeZCd6M2PVXfjYc+cpBf3bcHdtkX5/sMWvUMYuH/i9AHWj6UVo3SvTnfZy7/c1NmBmHj/afr2rKFZrJ5Xme0cnS0zFBzHjCl+nPbN5rGlzrJwEY5fYhvhMHWB/p++FB4IRNvbamcCI8EoCVpy1ywZ760sBQiPNZ71UhUbjhQzLwrzbFSyb0Hz5Lj1wvcepfhkCa4RBLfZaukeMQyDVQyXcSaseRyfLg5kN5vsBdkVbYJbmCY5sdGdI+xn6Dc1U0sd9/TBdGIma4b0kZ3BQ6Zl88i9J/wOK/hmnyjTq02bfTRIYduYujOGM6kJWQzdLNKNdJktpljV8nmUUgG0hZla6/4QKc+wrrgR+5JxM67eqUaD4iE1R0ccpl8LivI29V6kG5oZIZqwImRG5pqdtYmWCmq5okeLPfY0EuM/UlSZAE1DLm9TdPC1Zpp4hyqknFqGQYY9ce+d8p2jt1lw92sMHc7rK98WA+GKR+V5blmcIUMvOsEyomP/zvBH+LKCi3nbThWVMehuDbWMk7/ebwvb2ztgQyxWzXq3Xu60hwrbS40x4y1JcdQ2BwtO6xCS+OFeGPhTuBYbB/MiFLtydx3/1wp9i62+wc+xyYVvurtP5EUTCFBrH7DeP4Gm0U5wA79znhFHjFK/VHyT8njCgfM2zV0U6c=
X-Forefront-Antispam-Report: CIP:194.138.21.75;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(39860400002)(346002)(136003)(40470700004)(46966006)(36840700001)(41300700001)(6666004)(478600001)(40480700001)(316002)(36756003)(26005)(82310400005)(110136005)(54906003)(356005)(16526019)(86362001)(81166007)(82960400001)(2906002)(336012)(2616005)(47076005)(956004)(1076003)(83380400001)(186003)(4326008)(5660300002)(8936002)(8676002)(70586007)(70206006)(36860700001)(40460700003)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 09:10:56.0141
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c220124-acf9-42ff-ddbb-08da8cc30b30
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.75];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT033.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3341
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

Changes since v1: 
  * Rebase against recent 6.0.0-rc3 kernel, but the maintainers list
    stays the same!

  ./scripts/get_maintainer.pl drivers/memory/omap-gpmc.c
  Roger Quadros <rogerq@kernel.org> (maintainer:OMAP GENERAL PURPOSE MEMORY CONTROLLER SUPPORT)
  Tony Lindgren <tony@atomide.com> (maintainer:OMAP GENERAL PURPOSE MEMORY CONTROLLER SUPPORT)
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> (maintainer:MEMORY CONTROLLER DRIVERS)
  linux-omap@vger.kernel.org (open list:OMAP GENERAL PURPOSE MEMORY CONTROLLER SUPPORT)
  linux-kernel@vger.kernel.org (open list:MEMORY CONTROLLER DRIVERS)
  
  ./scripts/get_maintainer.pl Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml 
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> (maintainer:MEMORY CONTROLLER DRIVERS)
  Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
  Tony Lindgren <tony@atomide.com> (in file)
  Roger Quadros <rogerq@kernel.org> (in file)
  linux-kernel@vger.kernel.org (open list:MEMORY CONTROLLER DRIVERS)
  devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)



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

