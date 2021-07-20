Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D2DF3CF64B
	for <lists+linux-omap@lfdr.de>; Tue, 20 Jul 2021 10:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbhGTIA7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Jul 2021 04:00:59 -0400
Received: from mail-eopbgr110129.outbound.protection.outlook.com ([40.107.11.129]:19456
        "EHLO GBR01-CWL-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229588AbhGTIA6 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 20 Jul 2021 04:00:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bP4MaUmTnC5O5cv5JY9ydJIYI27c6uLI2+MUyg5PJbYlNEW/HPkJvgkkqcOzo5mSvzFaBEJsLCIv4gtCAJaiOTky74danu5bBQJOCjTm5qkuIyk9FfUZVjjVAllxkryEVkcGk7d25dgN4R6OhRJMFPgxTQrb0hRy9oAgCuWKj/5VFKxg1ShmV/4Qnqqk/v7gXNQN061zrn0kSGRZL+WfYe8XX/221X6P5C/ffkntRmmjWkGaqljrCDRiiN/7Wn974JiFac13VDFcpBeYbEFo1WZAey4MKpbTWEUsqTDl5YuWhBHeyMveWZY+edoTRPVzKMcfJKZ2VmmjG/7ohMo+9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9tj66jO5dVWtaH0rERbTckq74257x1LIQ7/yjA7t3E=;
 b=X61yyvzWOFceDGcFajYvefW4LpQwftivFy32f82aSuXdTZfjDBK/DQvJJtoTB7hWBrStBVGReIDNx7OhwYuvaJO2qnswaOTn6sn+MloA0fy4dgH8qmtHCMQXear7sRq3zbmXyR9ioc9NVHNR/zzU0OGIJNn9GSrBFkI25BQ8vWICmxq4FEr/sqdZbyl5X8IQnmIqKMNe8+ALFATGGlIQ7QMfY5gdKqKpiw91BMBVhL14EJtOueqyk8uRoOiQRJzqugNfRbZfHgrodKIEJn+b7+E38N+sI9FGezKOSj2nfDqwIBF9yF7u/dIradIcx3O1VcMjZBBULvOkGaNVAq/tQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sancloud.com; dmarc=pass action=none header.from=sancloud.com;
 dkim=pass header.d=sancloud.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sancloud.onmicrosoft.com; s=selector2-sancloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9tj66jO5dVWtaH0rERbTckq74257x1LIQ7/yjA7t3E=;
 b=J+W3+GKojH+QmiHgtD3T98zWTqZNB1mlsKbb0XWMajBtAq8a1pvtxegIkLf/qKLj9cVGVMSPukLDAapgrWjAL8hc1KoQqRNVo7t/xK5mtQ8/MSgBikQCEYlHUFo5aFcGSj5Ve626N5qkDUw45G7g97/t/qq7PU0WgQ0/Mf+n9G4=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=sancloud.com;
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:61::19)
 by CWLP123MB3764.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:94::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 08:41:35 +0000
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::dc2:e929:76be:a8b0]) by CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::dc2:e929:76be:a8b0%7]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 08:41:35 +0000
Date:   Tue, 20 Jul 2021 09:41:33 +0100
From:   Paul Barker <paul.barker@sancloud.com>
Cc:     =?UTF-8?B?QmVub8OudA==?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Marc Murphy <marc.murphy@sancloud.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 3/4] ARM: dts: am335x-sancloud-bbe-lite: New devicetree
Message-ID: <20210720094133.10006323.paul.barker@sancloud.com>
In-Reply-To: <20210629141034.2f9a2fea.paul.barker@sancloud.com>
References: <20210617093330.9179-1-paul.barker@sancloud.com>
        <20210617093330.9179-4-paul.barker@sancloud.com>
        <CAOCHtYjEn+F+_chyMQ0cppA0y=ZeHrme3c66A2Z5U6pJf9a8_w@mail.gmail.com>
        <20210629141034.2f9a2fea.paul.barker@sancloud.com>
