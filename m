Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3A005B973C
	for <lists+linux-omap@lfdr.de>; Thu, 15 Sep 2022 11:15:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbiIOJPA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 15 Sep 2022 05:15:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbiIOJOe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 15 Sep 2022 05:14:34 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70084.outbound.protection.outlook.com [40.107.7.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B44E98A7A;
        Thu, 15 Sep 2022 02:13:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=famMzwj8pg8cXrogU005lZbCGz+g84UnrPLStjwkih0vyJmEYkJv9j3m85Q0cY7gGC4/DVBcjAkbL3saa60T85EjDHWHckB99ir80hH8uY6Eb9n7h2X1E0N957bqd0Liy6s5RqAULKEZwzsmLo3wZ9gVaMDO7Suimif2IGOEiuz8zQiD+YAsDBqaDTb26Akufv4NKxOjGqTv9f77nfRt62sdtOCep1xsJlOj6WTMp5Wsmzp+ONCnA6Wkv7mukg+D4fMEFeEH5nBSE3MxYSM80ymL70gk/PQBN9qSY56yjV/tyeyHqQoHpptpjTFDlbhgyNWNHqnjTblJ4gCXixc97A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXJ0JLiUl7FIn6Fc6ESR81hBPq51NQ5+efUz4SJPILo=;
 b=VJwvgKv4rUabCab4ft7ntDNEZZtaFJ/ujJWxGjIwvsFJsudqgqvRf5V2F74qNMPW8w0ykSIzvstIPipMEXyUo1k0c7ndomXqXjL4M2Eqo7VgtP6wzwBsOFpN4M/0P3b0IOf7Fltm6wzs4krioymx7dJxa081Kv22ohAZMKritOpe36Ks3dVh6zlHfg2flrCX/xa1+FzAHN4JfzGqv63CWcQkej+4Y3hhdzDO9HwqyQaCJL/5kn94otbQoL7G5Pl5XSvgjlJ5+XH+IkkHx3jeGydL0XG99RIy4H1ALkKynpQBVMvurH2A58x6H6qVZ7/9oc/IumZUGW0EPZtRoXvXww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.74) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXJ0JLiUl7FIn6Fc6ESR81hBPq51NQ5+efUz4SJPILo=;
 b=oHwpKnQCV7jrWeZ0mSY1DeiWeFkUekkyfYVAZ5HUd0txARwj/W0j0gmLVDPWaD/EL415Y2n+OkbPGKjkYQv07boClZWJeEm/gfkGQ2tlhfAT5nIM8S0aWemfirmqQJvM3ondEVzeQsW9/dHWYb8MFB/D8quxMTFw3fiRsKdxo8nSKlqzs9kGfxCa49/L8Hpy+dMG1M6V9Urvk8zzxE7q7W54QcCHnV7leEOvBPjhMmZkrwBM14IiRX+BZvU7TbnTLvHC0awccgc/3+VCEWTkHSr47cCSbWB0FyMOQjp6Z6f3wPzkpJUolt1FSF7TPLPvMSBuN3ZuQjR1cKt718GThw==
Received: from GV3P280CA0048.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:9::29) by
 AS4PR10MB6088.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:583::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.22; Thu, 15 Sep 2022 09:13:45 +0000
