Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 195093E1ADF
	for <lists+linux-omap@lfdr.de>; Thu,  5 Aug 2021 19:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240872AbhHER6o (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Aug 2021 13:58:44 -0400
Received: from mail-eopbgr110137.outbound.protection.outlook.com ([40.107.11.137]:29376
        "EHLO GBR01-CWL-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233027AbhHER6n (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 5 Aug 2021 13:58:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M6Zvs+w1BcaYGCSfWIfiZtlokAUdPX1O9kh42PCk2YVs6CX3gelXNjF13aEMoAQBVUxLwkIsWgTP+OmqhowmgRhpM67nwt2V+NpV482x2uTm0PdVU/H7ZkFohCoWvJSerNinMTexVlnRQF4wXfSZql5k1FLIfma/ox+OD/VyYda45hKFGnF7xHP8xhHFxtmJskBTHWWVJktzsfaHRcis1wHxMJOVUlSWogDUhI7vqNFVFVMRSBfV+0nRxAInkrOtieCh0vU8liXYYJ+eYgJj1XScwEQOhwjji3S5/ZzHfe9SGe2UOTzRlhfRP3lDjGnwKvKfcSo/+4iJfHtl5VR8IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvIBNrGHDgPY9k7Rip4B06EK82UlZaQ1hqlED4eCaik=;
 b=QKKPSUwM5IUHFE9FvZ2Zm+yytWSXCHcBuqPVyfELesB33e+KM1kCSp/kXKoHnJcYi9/TOYVJPWkN7XYdbAD3pcDs5CWCXKqyvCl0N2k7k9sUWukdRMjWtuPMkBAbeD5yImfZAiqYu1kvggUr6qNSVsOWoeCRQH29DUuwK+InHqFaSZ/2cwtU4/eSCQgUs/e1QpyxcLDLXbYFLOO2EO90tYXaRESFIu2my5RBKIyBdv6NE+/kV3Dv1BEmKSnExCmj8zOmml4Ps6kTxuMnJ5rIgEvq4he90iecxoqatYwLYzqHq0ue9LKn2XtAB+IotD3pm90b9y9d4+gMB7vK45WaLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sancloud.com; dmarc=pass action=none header.from=sancloud.com;
 dkim=pass header.d=sancloud.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sancloud.onmicrosoft.com; s=selector2-sancloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvIBNrGHDgPY9k7Rip4B06EK82UlZaQ1hqlED4eCaik=;
 b=gHYuAbAZpjLB+2Xrfc6LgitBNwSDUU+8ms+wxDFQgT+DfkrhvaDOmqGf2S4eheQOkPtBRPZQ/R12H7iuWU1rDgJ/kBdMZuw1GydgZCC3RbZXgKht/bOQNJFe//D84+Ge9j5XsNevXGubREqWCVkGemzn8I9nqi335FXay9AtJXM=
Authentication-Results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=sancloud.com;
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:61::19)
 by CWXP123MB4758.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:127::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Thu, 5 Aug
 2021 17:58:27 +0000
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::dc2:e929:76be:a8b0]) by CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::dc2:e929:76be:a8b0%7]) with mapi id 15.20.4394.017; Thu, 5 Aug 2021
 17:58:27 +0000
