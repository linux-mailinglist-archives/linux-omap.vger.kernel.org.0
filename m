Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA48627BF6F
	for <lists+linux-omap@lfdr.de>; Tue, 29 Sep 2020 10:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727681AbgI2IbG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 29 Sep 2020 04:31:06 -0400
Received: from mail-vi1eur05on2044.outbound.protection.outlook.com ([40.107.21.44]:17560
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727605AbgI2IbF (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 29 Sep 2020 04:31:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NWX9YhtzW9x7gjymERf+1h8WM+raywh6Gukh7OZactCJWNIOdR3jtvtvCIJrVHzgGkgcQ+eGSHJm3ZhPsKYnOHdiYO2yUBn0rwGMP51fg/0Q2RQj3BRschX6jLka3VecTnlcDjam3dnYZW0eoLmKlosKu85xZrjeXlH81/+wj0fUphT9vSc6m3YG12lgq3vA9/EC5i+CHWqRqM00v2Y4grUiFUOh77TtIjQfZoN9/GtMgxG2gXOknkaLMemsS+utiQ6LO5vD+NTvOsFw6/w2q4Pwls0y2wjOkX4toEzBDzRNo9XUmW+ZGlxPMSnoHrRpda8YpQ3VSUQzAQYyNwWUKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lb+679fOHrjcZdUkqeXWy8ZMVDKzxqtW33d0gVCc+P0=;
 b=cc6TgJOrtayyXtiPB3oRyRdHyiFAa8Rgc3IOqrQg4cKQi4YeZgwVb65nGRpPZMcfnQprlgzGWvieVZNaYJrgIL8kXURH896oeDxXJ6WA2/Qm3MlO/1q51wColUsqRegUhEa+fH1BSqQZiK9hWr68+1AYvHKacUghn9sbIKwuJLBfpGzp1opewCWZkwgr6FsIGvoOOHoPLsSIAfmsZbO+y6beDbhI2ICvKNDTPwis00RV13jY9XzvreAxHxdo7gjL5GvFtqHqn8khyW+TL5b4YfsTG7duG0LPV/ay0kfDrB2ezyLgWEC2KUBq1s1wYDyMTfIbF3Msll8wnTg/E9rDZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lb+679fOHrjcZdUkqeXWy8ZMVDKzxqtW33d0gVCc+P0=;
 b=SCWAJhIj9VIO2SVoiDufWGD/PuHqoCZn/DMT6wtflt1x9vmJnWiFcS0WXaAAK58lNGVw+O8pVDw0PytC4HDbJy4P3eXaCkKiFgyzirFLvrtk4ng6q9H8tF0pPllF2YsgALasXJkmbwQN6WIGRIb172VK+uz4wFBk4Mckl505dwc=
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM0PR04MB7123.eurprd04.prod.outlook.com (2603:10a6:208:197::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Tue, 29 Sep
 2020 08:31:02 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::ad01:9b1c:3b4b:3a77]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::ad01:9b1c:3b4b:3a77%7]) with mapi id 15.20.3433.032; Tue, 29 Sep 2020
 08:31:02 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     kernel test robot <lkp@intel.com>
CC:     "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>
Subject: Re: [balbi-usb:testing/next 104/108]
 drivers/usb/cdns3/gadget.c:509:7: warning: variable 'length' set but not used
Thread-Topic: [balbi-usb:testing/next 104/108]
 drivers/usb/cdns3/gadget.c:509:7: warning: variable 'length' set but not used
