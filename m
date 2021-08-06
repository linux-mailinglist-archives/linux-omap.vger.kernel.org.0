Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96A843E269A
	for <lists+linux-omap@lfdr.de>; Fri,  6 Aug 2021 10:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243938AbhHFI7m (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 6 Aug 2021 04:59:42 -0400
Received: from mail-eopbgr110132.outbound.protection.outlook.com ([40.107.11.132]:58544
        "EHLO GBR01-CWL-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230119AbhHFI7l (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 6 Aug 2021 04:59:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MUfCFKjCrcF+SH7RYeIMeD08dwhGHlq7NVAjUGunDu11tJj8ZFGxwPzWGNBqKGSeEB/qnPfEekVMEd8T7cvYJms6ANp9auzL+SRCTzkLlzno0tBPYxMMP3P8F+7gaiZnlhs38/AnuYzyU1twVsFOq9bmGx0vExPgaQIaHNCbDZ8vNPx8APQUsKgzQJPBOyhpp6CrbOfk7VE6/3Fvu28oUiBwJggdGcH/ki6rFiwgSQGJOr7n4a/MlPKabY/gTasxw0gAhNy7++yAVEdVf4iotAfsoBgHqsXpJ9uoK6Y68Xj9Msy0PFYpeuAg3c57sV1BVC7zil9FaW6YIJl9UbiODA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqmooBRSvAdtyWZS5eC9D71SFbbvU7BDcu8ejVZ70q0=;
 b=f4qSOLs1yJyvBEaFtjqM+Uj0VXkvrE9DhhGovHxpPVE+5eI3LQSJNr12CDEdxLGAIaq2VHf33Wc7xbBninRio0ut5OTR0JTGYKHMAcn0TWaoyIHkyzyKYC9FEq+agFr8K6XYbpuurpHMCYBYYyeqdz1t9ngdZ+Fl6vpoIni+QOjfQGrRgmh/i+fzJUOg7iiN4j6FORW9xtdA4Gp4Dp2U/dPqj/fp0PVtPuV3byl+aPLaJE5pUp9SIOdyI54m4QZY1raNvpq3sMc7O8Y0oqvTB6JCnt019Wl+C/DQoIoMNz04VMhtHBUBtWcSJcaUyKZiUJSRnGEFaT8mZ/UCHlgZwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sancloud.com; dmarc=pass action=none header.from=sancloud.com;
 dkim=pass header.d=sancloud.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sancloud.onmicrosoft.com; s=selector2-sancloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqmooBRSvAdtyWZS5eC9D71SFbbvU7BDcu8ejVZ70q0=;
 b=A/BYb4OV3NP/5f4OI2YRqPg+HyV/KlzcZFESKWuwBaUoCTe8qsZFIZ3qjA4euhX5oAo8In9aVRg3UxCQKlANTQvoQL3GANDIuG/8zraut8aTuSQ/Pe6eC05FlY7lDQwPmom7v7IwjNoLTvC0uJ3NEeDixTeMHtlHYignWKb/qXE=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=sancloud.com;
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:61::19)
 by CWXP123MB4934.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:125::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Fri, 6 Aug
 2021 08:59:24 +0000
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::dc2:e929:76be:a8b0]) by CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::dc2:e929:76be:a8b0%7]) with mapi id 15.20.4394.019; Fri, 6 Aug 2021
 08:59:24 +0000
From:   Paul Barker <paul.barker@sancloud.com>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Cc:     Paul Barker <paul.barker@sancloud.com>,
        Robert Nelson <robertcnelson@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] ARM: dts: am335x-sancloud-bbe: Fix missing pinctrl refs
