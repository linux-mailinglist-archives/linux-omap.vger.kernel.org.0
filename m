Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCB135AE8AB
	for <lists+linux-omap@lfdr.de>; Tue,  6 Sep 2022 14:48:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240071AbiIFMsD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 6 Sep 2022 08:48:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240069AbiIFMsC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 6 Sep 2022 08:48:02 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2074.outbound.protection.outlook.com [40.107.22.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69F9357250;
        Tue,  6 Sep 2022 05:48:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aG/mUTcEbMSECEFpF29NTHS7S2gg7dyDHxyaOAhR+u/y+CPcYwzrtHSZXzOKwQilVeDlIEp2Gj4QmpkcWh0pe8LYtNPJnfzDV4ed1dENavzTSP5ACAPIDnCwd2PkDruzDjVeaETCatonive1YWohbW0MGetTTlOGEbN9QsFI1T7w61cnhcamzMdbxmCbqQy9He3dLISwQF0JNCuD61jS93ZSl93lSc091sYuHw83R6tDGgTe/toqHIWib1aj0eDGueajoiuZaOWkUKPYAuGRgcYY4U9rxMr2R6bGuIhiUGMT/Rd7el9vJI14pf8eEbtLopc8cSF0dcVwjZkA/q0qhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h7DoNJSB9r96Z1JilOK6nRjnPrk8RCLdULZ/0nq+lO0=;
 b=Q7KOrbINP4fdiJ7Jgsj2T/mA5shjzctyOK7kG2ODgshF6f5ddL3mswnukYSAYpz+U6qXZz0u6kV1suYoZyQKEr8SZShag1DyEgh4enTYwjjF3QfpMC4vVhiOXosjlwZjxJBi45NPrMXWH1oIDo6lqWosK/J9NcxuGXj82xuGUAvtxhWcISymlIcrDuzo/VIxTJlw5z2hWibADaa7AwbAa99Iqu0ONWfa1dWJUNyAPHXWWWGYLU2DZ8sO6X5uJ1ChFtS3ZHeq4v2ROY/0LlLwyZLF6kWzQwj2mcue6Br7xOs1wOFSIim2guooDC0s4GCEc3TfQxmuPpzA6SiTRcM2VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.74) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h7DoNJSB9r96Z1JilOK6nRjnPrk8RCLdULZ/0nq+lO0=;
 b=QJTkXhMpHrrgfI3VXhfqUeT0A9lUZegGjSZbKjNu/eG4DVBUXjVfHH4H8s04cahBXo0wsOyBE1pfPwe8KtTwFhro4KsWBE25D7Ynnz3uKJtN1CmzK8LhrGv4N5WbTIa1bXq8ukskwYp4cL5VioVvCX0S22Vx+9oPdGUFH6haz1zHDyQwE01L0ZFJmFvf+c08WiT7b/XoOK/V7fUQEvFfb5AXwTnGRu9guZD8hg+zW+NbQItvMhvJ0hEXI145muteJJcIpwOpKcPUZtsceAuyF7sRFzPLWZsyZlKVMS3sJMoOLMc8QEm7m2fwkk5derDQ8VQ9Bfn9TG8yP/QRQgpxuQ==
Received: from FR0P281CA0081.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::7) by
 AS8PR10MB6248.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:561::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Tue, 6 Sep
 2022 12:47:58 +0000
