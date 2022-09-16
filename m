Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9308B5BAD01
	for <lists+linux-omap@lfdr.de>; Fri, 16 Sep 2022 14:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbiIPMJN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 16 Sep 2022 08:09:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229959AbiIPMJM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 16 Sep 2022 08:09:12 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2082.outbound.protection.outlook.com [40.107.22.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36B59AFAD0;
        Fri, 16 Sep 2022 05:09:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EawTRJxy+rvuaNTWTJYbH+OQiwgyRTTXVnW5dNcwnUojGAdXgzkb2gs/ccFr788el+hENAnZSnOc9PCN+drZ/7qp2C7FXVuBRgb8pmhFaovPsxiLQ3ttEVWw99Nx/A+SG/IU9vort2PvXU3cLd7DIR82wfEtq7wSDa3T5tBHNA4K3xQ8oU0YZFgHClT6m9uen05FZv1i0jNArefPI/p4ui9n7SSEu+gDX0UIHc/vMYqsdOd3BoOZag27vvbvLcH7TnVqB11yq4evPscrgzQrPcx7+dhGhIfqeQVWVwaT1MZIjns+ET1SLqhoGJOZk9mYpZlg2mZ2APWVbCgFQqeExQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dyf94WJFP348oa3g0gktBfN9qvq3qbmcUsesPkG+9HY=;
 b=MZJze6THDRu2hren96vYirHyY1R1EH5AINrKmfbww4hNtrQoqw1uhVX7YzrvT/fhQLPHlVCunkl2EaWZlRKN/G1PViOFTJiRXjrCRHy8arZWuaUOzH6BcGs8k+MUAvXI1Jjz84Q/ccO+N+mEBoW4lgj6jLQo539envSlzrDvXuHJ/2z7AkSO3YrS3/RRpcUmyFm8BcUsB3HWKERctiGmwOzWorbsMPeBAD+dxK9fnmVHujqh7Bcm2glHRhVejbDbgI/G4qNDnjjiUUfREfec9QnVmtbLzjOmW9M/UdwN6UHiiLCjfwtVT96v/+J+rqqTSfkFWRfR1Y9GrQ6i8lulsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.74) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dyf94WJFP348oa3g0gktBfN9qvq3qbmcUsesPkG+9HY=;
 b=VGanrd8C/aCM+rQzeyw+6qj1ILuurScph2dE1ZIuu8InGAple2ORGfF3pgAOufSRAWLz0c8Y0TUU/O9dmxduHjf28bo/8YrtoG9b1rNhQ82C+vmpdFy8izbrUaW9QvrMCINTM6cNoJzH2te/qGxOGC1xhV8u2qik9z698/Ze2C92BmqInkTYg6AotxH6cReU0seaPdQlhJq0k8tlL6O4q2eMbjk6oOCGmkVTYerD7Pg5oB6/Kh+yHYqZpfbC1IhGmS0k0symPl5rhanI8jGubQPX5YKVog3hU1eWsUELXTgMJ0vrTruHSJtWelIHvSjIP2gGBuPEgShqwiCWRdHlgg==
Received: from GV3P280CA0056.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:9::10) by
 PAXPR10MB5638.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:244::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Fri, 16 Sep
 2022 12:08:05 +0000
