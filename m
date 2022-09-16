Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07A205BACF7
	for <lists+linux-omap@lfdr.de>; Fri, 16 Sep 2022 14:08:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231273AbiIPMIS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 16 Sep 2022 08:08:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231346AbiIPMIM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 16 Sep 2022 08:08:12 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2043.outbound.protection.outlook.com [40.107.22.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3837DAFACE;
        Fri, 16 Sep 2022 05:08:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a9ZETFevpkng5xqOX5sgogf9/oKek83WTX7k10YAgmXWdZuJjkF9UzhTEp368W0nR+bQ27jKMmt+AIGxu5ZrOKhCwJq0VArHURHiU3O+buJfIzV2RZZxBVGyIIK5+pUTnFj+dvXt3FIE8tXLGZ2+5xK3UaqFL/tRGUIyODtMC6oFAsMnAdpbfPajT8iObBaOdRmFCD08C9p9lAjk5wBOTeH/MVEUAiwV5fP/zI5N3/scGJcAli/nx60T86HPeKfuV9xf54zSrrtj/honvhv788uNxksfq2ug9qQAvgWRww+4D44sCMjmTsVsDVb9kjCsQwwjqfcOH/gTUxqvIW1DaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+FPLwy3gra3QskfEclDY4irHmV/m5jRGYSoBiM8Zpw=;
 b=XnzicytU3VHWM0eTtKnBaTvhm8WmcUD5iGDpP4M072PUWqlyeZCYmYB36z8ZE9J/NCkZB4AncukK1ZNg9V+mYCCVA6QOq1jUM34p13MBKS8fP+7AH6IhQ/9hMZ+aZuURsFA25v37KmIUe/No3HDPBZ01VIx7g6kFnPW43rXDXY5BeMuGkyfZ5zMtHm2E1M5I1h1BU3r5tZDllBMvyJ8gUWEeAaFGhh5E/6UqbbIYpIkkBLNNnh0aWAy36XOwy+TKcK1whGyExZOsy9x76vr0hpDH0MnnYwJ+UA83jVSO4SwLc3sXOOzRorC7i6w0XIUMyujioeZFHgyt6N3gUozL2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.74) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+FPLwy3gra3QskfEclDY4irHmV/m5jRGYSoBiM8Zpw=;
 b=HgfkzRUZkKrKQKv+gwohskytfSpwAesWWZYvhdlUtLr3Pq/DM8V0lM74wKkgf4yKY1xVBDlvufD3BU5AGPoCwVCSXirs1xzWQUGknGEVeS+9CI5jNA4CyAZcmaEa4bcjT7O0rzjIMG3ckJlU0dmj5L6NtzhQ5+OfbwrmSI8mNpGe4ItcQXBpXjpx+MJ8Jde/pfk2bYtUnyK+4mKQZOxh4HMWgyVT36ZLw5hxzo3DlY8ghpqr1T8wLoJpNdWSk+i1FoDm+nYE4HdAhWzkxMy89zRJ9sGJVXbMF6yi9cv9wQhIo0t0iBWWkStEOsTM1aZ7plw31g4tqtjMEwZ/6a0ErQ==
Received: from GV3P280CA0051.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:9::35) by
 AS1PR10MB5392.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:48d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.14; Fri, 16 Sep
 2022 12:08:05 +0000
