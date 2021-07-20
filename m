Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F0253CF647
	for <lists+linux-omap@lfdr.de>; Tue, 20 Jul 2021 10:40:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234058AbhGTH7Y (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Jul 2021 03:59:24 -0400
Received: from mail-eopbgr110132.outbound.protection.outlook.com ([40.107.11.132]:42540
        "EHLO GBR01-CWL-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229588AbhGTH7X (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 20 Jul 2021 03:59:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q0u5+/QRiWdu4HKMUAqHHtrlwBMCl7tS2QVQqJxz9RUwoJIjNfJFb/RNS71ffLG1Pb7y5/Vb+6cwJCznUwK27KhrH1++yxBAwXRSFSByxavn/JvZGus9k5f7mcoh/Ol4FUs5v5mBvm/RI1/k0POeDIddMhcFfjjPfffvQ+FNNsRGrkSrGI+lNiwEN77007NsZbS/hROMYPWoXauMmSBCS6EK+K8+e8cp3ojkBJG30KblqTx6zD4G6/9bzV10iBWPj0k9XZFt/PVhqrZKO2u5frt68DFg70Kl2y7GB85JH/lGf0vWboAhi6YZAOop/uLpVjgdhQ0F4xieY7Vlhd0wZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=szM+su17N2M77kInVnoq1+jKYq7xiz4pRN28XnMN2ZI=;
 b=mvdDBOg1NYzi43xSZXwbHEpztRaxR1iSUxDTf1wze+F/sJqAEWZNefasXs0GOOi5fMknumYCpgo2gJEnfOyDsY8gWQFhzQyncmeCukVexZUZ7xqazcL36SO/Kneqm83tHXtWzTM2KAJirccZX8ULmplTqNwOWI3DP+iNW6T/+stXnzJJIByzK1fXQAZXtkZ5SjYejI6sVaRwW7TZlrsEU94t7pE9PTHa9srp5jGCQoh6pIDBI5kRdMnDpqpMTsHAHw6F6ZgXeut3F3KTzLRDy7nLBtgglBTfgAM9me925o7M8Kniu/gI1F6XSdYyKI1/gzGxcEPD48mQm2MWwJBJ/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sancloud.com; dmarc=pass action=none header.from=sancloud.com;
 dkim=pass header.d=sancloud.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sancloud.onmicrosoft.com; s=selector2-sancloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=szM+su17N2M77kInVnoq1+jKYq7xiz4pRN28XnMN2ZI=;
 b=HQttjwxHpDO5fTgOwl6q97mBHN+23b9Yk61i7A4MoM6JKOKcZGzMQPJhl+qDDJu/lBLB+nY0RY9/O1h8OaZKyCBJtt853xfTfzjVdIrJkrGkXT6P1sE9+BZKJDgoguU4cZ3Ag23iIfUqhdTHCu+Lb/nNnQ7UxGk0S10xIvR/Izc=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=sancloud.com;
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:61::19)
 by CWLP123MB3764.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:94::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 08:39:47 +0000
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::dc2:e929:76be:a8b0]) by CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::dc2:e929:76be:a8b0%7]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 08:39:47 +0000
From:   Paul Barker <paul.barker@sancloud.com>
To:     Robert Nelson <robertcnelson@gmail.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Cc:     Paul Barker <paul.barker@sancloud.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Marc Murphy <marc.murphy@sancloud.com>
Subject: [PATCH v2 4/4] MAINTAINERS: Adopt SanCloud dts files as supported
Date:   Tue, 20 Jul 2021 09:39:28 +0100
Message-Id: <20210720083928.10404-5-paul.barker@sancloud.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210720083928.10404-1-paul.barker@sancloud.com>
References: <20210720083928.10404-1-paul.barker@sancloud.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=808; h=from:subject; bh=XLl58wwGYEXn+NR+RLsmqKjZzwfScWDWVHpGqc31xyA=; b=owGbwMvMwCF2w7xIXuiX9CvG02pJDAnfuveE3w2PSCubaXx4/r2Cn3Uyl1uTtF+fS7vwjU+o/SPT tI8cHaUsDGIcDLJiiiy7Z++6fP3Bkq29N6SDYeawMoEMYeDiFICJ6D5gZHiyNbq9eM4RTUlZaxF+n0 iNPZ7s92+2v/lnnC0pw+5Yq8HI8K/t6mmvbZlfzyxc5atgJ32b/ZzFxjKOuT+yRYwLpi49zQAA
X-Developer-Key: i=paul.barker@sancloud.com; a=openpgp; fpr=D2DDFDAE30017AF4CB62AA96A67255DFCCE62ECD
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0219.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::8) To CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:61::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from owl.home.b5net.uk (80.7.160.81) by LO4P123CA0219.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1a6::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26 via Frontend Transport; Tue, 20 Jul 2021 08:39:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8a483a4-d60a-441d-cf90-08d94b59ee2c
X-MS-TrafficTypeDiagnostic: CWLP123MB3764:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CWLP123MB3764994386A9CFD3201472A893E29@CWLP123MB3764.GBRP123.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:272;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XiTEpYJHJhm245UgbsorBbQKOzZ5Bp09CGiY+LAFNHTIbiFcFwPcDKUBsE12bQU9Y/57vfhdkdCXY8Fh+6XS3p/UIvdpiti0A/29mf1itu3irbzBuHnYC2UUAvIhiclDnnogwt17gXJbP3MaAhkGnU2JRnbOLKEXPanK9PnhmdRBrohDNtD0PmxBFuyXAZN4tuDL5wmnIVpQRa05TEWbzQndH9lCtLhUZXdAlgXBAGZpnAzECNPf8R4YxjreAo1jYS6Y1DLPvJfiTIUOK3EgNSH0TRuqXArDbp+ii6zbp7nNKOOXOgLkpILcEb8zjtpgxiWkE3uClvcZIp7yrJLLj4BFOlitHv+LcJiArFTdQoP/zkhyn9gtDsG0o+AOyviS4PZqXGHF1s/cw//gHowOLYMYdX/odNXNDXeooJODSiSpI+ZufhH/UDMjmz3KcGC6qDxidJs1q0e/dUKMHp8v19GjdgnIaWs9lP8hjegJQyq1afm3I8FpP4PWQ+SfS4iVnQ6nH/iPKTziKGRDjwCvH0Inp9/etvtCkYMpWe1FvSN0udLqVviUhQxTFj6FtKXb5B1IvuQYCAgQYfaRFfztiXcRbeYkGbDytCL3tHdQp8l+jdT7P0zWzJH/6oLilrJwuixvVmI6hBP58iU7j34IwqgrUg36o8tgjqWK+jz5zPEgaLYVsuP6fKkLvGIAyOhQdAl6ahkwkBxAZsdhe/2/UQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(346002)(366004)(376002)(136003)(396003)(39830400003)(66946007)(6486002)(110136005)(26005)(8676002)(54906003)(6666004)(38350700002)(38100700002)(186003)(8936002)(4326008)(316002)(66556008)(66476007)(6512007)(2616005)(5660300002)(36756003)(52116002)(956004)(478600001)(6506007)(44832011)(1076003)(107886003)(86362001)(2906002)(4744005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gstwx2MaW2aWhZat16jk3rpW4GOm8jkIRIhXnE5GLkme/DcLD7r9+2WfcA+j?=
 =?us-ascii?Q?E5U/VxBed7aAN3lYel4u8Ffw20SXqfDchQQRq44gIJxSGYTqKaDE/w4HQkaY?=
 =?us-ascii?Q?xG8NwnDghmdsX7+kzucsDXqXJEoG6cv5sv/KzzQdctaq/RvRmDNRGSU4+llx?=
 =?us-ascii?Q?ROuLL41OApo2zKnUPr+kAW3wVcQ/PP0iAxntSa7QHmzHpKGt3dULJhCQFT5y?=
 =?us-ascii?Q?Buqt+mLfTdaLY1In387qNmA5RgMertxTQBADMoQXxBxfRF4DJd/t253TE0p9?=
 =?us-ascii?Q?bGeVFGi7PTqg8W8jwUOZAP74JE+k9rW4ambPEMvsjnfAFFOrf0SItNLH6+kD?=
 =?us-ascii?Q?ME2bRP0g7mfC9szbmuBaw8r01k3kzeMYOh8eA38vJG7JkFbOOxLtJ2WOusmL?=
 =?us-ascii?Q?j9/9rs7I4amwQHjJFbCKADTzQyOXQpgIrXvbuIm/pfSZtPAx1CGtTE0Z86uG?=
 =?us-ascii?Q?eCSAgNmeuUsoJDthFDNhOVpFapFiLI2VwVgxYtvzvmqG+ZeSaKtdaa7n9UYc?=
 =?us-ascii?Q?zaJQzC38EDOGhhJbRYn+fndvajYFJfux1ApNX7gBu5KMp5L3TqHTHcoW1rp4?=
 =?us-ascii?Q?Iwiw2de9zseBdjj5xA1+7blklTV0GNwQu/9N1n3hgC0KP8ezV/MVmQHpSLK1?=
 =?us-ascii?Q?A6knBgmEUeVy0RrDB16eWjpGgL7DW+41kVGZniu9PhKgVObIGJChQorsIiUq?=
 =?us-ascii?Q?1YVS2rTYCZcdX84mYUdJB9p5EPfqXG7kMaN78TrYDq0xYV2T42qIkLY6VWzu?=
 =?us-ascii?Q?vwG6AfKxCl1zBh2kR2GTwEt0obKZ0Q0j8P92jmMKmSW5u7dPHJha5QR9hIPp?=
 =?us-ascii?Q?TxNgFnNJjS/93SpDdb9qpNihnyDDyEYIk4Ykt9h1AHepHSAms5KXfPnvsjrS?=
 =?us-ascii?Q?67dQD7F8YIf/lcxaYOogafuK11U9Qfl3SNrrUxWJxslHKxySyK9E1wvSnJNL?=
 =?us-ascii?Q?43OGaZi2IA6PowsIQi3aiE4fbbEIFCYkmmg5dS9KJ2fzJ5aLySu6WAJaCH0t?=
 =?us-ascii?Q?QNT0JAAYBszfxXBsUxJaaNDUWQDQyRiFO+2nlv6qLSX+BV3P/j+sJMaiLTQt?=
 =?us-ascii?Q?ZAywex1/Nx2tuT31zvz1keiKWz+lj+Z0cxVjr+yNiEcSNhD0EOIMY7KWAJxf?=
 =?us-ascii?Q?RqgczesyaysfVq2p4k28SOpovghYwMIZC9AlRARHfjKEZnOELoTDidb7+i/R?=
 =?us-ascii?Q?AYl0r1RKdhp3N9A3sRj8cRboKc5gfzkJsRr9rmb5AwxCCjXaa05GWQRP3qiS?=
 =?us-ascii?Q?+9oH7yB3wFuSwC6u1N4E8WnxQx4PYmWDB14RKDjEqk006QqUw52azgJO8bQV?=
 =?us-ascii?Q?pYSD/Ls7qXS1G6l0UgO7REem?=
X-OriginatorOrg: sancloud.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8a483a4-d60a-441d-cf90-08d94b59ee2c
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 08:39:47.0911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 840be37c-244a-450e-9bcc-2064862de1f4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lkf+IIgpL0MRyVNyWQVuH739wEh05LoxWTjzzkO1+kAklbmmxRkeAGnJo0EzMyJWbFiKDqW1Uw7KKmwjCs9bH1da5Jkgzq9VvIpA2Fnrw0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP123MB3764
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
index 6c8be735cc91..b9c893ea45fb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16447,6 +16447,12 @@ F:	drivers/phy/samsung/phy-s5pv210-usb2.c
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

