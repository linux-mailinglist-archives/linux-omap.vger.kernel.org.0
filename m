Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE4083B72FB
	for <lists+linux-omap@lfdr.de>; Tue, 29 Jun 2021 15:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233482AbhF2NNF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 29 Jun 2021 09:13:05 -0400
Received: from mail-eopbgr100118.outbound.protection.outlook.com ([40.107.10.118]:45888
        "EHLO GBR01-LO2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232498AbhF2NNF (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 29 Jun 2021 09:13:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FYtcTzL5ngYzCOUWEdJYN431QKU72pKM7SoNRC/tjc3KQ7oqN+7+o3jWdRkUCFtmvyc9w0VGklte5Nn4Vyrv9hBkcpSU37+UUaLxlG+huZrHgiJjM8lo0sQEg0tYdyMUBbRM7tvvf9ddenI4NrucY6Iiu7L5AOvakZ7T603VydR0w+/WpdlCvFBjRlCQCAn2O+NpLYFyyzZBxRlaV/QC05HxnBmMmOLWlLn+skL7xGx14eGPoIar2CM/OgMDH9EtXK2nDxOIX3kUOPmkbhr12KLRZEd7DzGDVzBukLqWwjPPMSyyPeOr+rDv/ad9jLzFM5XZXwCpeDaAr2+WGlMJ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8YT9Y6z5M4j5VNY0vaSN29Etwx8BvNWKPnhSzjqdlyw=;
 b=UpUcJnGjLGatX/a0pYNFxsYzPGHCHnLMezT76ZC4yWx8Q+gVX7XEz9pksTtP6jAzlBCmfzWrY4tM32X+vJ41ycSoWJjNpppIADLPHNKOiRHXs6H52RU+jHW/p3mupnr16JyERJQ8Guy7SpuPJa51DIWmNmg2eNoYG5v51OXTIatN5BYqwKsmrj+0YjiAccrfgBL8PWHaYrXh7ZXvc9Ji3xwSG56xiWx8dTWhXz7b9ZY61YVN3oitq3YvSy6F7uHe39XeSgiXYGiUJi8TzYedrEPNDvU/jzHmNkZqSGqqwmfa8EDVSHkZBmqPST0E+kWoOH3F75ePE0zchZdluHRtTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sancloud.com; dmarc=pass action=none header.from=sancloud.com;
 dkim=pass header.d=sancloud.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sancloud.onmicrosoft.com; s=selector2-sancloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8YT9Y6z5M4j5VNY0vaSN29Etwx8BvNWKPnhSzjqdlyw=;
 b=auwvcmo6Z98wRNfX0xH8QCSPGcJlbAuPbXPJKRdgni1jsnwVxaCC3lUYv2/VS9TQgY0ibtvwqysBfdrw0FAEhjwNjy//hbdVa3rwtHG2hF6K5mqKOX/tSjX8/EGENwe5MejWCbSsyBoNyPL4qntxtXakSW5nWq+PLcmzM/3dCwI=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=sancloud.com;
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:61::19)
 by CWXP123MB3095.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:3b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Tue, 29 Jun
 2021 13:10:35 +0000
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c84c:4809:6da7:ecf5]) by CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c84c:4809:6da7:ecf5%6]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 13:10:35 +0000
Date:   Tue, 29 Jun 2021 14:10:33 +0100
From:   Paul Barker <paul.barker@sancloud.com>
To:     Robert Nelson <robertcnelson@gmail.com>
Cc:     =?UTF-8?B?QmVub8OudA==?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Marc Murphy <marc.murphy@sancloud.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 3/4] ARM: dts: am335x-sancloud-bbe-lite: New devicetree
Message-ID: <20210629141034.2f9a2fea.paul.barker@sancloud.com>
In-Reply-To: <CAOCHtYjEn+F+_chyMQ0cppA0y=ZeHrme3c66A2Z5U6pJf9a8_w@mail.gmail.com>
References: <20210617093330.9179-1-paul.barker@sancloud.com>
        <20210617093330.9179-4-paul.barker@sancloud.com>
        <CAOCHtYjEn+F+_chyMQ0cppA0y=ZeHrme3c66A2Z5U6pJf9a8_w@mail.gmail.com>
