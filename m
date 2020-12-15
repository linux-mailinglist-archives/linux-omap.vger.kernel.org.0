Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CF2C2DA7AB
	for <lists+linux-omap@lfdr.de>; Tue, 15 Dec 2020 06:28:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726288AbgLOF02 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 15 Dec 2020 00:26:28 -0500
Received: from mail-vi1eur05on2055.outbound.protection.outlook.com ([40.107.21.55]:12896
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726033AbgLOF0B (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 15 Dec 2020 00:26:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGHJjieUCnlJcUKR0LClIW4lvGSxdBjvl3uSziTcwiIc3/ah2mp+Ud7b7b6C/bWnOU10OVQ/zA30binf8w/TeOTLjiM2QFJ/cpj3qblk/UP36LuHBLubiWxP3Yl/vvXfcdGpv3Ef9AWUO0/6vCvw9nL3nlv460hGCW2JkILihZLG8TczGGCQ60TMuHHG0PotoSe++JwXwMyJCSwikTKkqnutjA5veG3ht5fE6PITzKnrF7nvh5ShoS3gCB0ERMmG27nW4R40fBkbS2fAWy2fDHT50kdJgKXn7Nmqz7SSyhjvZE/FnXYCHYFcnZ9wo0gVVDy4VOlfxCeeoNA2ClMWdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=taU4ld3kQy0C8PRRaFAG1ANgmoL9U4qtqOa27kL/zAg=;
 b=OlwiuoxvxsIB7zIYdkV70qvFlA1ghXtacZr83PGfT8arKSdUnIxnPHqlGIH6zJNwpi5kT3kXH51R7yHosa91KMn3HmTgJ/opDzcz2B6D5+LmmM4otQrkoPbdPQPnrIftmS/MTNSyW9kx/j/aO4bIiPZTP4gtcXKPylU4Kc0gMdGyTrrC2gTY1o+QQeKlYM+3S4C1TDJo3pWYa/mQJAaN1GBz3tzi0EocVlzGUbYggqxl7w2huFaaETTCwrCHJtHwwUbjPV8rjVtm4DIdfjreL0VE8j2F9/avr/ZYBW3d67h/qFYYiZoHUjN18cOTIKoDkuDC0fh3hK3gb9jDlm9UQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=taU4ld3kQy0C8PRRaFAG1ANgmoL9U4qtqOa27kL/zAg=;
 b=QzwLvhNl+0L6kCNSTs2awZ/9v4O8Be+RjkVhwv4spos4BkxeeJ9n9mplfVzgLBhBWfiMORARR4evoKZxjksbtQ3iuPNRNIIkj5C+AXOHVSXoM1wO1HtEK6bavjaRwYsrCNGtLCsLYC1p3GQNWycVYrUqXajuRDFDwgIdJpLepC0=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB6PR04MB3013.eurprd04.prod.outlook.com (2603:10a6:6:4::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12; Tue, 15 Dec 2020 05:25:08 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3654.026; Tue, 15 Dec 2020
 05:25:08 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH -next] usb: phy: convert comma to semicolon
Thread-Topic: [PATCH -next] usb: phy: convert comma to semicolon
Thread-Index: AQHWz5uFmY6Rb+QWJEOEEW8v9JRhUKn3pfSA
Date:   Tue, 15 Dec 2020 05:25:08 +0000
Message-ID: <20201215052439.GD2142@b29397-desktop>
References: <20201211085428.2871-1-zhengyongjun3@huawei.com>
In-Reply-To: <20201211085428.2871-1-zhengyongjun3@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ef029f60-2762-4c74-36b2-08d8a0b9c9d6
x-ms-traffictypediagnostic: DB6PR04MB3013:
x-microsoft-antispam-prvs: <DB6PR04MB3013A5438991D9EBE948BFD08BC60@DB6PR04MB3013.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:449;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MiJlaskQDyQldwtVJQVdHk1HwKG08rCXSWKzva0ypd1BbVlJAjGTuSSNW7rE16X69OmbauHoLiPeyzNU8rKxBisPuM4WtR4kWCtPLMDLL388AVUdpTIL9AvSuV67OkKQaXqeC4EKmQFvPt/M494S6nebyfTT0rScuJT6S3hkB1JUZ0jipiARTc8RUnRxiGL2gTi70jIvCar7tIl24s1c+TXAksT+/8eAG/gtZQE6jbmWdL1/MWBCu7buMOTvP9yB0NFfzN3BrtOFrwq42BpFzyDZygWh8vXx0GQeFRC8Z/DM4Uy8NyOJ4n0mT+9XWQw5vjQgvKm/JL1tx3ekWfTUPQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(39860400002)(396003)(136003)(366004)(376002)(66476007)(86362001)(33656002)(6512007)(44832011)(9686003)(186003)(76116006)(5660300002)(26005)(83380400001)(8676002)(53546011)(66446008)(316002)(6486002)(6916009)(91956017)(71200400001)(478600001)(4326008)(66946007)(33716001)(1076003)(8936002)(6506007)(64756008)(54906003)(2906002)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?4sJG53XsunF/Cw8jdd5j218nB2ErVDaubGb4uTaiavCaFABZxLsz8Dsrfjvq?=
 =?us-ascii?Q?tqtQ+cWUSd3XCGu3wMVwzE8C0Uj/eocJc6mIF3F4qMHVSPTkEGXNg/zO2rOC?=
 =?us-ascii?Q?N3CjVmkeoyrbNNtIds4uqZuxif6P1C9DTBNGJbDw3li4nooKU+Y1Pe1RL9ow?=
 =?us-ascii?Q?NkiNEQPUKlIQOtFgudvqC2dAm+k6OmHEXfYqMeATRoQtdipWzOWtBNv0cdZ3?=
 =?us-ascii?Q?n2FlDEyEoKfvl6pKxwcUtOG2XCGgZfcyQL4Y1RzZZDP9s0TlWEw4pAlCsxmU?=
 =?us-ascii?Q?doRxzSmuvK7dKw1usbgtHMHveLWPbZ5GHW5vOjiV40rY2GqzCji3xRklu38c?=
 =?us-ascii?Q?A3JBf8TG1F+oJShOGlJjD8WWQZs5vhl/Kb7dtEISD18Fqd3jazSyIYTCe6iK?=
 =?us-ascii?Q?nnziv+DYq44wPA0MwyxYs3UVCONaKoywQfV6Fmb04q/DN8b1sT5Gs4aqooeq?=
 =?us-ascii?Q?6UAgfHR/yKoHC+NqEtc4vppECKfHSPM4vaw3pXeMOHHoq70m1khhMdYC9f47?=
 =?us-ascii?Q?4JVjkWy5+AAy51cpP1V1ZVTbOgtrIq2SHmvtfyYPpM1oCZSxwQkQERs1S9Ph?=
 =?us-ascii?Q?AvoitrvN/Rovl4JOaSHno+pfm/NBOsgtY/VOSpG2pRKDMTZMH2RpqO0HxxCC?=
 =?us-ascii?Q?HWVHgfBiB70q8+ugwnHDQwCX9SIvpbduP1jkzGDkzNhJwvMPI90R0/J6spFU?=
 =?us-ascii?Q?/jgXr4ZWSr3bMkvkCxYEbWzyByhQtb9yvunX1gtBCSU9VlyeEMDD+9UPL8xg?=
 =?us-ascii?Q?0QMy8KpbVT0PaQE9oEHzE+qRAHUuIftLRJpgE1GUyuWMCGuyfIvkGuhSn0Fs?=
 =?us-ascii?Q?/D+UxCiqGBaSB/A0MhR7k6OAcsKtLVogdfVCmdpbOrGZqIad3DFAChk8maca?=
 =?us-ascii?Q?THoHwlqOMDLQSDFMyysOdLJxfTND7MzeTL+5X3q71nLUKiJjPGuRupT/BBdZ?=
 =?us-ascii?Q?+RBQqwJ8Gr36UBz/Tv3s3AUA2hH+/xyioNCa8JqvAZ352ihQ2W6jFeDSQXX8?=
 =?us-ascii?Q?UIOB?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D0B590CDC2CBAA43A0437234A2AD98EF@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef029f60-2762-4c74-36b2-08d8a0b9c9d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2020 05:25:08.7692
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EmbuKVOSpXY+WLM1213l/QgjgBcYs4UEDtObO6NaB1BHmSXzNAJOUrCDxqh4xJi2buk1EjSJ5cw7y+bBpsjcog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3013
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 20-12-11 16:54:28, Zheng Yongjun wrote:
> Replace a comma between expression statements by a semicolon.
>=20
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>

Reviewed-by: Peter Chen <peter.chen@nxp.com>

Peter
> ---
>  drivers/usb/phy/phy-isp1301-omap.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/usb/phy/phy-isp1301-omap.c b/drivers/usb/phy/phy-isp=
1301-omap.c
> index 4a6462c92ef2..6f4f74e6ba51 100644
> --- a/drivers/usb/phy/phy-isp1301-omap.c
> +++ b/drivers/usb/phy/phy-isp1301-omap.c
> @@ -1566,13 +1566,13 @@ isp1301_probe(struct i2c_client *i2c, const struc=
t i2c_device_id *id)
> =20
>  	isp->phy.dev =3D &i2c->dev;
>  	isp->phy.label =3D DRIVER_NAME;
> -	isp->phy.set_power =3D isp1301_set_power,
> +	isp->phy.set_power =3D isp1301_set_power;
> =20
>  	isp->phy.otg->usb_phy =3D &isp->phy;
> -	isp->phy.otg->set_host =3D isp1301_set_host,
> -	isp->phy.otg->set_peripheral =3D isp1301_set_peripheral,
> -	isp->phy.otg->start_srp =3D isp1301_start_srp,
> -	isp->phy.otg->start_hnp =3D isp1301_start_hnp,
> +	isp->phy.otg->set_host =3D isp1301_set_host;
> +	isp->phy.otg->set_peripheral =3D isp1301_set_peripheral;
> +	isp->phy.otg->start_srp =3D isp1301_start_srp;
> +	isp->phy.otg->start_hnp =3D isp1301_start_hnp;
> =20
>  	enable_vbus_draw(isp, 0);
>  	power_down(isp);
> --=20
> 2.22.0
>=20

--=20

Thanks,
Peter Chen=
