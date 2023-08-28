Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF78378AEEA
	for <lists+linux-omap@lfdr.de>; Mon, 28 Aug 2023 13:33:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbjH1Lcr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 28 Aug 2023 07:32:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232530AbjH1Lcl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 28 Aug 2023 07:32:41 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2136.outbound.protection.outlook.com [40.107.114.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB4ADB3;
        Mon, 28 Aug 2023 04:32:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q8dYSXuwhdSaRem+nvA/3JFuQJ+PRTflCNSseQGB2o7PcnLGd4hoVjdDX8TzRFK9AdXF4OfSEE8Pdodi7ETW8+5lJi9Xc48RW15PJt3enbJSNLRq2uYmmIxZk6dY85LkUyWSWprZQjvyT2yqoBPcRlZuiD8WB2dCu1X7MevyP8tkGTDMj0B4sm3QNMfGZti2U+28ikxlsw4ek2bAE7heTz15nn38UlVJDcDYOq0/gD9faGP3JwwmUs6vd+sM7WMeu35SVP0fv4EZEZJWBOgtltgeQ+//EVzMW2KL22ABP13OfuQ59WLlswRLenh0VrjsavYctkLlJ4xnvyERiKzQ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TomY4pvVLyZldgD2LklTmQD/FSoeoi4+BoJ8xpqbCKs=;
 b=aemChS5bj/MtBpUwubUWsDpPt/88ShVZtNHEbSVoxyTNcJRIIXm0HplVrwlOoGexmCddof5IrI9GnB91Utdao1J1svFOqlb9vwZU5ISgrj/XcKzkk+evHLXsvnAKHvlac6t8T9n80WkBTrs3T6lY6jjzbxRSUOqidryqfcxKKl3I53ya4FEUyOyHognGd+/Gl3BiFCTqclRw1IO5/IZSujZrPAJKVaM28mhnpwjg/3mMOUeiqs3eD8n4wnAU60kdM0vfST7DmoUfbO3sJz6FJV8N4P4tz7QbLmZfPQrRz8PbprDDDp22Rana/RZ1i13/8NQB1GsRRz/WUOK/xczBsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TomY4pvVLyZldgD2LklTmQD/FSoeoi4+BoJ8xpqbCKs=;
 b=se6kS7hEIhCuvlwbC73gYgIQAOowt6wIyxTjWvlKHnKyHA77Tge0wrsg0J344wQdOv2UGvoXekfxafDp5/iqUTN/b3fGJILYWM7j+DMublEOOo1cAbwnopIqTt1fSAW0ni6gRkkevcpAiaG1IlNi3eGVIs08JQZ+yqrGc5OIfFw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB10189.jpnprd01.prod.outlook.com (2603:1096:400:1da::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 11:32:36 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%4]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 11:32:36 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/2] mfd: palmas: Make similar OF and ID table
Thread-Topic: [PATCH 2/2] mfd: palmas: Make similar OF and ID table
Thread-Index: AQHZ1/Z0JXP0u3zEUUWlH5uLCxu6+a//kzEAgAADYkA=
Date:   Mon, 28 Aug 2023 11:32:35 +0000
Message-ID: <OS0PR01MB59222D7AE1E2670DB74B137186E0A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230826082217.41967-1-biju.das.jz@bp.renesas.com>
 <20230826082217.41967-3-biju.das.jz@bp.renesas.com>
 <ZOyC1q+3Fk/weRjn@smile.fi.intel.com>
