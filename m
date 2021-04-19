Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3EAD36400A
	for <lists+linux-omap@lfdr.de>; Mon, 19 Apr 2021 13:00:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233163AbhDSLBY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Apr 2021 07:01:24 -0400
Received: from mail-vi1eur05on2069.outbound.protection.outlook.com ([40.107.21.69]:60577
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229537AbhDSLBX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 19 Apr 2021 07:01:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WROHXBCzwR/7tNzLjCl3GdbYNLpyL8WU2Jnsct6tgzRJjI3ebXEsTl/DgNH2Ouv1RYe9OcIAlt8a1BMPrVi5ybyJE9g55s89LMwncOAW5JQqR/4O2ZnyPNrcB/CuI5o9ztqLyWKVnTcuW6gf83iC6/yVWakGvyeFumgZwWUoVuHLzddfG8x7xNgPd4hQRJWXQD5PWxf28fZ66Wi19aCXNCoeJVrZSfHRC6dsR+anva6WmyOajSaISXHLVwzioHg5pblcuIvQVcbXqxOqsS0ehWrBc+Uodn0HkUKGzJObwugg/iug1FOWmNzDFJblTQoga9NO0qs++kpYGmyBoGD98Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gGmsWFfOHlRvRQnnfRgKyxnMyTbtfm/Er5u8XsiePRM=;
 b=G4NOQzvyuCDhbzGIP0WdTIaiIn2PHpBJy6v2AJaa15TJo4geC8HwurUnNA4E4YUSsI8fX/77K6dZED0ZZhXC66bEJZeaRpXoa02n+boNdDH45zJWaVImG2VqNuEw6laceyZBCOgM09ksiUwnQRN7I2HCeFv2gmr5moMdogp6W4f9X88zkO8fOKh4V2n2giYN4kI/paagPKtAnitMshAZLazcJztG6JS5KdkzLrKhpD6p/IZib1/Hs9PsBpeVWvQvAGCKCwXdKZDE2r46wVNlOpkaZ6mYjUcJfSI3pgOLEhnrU5Ydqf/zhJUS6Ir/DGa9Sk8hAkkjN4RtfIj1SCbmWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gGmsWFfOHlRvRQnnfRgKyxnMyTbtfm/Er5u8XsiePRM=;
 b=0kIEQYWzbRLMFKEDR9/vik6lRaz/uu93/BEug0TBKtW+s1SaPnpPzAG5lE8ZCumFYLT20HP96DSrzEDg9EAc9eSyt1OKD0u0UyXYV8cCfZJJaepdQXo8rEHT6fYhF4lr4GjJyNWj5ZSnCaTtXSUUfVBk5G45i4KqkaCwoPQ5a1U=
Received: from PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:ac::5)
 by PR3PR10MB4160.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:a4::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Mon, 19 Apr
 2021 11:00:48 +0000
Received: from PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7040:2788:a951:5f6]) by PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7040:2788:a951:5f6%6]) with mapi id 15.20.4042.024; Mon, 19 Apr 2021
 11:00:48 +0000
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
Subject: RE: [PATCH 4/7] mfd: da9052: Simplify getting of_device_id match data
Thread-Topic: [PATCH 4/7] mfd: da9052: Simplify getting of_device_id match
 data