Date:   Thu, 5 Aug 2021 18:58:14 +0100
From:   Paul Barker <paul.barker@sancloud.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        <linux-kernel@vger.kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2] ARM: dts: am335x-bone: switch to new cpsw switch drv
Message-ID: <20210805185814.2505a3ad.paul.barker@sancloud.com>
In-Reply-To: <20210805172954.5409-1-grygorii.strashko@ti.com>
References: <20210805172954.5409-1-grygorii.strashko@ti.com>
Organization: SanCloud Ltd
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
Content-Type: multipart/signed; boundary="Sig_/yNekcJ3BF8C5jS2gFCsCuzo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-ClientProxiedBy: LO4P123CA0270.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::23) To CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:61::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from owl.home.b5net.uk (80.7.160.81) by LO4P123CA0270.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:194::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16 via Frontend Transport; Thu, 5 Aug 2021 17:58:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28492cb1-d8bc-4eda-b2e0-08d9583aa09f
X-MS-TrafficTypeDiagnostic: CWXP123MB4758:
X-Microsoft-Antispam-PRVS: <CWXP123MB4758312D7829AAE0C9827A5193F29@CWXP123MB4758.GBRP123.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4xmGPIJl5kh/KwgbJMPbBCFs1ei0GRqUW5/jqc29AcFAfw9Z+9TSyTf4mYfxCu1R3lSz1gXPSUE4RD9VUksgZZ/Qh1bQZFmOJrRG+KETxBtuezcAbpAFsEYmv0w0h7+vnTfCOvdWFQ/L74/fUkfbt/r+pY8iQzJB/5vBLilGKoPCjizExphlUY2g2+8RuLhL+kyhju7dJRbNM8Eea4yYF43+T3QfJmXXVh7oZTTdXIefMMvIEgBix9dEl9FtsRjLt7qzyng5v8S9IrCMPbEIaD1wi2Nk7jZ/YOd6JhsJzeCHXPjivpqI82D5qPczVEAVhbHwABi2sATrIa7aOxZeQwcINL42dKgSIHrFjlX7fWC0hIk+0KtUJenDbK9vg5WCEmbG7kuxguYlQIa7D0HfvRQdHHH66vOnbOl0x+joZkVyOKal7A5nkTu83kDvPspqpGOjZeVQMBBjiG3P//byVkGhhOAbdeDzrGzEseRZm33mJp2eQW3jLgNQsl5iG8sEK/B+mlSFpjn5GnB0RtyshcNdMQovz1h81KUzcJTneMoVxUAdsJ9DGQuRoLw468I6MX5bS2RnWaRIMO5IgRMxXfkJiOu9iL8BaH9uy22+NW5kbYnbJ6bRCC0XDBthbZ5qafoOA2aR2/DWVO57WF+IPMzaWdnoflzi9pvI89wmoSGWV3+peWzhmpfaA3bmoeg8
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(366004)(39830400003)(136003)(396003)(376002)(346002)(38350700002)(8936002)(86362001)(103116003)(6506007)(186003)(38100700002)(66556008)(44832011)(316002)(6512007)(36756003)(83380400001)(8676002)(1076003)(6666004)(478600001)(66476007)(956004)(5660300002)(4326008)(52116002)(6486002)(6916009)(66946007)(2616005)(36916002)(26005)(54906003)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BmhCzx1uFtlOjtD17xScolMrG2r6lw24QAlxDvX1oxrriSato51G2pmcXVXv?=
 =?us-ascii?Q?LHnH+j5Ix2o13l6ofJs38Td8NyKZFGy3LiDCi7OXyHkbG9sL5DZ4OMsNf/d7?=
 =?us-ascii?Q?Vlz8lRaAuGCEV4J3PREiRfHs/isjR62Hn1NO+HSRFWPgs5UvFGOoCjRM7b9C?=
 =?us-ascii?Q?yDlk7A4QWMNscm0oW/rfAvH4+F9YeWV6Q5BDDWOjo004G0BfQBvMCXzp3F0e?=
 =?us-ascii?Q?HanrQPGLJJulYNPWmFdtF9vDcVxCoAq8Tz+GFhqppFAiJUsO1982DAn+VpVa?=
 =?us-ascii?Q?ZlEkc+z/eV/BxyvfoCEyVQchGjyBDJ5ZK3fbn15uCflT+RqZNzPC8+qoSCHi?=
 =?us-ascii?Q?r6zVSoVTCGEZTdIn2Qk0NngK4J6Sw1d2+sCuaG8ZsXk81bhvNkviw8u60X4d?=
 =?us-ascii?Q?PqAL/Qcp6RhNALefVFrBv7Inq5ligvGqfHWuTQi+lzDLeAJrhQ8X6MBx8/Tf?=
 =?us-ascii?Q?VKTYJoGtrMa4At58xRwWp/4vLxPtGw8Nife0QtufRUtD7faXcZmJ/5atzaTa?=
 =?us-ascii?Q?NOeCbz9dJAtc6f/Q7nZgjemgJbUEZBaSxHVCcO+3LOPGX8J35y2tL08VZ6rQ?=
 =?us-ascii?Q?1QNR9bCo9wBZ3ZVcP1mcojnwQI3if5F7BWDbhj64LPwg3h541cvUcIt0ZRrE?=
 =?us-ascii?Q?S3BaM6kfCVV2KbwIrXLJm9uBIPXOJhc7r3ylZgXyHug1SuAFrdG4zIP3BgNa?=
 =?us-ascii?Q?+RlYZll9JtWTkhiLlUbyn7p3R4pnnSXk/pZp3DLMOuQ8OH/EN6hMAlyQbeci?=
 =?us-ascii?Q?T1Ojr0AFNoG3jTzwkpDWztI9Fqhw9g6N3R+l7trRq4G8z6rRUIWQiJDUg7DL?=
 =?us-ascii?Q?SPWfG5IYMSu7/APo+SOIBG04UUQMCw1XX2qrKPlmFgv+BuMWg5EWI96jH42R?=
 =?us-ascii?Q?q4XQ6VvPHoeHM1EQLW9BxkD3tbqU9EblC8sduRGCZjZmwg/6xdWKK8BS8bJo?=
 =?us-ascii?Q?Ti9io3RdeGEg1PfqdtSDLWGT3GFWhj4kWt5TdZvX1T6+sooYUyPetj2VcTHS?=
 =?us-ascii?Q?ynNTKaztFkM1kNqoKutEmilOmUqzMcP+6aSGIjptLm2Bt7SEIHkoca/5ZDyX?=
 =?us-ascii?Q?jMpM/PoGstFC7R2eA7GTnE+USQbKv7UbYZm+eUNQpOG+jvdTyp5pI5qLF7tT?=
 =?us-ascii?Q?nH+93EJIXbgQPwcDJFC4r6MQMshY8eLzDybJwlKCbsX82JcNlcUq36mfVBmL?=
 =?us-ascii?Q?1mG+pB8IKdgufScpbZGyMiAHHbuMqe6Y6jfuggv94CcuUHXYwH7iR2xoPgTU?=
 =?us-ascii?Q?vWaNWsHphBrtcQL6xY1xVPtpXq3h2cVo/G93KHDyIpFARfgAe7PlaRIzIZFZ?=
 =?us-ascii?Q?VyvPKhJojmGqiCS1M/F/WR8d?=