In-Reply-To: <ZOyC1q+3Fk/weRjn@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB10189:EE_
x-ms-office365-filtering-correlation-id: ddb9f5e6-987d-4fba-3ef3-08dba7ba7a46
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MOBmqRLtLrMIoMKAo+sBEy8iTWzf+1CA/O6D+vkNjY2mUEI6E9mVYP9snl/azQ67H7T9Nsfk1K3C6+v0BvcgWXKvg21Z2EXWRzilrNxSlAu0i4BearHaH8wTfQfEvzIV7EGcGoksxABfz8FT/6pbfVvVd/huyzOupMST+qNj4J8sONoR/h2CaRQF3NvNcNCkeojpPeUillisMvZpenladAenLSW9ABe9K5zIfukzVS0zYPsM5XsZoh9MEsF09Oi+DLsGPG3ay4MKCu/wqWPrHS3uboDB2EQlrYv8q5gwCmQo9z/jMyWxp7ICZc4oIf0hes9YRmUL3zPhUcMa5eJyNrYDkpnH/3iHETG1wUM1QqziCd9M7ND56EPJrxyBo7kPZkJVOhWyarkoGhKd8rDviv84cduEfldxhCZVYcNJ/AvwlqemNJWojdbn0q0laR4J36+mObKKFkdFPJUFzwyHoGrtNDOa2J5rAbC4PbGv0E+F/Pr9bwGf356eln576TVtiM1Z1LI3gYbdck0kTDGYY0gYNC6edMO3KSdRpPaYqKN1vOwN2TtxhjcWuKewyZmpq8t2rfwJADp43Qll101pBA6BGroePXjl5GcXdL0mahN9uPYsUIIo4avWkNRZEH+j
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(366004)(39860400002)(396003)(186009)(1800799009)(451199024)(41300700001)(122000001)(38100700002)(38070700005)(86362001)(478600001)(71200400001)(26005)(9686003)(7696005)(6506007)(4744005)(55016003)(76116006)(66556008)(54906003)(66446008)(6916009)(316002)(2906002)(66946007)(66476007)(33656002)(64756008)(5660300002)(8676002)(8936002)(4326008)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Vgo/pfiRaZZyl2Po51spHNLFcR4jukgjV6pUwSxx9I8Mdd/i0bg6KSrgw1Vv?=
 =?us-ascii?Q?LV+2zsLdrkkEeegmUbXx7MEi3D9blnYgZylMeBiyOahQQ8QnPz1cnFbwlekc?=
 =?us-ascii?Q?MuXvNs1hz70p4BXHmdOoB43BISSV7XHFLMaN0MV1kyQxz1Qhp+SgqB2BAGCi?=
 =?us-ascii?Q?ULrHOp5bpykPCftFVfrQjU9jtFWm8gbyl9sXJGmj7lxL1Il8NVcGBbebZkay?=
 =?us-ascii?Q?H8o3YM1udyZ7tHqWWoAbRPeEugeU9LnaAwiLnsdyLhBw5uFUM572IDqD/184?=
 =?us-ascii?Q?iN+lP233gKLZ+CcNCszAyxfm5t34xmBx4B3SRg0th3Zop7R1UveN/8jlJq29?=
 =?us-ascii?Q?P3oopp4MHTy4GXbxzsVt2B4yEoQN6nkyHCZIqLIESdPg+fztgeLgd6eS7DoO?=
 =?us-ascii?Q?v4//aCRSp7UZauFc49IU/DHNpdxFCoAAV680fzopKoldSUE+p0fBOCNl/weM?=
 =?us-ascii?Q?Srhx1QmzY9FkRH1ZzZHkXDA8jEumrt3fgIwijEWsKgnhnjfTSBNeZ27WSsQB?=
 =?us-ascii?Q?B1SDJAh4MzapycX4ZVQdxrb36FPhHm+hSZCBs57/OKcQLpsMmVbBTGv3Xftp?=
 =?us-ascii?Q?0iCO5hBSOJ5Yqm72YGLQcjsHysbaxrc/BJoAT3LV8WFaThLyDjmM+oSr7auc?=
 =?us-ascii?Q?Nz5CvUKtEmFRTAkQR6di1X2StizEunIENSXbXkAxAU4nOnyz+zXRxfcgI9zu?=
 =?us-ascii?Q?ydSYcDBLr0LRIkwkSKKgb850CCuxxc751g/sdtelfwOfjVh8dpmpb+3IfEEA?=
 =?us-ascii?Q?2XbQKQIYx5eG+G68ansRecC9fKqd0ZS1MDdFCAB7U2CH6V4LxFnRc3497Bo3?=
 =?us-ascii?Q?ad5Vs+gwYzePOZCxT9rB5TvEk9dPF6mRIpGqG4J8DV1FwzFp6GX4mVDsejTO?=
 =?us-ascii?Q?TTBXjs/EsGpbrYJE+X+fJMz1rcZFa5VClmKW2O6445etAHbFqaUUxD0QdqI+?=
 =?us-ascii?Q?d/ZktyLfTyVdnHHbFa4Srg1IuKRozWMjqHZsw68L/XFlve4S7D58MUgnq43H?=
 =?us-ascii?Q?hTd5kpDj8vDlADpB4yNnUCR6/c6s6bGijxs1oGAnjdqYeLxWavwCzkL/lvA0?=
 =?us-ascii?Q?+og2v2t4Jweb5fH9dSj3MBH1vymu+mK8vcjf8lR2jp1znSexdfv8DIKcULuC?=
 =?us-ascii?Q?qpOjuziCWR8gJeY82HwEnVs9HCFHXWh217GBpQzCitzpnudobXma3chetwC6?=
 =?us-ascii?Q?Ng48vOpVwwi240reONdq3vcDu1m4a/T8eDRZWKO7Md4rpU17DbWWIx01kXTq?=
 =?us-ascii?Q?a+LwZdBA5rIRA0oqu9d3xHaLbMSBJV/cQmqVSNPHobdPBKvu5OOTemzPut52?=
 =?us-ascii?Q?T5Kj929xSaHZkpzznkXlRz6ZcEclUp49d4bPiFY5ls85z5cI5KCTXp/8gSiH?=
 =?us-ascii?Q?9GCpO33i7YOiN5WsJJgiPIoIBQjiJ+no5XF2y4HX71cnKlY1b2nYwmMmJ5yq?=
 =?us-ascii?Q?i1ttnLvTDcjcAYxXYyBKjPB2+WRbWtKaHxXSRY1hI7M0KBiLAShlrNlOdjRa?=
 =?us-ascii?Q?NqFv/Yoi5aF33I5wENJmGD2GMBYa1eRjMD+yifRAsru5zhM9O9FWrJSTMyj1?=
 =?us-ascii?Q?rl6pOuXmHMh3e/K1w35Lp1Ivjvc75twTsOjDnOSJaGfuj19WaRZaVJ/krpVE?=
 =?us-ascii?Q?EA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddb9f5e6-987d-4fba-3ef3-08dba7ba7a46
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2023 11:32:36.0102
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VOC6KWldTKNZz7nIS0uxX3/KoiIGkBODUYOLfSTp2GNiHnXtGcKQQRSrhhUKQBc41H85zpdRAMqXxfNHMEBZNsDHzmzwM7opQP7h03sd6ns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10189
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Andy Shevchenko,

> Subject: Re: [PATCH 2/2] mfd: palmas: Make similar OF and ID table
>=20
> On Sat, Aug 26, 2023 at 09:22:17AM +0100, Biju Das wrote:
> > Make similar OF and ID table to extend support for ID match using
> > i2c_match_data(). Currently it works only for OF match tables as the
> > driver_data is wrong for ID match.
>=20
> ...
>=20
> > -static const struct i2c_device_id palmas_i2c_id[] =3D {
> > -	{ "palmas", },
> > -	{ "twl6035", },
> > -	{ "twl6037", },
> > -	{ "tps65913", },
> > -	{ /* end */ }
> > -};
> > -MODULE_DEVICE_TABLE(i2c, palmas_i2c_id);
>=20
> Why do you move it up?
> The first user of the table is below this code.

Agreed, will fix it in v2.

Cheers,
Biju