Thread-Index: AQHWljSrc6RauTltskaGpAYZGg/e7Kl/SQOA
Date:   Tue, 29 Sep 2020 08:31:02 +0000
Message-ID: <20200929082957.GF9076@b29397-desktop>
References: <202009291511.DDBVZnqE-lkp@intel.com>
In-Reply-To: <202009291511.DDBVZnqE-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: caaa51b6-3918-453f-aec9-08d864520029
x-ms-traffictypediagnostic: AM0PR04MB7123:
x-microsoft-antispam-prvs: <AM0PR04MB712329D236F0B4AA33FE4ED38B320@AM0PR04MB7123.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6KFkGyJMmxykG84aKsvFmhMxoGItPpnwb6y+gVhinoNWpJ3smKQ9T2WRPN/aFXIO5/QakpPFZNDZ4qL3iQ6kNRMSqyk+bSUYYlcS3YA+i88ganD2ngYB8YMBfcp3Qrc6CnqTGK6ysUAhVMuez3RqkJI2fYUaHTiz9hz9VPn79xxZ6UWwA1qeMiodEHoCKOgWeZ4nyTQfeiPBQDpKLQ7okdaqiqyOmcBi7i6jSsl2QTfLwTyt+oy+YUQpfPalVafLuaM/SiCGgQOR52fTcYisiZTGcP7yJfMBi5lVE60KLPPV4OSfoIKaBG3kOfwSsR18Jn0Hmy4kS1BjRQQUIYaHnkBenOkoO6W4KuXdR2c7ZnQqx8atJtVImr3i5glWA3ThkfUk7Sgsu6lROLoF39+Piw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7300.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(376002)(136003)(39860400002)(346002)(396003)(66476007)(91956017)(76116006)(66556008)(64756008)(66446008)(8676002)(2906002)(66946007)(86362001)(71200400001)(44832011)(9686003)(6512007)(186003)(316002)(26005)(54906003)(6486002)(6916009)(966005)(6506007)(83380400001)(4326008)(45080400002)(33656002)(8936002)(478600001)(1076003)(83080400001)(5660300002)(33716001)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: rC4cUk+MSPfAHb58MYUMQDwgtm7dQx2s/RsAU53kudoJGcHTymyyMnov0l7aW0139m1W6gUCGHy52rDTAcZ5l4b/3n/ayS+Z9lAcDTbeArsztKhhIpUnbAwr3biXrr8CxKBiHwAUlcCg7QnaJf7n/TdaIzFptDacUtsM1hocn/A2FzvkXsVAQH6QeCVLBkH4HgnphM2fVOIZwpiAQseiGZjhnPga9D13OLWC0h4Lm9YE74NEUsyH75DWYQ9vuHK1QgBokFJYlT0Y22+w6L5+xC2jSVMAXac6knB9vvvSAns4/zODpmnzj+vb1CeK16Izsyv2Pdywx8R1cXUewvomh/65+yD+4wAESgZz7VjLyhyDEe5Pk3K84u+TbusnNp4zcOLHA0eh6QT7KAADtJzhoXChN1Ittya6OxF455QdK0DkDW8SpVADJFwEOLdg7VpxsgOlKZseFmh+TM4/m52RrLi42gJwMyHhfWzDqjRO5taqT+QQ1Fc8Me8o2bLtked3KpaP19Wx9A0bVPi3CQUoSXwXfeDaB/j+67T0LJ8w95k9sqvxwnKoGyy3OaMI3Ob5ZOhLMd17W08Gpma0nOaNacH8oLhgFAzN61hod2gs+lr+5gPM3GgBYMqW6eZzP2AslhszZw8poa5EYjaCNVUkzQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1FA3A3BDF734EB4DBA9D2C636E35A6A9@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caaa51b6-3918-453f-aec9-08d864520029
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2020 08:31:02.4239
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W+KMylbbdHOX6aAVyRv8ewDUKDAeX4sbZnqC8PCd9iMF12+7c1w7J8JGog/22exdBixSLUPwdG+qUthox+Wvnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7123
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 20-09-29 15:41:14, kernel test robot wrote:
> All warnings (new ones prefixed by >>):
>=20
>    drivers/usb/cdns3/gadget.c: In function 'cdns3_wa2_descmiss_copy_data'=
:
> >> drivers/usb/cdns3/gadget.c:509:7: warning: variable 'length' set but n=
ot used [-Wunused-but-set-variable]
>      509 |   int length;
>          |       ^~~~~~
>=20
> vim +/length +509 drivers/usb/cdns3/gadget.c
>=20
> f12b2ec1c423979 Peter Chen     2020-09-10  494 =20
> 6bbf87a131edd39 Pawel Laszczak 2019-08-26  495  /**
> 6bbf87a131edd39 Pawel Laszczak 2019-08-26  496   * cdns3_wa2_descmiss_cop=
y_data copy data from internal requests to
> 6bbf87a131edd39 Pawel Laszczak 2019-08-26  497   * request queued by clas=
s driver.
> 6bbf87a131edd39 Pawel Laszczak 2019-08-26  498   * @priv_ep: extended end=
point object
> 6bbf87a131edd39 Pawel Laszczak 2019-08-26  499   * @request: request obje=
ct
> 6bbf87a131edd39 Pawel Laszczak 2019-08-26  500   */
> 6bbf87a131edd39 Pawel Laszczak 2019-08-26  501  static void cdns3_wa2_des=
cmiss_copy_data(struct cdns3_endpoint *priv_ep,
> 6bbf87a131edd39 Pawel Laszczak 2019-08-26  502  					 struct usb_request =
*request)
> 6bbf87a131edd39 Pawel Laszczak 2019-08-26  503  {
> 6bbf87a131edd39 Pawel Laszczak 2019-08-26  504  	struct usb_request *desc=
miss_req;
> 6bbf87a131edd39 Pawel Laszczak 2019-08-26  505  	struct cdns3_request *de=
scmiss_priv_req;
> 6bbf87a131edd39 Pawel Laszczak 2019-08-26  506 =20
> 6bbf87a131edd39 Pawel Laszczak 2019-08-26  507  	while (!list_empty(&priv=
_ep->wa2_descmiss_req_list)) {
> 6bbf87a131edd39 Pawel Laszczak 2019-08-26  508  		int chunk_end;
> 6bbf87a131edd39 Pawel Laszczak 2019-08-26 @509  		int length;
> 6bbf87a131edd39 Pawel Laszczak 2019-08-26  510 =20
> 6bbf87a131edd39 Pawel Laszczak 2019-08-26  511  		descmiss_priv_req =3D
> 6bbf87a131edd39 Pawel Laszczak 2019-08-26  512  			cdns3_next_priv_reques=
t(&priv_ep->wa2_descmiss_req_list);
> 6bbf87a131edd39 Pawel Laszczak 2019-08-26  513  		descmiss_req =3D &descm=
iss_priv_req->request;
> 6bbf87a131edd39 Pawel Laszczak 2019-08-26  514 =20
> 6bbf87a131edd39 Pawel Laszczak 2019-08-26  515  		/* driver can't touch p=
ending request */
> 6bbf87a131edd39 Pawel Laszczak 2019-08-26  516  		if (descmiss_priv_req->=
flags & REQUEST_PENDING)
> 6bbf87a131edd39 Pawel Laszczak 2019-08-26  517  			break;
> 6bbf87a131edd39 Pawel Laszczak 2019-08-26  518 =20
> 6bbf87a131edd39 Pawel Laszczak 2019-08-26  519  		chunk_end =3D descmiss_=
priv_req->flags & REQUEST_INTERNAL_CH;
> 6bbf87a131edd39 Pawel Laszczak 2019-08-26  520  		length =3D request->act=
ual + descmiss_req->actual;

The "length" is used here.

This logic is existed one year ago, and not introduced during recent
patches.

Peter

> 6bbf87a131edd39 Pawel Laszczak 2019-08-26  521  		request->status =3D des=
cmiss_req->status;
> f12b2ec1c423979 Peter Chen     2020-09-10  522  		__cdns3_descmiss_copy_d=
ata(request, descmiss_req);
> 6bbf87a131edd39 Pawel Laszczak 2019-08-26  523  		list_del_init(&descmiss=
_priv_req->list);
> 6bbf87a131edd39 Pawel Laszczak 2019-08-26  524  		kfree(descmiss_req->buf=
);
> 6bbf87a131edd39 Pawel Laszczak 2019-08-26  525  		cdns3_gadget_ep_free_re=
quest(&priv_ep->endpoint, descmiss_req);
> 6bbf87a131edd39 Pawel Laszczak 2019-08-26  526  		--priv_ep->wa2_counter;
> 6bbf87a131edd39 Pawel Laszczak 2019-08-26  527 =20
> 6bbf87a131edd39 Pawel Laszczak 2019-08-26  528  		if (!chunk_end)
> 6bbf87a131edd39 Pawel Laszczak 2019-08-26  529  			break;
> 6bbf87a131edd39 Pawel Laszczak 2019-08-26  530  	}
> 6bbf87a131edd39 Pawel Laszczak 2019-08-26  531  }
> 6bbf87a131edd39 Pawel Laszczak 2019-08-26  532 =20
>=20
> :::::: The code at line 509 was first introduced by commit
> :::::: 6bbf87a131edd39040974f3843ff97e89310ebde usb:cdns3 Fix for stuck p=
ackets in on-chip OUT buffer.
>=20
> :::::: TO: Pawel Laszczak <pawell@cadence.com>
> :::::: CC: Felipe Balbi <felipe.balbi@linux.intel.com>
>=20
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
.01.org%2Fhyperkitty%2Flist%2Fkbuild-all%40lists.01.org&amp;data=3D02%7C01%=
7Cpeter.chen%40nxp.com%7Ceb44b3a98d6249fb88f808d8644b2c46%7C686ea1d3bc2b4c6=
fa92cd99c5c301635%7C0%7C0%7C637369624019300389&amp;sdata=3D0Nz5ERcQp2BxO5q7=
uuiIjW3O8Sw6pbyDw1Q9QsqG5Fg%3D&amp;reserved=3D0



--=20

Thanks,
Peter Chen=