Received: from VE1EUR01FT099.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:d10:1e:cafe::fa) by FR0P281CA0081.outlook.office365.com
 (2603:10a6:d10:1e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Tue, 6 Sep 2022 12:47:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.74)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.74; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.74) by
 VE1EUR01FT099.mail.protection.outlook.com (10.152.3.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Tue, 6 Sep 2022 12:47:57 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC8VQA.ad011.siemens.net (194.138.21.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Tue, 6 Sep 2022 14:47:57 +0200
Received: from bennie-lenovo.fritz.box (139.23.126.196) by
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.12; Tue, 6 Sep 2022 14:47:57 +0200
From:   "B. Niedermayr" <benedikt.niedermayr@siemens.com>
To:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <rogerq@kernel.org>, <tony@atomide.com>,
        <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>
Subject: [PATCH v3 2/3] memory: omap-gpmc: add support for wait pin polarity
Date:   Tue, 6 Sep 2022 14:47:44 +0200
Message-ID: <20220906124747.1767318-3-benedikt.niedermayr@siemens.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7a8b7393-c3d6-471c-3646-08da90060661
X-MS-TrafficTypeDiagnostic: AS8PR10MB6248:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3q0jYayDT9zvrh4gupkM7ssMIjGIbQRbcvi4DmW0vHMl1dnOooxr/PBn6w7eWBaFb77SxYIv3Ae4yHuDWmdyRZqsNsbOqEVfRxyHhh/4b7vSdXOa3YYGkb+6diup6ny/CdNEsMF+KcWdyfN2vF8/PELj2xa6nbI1N9eu28/Yd4nCb/na1G0/c3kq7fj156/j4KTqluStr1OdlNHtxPOX8mRT6YDCHBBTM1ohTIXvsfcoVW201+WZazk/h1o7G6lNfWm+LFyp+X//yF/X6393wPFe9jt9xzum/erZeai5K/LtjgqTXdhs6kNsfEnfj5bz2a7gUc0T5/sl8Os51hY8x9NjPzk2WZfLXgGtuQU5k81RePk47Kbu4xlmZGpQpsvSw+/ogft2MNxDZ9yfusW5VmZ+O2ryW6gXwDKTwfJpfGGU+WtFZiKmGW58qYNha7Hp6KXCIR/6pOfc5o5nneDZTHRbkAvXgt4RrAg/fuVnFZh6GLBPLI7Oilw+XuYfUmeK6dBeA5LmMjawHvEyKfJuIogKomNhBzWNAcgthsFLyAMlZA7Xjeu5pDmzJIcM2TW765tdXlHE33tKaZxrG2encQR3yaIW/3lHifZChMUjhQpsoGimBWo9c7GgOkzdgtQB0bZaBD3fkVnG3PXFqCx1aPMwoFO7LzAZ9luz8gPI94e5oYAvqT7t/bS3tlfVwx52vMpNK35XXucsbILGgB4lYgCApljmT5N8RS4co2zROaSsUbLuKl8A36dg5JCsP00cnLCBviaI0gVyZP2mIjpzWw==
X-Forefront-Antispam-Report: CIP:194.138.21.74;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(396003)(136003)(39860400002)(40470700004)(36840700001)(46966006)(7636003)(36860700001)(8676002)(356005)(7596003)(4326008)(82960400001)(70206006)(70586007)(82740400003)(2616005)(1076003)(186003)(47076005)(41300700001)(16526019)(336012)(956004)(40460700003)(110136005)(6666004)(54906003)(316002)(26005)(8936002)(86362001)(478600001)(5660300002)(2906002)(40480700001)(82310400005)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 12:47:57.7050
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a8b7393-c3d6-471c-3646-08da90060661
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.74];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT099.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6248
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

The waitpin polarity can be configured via the WAITPIN<X>POLARITY bits
in the GPMC_CONFIG register. This is currently not supported by the
driver. This patch adds support for setting the required register bits
with the "gpmc,wait-pin-active-low" device tree property.

Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
---
 drivers/memory/omap-gpmc.c              | 15 +++++++++++++++
 include/linux/platform_data/gpmc-omap.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index e3674a15b934..609df21e0ce6 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -132,6 +132,7 @@
 #define GPMC_CONFIG_DEV_SIZE	0x00000002
 #define GPMC_CONFIG_DEV_TYPE	0x00000003
 
+#define GPMC_CONFIG_WAITPINPOLARITY(pin)	(BIT(pin) << 8)
 #define GPMC_CONFIG1_WRAPBURST_SUPP     (1 << 31)
 #define GPMC_CONFIG1_READMULTIPLE_SUPP  (1 << 30)
 #define GPMC_CONFIG1_READTYPE_ASYNC     (0 << 29)
@@ -1881,6 +1882,18 @@ int gpmc_cs_program_settings(int cs, struct gpmc_settings *p)
 
 	gpmc_cs_write_reg(cs, GPMC_CS_CONFIG1, config1);
 
+	if (p->wait_on_read || p->wait_on_write) {
+		config1 = gpmc_read_reg(GPMC_CONFIG);
+
+		if (p->wait_pin_active_low)
+			config1 &= ~GPMC_CONFIG_WAITPINPOLARITY(p->wait_pin);
+		else
+			config1 |= GPMC_CONFIG_WAITPINPOLARITY(p->wait_pin);
+
+		gpmc_write_reg(GPMC_CONFIG, config1);
+	}
+
+
 	return 0;
 }
 
@@ -1985,6 +1998,8 @@ void gpmc_read_settings_dt(struct device_node *np, struct gpmc_settings *p)
 							"gpmc,wait-on-read");
 		p->wait_on_write = of_property_read_bool(np,
 							 "gpmc,wait-on-write");
+		p->wait_pin_active_low = of_property_read_bool(np,
+								"gpmc,wait-pin-active-low");
 		if (!p->wait_on_read && !p->wait_on_write)
 			pr_debug("%s: rd/wr wait monitoring not enabled!\n",
 				 __func__);
diff --git a/include/linux/platform_data/gpmc-omap.h b/include/linux/platform_data/gpmc-omap.h
index c9cc4e32435d..7c9675165e8a 100644
--- a/include/linux/platform_data/gpmc-omap.h
+++ b/include/linux/platform_data/gpmc-omap.h
@@ -149,6 +149,7 @@ struct gpmc_settings {
 	u32 device_width;	/* device bus width (8 or 16 bit) */
 	u32 mux_add_data;	/* multiplex address & data */
 	u32 wait_pin;		/* wait-pin to be used */
+	bool wait_pin_active_low;	/* wait-pin polarity */
 };
 
 /* Data for each chip select */
-- 
2.25.1

