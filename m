Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ED62273E03
	for <lists+linux-omap@lfdr.de>; Tue, 22 Sep 2020 11:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbgIVJEn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Sep 2020 05:04:43 -0400
Received: from mail-eopbgr80074.outbound.protection.outlook.com ([40.107.8.74]:55596
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726419AbgIVJEn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 22 Sep 2020 05:04:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQKsOph624aniTIonZyWi1WNoJfwl+LEfdvfc+ym8/oEPhkx78ZjSmyTL5qA7N/m9NiH4o2dh/7Yar89iKdg/zriIuOcoViOAQQQ23143ui51Aak4D+5AUvYDdNvwzajmjos/8L7R+Y0C3lxWfNORLrvhzY1k9AIwUjMy+d05leqUXwLzR04rAI5cYxI89UcIfyqvxMg0EeZdzMhXwSHgrh9B48lE2PNRAy5u01GCg3Pj+fx1zDvhN8AeIyZbZT33LeIZpJ6+JhY78/zdiwHlnC06qShBBMr26O2vNMdB0yP+Yq/sJTLuOGO+Zw30cyMq2Mu78KIiDYzSzi9tRvAmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGx1DNgW5lV9kGjujpkPMseR2ZF3KIqYeGRaIs4Fk+I=;
 b=ja7qGoyBL+3zywd48RB5ulolsOWGqKrppfSXiLi31B5GioTR5RVYLHojy2oIUTw+wErygF2sOd9XwNhCcTt4g016tqbsM3n9xHDVspD6xNUD59wiUZywxlv54U6Pl8bdilZtbUf7VrHBoIwwiVuPh6pXj+mF0miNWzfWTxK/7u9kd5tsl28NOZsR7gGBJ6QU1cTZJAUHiUDUeeFVEiJGaCF/thHCyl+efsRGQqDUYHmltafN7OXeWxign9Zszn+MfVmBrKFZrto6lOmeJIbr2xv2HiwhEh3ZaPwvH91VI1T/n+LhGkrsfomywtuLZtDJ6Pjni2ZW3EBJmiIMvYD3WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGx1DNgW5lV9kGjujpkPMseR2ZF3KIqYeGRaIs4Fk+I=;
 b=DtMm0rWmjpQw4uEYCH2L9XneMe/MEzCKij1VwekWNDkYGocRyXSJZ2V6VkjgNv/Y8MhHldSLBAazD3iSLSU6YgeuhQIttqjpPqOivcs4RvzImZdzh2GGJK61xoz6O9bSrKKOxcHegRhOGv3bxP8pm6CmQQeIlt9MpWdLwkaPtpE=
Received: from PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:ac::5)
 by PR3PR10MB4061.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:a1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Tue, 22 Sep
 2020 09:04:39 +0000
Received: from PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4c39:b37c:c088:e032]) by PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4c39:b37c:c088:e032%6]) with mapi id 15.20.3391.026; Tue, 22 Sep 2020
 09:04:38 +0000
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
Subject: RE: [PATCH 08/42] mfd: da9055: use PLATFORM_DEVID_NONE
Thread-Topic: [PATCH 08/42] mfd: da9055: use PLATFORM_DEVID_NONE
Thread-Index: AQHWkFjz9mHOiLPz3kibJWI/rdv5Ial0Wvew
Date:   Tue, 22 Sep 2020 09:04:38 +0000
Message-ID: <PR3PR10MB4142E57882D8D0A08149147E803B0@PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM>
References: <20200921205016.20461-1-krzk@kernel.org>
 <20200921205016.20461-8-krzk@kernel.org>
In-Reply-To: <20200921205016.20461-8-krzk@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.85]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d88c46d8-d36a-459b-1a08-08d85ed68929
x-ms-traffictypediagnostic: PR3PR10MB4061:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PR3PR10MB406100D79D49CB0F2EC0AE00A73B0@PR3PR10MB4061.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:747;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dQAGvnSK1Y0OKQ7eLDtIpwsbAm/IALvbOKlwR7qCa23yrt8JHjxo/If2DTHMGj3oyuXc/xQPyK41FhLeaWV4xFuJ6Ig4kdCxWuyYH9QqrYMeAVqf4zs87ASHohAMaDkwfzO4Q6GJtHnsVI53F4N4vDkB/iFOzCkEKygBlT6EY50Z3ANq1ghWHUlx0JrIpyp7t/8YQWWmH/xCRQYOHBWlr3zVhgXqpbu+rFDtwYgPj11o+mEBGVuLemxkvOIb7yjk5IAq3eSQVFLe3vAN/OZLtj+5amQGWmtU6n/o4GtPMMjx/wG4zNqSXSwtoKnMtMpYTty4IP2qyH2xed0f5Ud9M5ZL0rAhK6pWrnNikLGENaXelxmeyR/nuaHKCWqL34ip
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(376002)(346002)(136003)(366004)(186003)(6506007)(7416002)(2906002)(53546011)(26005)(76116006)(55016002)(5660300002)(66446008)(64756008)(66476007)(66556008)(66946007)(55236004)(110136005)(33656002)(52536014)(558084003)(8676002)(316002)(86362001)(478600001)(9686003)(71200400001)(7696005)(8936002)(921003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: ZSpb2Y9MUQrbddBQVOgtbmiDJPNfJpQMhjUPvmtgyONj0u87LLC3CW5e8heC0J4Xpk9JMvW1J8k3TN+Cny0sqAWw9/jQRadfPq2AXY1Z8VmYYeytJ5IVJNxJXx3HHWrP+N/suRXsdAElJZDzsQPRiVWAkuWxCK4omSndhRA2QFep7Smz4bElWhaZhFa26O9XhKp62daCcDB+6uwMhaR1clIJ7WOBdlfLaYxg7XhsNKWS2tm5wm13PkKQvvdnA7vnev6CqFmnHYJS8IHKyNxPGCUEOMeQsQ5IhDCGAsoN2x6uOurcjDrAfnu/Keq2xJ+5Abm1vaGHCBes6Xa7sG6dQ4eDK1s+0pvhNrrwSf+AM0ECvYi92zWzgzVJf8jz2/Ef2Y7yuEjags+OXxr0WxH91cEJSDhRIVJxkl6zyAxcykpE31qm7ox7SZV8HvLn3uQqtHDbXFtrIAoEdLrk/UdvjfBDiFiyCM1I4LpBa/OB8N8OXQ3IoEcxxPNZ7jDkim8Ynluo33Y4jDmNMuKfynf40ZuLvqK59f3pgEWf5PSrmG3etlYyPBxyxELNyLe9670EAFu5wpeqGJHiKoDVeNQ+4AZE29G7Bhip4e5veZZ1EvwIulKF18OOe5edvXZnh6JkGkwmHp47daVj2/58zf3afw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d88c46d8-d36a-459b-1a08-08d85ed68929
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2020 09:04:38.8088
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NtqUQJKZ4M87VJ+Hj50jQnQ2D03FZaVZTc4eFC6WS8krlPu806Quj7CN8ALvSnyLdzjGa8dC2U3mZEqEg5AbbBQAiBhJjjd4GEOxwwVx3n4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB4061
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