Received: from HE1EUR01FT063.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:150:9:cafe::7) by GV3P280CA0056.outlook.office365.com
 (2603:10a6:150:9::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15 via Frontend
 Transport; Fri, 16 Sep 2022 12:08:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.74)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.74; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.74) by
 HE1EUR01FT063.mail.protection.outlook.com (10.152.1.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.12 via Frontend Transport; Fri, 16 Sep 2022 12:08:02 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC8VQA.ad011.siemens.net (194.138.21.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Fri, 16 Sep 2022 14:08:00 +0200
Received: from bennie-lenovo.fritz.box (144.145.220.65) by
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.12; Fri, 16 Sep 2022 14:07:59 +0200
From:   "B. Niedermayr" <benedikt.niedermayr@siemens.com>
To:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <rogerq@kernel.org>, <tony@atomide.com>,
        <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>
Subject: [PATCH v5 1/3] memory: omap-gpmc: allow shared wait pins
Date:   Fri, 16 Sep 2022 14:07:47 +0200
Message-ID: <20220916120749.2517727-2-benedikt.niedermayr@siemens.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220916120749.2517727-1-benedikt.niedermayr@siemens.com>
References: <20220916120749.2517727-1-benedikt.niedermayr@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [144.145.220.65]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--12.932000-8.000000
X-TMASE-MatchedRID: YeslW8iZUfPMYa5soaxdevS8hmHHS12Le/GSmEODdnIdZEkR8Y/meX+s
        iCf/QKJTdANxGD2/8Th88Abx2XH5NlppNBoXxD2IjUkjodfNrfZjFNgY8SnxHA3BRWEgXqlWWNb
        BpQ++I1mRiV0eo0RbuK1uNfgQaqvvSqdra4WWujyPQi9XuOWoOEPu4/hW5W83U9ht8cPjV45nAs
        t8At+c3ceQfu6iwSfsJVibDTTQXq1wDPi4qgkFxCfEMauXqN9RTVAfo9STYMOK5Jq39CIIv+uLF
        ZZYlisfHxPMjOKY7A8LbigRnpKlKTpcQTtiHDgWM36TonZTaOPY8ftIlo0kbUqSpMkU30hB0m0/
        /9UUQaRta2wryESZag==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--12.932000-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: AD166C68398BD1A34AA7112FCE0560E7EF40665841A8F99ACB28101A975A4D462000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1EUR01FT063:EE_|PAXPR10MB5638:EE_
X-MS-Office365-Filtering-Correlation-Id: 22677c36-62cf-4ce0-9dd4-08da97dc1ac7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uK62T+ymgefUu7GhCVsf/8SmjE0Nn23TtREA0AWv7ExuURTJt4e45psjDiAQ1O/Oosth0m+gDoNqzeMlzLoIDdqQZqY4NVMIVGEPaJUXlhFukoBI/CR7gslzfREGdDpoHTsP4KsBRbWnOaQlP+7mx77RLXIY0jl7yaLiufv6cn6EthHTbLBiwQpquwviElt0KNtJdtOdNN7el37VqFKJwdERAtu4nuzED5YUd5yeuc7iFCPi8+14oxDmh0eT0ActSegdCuEGau8TqTblf3ns8HAYkwnKGO6cuJ5EqxaGcXzHpgsIbbjJlvkPpg/oDkFByW7OCXm19h0FYDftiqTfZFAIQaFB2FsG4JfL2eKFtUZVNEYuZfMW7McZBll1xBz6L3oJb3mOllkDYQMcElqPUrX10+re+oVaUvANQFRytxqb2hXtjgw3LSh5qbXcPQ8gUzizmwfx5rU3i1Ulxf5cSeUFSDxYJ+vRdNg+awP4pEHOO39VgTv6hkzCY2joF3NtJd6oN0lckmAiK1sB/O1pYZZ5y73dGRuRr0G7OBjX4/Yf3/F3CkGXbLDsrH89FEoo3C2PbhhzVl5XuP64w3BpEqf17pW0/+F7bfycc+jqsO/hxBAeKyCj+Wqrc5WGecrhN5dRm2wehIb/Y0ikuszv2Fcc0KhtUJU4SwzudIkftYQkWK273vrQHod1CldYEE89KBoP26YrV68+FRMDa3o9saycXYWlBmx9x6KWpKcnGB3a9Y8h1NOkc598V9+bivw/VD+fsEtT8fXdGbrde7qHxw==
X-Forefront-Antispam-Report: CIP:194.138.21.74;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199015)(40470700004)(36840700001)(46966006)(478600001)(110136005)(36860700001)(82740400003)(40480700001)(316002)(4326008)(70586007)(82310400005)(7596003)(356005)(26005)(7636003)(54906003)(8936002)(5660300002)(70206006)(40460700003)(2616005)(82960400001)(6666004)(8676002)(41300700001)(16526019)(2906002)(336012)(186003)(47076005)(86362001)(956004)(83380400001)(36756003)(1076003);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 12:08:02.3298
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22677c36-62cf-4ce0-9dd4-08da97dc1ac7
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.74];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT063.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5638
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

Newer kernels refuse to probe when using the same wait pin for
different chipselect regions.
But this may be a usecase when connecting for example FPGA or ASIC
modules to the gpmc, which only got one wait pin installed.

The wait-pin allocation is now tracked by the gpmc driver in order
to be sure that the wait pin has been indeed requested by gpmc.
Therefore the "wait_pin_alloc_mask" has been introduced.

Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
---
 drivers/memory/omap-gpmc.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index d9bf1c2ac319..ea495e93766b 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -232,6 +232,7 @@ struct gpmc_device {
 	int irq;
 	struct irq_chip irq_chip;
 	struct gpio_chip gpio_chip;
+	unsigned long wait_pin_alloc_mask;
 	int nirqs;
 	struct resource *data;
 };
@@ -2221,9 +2222,16 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
 							 GPIO_ACTIVE_HIGH,
 							 GPIOD_IN);
 		if (IS_ERR(waitpin_desc)) {
-			dev_err(&pdev->dev, "invalid wait-pin: %d\n", wait_pin);
 			ret = PTR_ERR(waitpin_desc);
-			goto err;
+			if (ret == -EBUSY &&
+			    test_bit(wait_pin, &gpmc->wait_pin_alloc_mask)) {
+				dev_info(&pdev->dev, "shared wait-pin: %d\n", wait_pin);
+			} else {
+				dev_err(&pdev->dev, "invalid wait-pin: %d\n", wait_pin);
+				goto err;
+			}
+		} else {
+			set_bit(wait_pin, &gpmc->wait_pin_alloc_mask);
 		}
 	}
 
-- 
2.34.1

