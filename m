Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF3B2C4ADC
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2019 11:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726038AbfJBJyq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Oct 2019 05:54:46 -0400
Received: from mail-eopbgr130090.outbound.protection.outlook.com ([40.107.13.90]:21412
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725765AbfJBJyq (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 2 Oct 2019 05:54:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Euwsstl536tWOpXinu6NAqKTRxfyMZXNWAUWjVooiAMh43mMUEzWUmFkpSB/s1IO7xMu9mrp/eNUckc+1REb4xTvgtCRXxD489Bp1MOJUh/VTlB9dhXdJ25hFl3yJ5N35xqyMSMyZjvdaXbBP7tKqHEuTYzInIJy9RhNeP5fVe9e5r5fULLKSghxBMqJIp/9Dj/at3iMSn1UKfBW6WDY3v8H/vKZ22CpF7h88LR0OAtH+EWhUEmxwXVKxqu3fVLHiM6u1b/ZMK5j53LIl5QrIT4cLFz53+YHiSxr/dSGuYmw4ly/raRmMRZwccZNVIQTmiqWrguQZtyd1bSFoRFomA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QdtmTh5qtPzh34SA+YSt362Ksvt6EU2GpMlX9eOaf9I=;
 b=DLDcblhUOGsg9biwyUChANVRYIqxNkvlUvY6qrbS9RaueqrXCpFSHZH7Zrmy7FxKfXzi/8iXka3Jd38ikTN7VdatOVrATuns/GhkKHZiGjhhKfjv+oW8aVoNXm+eSXdGrHBVMRa0qyfk6LaICE3OqbtWTW3lTo8ARzfjrq/tQ3s102sA6tG7dDY1i/KSWgtoVw2B8Ws9ENnqf7iKAPxeI3FLij/+25XUVKMzFrPZuD31m5H9TvUunaatwfOJpX6S9mBeu88SuYzXXxeJ5ToE9RjlGX14F3SgrWl51aJaxtl39vgan7c2+fKJzn++wJJ4BWWy7POicfNY3IC4m9fP1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=victronenergy.com; dmarc=pass action=none
 header.from=victronenergy.com; dkim=pass header.d=victronenergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=victronenergy.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QdtmTh5qtPzh34SA+YSt362Ksvt6EU2GpMlX9eOaf9I=;
 b=TB3zyZOzMnNoO1une42o4E9NShNn9gf24CbpMIpgKAzaVR7fpxnO4sbwExPCI9sHj9dmkKHztW1IdRFHKhg2heUMnW39WXJoreQ3iYj6Q/Pz5Dbd0Kr9nLqjS6axnlZO1OQpqFuS8oOWS5ijpnCK5SUCUFtEbD+krDNs/ZqvIMs=
Received: from VI1PR0701MB2623.eurprd07.prod.outlook.com (10.173.82.19) by
 VI1PR0701MB2656.eurprd07.prod.outlook.com (10.173.82.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.9; Wed, 2 Oct 2019 09:54:41 +0000
Received: from VI1PR0701MB2623.eurprd07.prod.outlook.com
 ([fe80::dc92:2e0d:561a:fbb1]) by VI1PR0701MB2623.eurprd07.prod.outlook.com
 ([fe80::dc92:2e0d:561a:fbb1%8]) with mapi id 15.20.2305.017; Wed, 2 Oct 2019
 09:54:41 +0000
From:   Jeroen Hofstee <jhofstee@victronenergy.com>
To:     "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
CC:     Jeroen Hofstee <jhofstee@victronenergy.com>,
        Koen Kooi <koen@dominion.thruhere.net>,
        =?iso-8859-1?Q?Beno=EEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: [PATCH] ARM: dts: am335x-sancloud-bbe: Fix PHY mode for ethernet
Thread-Topic: [PATCH] ARM: dts: am335x-sancloud-bbe: Fix PHY mode for ethernet
Thread-Index: AQHVeQdofKkOWkby2kaW5oWVx4ahWg==
Date:   Wed, 2 Oct 2019 09:54:40 +0000
Message-ID: <20191002095416.19603-1-jhofstee@victronenergy.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.126.8.10]
x-clientproxiedby: AM0PR10CA0015.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::25) To VI1PR0701MB2623.eurprd07.prod.outlook.com
 (2603:10a6:801:b::19)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jhofstee@victronenergy.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e3157eb-5cf6-4131-2af5-08d7471e8b39
x-ms-traffictypediagnostic: VI1PR0701MB2656:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0701MB26564BEE5520C072ABBA8E3BC09C0@VI1PR0701MB2656.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(346002)(376002)(39850400004)(136003)(396003)(189003)(199004)(186003)(54906003)(6916009)(2906002)(6116002)(4744005)(256004)(14444005)(4326008)(6512007)(66476007)(71190400001)(5640700003)(86362001)(2501003)(6436002)(64756008)(66556008)(71200400001)(316002)(66446008)(6486002)(66946007)(81166006)(81156014)(36756003)(305945005)(8676002)(478600001)(50226002)(7736002)(486006)(2351001)(102836004)(386003)(6506007)(52116002)(8936002)(99286004)(14454004)(3846002)(1076003)(5660300002)(26005)(66066001)(2616005)(25786009)(476003);DIR:OUT;SFP:1102;SCL:1;SRVR:VI1PR0701MB2656;H:VI1PR0701MB2623.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: victronenergy.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R8RhCAb1MbTsaOvs6TtPb6uU4/aD5E4wOAbHz74yz6hIbW0W/uE+ndfmJne4Qb8KGNQIzDT4e0oZPViIm6/Hbh2xdIBBub4LZXaLd86XEktiLEAqAl5SDExRsrGqpw0PMOrfvtz7HHW7dcFJ9nNVxZ2E75XS0O9KF/oAj+9l2RKmnZU/IqG8MmDZOB+IGe6f+QV0c3djpD3Q7qV+ijn3qpuTQzwhsxX+PD+I32ZtjpxcuI0jKqTCwmsCWwuj9TOwtuyupKVNDeeGlQsdJupPKFVsjpAEPiqNKjaO+CwA6WqmheeU/clKNmtCrP1bI8G8NyBLyNfLNAODKF/7WzQHC2mMSGZpm+Sc78IOmjsNnq8WvXLFzu8TWhMSELJRu7mrQYkZfb5UiOsS0KBhxM/vUdM6xIvHARRIisPYYGcM6+o=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e3157eb-5cf6-4131-2af5-08d7471e8b39
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 09:54:40.9393
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CLInNsFEvE63r+ugzjcJxVJmBp5yCm/1R32n2pCFAwrFq/LCa22IMF73PpT2mX7rNaJk24rNNwwauwtvaVdIsZGXHctmOo08h5Og6HceG5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0701MB2656
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

cd28d1d6e52e: ("net: phy: at803x: Disable phy delay for RGMII mode") broke
the ethernet networking on the beaglebone enhanced.

The board relied on the bug in the at803x driver to always enable the rx
delay. So change the phy-mode to rgmii-id so it is enabled again.

Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
cc: Koen Kooi <koen@dominion.thruhere.net>
---
 arch/arm/boot/dts/am335x-sancloud-bbe.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/am335x-sancloud-bbe.dts b/arch/arm/boot/dts/=
am335x-sancloud-bbe.dts
index 8678e6e35493..e5fdb7abb0d5 100644
--- a/arch/arm/boot/dts/am335x-sancloud-bbe.dts
+++ b/arch/arm/boot/dts/am335x-sancloud-bbe.dts
@@ -108,7 +108,7 @@
=20
 &cpsw_emac0 {
 	phy-handle =3D <&ethphy0>;
-	phy-mode =3D "rgmii-txid";
+	phy-mode =3D "rgmii-id";
 };
=20
 &i2c0 {
--=20
2.17.1

