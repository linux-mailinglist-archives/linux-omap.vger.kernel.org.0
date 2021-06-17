Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6730C3AAFDA
	for <lists+linux-omap@lfdr.de>; Thu, 17 Jun 2021 11:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231490AbhFQJgD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Jun 2021 05:36:03 -0400
Received: from mail-eopbgr100128.outbound.protection.outlook.com ([40.107.10.128]:44672
        "EHLO GBR01-LO2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231683AbhFQJgD (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 17 Jun 2021 05:36:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LYSkrHjT8QgoEByaKw7Fimbgh3D7y6Oze5Fe5DWdrQdyRl1WAHeb42WIU3kFhDX7HDMBrXWy9o5vddhhymKbBlEwclb0IrV6wunYxcPER/HPQme3bBWkz716XlDc6hHAiTRirpRAPqTnOWvxDOFdGo5JC723/kkBlf6OVT/RrUP8Hk44ytoAg/3wGjOoRHARlPqEXbhauDkRAE8QL0QPzmzjHerwiqD5aoy8MC0C6JTqflx1C5c3mfchouy/ZbA4MlTi/u69qWTs5CHqa5X+VhX29oYgn0Xnq0CG9SMmVjh5YCHv+OvwRzUnYHGWLWUdwAeDjv9AlXt6bkD3S4+2KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BDsNDDyruec9FATJ0grguomSGlW5Ge2dCA15SkAhLXQ=;
 b=OhQzDlVg/wRSwH6eftSBVFr0VZBRa5W07beL/aHEAPFoviNH7QfVScEuScejGW63x2Ir1LQzyZH2/9uxrlkstjUKN4QKixfhdGcPQf75o3Z6XddA4goK1pUz6NWTSCZIU7maU6ao4b/JI7PyE4jKixE4ZQrYJtDH+WQ1Avhf4j5w9+52XlUrxdDa5H/3xKHEc7JL+Hqn6lIuJfOxJ5FQrhcOVjHCzA0mOVySg1DTpL8g8LdJDa4V0+inL4pI8QZpg241sHQQdpN+l555jHqQUDKRrl03VWq+Z7OeQBaXXQ+YbM1LR+oCUNy6kx+12LzQms24ekW0Ld6EH9dz51ikYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sancloud.com; dmarc=pass action=none header.from=sancloud.com;
 dkim=pass header.d=sancloud.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sancloud.onmicrosoft.com; s=selector2-sancloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BDsNDDyruec9FATJ0grguomSGlW5Ge2dCA15SkAhLXQ=;
 b=Zt/22S/z7ighBaa9VkT4glALrsQ0NO1W1iBXJpW127gPI36y1cgsoYJF1Yw6ipOuNW7N6UNKrZqOf6MfGpnRMFjdscR87H4VRKPt/EH6uRlQbpkHAq5kgu/mY2BcgN2Bgunm8K1gGJQmW6Oyct6FG+rAVViBjb0E1aJ+vK084aU=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=sancloud.com;
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:61::19)
 by CWXP123MB4855.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:114::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Thu, 17 Jun
 2021 09:33:51 +0000
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c84c:4809:6da7:ecf5]) by CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c84c:4809:6da7:ecf5%6]) with mapi id 15.20.4242.019; Thu, 17 Jun 2021
 09:33:51 +0000
From:   Paul Barker <paul.barker@sancloud.com>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Paul Barker <paul.barker@sancloud.com>,
        Marc Murphy <marc.murphy@sancloud.com>