Organization: SanCloud Ltd
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
Content-Type: multipart/signed; boundary="Sig_/MFaT197QZpTt50mFfIrjMfc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-ClientProxiedBy: LO2P265CA0205.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::25) To CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:61::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from owl.home.b5net.uk (80.7.160.81) by LO2P265CA0205.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9e::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 08:41:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5519320-9a3e-40e4-9129-08d94b5a2e90
X-MS-TrafficTypeDiagnostic: CWLP123MB3764:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CWLP123MB376467268E811B39E858DD5493E29@CWLP123MB3764.GBRP123.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lh5hOCQr4Cu5iFAzrpSAqOyC/B8EAqpy7fKDN+vnn+x+FfDAWEM5/QL6yiCk0rLJdiwHoUhizJp42htoxyc0/3OQ36aOyZh7d7GCGCY9lTcIKBFfLWmE20yBGXSxSf/cSoOmASjpVul2WCazcIE55zQxzVO1ed76DVLWWJ/Q30YP+7JB30qobwNLYrYwmLEczi7i9r/yyPjGLZGDSssvVTmCQNuojY/WabQANRgZ6EYFqKNQ1OVRJ+BKgioH7wd+ETE4r3jtb1Gn1mg8oL1adPYnEaJMPp/FqhP/+rVZbanYlPMV7Jc/76UB8d7iD08hEe6DDR0uYxCFfm8Jng+GS2hfFTgaO2+soi3itV2s1VCsrxkEzyRxO3yXCo3eW+YS6SFfJREf67zrsZYcxgpwjVBN7RrQS6FQAQrsBpBrunKWJMWQxDtSqVjTEz/yE0yRlwQ5gfoVkRTsxXGxAwcX6d6dn2grPBtlD7O1SZKo++NBcvzzGYt33FYGch2W53bbtNTm0b6RUHWDQsQSC+00hCIgAnVYK63Dn7+ouvHzqMIqxDkZ8X0TypTex5BKF1uoVANO5gErDUEs0o47bCBxU/95PNf6L79Dird4TnjNSP2cE9J0j8A+orm23p+o+jwiJjZYgltS6rozXaI51FDulkudh31YQeXxfv2dWbCjLV+fn0E59jmt/xOvzEnkNDWDuBpPn3FWBE64i15RbbigJ4sHzI3twR1EkxpUh2v8qGwVzCCGWtT7+xZRxFaXGWLKjtB8EA8TjioCDgSWcJcLPSIHNRSZI7EwXt9yxLY0f+8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(346002)(366004)(376002)(136003)(396003)(39830400003)(66946007)(6486002)(26005)(8676002)(54906003)(38350700002)(38100700002)(186003)(8936002)(83380400001)(4326008)(316002)(66556008)(66476007)(6512007)(53546011)(2616005)(5660300002)(36756003)(966005)(52116002)(956004)(478600001)(36916002)(6506007)(44832011)(109986005)(1076003)(86362001)(2906002)(103116003)(14296002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tWQg3JnTZJVgj1pZOJIKEYReQ3RxFqhlOPzXaeuE2aTxiFV4+PS+Q0wzyeqj?=
 =?us-ascii?Q?D6CUWSgMqhp1XSi1F1ABmkKW/VMKTVFXaFcmRxIdoY3WZwQxiookR55zfP+T?=
 =?us-ascii?Q?o/DXIahcaAqjEom/vrhrzWCcbFZioL9pmRKaYzTcBtaRCWXPX65v7FXSGqYg?=
 =?us-ascii?Q?39cu8b1nvPs6MixSo+Dx4uOG5c4S0gEKKw3Me6s8VMPjkvWiur7CcftFvuzL?=
 =?us-ascii?Q?XPN7Ba63PUmioXp6H8gRirOprZ/nGOnbGrywUhnWVX74U2+rLySRBhQstbX4?=
 =?us-ascii?Q?sMKwDI/GzIv7eraGyq2d1FhLlmnbE1PntBYwCd2v+3l+IrqH/qhGO0C8itrf?=
 =?us-ascii?Q?tdsbCi9e2HT8YQuA6lBSTgcOY8yZrZ0E3hdDnQw8Sw7DBw+3qp4k7ObVx5FG?=
 =?us-ascii?Q?WZdyeJ1XORTgxSmaqO3wlpuT1O3RQXz+WEh3jgvw4tbecNdbUqzEks4WA0pr?=
 =?us-ascii?Q?R4LNAw3VpU3LRPx6QnmUrtmV7GRU2VtgnJZMYm+bfMVO9mx9erbe1Zd9XsnV?=
 =?us-ascii?Q?rzixy44S4O8UJ8F+OWKjkCJUcJyYrAxOU7g9crCswfIy07lcIFWUTiNU20ce?=
 =?us-ascii?Q?4YTSX1jDwb33rFtrCicmcxEfJRczndfVRWVNMpz4TLElaEjyxvpIvZzZUvFZ?=
 =?us-ascii?Q?P3Ou7ATZY1WS5KRX+dsPa2uszaTfZw4gZ7k6/zhqSepmRGXHXHXX+vlLJaX2?=
 =?us-ascii?Q?prpfs3gMf02e1ER9MYwP3yt7AzfYUNKxFdbZFYkjmHYtna5e3JUNORTCGdfh?=
 =?us-ascii?Q?fmNs8V+eoornVoZOrhznhAdeZPoj0pzy89hlu5PCyECmqhYze9qWih86NcRX?=
 =?us-ascii?Q?FZlKuna6wdJ/ute2rGzTDGjzwJv6iAbZHkA6qONsEUhUaO5R+PZSuVosnoMS?=
 =?us-ascii?Q?MJHQG3KHgwWBYArt2TM2u7i2+RST2zLbOR4NxXNXCURDoF/9q7KMUVsk1RSD?=
 =?us-ascii?Q?mh5IStkK8sMrgdvnNiluys4H28um7kGwPj7MxGV4mg/ESJ29UbcgRV2YomGB?=
 =?us-ascii?Q?0FSdF/bEm9pjI6cdyJEPd9cmj8vWTVVG+S/dGi+ssriPVjeCZm1tEX0fDkdW?=
 =?us-ascii?Q?Y+QNutvP2sNCgSyih3rVX8tibbWYLplskPMf5wGwqmW9YtwbT8nSbHdxxodk?=
 =?us-ascii?Q?g1+xMDFUhtwZgZRonFMqoxSdO6Gg3+6v+AcPPF4V02MwVd1SI9a5EOfn/4qD?=
 =?us-ascii?Q?gFY/7zapsVQGBgWf0O2GalcvMyPB1oOQeq/EA+0ALhKpwhN/7IjELlh8VVqJ?=
 =?us-ascii?Q?mQTa1pvWSGaFx19sGM7RLY9T984voOIamzQzDY35rdrz09pox3415JqNV/D3?=
 =?us-ascii?Q?+DyjkfBL95y+RK/JnuUxYMGr?=
X-OriginatorOrg: sancloud.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5519320-9a3e-40e4-9129-08d94b5a2e90
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 08:41:35.0911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 840be37c-244a-450e-9bcc-2064862de1f4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dmxEZ5JCYSwzEGsGs7TyCPXI86b5Zk9Om5eQlhxF56Z1Eman8aV1E1FmU0B0LDXxvT9uMW0gAvN01++UG/aeP5ILlqgbBjaE9sgnIcvSl0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP123MB3764
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

--Sig_/MFaT197QZpTt50mFfIrjMfc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 29 Jun 2021 14:10:33 +0100
Paul Barker <paul.barker@sancloud.com> wrote:

> On Fri, 18 Jun 2021 11:02:12 -0500
> Robert Nelson <robertcnelson@gmail.com> wrote:
>=20
> > Hi Paul,
> >=20
> > On Thu, Jun 17, 2021 at 4:35 AM Paul Barker
> > <paul.barker@sancloud.com> wrote: =20
> > >
> > > This adds support for the Sancloud BBE Lite which shares a common
> > > hardware base with the non-Lite version of the BBE.
> > >
> > > Signed-off-by: Paul Barker <paul.barker@sancloud.com>
> > > ---
> > >  arch/arm/boot/dts/Makefile                    |  1 +
> > >  .../arm/boot/dts/am335x-sancloud-bbe-lite.dts | 51
> > > +++++++++++++++++++ 2 files changed, 52 insertions(+)
> > >  create mode 100644 arch/arm/boot/dts/am335x-sancloud-bbe-lite.dts
> > >
> > > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > > index f8f09c5066e7..8629c941f573 100644
> > > --- a/arch/arm/boot/dts/Makefile
> > > +++ b/arch/arm/boot/dts/Makefile
> > > @@ -834,6 +834,7 @@ dtb-$(CONFIG_SOC_AM33XX) +=3D \
> > >         am335x-pocketbeagle.dtb \
> > >         am335x-regor-rdk.dtb \
> > >         am335x-sancloud-bbe.dtb \
> > > +       am335x-sancloud-bbe-lite.dtb \
> > >         am335x-shc.dtb \
> > >         am335x-sbc-t335.dtb \
> > >         am335x-sl50.dtb \
> > > diff --git a/arch/arm/boot/dts/am335x-sancloud-bbe-lite.dts
> > > b/arch/arm/boot/dts/am335x-sancloud-bbe-lite.dts new file mode
> > > 100644 index 000000000000..9c311bd106f6
> > > --- /dev/null
> > > +++ b/arch/arm/boot/dts/am335x-sancloud-bbe-lite.dts
> > > @@ -0,0 +1,51 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright (C) 2012 Texas Instruments Incorporated -
> > > http://www.ti.com/
> > > + * Copyright (C) 2021 SanCloud Ltd
> > > + */
> > > +/dts-v1/;
> > > +
> > > +#include "am33xx.dtsi"
> > > +#include "am335x-bone-common.dtsi"
> > > +#include "am335x-boneblack-common.dtsi"
> > > +#include "am335x-sancloud-bbe-common.dtsi"
> > > +
> > > +/ {
> > > +       model =3D "SanCloud BeagleBone Enhanced Lite";
> > > +       compatible =3D "sancloud,am335x-boneenhanced",
> > > +                    "ti,am335x-bone-black",
> > > +                    "ti,am335x-bone",
> > > +                    "ti,am33xx";
> > > +};
> > > +
> > > +&am33xx_pinmux {
> > > +       bb_spi0_pins: pinmux_bb_spi0_pins {
> > > +               pinctrl-single,pins =3D <
> > > +                       AM33XX_PADCONF(AM335X_PIN_SPI0_SCLK,
> > > PIN_INPUT, MUX_MODE0)
> > > +                       AM33XX_PADCONF(AM335X_PIN_SPI0_D0,
> > > PIN_INPUT, MUX_MODE0)
> > > +                       AM33XX_PADCONF(AM335X_PIN_SPI0_D1,
> > > PIN_INPUT, MUX_MODE0)
> > > +                       AM33XX_PADCONF(AM335X_PIN_SPI0_CS0,
> > > PIN_INPUT, MUX_MODE0)
> > > +               >;
> > > +       };
> > > +};
> > > +
> > > +&spi0 {
> > > +       #address-cells =3D <1>;
> > > +       #size-cells =3D <0>;
> > > +
> > > +       status =3D "okay";
> > > +       pinctrl-names =3D "default";
> > > +       pinctrl-0 =3D <&bb_spi0_pins>;
> > > +
> > > +       channel@0 {
> > > +               #address-cells =3D <1>;
> > > +               #size-cells =3D <0>;
> > > +
> > > +               compatible =3D "micron,spi-authenta";
> > > +               symlink =3D "spi/0.0";   =20
> >=20
> > Sorry, this "symlink" is an undocumented "feature" of the
> > BeagleBoard.org tree.. We use it to help "identity" spi/usart/i2c
> > nodes names when they dynamically change node numbers based on kernel
> > versions or even 'drivers'....
> >=20
> > https://github.com/beagleboard/customizations/blob/master/etc/udev/rule=
s.d/10-of-symlink.rules
> >=20
> > For 'mainline' we need to remove it.. =20
>=20
> Ok, that's a straightforward change. I'll send an updated patch series
> later in the week.
>=20
> Thanks,
>=20

Sorry folks, v2 got delayed due to illness. I've sent it today.

Thanks,

--=20
Paul Barker
Principal Software Engineer
SanCloud Ltd

--Sig_/MFaT197QZpTt50mFfIrjMfc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQS7m7rT1+CktY3YG1PYN3IfEvob6gUCYPaMPQAKCRDYN3IfEvob
6vjkAQD/vuTFcL1DLcoP9GdstvMp7jHfpoH4EAb1oFun00/vwgD/Ze7IDVKfBfUx
jY3hgS5FWuKQ+iN/MyPowe7L+s9pCwo=
=VHkX
-----END PGP SIGNATURE-----

--Sig_/MFaT197QZpTt50mFfIrjMfc--
