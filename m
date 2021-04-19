Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7D4F364007
	for <lists+linux-omap@lfdr.de>; Mon, 19 Apr 2021 13:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231637AbhDSLAj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Apr 2021 07:00:39 -0400
Received: from mail-eopbgr70041.outbound.protection.outlook.com ([40.107.7.41]:31624
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229537AbhDSLAj (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 19 Apr 2021 07:00:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CCobji3Q9qzhYF4Rs4Rsw0wAc7w9oj4BFXBDStom6myqGV2DfOWMrlckE8HS6EKo6CBzW0P8afAx5dGBbPjdKSptymaTG7kcMycMho3j5Jk07UeuLVi35DXzpHGyh7p8TKQC/XjOmqhKqKWc/uNAcJK0Oki3+MZnVDfU81T+P/7C+4uiWeiQj2VAm86OzyJepd/K79LCiGZkDR6HJAK4IUjpfmMEHmBcvj3lMQ/SMdbX7DmX4TzFK2sgx2r05yKDnt4bqF8VCVulR5HOILiAOncNSfHYjVIAJcaTi1zJ1f+htGKllHSs1VmF5+s6c+twm/OPoKfon30zL5MvvOxOiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8E7Rq8C1BMMpOyL/UrJhTVjgzmNo9QEvNX6uoB8Tbzs=;
 b=S9rBslZ0Wd8RKKPYHnNFL6Swcred7FWyQQANqwQBH0QOlkJQPd2VPAx7nid3dvipW2qzS1kD8tgAF07ehQnY0Ezc6IDkRfQs+5XVLb58teoMNlbTbuMnqQSy82AKacG4eYRWVH1v/kZbcGz1ppz4Ok/OqNe47f+oFU14j+zbJ33xfqUrHqlKaMmUL2JwWYXRON2wnbsm5P95eKZqPR6a32HpAWYFRyYlA+xtlfU4K21IYMGwvji76XZklFztNf/hEVtDVO6VpQYwc+uFQQ5MMIosiSArIKoOJchPG8cVtpB+CEPrCQAmanWDCVDhIZxnyEvmJmQRg2WUGNonR6L1cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8E7Rq8C1BMMpOyL/UrJhTVjgzmNo9QEvNX6uoB8Tbzs=;
 b=ZmEPQfdOxo3GwdD+Wm8oQqQgkUYybxYllfts5xTArcynZeoJhbiIYKUu5NMOypScDKFmEsE+SGlBPLXGh9d+5bQHRPSfsMw9Q75Uv5LNFtsRD14cYS7xD1DGdCY1Hq/EKb7PjP172z1eKaXKn1k2LnjLLr6IeheP0PuZpLgxcpI=
Received: from PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:ac::5)
 by PR3PR10MB4191.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:ae::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Mon, 19 Apr
 2021 11:00:04 +0000
Received: from PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7040:2788:a951:5f6]) by PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7040:2788:a951:5f6%6]) with mapi id 15.20.4042.024; Mon, 19 Apr 2021
 11:00:04 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Support Opensource <Support.Opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
Subject: RE: [PATCH 3/7] mfd: da9052: Simplify getting of_device_id match data
Thread-Topic: [PATCH 3/7] mfd: da9052: Simplify getting of_device_id match
 data