Subject: [PATCH 4/4] MAINTAINERS: Adopt SanCloud dts files as supported
Date:   Thu, 17 Jun 2021 10:33:30 +0100
Message-Id: <20210617093330.9179-5-paul.barker@sancloud.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210617093330.9179-1-paul.barker@sancloud.com>
References: <20210617093330.9179-1-paul.barker@sancloud.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=808; h=from:subject; bh=e00T/6bjwnM/GgxSNfyX+L4/xSmwfYimdK9E/NBHNac=; b=owGbwMvMwCF2w7xIXuiX9CvG02pJDAmnxZ5+NPUxOmI4/cWV/xm5O0siP6qZ9c+/sYz/08oes3sK Gx8+6ShlYRDjYJAVU2TZPXvX5esPlmztvSEdDDOHlQlkCAMXpwBMpKKU4b9ryc6s40sUP/f9SZj90k r5cffDiLWakY96t/OcOrV9L683I8P1jVUBF47GbvK4KL1bZoYP86/I6K0zFvp9OnXs3OPzdu/5AQ==
X-Developer-Key: i=paul.barker@sancloud.com; a=openpgp; fpr=D2DDFDAE30017AF4CB62AA96A67255DFCCE62ECD
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [80.7.160.81]
X-ClientProxiedBy: LO2P123CA0071.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::35) To CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:61::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from owl.home.b5net.uk (80.7.160.81) by LO2P123CA0071.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18 via Frontend Transport; Thu, 17 Jun 2021 09:33:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5d437b3-57bb-4843-0cf1-08d931730467
X-MS-TrafficTypeDiagnostic: CWXP123MB4855:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CWXP123MB4855A86869E13963EB0A8244930E9@CWXP123MB4855.GBRP123.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:272;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hu1s8E5XuN/hIu4gkjNup1nLcZPGGV67KjyUjq9pdiqXj8myBEm57wIFcleKLBGwnENFUu05YRUZLsA7S4ZrAbN1jYvXojd2web15q/hpI0Tj+eENxkGIO0LxLNC3ztlt7GPqCKdDHIYGbNnqfpesaST4/efjtlb5/X+b4nKtXYBxLxWvD5zNudbkUnGn0R/AUBPPeU93a896vDLmHWYvPTR+f2dhG8nzPuNzjXR4dd5Qa4dqCTNBnX417npBZRnruZyQ0U/ZcnpBplN4PDdJZnH3cmskFCOXWO2yBZriol7WxLws00CvFml+r8qB0YHEWUam4m4tPh+GnOaY+cII8aK111mXumx9M+Wuq1mXoJpykNSGq4eNWxZ/NoXfABjGUB1iT3giB8jAnQMog5gt0lfMoGeS+qUP6M97VLwTZ8/uke5yToeN+cV/kikTaCRiWp/M4aYNEQuoMzXTv2L7BN6//ph4ZqA2Lxsrtb5DugpzjlqqoBJhJI+DHUdo3khN47oW6uk7TP6q3wLZsbowoQKmtyp22kci/yKYLfjXmOw/xO1e+L0ZkaO0URYIenck94zdb57o1OlNbBRWSSIszJl5ezmEMm4UrI5mZTBkTRnbRbuQUNWtJbpj9jAlEtMSsdmi2EpEqk8epztUZfoBS0w6kn6H5fxuExU/WCUcmc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(136003)(376002)(396003)(346002)(366004)(39830400003)(66476007)(66556008)(66946007)(4744005)(36756003)(316002)(478600001)(16526019)(107886003)(1076003)(86362001)(6666004)(6506007)(8936002)(4326008)(38100700002)(186003)(8676002)(956004)(6486002)(2616005)(110136005)(54906003)(6512007)(2906002)(52116002)(26005)(44832011)(38350700002)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Bsc2HVeUnlAjHPAWaqccWM1ibtR/s6JgyJVaGLpl2vZ0ruNUkBNrap9+A3xq?=
 =?us-ascii?Q?BhoMrA+zge53l5G0mJvXag1+/aLycBLhuN4CvsnaZJdd5gxvyJ72FeRaE9bl?=
 =?us-ascii?Q?0pDQUTpyEAgO5r7J3lOIoukLpAuDV5XTyljGHXQ4SxqWH8yOUhHo8gNjYnHX?=
 =?us-ascii?Q?OQn0Dy/G/PomC7PPSrTW9iwseKKRQMXzr9LC1UuYREK4lZfdnoQKYAyPdm7n?=
 =?us-ascii?Q?+COHQX13twn7x8aLFdNCUjdrCyvPDa9lgConq3LjFeyh3kCect8Y5iWvmEDa?=
 =?us-ascii?Q?pvAXF4FuhNaSy+3lLRgRLCw2sELuaWZbFWBf6za5MAa8cc+3E0Cj6WzZXgkv?=
 =?us-ascii?Q?kl8eRUTznuT0K+GmNpbV7KjgYqT5XOwiFZmuQwE3PkMIRDIwIMnPcuDJ713I?=
 =?us-ascii?Q?tJznPmL/CAlXHXcsKmJGS5HTF4fRJ54ru0wxxc6xyAPgsbzIEnMx02j8b5QS?=
 =?us-ascii?Q?l2A/Rf0GpuFWEg4JA8Dw9AJHllQM0fKpI9fxZxmMVAs2oDa9M5e2DXhlB7Vy?=
 =?us-ascii?Q?hCscH9IY5dYRrmI9VgGYo/CRqRa0MMVHqbv+ZzA18qcyZcpSmr2wY3/U8zai?=
 =?us-ascii?Q?N1WO7wiotkp+1vFdp01zL/nUQVmNRnhTvyrlScuAXZtde1nmSuaHCpPmu/Xe?=
 =?us-ascii?Q?bhhViiPUPZJ9Dz0mf2aQyur97/whClG8B9oVoIrFFwgsvPMKSR2d3Q9qxOd7?=
 =?us-ascii?Q?Q/gJe0NhXDk08FP00/mqixr3H5S541QR3ViCbftslE20TmXMjOvYHUXyH3n9?=
 =?us-ascii?Q?HYjklKoiXOTY5INBUjjpBdEoS5zH1FQD51hGXg9dG7obWCc6JTz3QjstN5Yq?=
 =?us-ascii?Q?OVr8Xq+BqbNgNHS4V3FEJOa9wcq1ANsycPwa1UUjyJF4tFoqhr0kAXrfIkct?=
 =?us-ascii?Q?1Pe0AfSMuP6+1fZJ/DxzoJEhiZkNEbAg+pvv+uZ8IC6vb6b0G915YfDJKkb2?=
 =?us-ascii?Q?uce+Vlavm2ctl9wR8ARvRO9i4LhiKPDMExM+cnypnsaqx5tUUfK2QlWyrHYw?=
 =?us-ascii?Q?vjZ+YdO+VcGEx3APR7PosOtaAYYvUpjj2WHBgNoGLXl93uIxZy7gx58CQyRw?=
 =?us-ascii?Q?d1HB3HuxxFrIHnHvOl84ebMdiCsihDF3JO2UEvIGDiqbz52ejnrFPYyn03vm?=
 =?us-ascii?Q?CNDrCzFfEHhw3WyH5GyLYz4RB7/J/NQRpaN1iI+YK58B3aWPYDmMV/X1Muar?=
 =?us-ascii?Q?zTPak6urR70eZZ0lHuIriSxL2PGHtL7ZijIhQlehOyRXz0b3k/OcfgdoMmKL?=
 =?us-ascii?Q?gUMuH8pv9htNvzursNhrSPrsSpaZ/aQYORlzuDyFjHw0GZTACt4KdIXMmlwo?=
 =?us-ascii?Q?E2RToynDB0PZP09FRraX9IaZ?=