Organization: SanCloud Ltd
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
Content-Type: multipart/signed; boundary="Sig_/m9WJ5BecVUyDBqd.Da=731G";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Originating-IP: [80.7.160.81]
X-ClientProxiedBy: LO2P265CA0229.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::25) To CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:61::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from owl.home.b5net.uk (80.7.160.81) by LO2P265CA0229.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:b::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.21 via Frontend Transport; Tue, 29 Jun 2021 13:10:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f2f6bae-910b-4ea5-7a98-08d93aff483c
X-MS-TrafficTypeDiagnostic: CWXP123MB3095:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CWXP123MB30958EA1B21CD12EE61A108593029@CWXP123MB3095.GBRP123.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TJDG14MBsWcyJwyYhCZ2nVdGsP19Dlvt2oKFCrTzNwqvPhggqk5wq76ZD+fc8rNqLA1LNHtTj/Oa2cjOozJIndXBHCEw0KYIMVSdU7pTsBVO/tuTIWaR6i1hFS1GgM0DHPIAvnhtwk1CT0CBaeUknoy8jdGZfuOI0LUVKMxiTwKbHeZ/k4l+/mDYII96ROODTnEXpM4rNmJuBm7h+oJqgPH81cvuSwaTf9vh7fVjqVMefb97alCi5NEC6WLo512L+mOgH4e13FbrOXVzadtM2zCPNI9Jm3vBtwVmKcGaRXnLuMZXoPuaS+M5zwy70y0k9aD4SrVGXA29VIN/bNXdT2cC4zxBwkLtatZkObA/5lqFFGDHFsKwRzFXLlR4dLdm8HpFcFoceHW3vk6vW8Y/q1lCi0o/JVkFEXZp1M+bIgYJ6x/M4F8tnirQcQQqOnT3hkCr0O0J21v93NpAzN9UGtHePlt3vcgbx7fT/RPdLyVlBEqAcHexzqGzeqTa3kHxJoPF6fHBUTT8gypRiWXi68BSzW98Ily58drJm93Qq+cZTdSOK+Fy27RTKIEbeS3yYMtTnl5Dhi8UISbOU6WBYcum5oHezFo5KWIsEUZBxmKeE1Aa/wY6dDkWF0bpVjNQrwz2/3elj2qLi4Gna6Rk1emXVlj0WrggWJiftzXbxjQY14FcpdC67mZySLBdklCa3A+Qoux384MaYAwPbObdYuVXGuMDnDfuCXP/KN1QGGRcsrsv2H5ByU4bcyacEWHyDF6UvJboown6sWs1sUCzdLkzzG7XFDWnua+Ko4QRxWlGOfK+mXSKnvKBFKcjcB7M
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(346002)(366004)(8676002)(8936002)(6916009)(103116003)(44832011)(2616005)(6486002)(956004)(6512007)(5660300002)(2906002)(66476007)(38100700002)(38350700002)(66556008)(66946007)(53546011)(6506007)(52116002)(54906003)(4326008)(186003)(16526019)(26005)(966005)(83380400001)(36916002)(1076003)(86362001)(36756003)(508600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Yfb08yTjT0IUAAaGBZEVittOx+Bq0YJZeK2M470kiK199G8LPEbtCG8KsqTk?=
 =?us-ascii?Q?XNdzQzuOhPyfzKwqsq3VwMMqQIYBy12VlhIeaBUP4bjSJuKZifLf8EaL2UoS?=
 =?us-ascii?Q?H44Az/DhJo/ZpytS0orksoUaw71BpwD76GYmfNW4o9NvoKqiwN0/DqU+pMHC?=
 =?us-ascii?Q?0tzSCVbDyZ6LdFMicX3Zyf1TxuWAbc8he+YeZ+XjFFKVDEXU4leKMMlHfzgB?=
 =?us-ascii?Q?m7IgL8z75d+zIL9ro2BFujxXWRB+tTeFATen0WEEcG0o9mkYgKaWf4DEF4fX?=
 =?us-ascii?Q?z/qmJAMcxjFHLqgrWNVRZ1NBcXzjuaDCCzYIdWEFMD/ws5WxjnkujRfauEic?=
 =?us-ascii?Q?yAsv+/WPOvXalLUOYbHHzHHRDCp/vcfE9P7MM5GuD3ikLMBlvFRHVoAY6oL8?=
 =?us-ascii?Q?hAbuiSn4bMCd/9Y5blPyVWJGmrpalnzz/BQ4TNnMqmTAQx5LI+7W8blbzP20?=
 =?us-ascii?Q?resGUVdMZb58DdzIK4CCO9OliN9E+ec/3FuhZlblWcp3DYvkQmO3LuxiFncM?=
 =?us-ascii?Q?B8C3ajzyxyWIq/Zt39KftrFI20txQUAsF/j9mYpjGFCNSeJCfzCu0Q1ZDAV9?=
 =?us-ascii?Q?3OngQg63vGSYO2DqhXF3wttry9gVnHvt3OdKJPZFFVVgf23H9g5w/4FmhdAP?=
 =?us-ascii?Q?R8CB5DGrqHH5ZBuzjds9GzHINcKsxKp7M2vOU96rJIMeFYhWlrf5PlPQYAAN?=
 =?us-ascii?Q?0baQ1arAZmdNXdFLtGYwl+U9+K+6yX2M12Qht18xfHL8zyMpHsQusfMNdvwp?=
 =?us-ascii?Q?UN6fw6QUCWy96OhCx9xbzyF1Ffny7JUu82/4BEZfbGUP6UABEz/YdQbL72yV?=
 =?us-ascii?Q?y/+z4tka2fnWhmWuC463swrfSdUsn3YWEOGg57lBL0jJMb4Fss6NLVVTPBx4?=
 =?us-ascii?Q?+UIuSK7mKg67kF9wghBYrGWl1A8wT7qFmXA5+1ABvBMyUVwQ/MpxriJaUAUd?=
 =?us-ascii?Q?H4tIrvwjGgTNBD8cN6Y7p6bo5SsIJJqMo0CRCBAXsJd7o5wFcinyvHi6mJcM?=
 =?us-ascii?Q?uMFGD3+b5zQE2pjvRqpmdbA+CJAmQJVSo9HSpze82Yls2QHBPIhi3g1deTXg?=
 =?us-ascii?Q?+Y5+L3hsgoRPQPLacsct8q+j/8CbVBZZlCWz0qvM3hkQ84AF8AfeS80HPh4P?=
 =?us-ascii?Q?8WfwIqbWjMk88P7czoP5DabJker7pAVLmy4LculjcpkyJHjGB9tiSpvdm2Kc?=
 =?us-ascii?Q?XSyf4jhsK8a13nAa9pDfaLAVIfLQtkzABepDarj3MInroW1TsjU40XMepcr9?=
 =?us-ascii?Q?g1FQNwCD0FnK0wnvOF6NDsyzoscCzJM5xWREFmuR3b7zQ5nDQZk4x6V/aXSi?=
 =?us-ascii?Q?n5P/k49HtVhA/h0dJ8x4WdUk?=
X-OriginatorOrg: sancloud.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f2f6bae-910b-4ea5-7a98-08d93aff483c
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 13:10:35.3949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 840be37c-244a-450e-9bcc-2064862de1f4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mBA/aXEs/G2CrepnNfE7nVKoF3hx6gwkg4+dzP+OTnnGQR4RvfH1UHVZ4+3DpxygK9Nconwxw1UeAjdSqlNpE+JORzpZtCwY6SHUSdEeVHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP123MB3095
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

--Sig_/m9WJ5BecVUyDBqd.Da=731G
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 18 Jun 2021 11:02:12 -0500
Robert Nelson <robertcnelson@gmail.com> wrote:

> Hi Paul,
>=20
> On Thu, Jun 17, 2021 at 4:35 AM Paul Barker
> <paul.barker@sancloud.com> wrote:
> >
> > This adds support for the Sancloud BBE Lite which shares a common
> > hardware base with the non-Lite version of the BBE.
> >
> > Signed-off-by: Paul Barker <paul.barker@sancloud.com>
> > ---
> >  arch/arm/boot/dts/Makefile                    |  1 +
> >  .../arm/boot/dts/am335x-sancloud-bbe-lite.dts | 51
> > +++++++++++++++++++ 2 files changed, 52 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/am335x-sancloud-bbe-lite.dts
> >
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index f8f09c5066e7..8629c941f573 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -834,6 +834,7 @@ dtb-$(CONFIG_SOC_AM33XX) +=3D \
> >         am335x-pocketbeagle.dtb \
> >         am335x-regor-rdk.dtb \
> >         am335x-sancloud-bbe.dtb \
> > +       am335x-sancloud-bbe-lite.dtb \
> >         am335x-shc.dtb \
> >         am335x-sbc-t335.dtb \
> >         am335x-sl50.dtb \
> > diff --git a/arch/arm/boot/dts/am335x-sancloud-bbe-lite.dts
> > b/arch/arm/boot/dts/am335x-sancloud-bbe-lite.dts new file mode
> > 100644 index 000000000000..9c311bd106f6
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/am335x-sancloud-bbe-lite.dts
> > @@ -0,0 +1,51 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2012 Texas Instruments Incorporated -
> > http://www.ti.com/
> > + * Copyright (C) 2021 SanCloud Ltd
> > + */
> > +/dts-v1/;
> > +
> > +#include "am33xx.dtsi"
> > +#include "am335x-bone-common.dtsi"
> > +#include "am335x-boneblack-common.dtsi"
> > +#include "am335x-sancloud-bbe-common.dtsi"
> > +
> > +/ {
> > +       model =3D "SanCloud BeagleBone Enhanced Lite";
> > +       compatible =3D "sancloud,am335x-boneenhanced",
> > +                    "ti,am335x-bone-black",
> > +                    "ti,am335x-bone",
> > +                    "ti,am33xx";
> > +};
> > +
> > +&am33xx_pinmux {
> > +       bb_spi0_pins: pinmux_bb_spi0_pins {
> > +               pinctrl-single,pins =3D <
> > +                       AM33XX_PADCONF(AM335X_PIN_SPI0_SCLK,
> > PIN_INPUT, MUX_MODE0)
> > +                       AM33XX_PADCONF(AM335X_PIN_SPI0_D0,
> > PIN_INPUT, MUX_MODE0)
> > +                       AM33XX_PADCONF(AM335X_PIN_SPI0_D1,
> > PIN_INPUT, MUX_MODE0)
> > +                       AM33XX_PADCONF(AM335X_PIN_SPI0_CS0,
> > PIN_INPUT, MUX_MODE0)
> > +               >;
> > +       };
> > +};
> > +
> > +&spi0 {
> > +       #address-cells =3D <1>;
> > +       #size-cells =3D <0>;
> > +
> > +       status =3D "okay";
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&bb_spi0_pins>;
> > +
> > +       channel@0 {
> > +               #address-cells =3D <1>;
> > +               #size-cells =3D <0>;
> > +
> > +               compatible =3D "micron,spi-authenta";
> > +               symlink =3D "spi/0.0"; =20
>=20
> Sorry, this "symlink" is an undocumented "feature" of the
> BeagleBoard.org tree.. We use it to help "identity" spi/usart/i2c
> nodes names when they dynamically change node numbers based on kernel
> versions or even 'drivers'....
>=20
> https://github.com/beagleboard/customizations/blob/master/etc/udev/rules.=
d/10-of-symlink.rules
>=20
> For 'mainline' we need to remove it..

Ok, that's a straightforward change. I'll send an updated patch series
later in the week.

Thanks,

--=20
Paul Barker
Principal Software Engineer
SanCloud Ltd

--Sig_/m9WJ5BecVUyDBqd.Da=731G
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQS7m7rT1+CktY3YG1PYN3IfEvob6gUCYNsbygAKCRDYN3IfEvob
6lNxAQC9QdOcnThmFQAAbURewMhqaY94zx+nIYgUaMvJ6+y8ywD/Uj0Ln8U8xIZ9
VW76FRUmX5F+KbVDR1B6uh/6hkFh5wU=
=LmAI
-----END PGP SIGNATURE-----

--Sig_/m9WJ5BecVUyDBqd.Da=731G--
