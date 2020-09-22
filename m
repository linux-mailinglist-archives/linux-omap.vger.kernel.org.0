Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37582273E0B
	for <lists+linux-omap@lfdr.de>; Tue, 22 Sep 2020 11:05:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbgIVJFs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Sep 2020 05:05:48 -0400
Received: from mail-vi1eur05on2051.outbound.protection.outlook.com ([40.107.21.51]:9185
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726591AbgIVJFr (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 22 Sep 2020 05:05:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kxsgmU/koY0f14+8+k0/lb3Z7YTIPQf+46WWV8J3lDOfOD2RtSjgjoySOVWDz96SRa7sNxZ9PFDOuuKGKQWq4UHeIu2Zq0NBZoKljd+q3dzY5Ys1PRgqXR/2ddPzmcMG/am/1vHUKmyjP8CwrqDN9z2l8AovZng7fkKw++MfOD0HxXIXbIGpOV4GgqaNKFr3Hb903a6edRB9dR7A16rqGv56E6AvEh3y427clZO9HFG9325mpdNlwrk4rIYejqRZHL/fR3RdkQVLvaR93tIkhISRlivuOafeHo2HvUDqXiyYuh98QFfvY80vM75BvksDXFXYV1Vgtwso8KSUmp3I3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGx1DNgW5lV9kGjujpkPMseR2ZF3KIqYeGRaIs4Fk+I=;
 b=FySBz86yX48gXWljt/4gFjNGq9S8S44iQnoE9Vb/jQoBGqWehYxTYoMyftuFYSEaW63oKkdKprCSeQGg4H+7OghzrZVxzlaVaYzQmvfP2Z5VfQG82o/SMh1XZ7EZeB+eyKHJf0Y4d2WHVY4AlCZE4tMmmZStvRkdDZwN0cc4fbcSamHFEua2T5msBjlnspM+9L6V3J+aPbgyykoXmJVYJrdudwi9qeo3ON20despHFsaEeLHdVY9F7gdw9Z6IU83mFy+T7mi5caTH7mQm0upliiq7MJkqAXvCXPW5p1zALQpA0/FKKcfAehucXgfDsswflEHjq3hgF/4UmlG6en26A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGx1DNgW5lV9kGjujpkPMseR2ZF3KIqYeGRaIs4Fk+I=;
 b=Re9Oci3MsZMUMIPrrSZdKbZCmhoDTkpockycwur4UW89FWBnhuCLtOKEe0uoxwPJE77dULovmYbC7G8xh6d+DF3AtQ01VcGtiBK2aFq7vNKO0YgJna9+rqi0v/AdtANf3euInyOu/o6hIqIiGCTEV5kmr1wbQUxShmUGL77fRWA=
Received: from PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:ac::5)
 by PR3PR10MB3801.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:49::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Tue, 22 Sep
 2020 09:05:43 +0000
Received: from PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4c39:b37c:c088:e032]) by PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4c39:b37c:c088:e032%6]) with mapi id 15.20.3391.026; Tue, 22 Sep 2020
 09:05:43 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Support Opensource <Support.Opensource@diasemi.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Milo Kim <milo.kim@ti.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sangbeom Kim <sbkim73@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-rpi-kernel@lists.infradead.org" 
        <linux-rpi-kernel@lists.infradead.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: RE: [PATCH 09/42] mfd: da9150: use PLATFORM_DEVID_NONE
Thread-Topic: [PATCH 09/42] mfd: da9150: use PLATFORM_DEVID_NONE
Thread-Index: AQHWkFj3sk3M+k8zRUiJ+khIKIk3fal0XihQ
Date:   Tue, 22 Sep 2020 09:05:43 +0000
Message-ID: <PR3PR10MB41420C65F853B8BC740B95EB803B0@PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM>
References: <20200921205016.20461-1-krzk@kernel.org>
 <20200921205016.20461-9-krzk@kernel.org>
In-Reply-To: <20200921205016.20461-9-krzk@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.85]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c00cc35-6737-4a17-5b94-08d85ed6af80
x-ms-traffictypediagnostic: PR3PR10MB3801:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PR3PR10MB38013E9BA070F825D4258926A73B0@PR3PR10MB3801.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:747;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4Rpfa33D5JSqzGxckLi0Fx0ZiTa4/pj/VQeL47KPmtD0XEBtTGXxWwXtgPecswn91MaY7plVWvxyLLejZZoIee7mAHloWHH+l3KVRfcsOpyJTMFE4C9rEj1wLG+MbwAr0d5+nvldjpwEtviscgKdyPcM5mg1PxWHH/txPkjILDjpPGfSPV1WBoK+fAXYpjM3zEs5wd9BnQKzalb7zG146iHaFGgIjR2EQTkw/xzhWfRV1ilQufhc+4hHFoYwuh7kO511anGMg0TRf7tVx2sW5syfLpxD8cTjoLfhz3mZ7eYzovrtX4+DFrBTgXYJrqXMdtrZH8PWnh+aMNTtK0AogdjQ9RvynsUUjNMEr6I4Nfy4jJAkBYPuJ6jKemVyqPTG
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(39850400004)(346002)(376002)(33656002)(52536014)(558084003)(5660300002)(2906002)(8936002)(76116006)(55016002)(9686003)(8676002)(66946007)(66476007)(66556008)(64756008)(186003)(53546011)(7696005)(66446008)(55236004)(6506007)(478600001)(86362001)(26005)(110136005)(316002)(7416002)(71200400001)(921003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: J7upv0tggL5ZS5qPiEVV7YCnJT8m6aer/UnT194Wrf1s18DyNeG8480vod+VgWPUR6YIl2yIEgtcdyAEiZ/ozbhMbNc9vZqIoqDBX/ry93t4FYp/QuJ0ZyZxpLoy4Y073l8ZONieJyNE8eOTzXr38xI7rgFycuQ9FzkdAxOchXmmPwv1tZSV9btLRhkgofVsI+eO4Tzz0YQnIrz9AxhCMZ2/Wy4Pw4f1xu1OFjs7R3Rn08XOsgBcFywLpXQ9ZbySXCJ3roDj7IceNYpSED7/tg9MwoNmn3SyOojPDvol6uPiqQ+ukKfJUJISBTtpjPNRjUtwTt0Jmk4g/onxOgq2H427d/Amoeyv6DMbPmaLVSzh0/jWS15ylQqXZZ4sZIsQQn1X8B96WxGUImITcdZcsHR6pZZC4mGM5wpatvz7A/p2bDTFtuFM+oNm8I/MSAlmBuuQB0ykybtLoYFcriT+y1MPaDKZ1B0SDEmYtITeJyhNDH14aK9FfI7ngvrEqnr2H57Th2hakFUHfGww06kAuQapav1x7WJd1via8JahlCGdxAX21umKRqCXAwr60GG9F5PBJ8dclWKQwlrGADYaEeBLS1qlg8ckvszlR+Aohm6ZnIaS7MPljVCD1Uzcdw1fVcGHL0TH3KTf0Vqi2VGY9A==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c00cc35-6737-4a17-5b94-08d85ed6af80
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2020 09:05:43.1460
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r2eKM7C9wJMPZBWdM8091/Nmeks/5hpu4JkppxKgR1TF8/1sPFidDeTrA6/TJO5GtPiVNHXwWyVDvrcs37NK5NQZFbHtvR+Wg8YGgs1AX3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3801
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 21 September 2020 21:50, Krzysztof Kozlowski wrote:

> Use PLATFORM_DEVID_NONE define instead of "-1" value because:
>  - it brings some meaning,
>  - it might point attention why auto device ID was not used.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