Date:   Fri,  6 Aug 2021 09:59:06 +0100
Message-Id: <20210806085907.14615-1-paul.barker@sancloud.com>
X-Mailer: git-send-email 2.31.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1627; h=from:subject; bh=IIeLdZ0jjRklwgYSN6tiM8nXRpo1syOzhQhrquK/gwY=; b=owGbwMvMwCF2w7xIXuiX9CvG02pJDIk8Py9snZASouD3sLg+b9+CG3YMk//8Nj30bFf47ldFpSty rac+6ShlYRDjYJAVU2TZPXvX5esPlmztvSEdDDOHlQlkCAMXpwBMJFWQkaHLzjP2bp2Yj/HP1xu5sj 5OTzHWEAld9+HdY9ngqbv2SIkxMqxVm2T0ai8j4/apyS8FjaQTHq93WOGcusLTZwfrqm96u5gB
X-Developer-Key: i=paul.barker@sancloud.com; a=openpgp; fpr=D2DDFDAE30017AF4CB62AA96A67255DFCCE62ECD
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0133.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::25) To CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:61::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from owl.home.b5net.uk (80.7.160.81) by LO2P265CA0133.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9f::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend Transport; Fri, 6 Aug 2021 08:59:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d756e7f-8f3c-4f3b-3499-08d958b87d22
X-MS-TrafficTypeDiagnostic: CWXP123MB4934:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CWXP123MB4934F1550B7C961281DE010D93F39@CWXP123MB4934.GBRP123.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hOZc9F4eCiu+LpWJxBSSy+H16Wp6iRlS/BhmCQbob1exfe5AeZRinJ+w+B99AlATb2Hjrurgspdp2tD8LfPVpftFQRRycprZTPKnn9GlV1QDgDwswaP+dOGIoSnjWk1AxotyJEr0ZZJ2HVCBz6rKEjet4A+WWxP/7/JZuVO21wSjQy/9OawolUbw2E0mWbLzrRiJS9mCv66Wsw4d8O+I1eGESySj/f8/hXrSAmWlQT8J09gbBh/8L2Y/UNr8Csqq35+HQ185OF7c1D2PkIPEil4JRmaLa6JnG6WvrKt53l6R3uFCohVshGDHcolRVnAx1mpHCBX18hPI3kT0+BGPtkbvhY6uaqPkme03pmllLlusN3rrBkY1t8qwr5QcWXXoN4AueVr1s4DGhfmiB81TWKI3O1+RonFab6U+hdKEfdgjbr5VT9Hkrk9aDLijs6pzAwdoLnt4U9onr06Y2mIy2AYn2wXw1PcRg5MFNzdqXq8oBL0oBKwfTVl+eGxze/iCFxJODAeIcPbHEby8rX13BqkcCt2gPF4nZXDWRIUPONGKvrGX222yC75SPNFKTUZCrPuBvKoFwDBXWemZxUSvog5u8XbCvTEs+4geEplKbOMYLVziaYWOWU65xZyxHIQguYXuZpNBEBAIjWYYtgss6rxyi+ravt4wb+Pt1K1CH36+BBuXxKuL7InnkOqa/6+frIf7sTSk1KGkvCfU4lFeCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(39830400003)(366004)(136003)(376002)(346002)(396003)(2616005)(8676002)(956004)(4326008)(2906002)(508600001)(66946007)(66556008)(66476007)(44832011)(38350700002)(36756003)(6506007)(5660300002)(38100700002)(186003)(54906003)(1076003)(86362001)(110136005)(6486002)(6666004)(6512007)(8936002)(26005)(316002)(52116002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BhEnAU25DRPQ5aJbMzZm6hOIAeQ6rtHNlYR6M+bZKvFePpgQFQ/vyoHftrhv?=
 =?us-ascii?Q?rs2ph3c8SXSRJ0//fbkl8qetSTUDzZxWT6HBwUAhpfjhTMdpwCLvDhCj+VA/?=
 =?us-ascii?Q?7lgvMBFfzVhEYy3/lEAKkre/Ec6VCZ/75QHLQKw41N0fFQIfIymyyVRj4/L7?=
 =?us-ascii?Q?aci7ZN6gIpjl1XO8nhE+/j5jzi1o3DhlIPOAPTxPDSJ+qGYavaPD2XXzUWVH?=
 =?us-ascii?Q?nVVqgCfFyqGyVGR+Fzq3mYRFKXSav8PgC3Yuw5BG29hkxOfJQ92Pgwuks5jm?=
 =?us-ascii?Q?TdhTmj8/3PzXul9QQu/J259ExsDOakRTpCGEIp1LrMEcTtn2Te/FKNMGo6dU?=
 =?us-ascii?Q?GAQdFO+reXeWXgt1t1CJVIojJbyPaHL7VgaBGVhgr1DgjKpsq20KTd0VlHQx?=
 =?us-ascii?Q?Dmw4DgPewp41FJ0y41aAEsFOcPRUdAefGuI82Iv+WXjI7SJS9GHp/02GhGoK?=
 =?us-ascii?Q?Ecp8cVbruGPffo1pBfG255oUiPt8iaF6iTTZA9j0EPU7kPU4tf0u8KM29v5i?=
 =?us-ascii?Q?43N8DNcA+ARqUVfScoC71kOCmrOf8pv4xfglaLayPbzEMx7XIuAfJ2ybJ2zz?=
 =?us-ascii?Q?dt77xAUUP98lyZnb3htCrbh1KuWOz6WkQudJKTMilqkfXFSjFUSLinkrPVva?=
 =?us-ascii?Q?F5QioNdwquqgx/vki/VAHIHvRL9VCi5sm1aCpytJwKop1gOImccDgXJcSXnr?=
 =?us-ascii?Q?ZHE+vLwHO3XzWfcd/wOpLtNyDKL9LPXwUrSKdVFlnnlEXTiOtT/4Lps17F+P?=
 =?us-ascii?Q?SvqPgWUOXzG6VyfhIyfevF7wSa/tX3xnclaiBi91rplyNrSQ6A0zg3yZ3EMR?=
 =?us-ascii?Q?1qGZ9xW6APf+iOodHVZonlx7pASi+V7jAjHEV8nY9QtQ6ZQG69OFzEYcfX8W?=
 =?us-ascii?Q?bRVQbARPCxWpoEi9dba0QjwPDKSMtQzhCtrISm7IUX6Ff4euze0rEU900LTS?=
 =?us-ascii?Q?1pO8UWJoqMehLzPqfOmSsejoF0xERniducG2PVAT+PoaY/VPGUaVR7QXCz7I?=
 =?us-ascii?Q?MutrmkZz7XtJ2hYfC8xlBzNU1oP0dvQsbZesTqcM7fHzjeCO+JMVnRY9wxJ7?=
 =?us-ascii?Q?aJ4KofgwYzeWmyfvtGY1BGH9FLItH2cJxpBYAZfnalxJ6WEHPr5RS2MmlVAQ?=
 =?us-ascii?Q?N+i/iLHlppTjpg7YZpRwdxJl17SAf5dowvUcoYbQ0pAWdkPorVTumK5Ckrd6?=
 =?us-ascii?Q?zurD4WylGhLweu5szT++gq6GJH6WeXxC1E7k6qJtkH7I0kxzO4FjRo4Ky+gt?=
 =?us-ascii?Q?JDXrxOOfQTm6rCBDm3fFENdG1l9fIolz8a2NQvjjwZ9ay8jmLzrw0nNKGubM?=
 =?us-ascii?Q?IaR0V2fkBTWUXyQBVQ05rh2I?=
X-OriginatorOrg: sancloud.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d756e7f-8f3c-4f3b-3499-08d958b87d22
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 08:59:24.8145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 840be37c-244a-450e-9bcc-2064862de1f4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1GsxGlUjee6ZJ5TEwJXkj76vU+wfvK7x9kJnldTwPS0aubuSlQUX9GHgxU28M4T4eOhZNVeFjdgTw6vyf3lvgP32KYEtsssOhpqLRMNHDoM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP123MB4934
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

pinctrl settings for the USB hub, barometer & accelerometer need to be
referenced from the relevant nodes to work.

Signed-off-by: Paul Barker <paul.barker@sancloud.com>
---
 arch/arm/boot/dts/am335x-sancloud-bbe-common.dtsi | 2 ++
 arch/arm/boot/dts/am335x-sancloud-bbe.dts         | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/am335x-sancloud-bbe-common.dtsi b/arch/arm/boot/dts/am335x-sancloud-bbe-common.dtsi
index 627c18d23f94..55952fe8687c 100644
--- a/arch/arm/boot/dts/am335x-sancloud-bbe-common.dtsi
+++ b/arch/arm/boot/dts/am335x-sancloud-bbe-common.dtsi
@@ -58,6 +58,8 @@ &cpsw_port1 {
 
 &i2c0 {
 	usb2512b: usb-hub@2c {
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_hub_ctrl>;
 		compatible = "microchip,usb2512b";
 		reg = <0x2c>;
 		reset-gpios = <&gpio0 29 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm/boot/dts/am335x-sancloud-bbe.dts b/arch/arm/boot/dts/am335x-sancloud-bbe.dts
index 2a0ac9f5dda7..efbe93135dbe 100644
--- a/arch/arm/boot/dts/am335x-sancloud-bbe.dts
+++ b/arch/arm/boot/dts/am335x-sancloud-bbe.dts
@@ -32,6 +32,8 @@ AM33XX_PADCONF(AM335X_PIN_GPMC_A10, PIN_INPUT, MUX_MODE7)     /* gpmc_a10.gpio1_
 
 &i2c0 {
 	lps331ap: barometer@5c {
+		pinctrl-names = "default";
+		pinctrl-0 = <&lps3331ap_pins>;
 		compatible = "st,lps331ap-press";
 		st,drdy-int-pin = <1>;
 		reg = <0x5c>;
@@ -40,6 +42,8 @@ lps331ap: barometer@5c {
 	};
 
 	mpu6050: accelerometer@68 {
+		pinctrl-names = "default";
+		pinctrl-0 = <&mpu6050_pins>;
 		compatible = "invensense,mpu6050";
 		reg = <0x68>;
 		interrupt-parent = <&gpio0>;
-- 
2.31.1