X-OriginatorOrg: sancloud.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28492cb1-d8bc-4eda-b2e0-08d9583aa09f
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 17:58:27.6783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 840be37c-244a-450e-9bcc-2064862de1f4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QtDSOnBF9v8xeSeN8IjME/VxUrhmh1LiBQJU7QIsVuqZVvXm5ypA9agifjH07Z94ekUjWf/qfip0YbCBDj2Tw4D/Z1IrU5fygbWI5lPk3/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP123MB4758
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

--Sig_/yNekcJ3BF8C5jS2gFCsCuzo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 5 Aug 2021 20:29:54 +0300
Grygorii Strashko <grygorii.strashko@ti.com> wrote:

> The dual_mac mode has been preserved the same way between legacy and new
> driver, and one port devices works the same as 1 dual_mac port - it's safe
> to switch drivers.
>=20
> So, Switch BeagleBone boards to use new cpsw switch driver. Those boards
> have or 2 Ext. port wired and configured in dual_mac mode by default, or
> only 1 Ext. port.
>=20
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> ---
> v2: only rebase
>=20
>  arch/arm/boot/dts/am335x-bone-common.dtsi     | 13 +++++---
>  .../boot/dts/am335x-boneblack-wireless.dts    |  2 +-
>  .../boot/dts/am335x-bonegreen-wireless.dts    |  2 +-
>  .../boot/dts/am335x-sancloud-bbe-common.dtsi  | 33 ++-----------------
>  4 files changed, 12 insertions(+), 38 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/am335x-bone-common.dtsi b/arch/arm/boot/dt=
s/am335x-bone-common.dtsi
> index 34a0045b5f65..0ccdc7cd463b 100644
> --- a/arch/arm/boot/dts/am335x-bone-common.dtsi
> +++ b/arch/arm/boot/dts/am335x-bone-common.dtsi
> @@ -353,24 +353,27 @@
>  	};
>  };
> =20
> -&cpsw_emac0 {
> +&cpsw_port1 {
>  	phy-handle =3D <&ethphy0>;
>  	phy-mode =3D "mii";
> +	ti,dual-emac-pvid =3D <1>;
>  };
> =20
> -&mac {
> -	slaves =3D <1>;
> +&cpsw_port2 {
> +	status =3D "disabled";
> +};
> +
> +&mac_sw {
>  	pinctrl-names =3D "default", "sleep";
>  	pinctrl-0 =3D <&cpsw_default>;
>  	pinctrl-1 =3D <&cpsw_sleep>;
>  	status =3D "okay";
>  };
> =20
> -&davinci_mdio {
> +&davinci_mdio_sw {
>  	pinctrl-names =3D "default", "sleep";
>  	pinctrl-0 =3D <&davinci_mdio_default>;
>  	pinctrl-1 =3D <&davinci_mdio_sleep>;
> -	status =3D "okay";
> =20
>  	ethphy0: ethernet-phy@0 {
>  		reg =3D <0>;
> diff --git a/arch/arm/boot/dts/am335x-boneblack-wireless.dts b/arch/arm/b=
oot/dts/am335x-boneblack-wireless.dts
> index 8b2b24c80670..c72b09ab8da0 100644
> --- a/arch/arm/boot/dts/am335x-boneblack-wireless.dts
> +++ b/arch/arm/boot/dts/am335x-boneblack-wireless.dts
> @@ -63,7 +63,7 @@
>  	};
>  };
> =20
> -&mac {
> +&mac_sw {
>  	status =3D "disabled";
>  };
> =20
> diff --git a/arch/arm/boot/dts/am335x-bonegreen-wireless.dts b/arch/arm/b=
oot/dts/am335x-bonegreen-wireless.dts
> index 74db0fc39397..215f279e476b 100644
> --- a/arch/arm/boot/dts/am335x-bonegreen-wireless.dts
> +++ b/arch/arm/boot/dts/am335x-bonegreen-wireless.dts
> @@ -62,7 +62,7 @@
>  	};
>  };
> =20
> -&mac {
> +&mac_sw {
>  	status =3D "disabled";
>  };
> =20
> diff --git a/arch/arm/boot/dts/am335x-sancloud-bbe-common.dtsi b/arch/arm=
/boot/dts/am335x-sancloud-bbe-common.dtsi
> index bd9c21813192..2513d7cde09c 100644
> --- a/arch/arm/boot/dts/am335x-sancloud-bbe-common.dtsi
> +++ b/arch/arm/boot/dts/am335x-sancloud-bbe-common.dtsi
> @@ -40,22 +40,6 @@
>  		>; =20
>  	};
> =20
> -	davinci_mdio_default: davinci_mdio_default {
> -		pinctrl-single,pins =3D <
> -			/* MDIO */
> -			AM33XX_PADCONF(AM335X_PIN_MDIO, PIN_INPUT_PULLUP | SLEWCTRL_FAST, MUX=
_MODE0)
> -			AM33XX_PADCONF(AM335X_PIN_MDC, PIN_OUTPUT_PULLUP, MUX_MODE0)
> -		>; =20
> -	};
> -
> -	davinci_mdio_sleep: davinci_mdio_sleep {
> -		pinctrl-single,pins =3D <
> -			/* MDIO reset value */
> -			AM33XX_PADCONF(AM335X_PIN_MDIO, PIN_INPUT_PULLDOWN, MUX_MODE7)
> -			AM33XX_PADCONF(AM335X_PIN_MDC, PIN_INPUT_PULLDOWN, MUX_MODE7)
> -		>; =20
> -	};
> -

The commit message doesn't mention anything about why these are
dropped. I guess it's to remove duplication since
am335x-bone-common.dtsi already has the necessary elements. It'd be
good to clarify this in the commit message though.

>  	usb_hub_ctrl: usb_hub_ctrl {
>  		pinctrl-single,pins =3D <
>  			AM33XX_PADCONF(AM335X_PIN_RMII1_REF_CLK, PIN_OUTPUT_PULLUP, MUX_MODE7=
)     /* rmii1_refclk.gpio0_29 */
> @@ -63,25 +47,12 @@
>  	};
>  };
> =20
> -&mac {
> -	pinctrl-names =3D "default", "sleep";
> +&mac_sw {
>  	pinctrl-0 =3D <&cpsw_default>;
>  	pinctrl-1 =3D <&cpsw_sleep>;
> -	status =3D "okay";
> -};
> -
> -&davinci_mdio {
> -	pinctrl-names =3D "default", "sleep";
> -	pinctrl-0 =3D <&davinci_mdio_default>;
> -	pinctrl-1 =3D <&davinci_mdio_sleep>;
> -	status =3D "okay";
> -
> -	ethphy0: ethernet-phy@0 {
> -		reg =3D <0>;
> -	};

As above, it'd be good to clarify in the commit message why these
entries are removed.

>  };
> =20
> -&cpsw_emac0 {
> +&cpsw_port1 {
>  	phy-handle =3D <&ethphy0>;

Can we drop phy-handle here? It's set to the same value in
am335x-bone-common.dtsi.

>  	phy-mode =3D "rgmii-id";
>  };

Thanks,

--=20
Paul Barker
Principal Software Engineer
SanCloud Ltd

--Sig_/yNekcJ3BF8C5jS2gFCsCuzo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQS7m7rT1+CktY3YG1PYN3IfEvob6gUCYQwmtgAKCRDYN3IfEvob
6ocEAQC3OgoEpumEbgYxeHEc5plq1GohAwaP9QXejoE1u3hZEgEAkebmT8Tc4Snw
bUOhB58kCQBR2xXfJe2W5AWVASvSEww=
=n0lE
-----END PGP SIGNATURE-----

--Sig_/yNekcJ3BF8C5jS2gFCsCuzo--