X-OriginatorOrg: sancloud.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d437b3-57bb-4843-0cf1-08d931730467
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 09:33:51.5407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 840be37c-244a-450e-9bcc-2064862de1f4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IK/m/SLmZE1+ixCvu5+YAxYZ4wiTykn8fknIep2aJzaTxo2zu9tlKlq37ddWJd9VoiuKW3F7CGrOKAsjOzoWFZTG9rgU5b7Yyl6RtMOWXeI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP123MB4855
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Myself and Marc are happy to maintain these device tree files going
forward.

Signed-off-by: Paul Barker <paul.barker@sancloud.com>
Acked-by: Marc Murphy <marc.murphy@sancloud.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bc0ceef87b73..70ff908ac891 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16234,6 +16234,12 @@ F:	drivers/phy/samsung/phy-s5pv210-usb2.c
 F:	drivers/phy/samsung/phy-samsung-usb2.c
 F:	drivers/phy/samsung/phy-samsung-usb2.h
 
+SANCLOUD BEAGLEBONE ENHANCED DEVICE TREE
+M:	Paul Barker <paul.barker@sancloud.com>
+R:	Marc Murphy <marc.murphy@sancloud.com>
+S:	Supported
+F:	arch/arm/boot/dts/am335x-sancloud*
+
 SC1200 WDT DRIVER
 M:	Zwane Mwaikambo <zwanem@gmail.com>
 S:	Maintained
-- 
2.26.2