Received: from HE1EUR01FT063.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:150:9:cafe::f) by GV3P280CA0051.outlook.office365.com
 (2603:10a6:150:9::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15 via Frontend
 Transport; Fri, 16 Sep 2022 12:08:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.74)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.74; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.74) by
 HE1EUR01FT063.mail.protection.outlook.com (10.152.1.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.12 via Frontend Transport; Fri, 16 Sep 2022 12:08:05 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC8VQA.ad011.siemens.net (194.138.21.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Fri, 16 Sep 2022 14:08:01 +0200
Received: from bennie-lenovo.fritz.box (144.145.220.65) by
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.12; Fri, 16 Sep 2022 14:08:00 +0200
From:   "B. Niedermayr" <benedikt.niedermayr@siemens.com>
To:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <rogerq@kernel.org>, <tony@atomide.com>,
        <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>
Subject: [PATCH v5 2/3] memory: omap-gpmc: add support for wait pin polarity
Date:   Fri, 16 Sep 2022 14:07:48 +0200
Message-ID: <20220916120749.2517727-3-benedikt.niedermayr@siemens.com>
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
X-TM-AS-Result: No-10--11.619300-8.000000
X-TMASE-MatchedRID: POsRPqSDEnZ2JssOPetOeImIDnzSS8mZE34mKqQRiel+J3gtIe0gA2tq
        QgJyb0BRWgm4fq9o0LPhkjv78Hej4ekIezYN3SFOKPXQFKk5uQGTCob0Yf2X3j8Ckw9b/GFeTJD
        l9FKHbrlHpEd1UrzmFY4nd5BIQmYqQjWDB8SvIeIkrBjqqIzVOO/Pzxjxyhd5EVuC0eNRYvJ7xI
        KEgZq/AeJiUqjHevI0F51v32DYCPs5GnFStuFoW0vAMVBNN3ewEnwQg0CZxZurm7DrUlmNkIAy6
        p60ZV62fJ5/bZ6npdjKayT/BQTiGpefsKoW209bhhQN2X8ImVVHZZcelBAWAp1ZWdlQ94S0ahpn
        rRh/388=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.619300-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 18D638CE024905B1A5EEE6137C9942F082B02C652B858DCBB557C510CEEAA18B2000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1EUR01FT063:EE_|AS1PR10MB5392:EE_
X-MS-Office365-Filtering-Correlation-Id: 48131a6d-6b18-4b91-aa12-08da97dc1c80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bH7yoWVGEssySiz0tdAr0lRzSBvdD4A/y88csUbUb0K7RSFYcj7Lp3wPCrage1BFYFBeVtVR1wIlVxXndERD/W8kKnfaFZTLZSjHLQyhIww/Zl0bL4ryTfDl9raqMzKb1LTRlBbiuPaF1X6mSUemyxwgQzclEB4z6N/5JMG2ga9G4FfNTOx751+Rvc/tFZ1vOHhjd7e1yyWpureWLViPCVGdpMUbiXI4Osun7qnKiVemsYxkSCabshELNxgpC7g5IlPxN/MuSTmI1x2YYPhJ6QCpxZVspv9QOrcBOZZlAdHO95toKJsUx8keMctqPl5lapkJrWTqS/9vYEFmW8hOCguAwqX7D0e3lU63KRbAcsYjCU0FBeoXzedRln0AQ+3I06sx9MC5uzSfXDT1Dc2Ogzg1sdcbgOKaIfFltrWt2jd2TE5JRdFWUeXMU4HAucdXfRNu0/5pdzD3B4F+/JWzs4hQbvymazL022h1DYJtgkoJZELvGwJYZD/sNKdpXKYnbP4hxGqljyGCL5ljKUVNyR7+iPxFNTfFvxkDpGv3g6D/xvUGM9X+0pNVNrE8FxkqJaxBPVuyl8g5ld/kXQU2cCYUkMDdL7w4oscXuoTEFoaa2npECw2gd0qXr2b6XBTIdjTCb7E3djZL+l6KlLS2exovlIyQvFgXvBmRmQqrbpFeGl3/iIUlAQ+V93pn3MOL/HPkiUi0y96O/irihDHutXzixGnh4xTpux+L7rCCHAFTUYPVhQ4GRH4zR3UmI9mfFOm2WAjzhmzqrY3g6gNeSw==
X-Forefront-Antispam-Report: CIP:194.138.21.74;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(39860400002)(376002)(396003)(451199015)(36840700001)(40470700004)(46966006)(7596003)(16526019)(70586007)(110136005)(4326008)(70206006)(54906003)(7636003)(956004)(2616005)(2906002)(356005)(82740400003)(186003)(40480700001)(1076003)(47076005)(8676002)(8936002)(82960400001)(5660300002)(36756003)(41300700001)(82310400005)(336012)(26005)(36860700001)(478600001)(316002)(86362001)(6666004)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 12:08:05.2046
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48131a6d-6b18-4b91-aa12-08da97dc1c80
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.74];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT063.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5392
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
 drivers/memory/omap-gpmc.c              | 27 +++++++++++++++++++++++++
 include/linux/platform_data/gpmc-omap.h |  6 ++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index ea495e93766b..2853fc28bccc 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -132,6 +132,7 @@
 #define GPMC_CONFIG_DEV_SIZE	0x00000002
 #define GPMC_CONFIG_DEV_TYPE	0x00000003
 
+#define GPMC_CONFIG_WAITPINPOLARITY(pin)	(BIT(pin) << 8)
 #define GPMC_CONFIG1_WRAPBURST_SUPP     (1 << 31)
 #define GPMC_CONFIG1_READMULTIPLE_SUPP  (1 << 30)
 #define GPMC_CONFIG1_READTYPE_ASYNC     (0 << 29)
@@ -1882,6 +1883,17 @@ int gpmc_cs_program_settings(int cs, struct gpmc_settings *p)
 
 	gpmc_cs_write_reg(cs, GPMC_CS_CONFIG1, config1);
 
+	if (p->wait_pin_polarity != WAITPINPOLARITY_DEFAULT) {
+		config1 = gpmc_read_reg(GPMC_CONFIG);
+
+		if (p->wait_pin_polarity == WAITPINPOLARITY_ACTIVE_LOW)
+			config1 &= ~GPMC_CONFIG_WAITPINPOLARITY(p->wait_pin);
+		else if (p->wait_pin_polarity == WAITPINPOLARITY_ACTIVE_HIGH)
+			config1 |= GPMC_CONFIG_WAITPINPOLARITY(p->wait_pin);
+
+		gpmc_write_reg(GPMC_CONFIG, config1);
+	}
+
 	return 0;
 }
 
@@ -1981,7 +1993,22 @@ void gpmc_read_settings_dt(struct device_node *np, struct gpmc_settings *p)
 				__func__);
 	}
 
+	p->wait_pin_polarity = WAITPINPOLARITY_DEFAULT;
+
 	if (!of_property_read_u32(np, "gpmc,wait-pin", &p->wait_pin)) {
+		if (!of_property_read_u32(np, "gpmc,wait-pin-polarity",
+					  &p->wait_pin_polarity)) {
+			if (p->wait_pin_polarity != WAITPINPOLARITY_ACTIVE_HIGH &&
+			    p->wait_pin_polarity != WAITPINPOLARITY_ACTIVE_LOW &&
+			    p->wait_pin_polarity != WAITPINPOLARITY_DEFAULT) {
+				pr_err("%s: Invalid wait-pin-polarity (pin: %d, pol: %d)\n",
+				       __func__, p->wait_pin, p->wait_pin_polarity);
+				p->wait_pin_polarity = WAITPINPOLARITY_DEFAULT;
+			}
+		} else {
+			pr_err("%s: Failed to read gpmc,wait-pin-polarity\n", __func__);
+		}
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