Thread-Index: AQHXNPR0DSU4jAvTN0G2huca9GWvIKq7rA/Q
Date:   Mon, 19 Apr 2021 11:00:04 +0000
Message-ID: <PR3PR10MB414231DE2AC6E7B8326D0CE380499@PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM>
References: <20210419081726.67867-1-krzysztof.kozlowski@canonical.com>
 <20210419081726.67867-3-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210419081726.67867-3-krzysztof.kozlowski@canonical.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [147.161.166.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 948c920a-df6f-4031-c2c5-08d90322498c
x-ms-traffictypediagnostic: PR3PR10MB4191:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PR3PR10MB419122BCF477E85D354F56A6A7499@PR3PR10MB4191.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:497;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7PJkzltj1ryu6GRLsWP9BxOjTbETbYBwPu0v7eoCyxNi0BJCF4PDm1j7rYnn2LDwjSYGbFQOKYwLqcMJ/kfLZQOTsfD4ldJt7ULd83KAfdpLIFKDO7xggyjjws3kqMJ5Dfd3n+nYlzRhdfLCIvSB/LG7ZPQYuSBdaq2ZQSmwYh3mrJd9fU8R2WHSdXqHH2u++UxiVV9W/j5PTP2WpX+u1W9SuhWVkVS0HBwQ/nCVY6cDB2Osn5bNyVEjm4wo69d0g0VprdqGMfXQ2DcdPQ9TWyC3XvOdjSJDYVa78aOfLWL+PiZUqbtEOS9v9P7dl0JMv3sK2liiVLF+YPPjM94KG86lEMEDrczfjQo90fcT5hmW/sdW3XYplrgUWC9uHrW01C+FPm7jrUzazTqVqS9KTYDruDiMYWgHNEkLn/bYla8wWTQvxYBllSm+3s35FWUPOHsSlMS8/zN635Qs+jsyB2pqrtAD2frO/K2Ml2N4NP6fb9yGNufaU9V4jPD5/uNVWQWfwh+bPSV/l7KXwDa8PIb47Y6yitBECLkdCA6Ob5WGHHOmqmeSSA8KG59bsKfWfSOZlsbOCONOR8KxbYqAEqAFoVUnThxGd9k9kHrYYRM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(376002)(136003)(366004)(346002)(122000001)(4744005)(33656002)(8936002)(38100700002)(8676002)(71200400001)(2906002)(66446008)(26005)(316002)(186003)(76116006)(5660300002)(64756008)(55016002)(6506007)(110136005)(52536014)(7696005)(53546011)(66556008)(86362001)(83380400001)(66476007)(9686003)(66946007)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?u1nsf6FmLunGfZWdavqF3DO7T+vVNTHQyorf9ZvgfwTfQsce2j45Sdl7LcwG?=
 =?us-ascii?Q?OsPN1jMekxLLVgkfYRHWKDvtk3Y95FTI9YMflAubmhuLN1lhQypz5Vx7Q4dY?=
 =?us-ascii?Q?/tSLKSIK3NTu4rX/hc8cLnGaDUWgp0M358FgOWUrZxc0tPjXKMBit8TZ4eOr?=
 =?us-ascii?Q?/4N2LZmcpD8T6k9Bg3Q4ue6Ak5wt78b2BfvDJYx1Yrah+YOdEtDhxrPTs124?=
 =?us-ascii?Q?QG3kgB4+n5bIlzBVEQQiL9tvn77HRNURyYxUbVTmmU4tmwauZbma6NdUTH8X?=
 =?us-ascii?Q?AHYmJbtddAnK9khkul95mrrx/gJg08taMIDOtgVnTfQrBB9WduwCW5Jv2unO?=
 =?us-ascii?Q?wML16miCp1E5muwCZaz/fb0moQdBc8pb/7IiugtcPhJkRL00nMz2VnvGAUs1?=
 =?us-ascii?Q?ZKbtsraeoeWYB/R1YJa+2xwmonJ4SMROed80UuhhnX+fsP7TybHgaS6rDBUD?=
 =?us-ascii?Q?yVBabslsTa8tqNWx/5Fz8MTptv8FSQbKPJTTgEnzHIvrDK/3SoaBamyo4rRr?=
 =?us-ascii?Q?xjfyPPoKIdX/yRwpqFPgasXQC53Wvh3UR/jtqb4AgiIDJF4HStmcvVUg6NGc?=
 =?us-ascii?Q?tyEK6Q1ZuEL7jhuyXi2jQNAo989UI+LNI0osBbHSj8SK6w/29S24dfSuCVBf?=
 =?us-ascii?Q?2urBIwf2m0ILFLYypHjFxxcehtbAGr8o9vML7WKsxtQkh6NtEVU1IJVJL/S7?=
 =?us-ascii?Q?wQwaZRlHD3/+fdFzTc4ZboeCd/j7jJTQM1bbLSWbI+VYd9pCgycJWKcdf5nu?=
 =?us-ascii?Q?dUAKipqvQjZ5B3H4kHJ8BGQKqpKh1OOGv1qiZ7ufeY76quHvfTNh71DysCmJ?=
 =?us-ascii?Q?ayRTgfTZYVFmmoogCPaL8+OSD+eTUu2fjZMd51dKz/yODkm0O3/zZid5ZXLy?=
 =?us-ascii?Q?+qob40qSASrNvxbgAwbUrJRREwf8jKiwxd+vfeEE1YuklP1MgS8N3dpx/xpu?=
 =?us-ascii?Q?XUV7bUt8odPGVr5bQOBEkXAKVay6nAQdDU6EhD3uN0TV5ltciEJlvmRTGxer?=
 =?us-ascii?Q?H2DGEY6dEn/v6usAoz1IFQGP2vaKGFDrKPaY/cSV5FRbhOrPOgL8UB4r/7j/?=
 =?us-ascii?Q?iiIqfvX2g53blrAY1kKU3RBeGrbKDvvqcrTKJEC0Ey056JDdYmOdS4z8WClx?=
 =?us-ascii?Q?E5xs1ROAdwPYjjNYtHeF8i0U5bDifrotiMs+9rR55Spm8rmnprDnWTu8MZqB?=
 =?us-ascii?Q?wGlKXkt2vqBNOfNLPFfcXGCwOZ0P3BeTsokmjw+Y3nQDTstRbFYE2BmN0kwA?=
 =?us-ascii?Q?YcKvTPeo3e4ykQIohd6+zl7dbZosMIOgM4js67lO+Q3CHFrrLDFzoK2nU+Dp?=
 =?us-ascii?Q?T3ou2EFP/yDgNNnzn7RL4CEg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 948c920a-df6f-4031-c2c5-08d90322498c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2021 11:00:04.6014
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yUww+WKJRXDKXJTHiELMN4egBC8ZbAjRMSpSed6OfLj8PcLlTwFbVkYcxIEneQO5FG+7Cqi6dZSKFAaVH+RvkqtW/4u3tUQwZG5gub9pn9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB4191
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 19 April 2021 09:17, Krzysztof Kozlowski wrote:

> Use of_device_get_match_data() to make the code slightly smaller.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---

Acked-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

>  drivers/mfd/da9052-i2c.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/mfd/da9052-i2c.c b/drivers/mfd/da9052-i2c.c
> index 47556d2d9abe..5d8ce8dca3fc 100644
> --- a/drivers/mfd/da9052-i2c.c
> +++ b/drivers/mfd/da9052-i2c.c
> @@ -154,13 +154,8 @@ static int da9052_i2c_probe(struct i2c_client *clien=
t,
>  		return ret;
>=20
>  #ifdef CONFIG_OF
> -	if (!id) {
> -		struct device_node *np =3D client->dev.of_node;
> -		const struct of_device_id *deviceid;
> -
> -		deviceid =3D of_match_node(dialog_dt_ids, np);
> -		id =3D deviceid->data;
> -	}
> +	if (!id)
> +		id =3D of_device_get_match_data(&client->dev);
>  #endif
>=20
>  	if (!id) {
> --
> 2.25.1