Received: from HE1EUR01FT070.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:150:9:cafe::48) by GV3P280CA0048.outlook.office365.com
 (2603:10a6:150:9::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.12 via Frontend
 Transport; Thu, 15 Sep 2022 09:13:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.74)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.74; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.74) by
 HE1EUR01FT070.mail.protection.outlook.com (10.152.1.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.12 via Frontend Transport; Thu, 15 Sep 2022 09:13:45 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC8VQA.ad011.siemens.net (194.138.21.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Thu, 15 Sep 2022 11:13:44 +0200
Received: from bennie-lenovo.fritz.box (144.145.220.66) by
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.12; Thu, 15 Sep 2022 11:13:43 +0200
From:   "B. Niedermayr" <benedikt.niedermayr@siemens.com>
To:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <rogerq@kernel.org>, <tony@atomide.com>,
        <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>
Subject: [PATCH v4 2/3] memory: omap-gpmc: add support for wait pin polarity
Date:   Thu, 15 Sep 2022 11:13:32 +0200
Message-ID: <20220915091333.2425306-3-benedikt.niedermayr@siemens.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220915091333.2425306-1-benedikt.niedermayr@siemens.com>
References: <20220915091333.2425306-1-benedikt.niedermayr@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [144.145.220.66]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1EUR01FT070:EE_|AS4PR10MB6088:EE_
X-MS-Office365-Filtering-Correlation-Id: f1f74f1f-3133-4f03-51ce-08da96fa976e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zlp9nuFmrxxnIfS4ddUTB2UMWGSn59iJm1sXXKDqvWtQY7MCNvNmgnV01Y8faMlwPcHzYK2PLMsSj2w4bwGo/x/B8pf9S5Lv7prAYlv8sw7jc8gI/QvfhI1yTABvpOCaOthJjNWKbB/oGpcblnfPMcJY3PBm+dH+18SAEIV9VRK5NGwk+wKpLV6Lvn69DbVnq/cIuiSqec9VxRQVmOqJQcO6w0Wj06rt/L2/QEmOjCMW5E9xAAqhWaAT6LfpiDKOGOVL59g17XZstgP1KTGMdluSH6ToC0fI6UHNrmOibsZOG4kpE5VPdRYFduIynJrJG4tWvZ98HSzaBEKGDst1Vx/OPQUpfOd+sNAFUjBOjW5YMPYFSMKBTetZyLLm5aJVrt82KXjOEOg3cS0RN4fGPQIUlnGVoiwEL51XAhnViCANnnLw8d8D36am+a43QLxjc9ehMoQv2pqOccKtm6HBaYPhSj8yd/PIuCKvjSN3Oc+NckWZ4wizkv5JHlSy/PUUqiDW1t7P94Mjk7OsWoAYkchgMLfU6nOLdczuS8/VmKxFb/1gqPvPthxBGtSmLqCJ+w5O8Z0B3nXCy7xgQrIE92iYXXbKpypM53bwzxmlPS81Jwe1IQlw4QdyACQ/S7zXNOYUYAmDOmYHkQYOXfXWBgUeNZFianJ+ZllYeqNHrkn9MrjxL9+1+ba4oRWzLF410bW8P/5Nn4KulOIw4YUPMM6jA0lc86oVBZAnxXp3alMQVpF6EPvHLKfICw81LU0Eto08xlRqmkP4R6WBpHAQFg==
X-Forefront-Antispam-Report: CIP:194.138.21.74;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(396003)(346002)(451199015)(36840700001)(46966006)(40470700004)(186003)(40460700003)(82960400001)(82740400003)(356005)(7636003)(6666004)(7596003)(16526019)(336012)(70586007)(2616005)(956004)(1076003)(2906002)(478600001)(5660300002)(82310400005)(36860700001)(8676002)(70206006)(26005)(4326008)(47076005)(8936002)(110136005)(54906003)(86362001)(36756003)(316002)(40480700001)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 09:13:45.1832
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f74f1f-3133-4f03-51ce-08da96fa976e
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.74];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT070.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB6088
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

The waitpin polarity can be configured via the WAITPIN<X>POLARITY bits
in the GPMC_CONFIG register. This is currently not supported by the
driver. This patch adds support for setting the required register bits
with the "gpmc,wait-pin-polarity" dt-property.

Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
---
 drivers/memory/omap-gpmc.c              | 22 ++++++++++++++++++++++
 include/linux/platform_data/gpmc-omap.h |  6 ++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index e3674a15b934..66dd7dd80653 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -132,6 +132,7 @@
 #define GPMC_CONFIG_DEV_SIZE	0x00000002
 #define GPMC_CONFIG_DEV_TYPE	0x00000003
 
+#define GPMC_CONFIG_WAITPINPOLARITY(pin)	(BIT(pin) << 8)
 #define GPMC_CONFIG1_WRAPBURST_SUPP     (1 << 31)
 #define GPMC_CONFIG1_READMULTIPLE_SUPP  (1 << 30)
 #define GPMC_CONFIG1_READTYPE_ASYNC     (0 << 29)
@@ -1881,6 +1882,21 @@ int gpmc_cs_program_settings(int cs, struct gpmc_settings *p)
 
 	gpmc_cs_write_reg(cs, GPMC_CS_CONFIG1, config1);
 
+	if (p->wait_on_read || p->wait_on_write) {
+		config1 = gpmc_read_reg(GPMC_CONFIG);
+
+		if (p->wait_pin_polarity == WAITPINPOLARITY_ACTIVE_LOW)
+			config1 &= ~GPMC_CONFIG_WAITPINPOLARITY(p->wait_pin);
+		else if (p->wait_pin_polarity == WAITPINPOLARITY_ACTIVE_HIGH)
+			config1 |= GPMC_CONFIG_WAITPINPOLARITY(p->wait_pin);
+		else if (p->wait_pin_polarity != WAITPINPOLARITY_DEFAULT)
+			pr_err("%s: invalid wait-pin-polarity (pin: %d, polarity: %d)\n",
+				__func__, p->wait_pin, p->wait_pin_polarity);
+
+		gpmc_write_reg(GPMC_CONFIG, config1);
+	}
+
+
 	return 0;
 }
 
@@ -1981,6 +1997,12 @@ void gpmc_read_settings_dt(struct device_node *np, struct gpmc_settings *p)
 	}
 
 	if (!of_property_read_u32(np, "gpmc,wait-pin", &p->wait_pin)) {
+
+		p->wait_pin_polarity = WAITPINPOLARITY_DEFAULT;
+		of_property_read_u32(np,
+			"gpmc,wait-pin-polarity",
+			&p->wait_pin_polarity);
+
 		p->wait_on_read = of_property_read_bool(np,
 							"gpmc,wait-on-read");
 		p->wait_on_write = of_property_read_bool(np,
diff --git a/include/linux/platform_data/gpmc-omap.h b/include/linux/platform_data/gpmc-omap.h
index c9cc4e32435d..c46c28069c31 100644
--- a/include/linux/platform_data/gpmc-omap.h
+++ b/include/linux/platform_data/gpmc-omap.h
@@ -136,6 +136,11 @@ struct gpmc_device_timings {
 #define GPMC_MUX_AAD			1	/* Addr-Addr-Data multiplex */
 #define GPMC_MUX_AD			2	/* Addr-Data multiplex */
 
+/* Wait pin polarity values */
+#define WAITPINPOLARITY_DEFAULT -1
+#define WAITPINPOLARITY_ACTIVE_LOW 0
+#define WAITPINPOLARITY_ACTIVE_HIGH 1
+
 struct gpmc_settings {
 	bool burst_wrap;	/* enables wrap bursting */
 	bool burst_read;	/* enables read page/burst mode */
@@ -149,6 +154,7 @@ struct gpmc_settings {
 	u32 device_width;	/* device bus width (8 or 16 bit) */
 	u32 mux_add_data;	/* multiplex address & data */
 	u32 wait_pin;		/* wait-pin to be used */
+	u32 wait_pin_polarity;	/* wait-pin polarity */
 };
 
 /* Data for each chip select */
-- 
2.34.1

