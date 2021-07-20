Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 762AF3CF640
	for <lists+linux-omap@lfdr.de>; Tue, 20 Jul 2021 10:40:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232727AbhGTH7L (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Jul 2021 03:59:11 -0400
Received: from mail-eopbgr100098.outbound.protection.outlook.com ([40.107.10.98]:10959
        "EHLO GBR01-LO2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231665AbhGTH7I (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 20 Jul 2021 03:59:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DSQQzhdWFGSYt/wyxs93GL+XiiRvUnKfMLrlnkfJmNNUdJJIsOQ0y+4kTGZ4CoOMAKUpdHxhFng66dGjOwEFugkV2UhEPyF+F3wU0xvkFfMGRGklwDq0RXpL2I2pKExyNnVIC4ZwUsXVhAi8a51ANQPxV5SFTcci6b50JELxetqoP5B7j/IvsHYO8iP83wyHjKYKgkyct1IYqHkiviBLr5DTT+uCsY/i33XoYwGCzq6KK9jqGPb4QVBQ4QFsL8/3T2xKVLiQeFlT1vMNDKrwxddvaKY/gR2PU6y8589mVnPtLoD3QINu0ZkgT1i0VgbgnM/G87VopdtPBACxyqTyvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WFFJEu4OVvT5fDHHJSlHUC5QZC7PxFWggNaj+3hOmaU=;
 b=CUMWAS9sXsgOr2127gVFbiLJRzb5JqCg1o6sGmQpc3qWWS0hjQlgfR2rd70+KVaJu8Bq7nN3sJAJwMZtmecLsEyHvkTnVzFsoMDnA1Qr0ITOO3MgN/9p38IPy8EWmX877YQTlJbzXzB46KvHJo0lWEkWUkfol8i6RDfUefGSHpI+cbWtbOEQHZPekkSy1KkFLwdWt76jyod+qZ5tAOVp7RGExPhrBa/enTk4die5X6GaQM9JN1AIAQ6FHgdtqQEPUTAiiGEZBMLpEpgiuZ2jDFPWH0E6xueRKpxT7TIskRXZ8oHZVrpl/g01de1jPX045BGjAd2+mGpipQsSR5YF4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sancloud.com; dmarc=pass action=none header.from=sancloud.com;
 dkim=pass header.d=sancloud.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sancloud.onmicrosoft.com; s=selector2-sancloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WFFJEu4OVvT5fDHHJSlHUC5QZC7PxFWggNaj+3hOmaU=;
 b=DcfgBUcXpilObG3hewcJFa3qwJwA1plTPlme+9Pb4/tM0rgQ3rytN1WyarDGaYRmkcF2Lyl4BbXJO85foGtwTZOvEi7TtanRu7bXhEE/ENjzG14/u1JBqFbm7HbiC6kw4jT4Z3IJgPSio1HSp7Nh7AwynkdvNzF4GL5GTS4ot0A=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=sancloud.com;
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:61::19)
 by CWLP123MB3923.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:a9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Tue, 20 Jul
 2021 08:39:45 +0000
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::dc2:e929:76be:a8b0]) by CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::dc2:e929:76be:a8b0%7]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 08:39:45 +0000
From:   Paul Barker <paul.barker@sancloud.com>
To:     Robert Nelson <robertcnelson@gmail.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Cc:     Paul Barker <paul.barker@sancloud.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v2 0/4] Add support for the SanCloud BBE Lite
Date:   Tue, 20 Jul 2021 09:39:24 +0100
Message-Id: <20210720083928.10404-1-paul.barker@sancloud.com>
X-Mailer: git-send-email 2.26.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2243; h=from:subject; bh=1YeaBD3D5MKMUtR2QyDDhsHKkhEnC94VvyQRtyaGHjc=; b=owGbwMvMwCF2w7xIXuiX9CvG02pJDAnfujcEfs24kKT18tm7a2Y3vTfcSVmRZb6C+5CZavSWE56d Z/m2dJSyMIhxMMiKKbLsnr3r8vUHS7b23pAOhpnDygQyhIGLUwAmcsOJ4Z/tutI2zfwC94dCJv/mX4 7/xex2MnPSrPJ/OmstRdOYzfcx/JXcbvRzmmqzm8bPGwu8C0ylCmZwVB9ZEnz2SP+k/Ct2bVwA
X-Developer-Key: i=paul.barker@sancloud.com; a=openpgp; fpr=D2DDFDAE30017AF4CB62AA96A67255DFCCE62ECD
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0219.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::8) To CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:61::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from owl.home.b5net.uk (80.7.160.81) by LO4P123CA0219.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1a6::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26 via Frontend Transport; Tue, 20 Jul 2021 08:39:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59f164e5-50ce-4ec5-3e22-08d94b59ed19
X-MS-TrafficTypeDiagnostic: CWLP123MB3923:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CWLP123MB3923D0B253B1743BBBC4AE7893E29@CWLP123MB3923.GBRP123.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mjmr9VsuxW+v1CmqIROxx8T3fh1UtT9Hrvh9A2J1TeJq+yIavQGten+8Ok0XkFSwF3CutvPNzangHXiWwBCLAsCqV5dn0zLjUp8p8WBMOLdTNfMJEsCBfOHnbFsr1TqyCMuIJIiyO+rqCSsjcqkh9rmt3SMVY3JV9AHH9vLvrenChCVORlxxZ+KdRIDbMQwl8TQjqYteRw/JaJdP4GP1juMNo2f2g3VEit9eEen4LGXJsTgmD5s6WsdrMf53/8MTUY+Kr830RZvmIBk+PDKaqpRRZTft3hI5qqEywQzic/0bHDa9HXnm2TwmWaCYi4W+M9qZxJ3bQhOr5EwrgWrm2Rf6OsguOUJlxqJS2ds9daCaAx8cwU/WXhz1th6JNHeQ9IYSTmuT3QMq05pYifkrvgyrvhIAsMRo4yrVcYUE/p7Cv/XLyWNZyxSC5TfQPMcW6ofrWPO7H4yvZdvc/F59nkkjaLXcYlFETOAjLlTnCBH5wfqRqcCP3yCvssrs47fsrA44mvGV4n/gMXxQtRkf2UUbRjR0InR1X3rmtTkFYO5EeeBZyVvTLl1zm/1ms047ErcxHgMtX/w8PLbslFVARUcSuvhYCgMfBZplF1dudfXjk59D5MUXdgC+UnF3s64AtGB8ZX/4xbSLhKunEXTyTOUCVDGUiZK+clOrKN4EJEneXDTyCAEOG4/W16zeWN9yuXqm+1/EQr4aSbgIfIK0SQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(376002)(346002)(396003)(136003)(366004)(39830400003)(478600001)(2906002)(38350700002)(26005)(44832011)(5660300002)(36756003)(66476007)(186003)(83380400001)(110136005)(66556008)(38100700002)(8676002)(2616005)(956004)(4326008)(86362001)(1076003)(52116002)(66946007)(316002)(6486002)(6666004)(8936002)(6512007)(6506007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dUPXq1scPHFvYo9/aJxGsdr8K17Pqi1gJNnws6XaRC7GgWjmPbq4HWlgaaW8?=
 =?us-ascii?Q?L26H/PsqsSkrpgUzmDTfY0xARQRqjKy8EnISx/vTSl4krSqkDqwWQyKfE3fz?=
 =?us-ascii?Q?Hzk4ZBNsVzHcSMGdBxYCWSrRwnqRsEeQgxvl6ReDrwrRO2CIETWHpywy4Xz8?=
 =?us-ascii?Q?lKdcQIjjBEqkXfesszo78rBnCc6Oon4xAmDdd2P6/FcMOmGqI7p7zfG87aBR?=
 =?us-ascii?Q?7j8lzt8stiwqaYzjV2CISxnB5XmZA1qCYddfhVo/MACSV5wvjMypA/qDZQLq?=
 =?us-ascii?Q?coyzcpOyV2zV+4WDZgRzPbUmkSjLkVaZKLhfxouWwCsbQ59c4nEUiRQwneoZ?=
 =?us-ascii?Q?snWMqOi8pUyX0tuPNMazsdqtV5VOsiG/MNwm1bvpuowuMqlPXDoENnhQ238E?=
 =?us-ascii?Q?1THm4SXos3xRsfg1xlgTEOlS6hOXSABO7hswuaccFoxRSlo6JhA/IMVcGa//?=
 =?us-ascii?Q?jJvthqVEZJD/U7Gg8mUFJuUiiZntXa2PrTYon2j3I/vNLHTjNH9X5WTdOBRb?=
 =?us-ascii?Q?uvedE6RxtRB81Eesoc66tHgjh74kZSmidxhgXDkVeIMcCHpf+o/WzlD20Gru?=
 =?us-ascii?Q?I66n8ueIw4JEzr1PTaKb06xSX6QnpDNqBTJFcFtjgZ3vn390mH2d007YCTT6?=
 =?us-ascii?Q?eh+LiCwPwUyU82WZqu8IZrAQRb6sMg+wtgp0+PfpSOILbp9WPBLI+IHDKWJk?=
 =?us-ascii?Q?PBmBTYfujL+QIwZgCJt71v5LPm3NMbED41yDvhodMGLpUURLaYm4oKw1b+LA?=
 =?us-ascii?Q?dm7o0BQtPg1RCTq9an2nmgKUgAWNt08jt2C500lQFahNQDMvv6xOLzXd7ZGH?=
 =?us-ascii?Q?zY8q9dg8+hAyIczd9Dw5mGxwW61VDunBDr+P0jo0fQ2m/SfY5mjxahSW26KP?=
 =?us-ascii?Q?8/wACqOTRPyOzYoO4lCCBRXBcS8NKfIMUPcP7rzEkXHaQqd6zANJCh9VPXWt?=
 =?us-ascii?Q?jpKpUClTlwW76aUeB7Ueyi2A4mjHjXsRlgx8Z1XS0z5SSdrfdjYF8pw+DcNI?=
 =?us-ascii?Q?0iQ2eW6I8tcSWtHINmEAyoF2Wn/gKe2acUk7kdUxAodlHe2w5L/1cyW+OzKL?=
 =?us-ascii?Q?qU/wktKm9ckHZfSI+n4dPxAxXorKB1APlFwCTe+N/kupr92ZK5IwT00QFWFc?=
 =?us-ascii?Q?AvN8ZrAZ1xVFsG3CTnwsDeSFxlimH82rFwQSThTkIaueWi+8rOWKCRCYh+H0?=
 =?us-ascii?Q?J304PTqOpioDjHW8ORLEXcy3yvdg7SXXFgAj+R4KxwaFm2cE+J3Xfdd8HSXb?=
 =?us-ascii?Q?vIMP1Se4UqYsrP6iJgxRrIQFe+JCFVKmWSWoaz7abur5Nq++c207JN1uV2nI?=
 =?us-ascii?Q?Bmyl4C0NcX2ZFuL7LZckbRvL?=
X-OriginatorOrg: sancloud.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59f164e5-50ce-4ec5-3e22-08d94b59ed19
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 08:39:45.2582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 840be37c-244a-450e-9bcc-2064862de1f4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NvrINMXTvQEJ6ZK+Ey+6+Zw/x52eDTTAJq7vDiWbnxzacZ/HzakhQaD0JMKGvIVym4huI7kju7KeSJeEJBkYRzdLkwAGR+um5xFnyG9xdWA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP123MB3923
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The Lite variant of the SanCloud BeagleBone Enhanced (BBE) removes the
HDMI encoder, barometer and accelerometer chips and adds a Micron
Authenta SPI flash chip.

The device tree entries shared with the original BBE and the BegleBone
Black are refactored to avoid unnecessary duplication and avoid having
to override the status of nodes to "disabled" in any of the dts files.

The final patch in this series adds myself and Marc from Sancloud as
maintainers for the device trees for SanCloud hardware. We're happy to
review any future patches to these files so that the SanCloud boards
work well with the mainline kernel. We expect the patch volume to be
pretty low and we expect that patches to these files will flow upstream
via the existing OMAP device tree maintainers and linux-omap mailing
list. If there's anything else we need to do to adopt these dts files as
supported please let us know.

Changes from v1:
  * Dropped symlink property from the spi channel node, this isn't needed
    outside of the BeagleBoard.org tree as pointed out by Robert Nelson.

Paul Barker (4):
  ARM: dts: am335x-boneblack: Extract HDMI config
  ARM: dts: am335x-sancloud-bbe: Extract common code
  ARM: dts: am335x-sancloud-bbe-lite: New devicetree
  MAINTAINERS: Adopt SanCloud dts files as supported

 MAINTAINERS                                   |   6 +
 arch/arm/boot/dts/Makefile                    |   1 +
 .../arm/boot/dts/am335x-boneblack-common.dtsi | 135 ------------------
 ...common.dtsi => am335x-boneblack-hdmi.dtsi} |  28 ----
 .../boot/dts/am335x-boneblack-wireless.dts    |   1 +
 arch/arm/boot/dts/am335x-boneblack.dts        |   1 +
 ...be.dts => am335x-sancloud-bbe-common.dtsi} |  41 ------
 .../arm/boot/dts/am335x-sancloud-bbe-lite.dts |  50 +++++++
 arch/arm/boot/dts/am335x-sancloud-bbe.dts     |  92 +-----------
 9 files changed, 61 insertions(+), 294 deletions(-)
 copy arch/arm/boot/dts/{am335x-boneblack-common.dtsi => am335x-boneblack-hdmi.dtsi} (90%)
 copy arch/arm/boot/dts/{am335x-sancloud-bbe.dts => am335x-sancloud-bbe-common.dtsi} (77%)
 create mode 100644 arch/arm/boot/dts/am335x-sancloud-bbe-lite.dts


base-commit: 2734d6c1b1a089fb593ef6a23d4b70903526fe0c
-- 
2.26.2