Thread-Index: AQHXNPR1IuBpkCnNm0Kdf7t+CNkgYKq7rGjA
Date:   Mon, 19 Apr 2021 11:00:48 +0000
Message-ID: <PR3PR10MB4142EA43FB5896B7573B887D80499@PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM>
References: <20210419081726.67867-1-krzysztof.kozlowski@canonical.com>
 <20210419081726.67867-4-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210419081726.67867-4-krzysztof.kozlowski@canonical.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [147.161.166.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60007928-3b3f-4c7e-e071-08d9032263ae
x-ms-traffictypediagnostic: PR3PR10MB4160:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PR3PR10MB41603C1A397D84595E199E06A7499@PR3PR10MB4160.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1148;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yae3QF32b0EE/rnb4keB+Mzq+GpgZFbTKjp5WCIJmXBuuYStFbKHvqh8RSDRu7sgsypZ8pehbcIKCCp++gb0c3xeG0ZIVq9dK7B7eHSrd9+K+O9n0Zq3EZyepJOIYpmp8LQXg4hgsw30keW9KuH3rzc8m1tiITlIcmZ77Pa4+/7ZvMQazoSfbPFIsrCSBlQlBB4EFWCFSjY7UDKEX2Y+EiS2xP40MHwn1oCjl93gEVm8ImVl9l7I7cPiGNHAQlpwg0TOy+pv57Wxl9PA7WkDMfktGX6ioKa8m68LkklRnqoC7kG79D6MpIMjFLconjVJ9Wuqx4yX7aOq/0zDiBTLxGaqHWgI7XYmwpveTa9PzS1iNA+9OosXIEzlv5VBNCZXO42thu0CJxEtaIuRTHyBHhQMwBPbEk1JWfckZhvyZTIBrxhYmjc+891mHzRAS7WuGv7BBSs+kbgeh+jVqzL+1Bd+Bm1I3ViNF/lTSf5hlq/Z4knLcyA78S6bBg4rCZ2DN4lH7SBEGUu5+aPu3znENBWooVop67hGmG1wGw9M1nN/3vWPEjfHjEEPDMeTcuIY3g/Amrs6z0eECVzki/btlkSNLB+a1IXLeBbYgjjsvM8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(136003)(376002)(366004)(346002)(110136005)(33656002)(122000001)(55016002)(71200400001)(9686003)(478600001)(5660300002)(83380400001)(316002)(38100700002)(66946007)(2906002)(8676002)(86362001)(66556008)(6506007)(66446008)(8936002)(53546011)(76116006)(26005)(186003)(52536014)(66476007)(64756008)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?6KVUGqEulg9FlM8YkoBbSEY3UpQvgFhWtBTR+LecwMFPUrbkMxwWgPl9QLzE?=
 =?us-ascii?Q?SwKDha/sze1/NtzOL2vKaS5JxUXL00pWIKxCFZTs5W6AHe4PAqdjpwJhS2uk?=
 =?us-ascii?Q?73vp+UnzSK+LZCmlBAtPRtAss3edoPFXRtIwLOXMNkVWztbpR8EMCkfoUZT5?=
 =?us-ascii?Q?5MkGn6e6XOlKEusJM9PaxbDaGGtoz4Tvfug/3gKrrd3LOqfBYeV1VnOdjMMQ?=
 =?us-ascii?Q?utKiRLQ8xjsQmqpiJaZrZyoF2MYcj+hWFX5WxxoPdsFojMzNuSZs4DuhOklT?=
 =?us-ascii?Q?yGHV7tmXQE2P+YF9zPNmvB2BZtD06n4P8IFr5pqwhhnUHeBwCijBRpKbbig4?=
 =?us-ascii?Q?NSLLeShI2L0EArHIa/SMTljmsDZtw2EKxQEYFr+gE/AcQFDEof1F4P2bd2mF?=
 =?us-ascii?Q?7wyIqt/+UIcskuybLD0z9gOaUhDhf1LKtMEL9uh9C0J2d+6pxwR8tDonzSRs?=
 =?us-ascii?Q?1OuUYVw1hkhCfWCU+ALwerEh+gB7OoC9FgUE6z/n4hENysA6J4S1/uPmRQMJ?=
 =?us-ascii?Q?Ex08/+SOs9lQ+3zBA37ermzYCHtWLNxCNq0BDW4pypyz3WBLSqmI1tkikDw5?=
 =?us-ascii?Q?wMe+HoJ+KadPFVygzLWnL8MP2GwI2lru17drn1NSbzMdwurBWUt9jwXTh+TY?=
 =?us-ascii?Q?S7RVeNBJrnFjK/nq3MOoxG9S0Nr1Uu21tnaAH63NSmmhg/Z927vHw/iEXTGG?=
 =?us-ascii?Q?mp7W6HK0CUcJ8MQS5GmA58ECJQPjr9DifaLw9uoyJZ2+3I+WBr165Dz5hvSd?=
 =?us-ascii?Q?WD210L4sxZ/dyItzdbH6YRWJIJsgZsd39LKlRnXAkFJBcfw6E3w57m1W62Ee?=
 =?us-ascii?Q?yNPUbkdmftHbZhWEvo3kdX83jKRDrSaHt4g6Jl/CgA/PeDNYwKvYfW6xjcT0?=
 =?us-ascii?Q?2GPSWViSVH1gmlmVA5BnVky1tYJPI0E3TCgM3fv4Z8R+Lz5cM+6kk9dDk6Ws?=
 =?us-ascii?Q?Zex+UOGE2eUmOQLRWQnqSg5rQ2c9h8d81YTKyT1nH+rBLbCX+lU5RgOqHhHU?=
 =?us-ascii?Q?8ObV6eeCzpxMYhlq6sGHBhyJqujEl4NoNSQLp6gHI/4Ircwaw0WuL5hXHWGM?=
 =?us-ascii?Q?/OUTMO4mTuoV1L94swr+ppXlJqj7CX160ColCga7mm3PfbS/JJk/Rtlo9pWG?=
 =?us-ascii?Q?CA7LCfgyDDPMfmiPOSYsVkfPA1qPrhcbzMV0KBqiEskk6pua/Gu5tUmnx0/c?=
 =?us-ascii?Q?WZgrMO6IudMP+nOCcZtWttU0gZpu8PcwxTd0aUza67KP9EzJ8iDYBNfpE9r+?=
 =?us-ascii?Q?ENa8ExKWUtZKGozHTvcOBLhTUW0bZyH0YlGJuW6OSdJzUa782uFifScnXSb4?=
 =?us-ascii?Q?IdPG37aPavuwqjfsHeN4H7Vb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 60007928-3b3f-4c7e-e071-08d9032263ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2021 11:00:48.4547
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tXWN9/dYU7quGrZUwqkPfE1gfmPPo8bzmb/KPi2r6KpFtMvPQKH9qo0jOMQxan9rGxnjlA/zYmVzg2Ey2whUJc3XeSq1iyuEEPO5UW9DXJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB4160
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 19 April 2021 09:17, Krzysztof Kozlowski wrote:

> Use of_device_get_match_data() to make the code slightly smaller.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---

Acked-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

>  drivers/mfd/da9062-core.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/mfd/da9062-core.c b/drivers/mfd/da9062-core.c
> index 8d913375152d..01f8e10dfa55 100644
> --- a/drivers/mfd/da9062-core.c
> +++ b/drivers/mfd/da9062-core.c
> @@ -9,6 +9,7 @@
>  #include <linux/init.h>
>  #include <linux/device.h>
>  #include <linux/interrupt.h>
> +#include <linux/of_device.h>
>  #include <linux/regmap.h>
>  #include <linux/irq.h>
>  #include <linux/mfd/core.h>
> @@ -622,7 +623,6 @@ static int da9062_i2c_probe(struct i2c_client *i2c,
>  	const struct i2c_device_id *id)
>  {
>  	struct da9062 *chip;
> -	const struct of_device_id *match;
>  	unsigned int irq_base;
>  	const struct mfd_cell *cell;
>  	const struct regmap_irq_chip *irq_chip;
> @@ -635,15 +635,10 @@ static int da9062_i2c_probe(struct i2c_client *i2c,
>  	if (!chip)
>  		return -ENOMEM;
>=20
> -	if (i2c->dev.of_node) {
> -		match =3D of_match_node(da9062_dt_ids, i2c->dev.of_node);
> -		if (!match)
> -			return -EINVAL;
> -
> -		chip->chip_type =3D (uintptr_t)match->data;
> -	} else {
> +	if (i2c->dev.of_node)
> +		chip->chip_type =3D (uintptr_t)of_device_get_match_data(&i2c-
> >dev);
> +	else
>  		chip->chip_type =3D id->driver_data;
> -	}
>=20
>  	i2c_set_clientdata(i2c, chip);
>  	chip->dev =3D &i2c->dev;
> --
> 2.25.1

