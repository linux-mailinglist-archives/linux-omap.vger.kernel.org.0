Return-Path: <linux-omap+bounces-2834-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F13689F4C98
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2024 14:42:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF73C162E3F
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2024 13:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 097F61F4276;
	Tue, 17 Dec 2024 13:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="Ly3P/Dqf"
X-Original-To: linux-omap@vger.kernel.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04olkn2025.outbound.protection.outlook.com [40.92.46.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D281F3D57;
	Tue, 17 Dec 2024 13:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.46.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734442816; cv=fail; b=b44R5bPklDNWv/6Hi/XukiHNIKE2vrBJ0+Ec2fyOdOtc4/w4Jt9PkWQ1ZkNLz7Sftyd7aqLLKh22xjQGGrneGWZ2zjNj5Ds21NPNr8xAvGAWY2wIf7r1dqKr9t4bVXIfTpzLC9oX740CvuwAcWYsT6AevF+FZ0f+7+VfJxH6jzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734442816; c=relaxed/simple;
	bh=T0uSoL/AGORnR7BBYpibEcGKujPoejHlnQb3sKQ49zA=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=TPDzkNpqX+MrCE1EJXxPvtGzQdhzN9aNl7eQx+SECCLH6js4KlI1H+kMLOuYCvqjhaiz/14An6+LIun6GPzRMAINe1ehTyKCk4R3y13jVosjBURs0fvUA5qj2xyLjgC/SdkkwP6GP64ePPGBSgs5hGUt6Lfs+zOP+Lkt+erJnuo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=Ly3P/Dqf; arc=fail smtp.client-ip=40.92.46.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fe2t9H0hcgype1tlcQI7MMs7L7Lcj2hLqEhD/ALsi8nPNtgvnw7W13AhGYaoQJMrq2F6LG9oQYQDOwSUVTa7bo3SsVC5OXXd0LI2eYQzETHbeJ9r4AU9Uvp4dqDnNoO0jeeEC7jwhUDVj+HkWUJnIuqt4GRIwpBIUsX8IqCirKNDfY/ys27UXlrQv4HdmnnaEfGVFoD7jbU/5KtS8pu3GMj0B+HTHZdjT10ZtjZ2brkmVXKXjmkrdjyFlYeQ7xrBRNKq0tC9o3ocS7I31GTQDk4up6/vy/JELAi1DortelQjCm4qvpbwOcqQM23b8rGW2YOzgjOuQM9Ycm8XyIwE8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nkRwVNTe7AEQcR2AFj9hF6StfnuR+OViEMHJNZ45zUA=;
 b=d0ms/LId9BSXzKqC3cNyAXSkE8JO7V4jQxgCNEbhBMo3UEx5kiWqiadwD8URiqTRCZUaglfRU5z3+h/ifpzDOJiyCl40USELTIKAAwo9WZD8LpCymscnl1IQJIZf0UOT2v/erPrqhNdzWW248/0SmzWGhWcSV9KN430vQxxWlHQQkk5qFJuB1x7O1lzCvhRwvb/SAFliNMGqkokPIO5/7vTqwSCbzrn5SIq9ThgWnTe/mazynDtN4HYm5dPSbjSkSK3UENpncC/Hi6Ko8M2KqUH7h2AcNQHknx47OiKK1q/+HsWz0UnmGrfRyqbu4au4vTNUHWYaNhLY1ponKJW1OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nkRwVNTe7AEQcR2AFj9hF6StfnuR+OViEMHJNZ45zUA=;
 b=Ly3P/DqfL0AYpdjTWMVzH8BxrqNkJLC5ginuIhSLQKhlGLQSZ2JrIBJ2DXHZ0uwaCJbUvLMZ3jmbXpdFLqxLsbM3yRUJcLjldYE6lpNlQt7ASs4uwZqpM3v94wW8zH6CGTAG1t7M3VHXQgZMw83UBUOES0B1sfOdZF7Cz/d4ilgEdZAWjz2t0A4eHLTxeGwK2ZeXsU5sfNhOQ8DwwmRBpwLxhju0n6eB//0knPWWuPQX/h65PICv1noFHgdSB1pNu+DR+ujgSCWORs+W4YshFG26VGkD3IRElzpKJQpcu4MbOk8dTiArmuIcqmHtw+gLSifZFsBnH1Ix5cBIN3th3g==
Received: from CY5PR10MB5988.namprd10.prod.outlook.com (2603:10b6:930:28::9)
 by MN2PR10MB4221.namprd10.prod.outlook.com (2603:10b6:208:1d7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 13:40:12 +0000
Received: from CY5PR10MB5988.namprd10.prod.outlook.com
 ([fe80::40b0:91eb:984a:1c11]) by CY5PR10MB5988.namprd10.prod.outlook.com
 ([fe80::40b0:91eb:984a:1c11%6]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 13:40:12 +0000
From: Da Shi Cao <dscao999@hotmail.com>
To: "stable@vger.kernel.org" <stable@vger.kernel.org>
CC: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: TI Ethernet Driver TI_K3_AM65_CPSW_NUSS
Thread-Topic: TI Ethernet Driver TI_K3_AM65_CPSW_NUSS
Thread-Index: AQHbUIcZhyVIDHAvZkWvGpkWBtlq2Q==
Date: Tue, 17 Dec 2024 13:40:12 +0000
Message-ID:
 <CY5PR10MB59880DDECD5D282B7665085B8C042@CY5PR10MB5988.namprd10.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR10MB5988:EE_|MN2PR10MB4221:EE_
x-ms-office365-filtering-correlation-id: dfcfc5b8-36b0-47a4-5705-08dd1ea05502
x-microsoft-antispam:
 BCL:0;ARA:14566002|15030799003|19110799003|15080799006|8060799006|7092599003|461199028|8062599003|3412199025|440099028|102099032;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?83TTAGk5UMVa5OXDUVzSSuOhv56SNhqOx+UUf3Kd8vvpSBF8jgtzb9kpf3?=
 =?iso-8859-1?Q?zX4sjDfKZ2T5RwaiwnQXqhcAxrRgKzgjtiea0tHcG+JbL1FYE67VlUuLYr?=
 =?iso-8859-1?Q?ZpFgkFAK2RtRsYgOfVieB+0DU8M6PeTeazqqzAJQgyRsWxuCpCRyQs5ZZb?=
 =?iso-8859-1?Q?jwK7muIf0jaIr9bnYfzKHiISEuHfwoJa5XcYBaBmJaztPM9RJFBD/Y+Zkf?=
 =?iso-8859-1?Q?ICaLzTlbdN120YfvM7cEiY346sKNgW5hd0eJDjjkl5h59sbBkYgtATvpeY?=
 =?iso-8859-1?Q?AOfGYmePdaq4cGI/M9JbW3hCwD0IBOaFaiO74r4Irs1QyjJKKKWUtczGSK?=
 =?iso-8859-1?Q?L4NFY3zbph58IUN4s7wUzpoNOkONC7wnkdWZ48sBbj0vXGZMP0Nv2Lb8ft?=
 =?iso-8859-1?Q?9ln5P/IWuOA55d+MNJTSQ0Uk/4jEGHQ1iotDHBCbhejU4slU4s+lRGyKZ1?=
 =?iso-8859-1?Q?s6MhJNV5ph6x/P9/HEl/w4Pw0b4fwkDorWpauYaPoW9ROz8JiMLvc/u1qQ?=
 =?iso-8859-1?Q?kYZCRH3I8BwMSBq173LgUi0NfHmDFaKZ6YEv5KqKA/7FAjF6+7qqgwchp9?=
 =?iso-8859-1?Q?oDr0X0cTnJRug19RHcJtebEvqh8nor5SyqJadknsiz4LQvpzkF5meWKMYN?=
 =?iso-8859-1?Q?KdyN1ZxJ40SUiAl56rftUF96btzKhbZcArkW1YFqdM9kPXlQUs+ZMFoMVr?=
 =?iso-8859-1?Q?gHi1XHdHohDO4NnnR6Kq5bGdVN2EOgm9pR++UuvDW4Uf2JV/Iid9QpCWau?=
 =?iso-8859-1?Q?qfXlyWvIL5lAbXAr6zrZWy/NnTiB7FRXNhLVTH47DyhMgUEN0bJ2He5/4D?=
 =?iso-8859-1?Q?mzPhowkk5eoW+hYVkbJkjX0nhhWVZDqjsUxw+HaczlgJ4T8STOM7J0Ya00?=
 =?iso-8859-1?Q?yjJndOitCU+WX/qlRs3/1ngB69+94si/JVUDJd99hqq+RjrtkN68Bil1xb?=
 =?iso-8859-1?Q?rZoK21ZLo1wlyd+4XDZ3/CPALYzzUe+eyru3BrtCYS8MHIcB7BxOaqaxyE?=
 =?iso-8859-1?Q?VDNFz8SMtwY9ZYYUDWcHW8Ry3FOxf0Xot7n2VQwZAXzebVipSoXZ1MIOQz?=
 =?iso-8859-1?Q?SrSs472TETQu4xSmJnDMtG6qA9RS/RlsxhuiI3uxLVJD?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?bIJd++dz8cvdqcr+tXWcT/uhjX3shYeZ9Owr/aIAihJKpLJXP25ZM7Y1NO?=
 =?iso-8859-1?Q?or1MJB1za/bG3giBIFsDEjfW++gKduvBBLQ9VHbwv0rxeHeUaxhOWm9EF6?=
 =?iso-8859-1?Q?NzL/w2toZsHu2I9FHweIMlS0F4ZDiOAdIg2V8DeCmM21D6vqS9mKlWss2V?=
 =?iso-8859-1?Q?a7mKz4LuJX2nu6ZLYY50ioUrR+TkxuyyN5fjec9RV+XK4+NSfpPcI49lhy?=
 =?iso-8859-1?Q?GQqo46/6fqfTr+JAC74ikBXJFW6yGC3QOeIzv+QJgKI/znwsGVzRvWJuwC?=
 =?iso-8859-1?Q?gUgDFnqHx5NZNubMANzQXlCkATtXpDfOtoyafF5I7NhFLFJGL+msx+5i2D?=
 =?iso-8859-1?Q?W4Z0b9NAhkdXAoHSFJrCVMyL2HxUsLOLgeujQpljMOFguImuJMQw48IaNg?=
 =?iso-8859-1?Q?KhJ3aVnOIny4qATWavf8JaIehRG8mlLY68FdSQga0DJonvruWu+a7tD2DV?=
 =?iso-8859-1?Q?ED2oq9c/Sf3TURpcUKr0Po0RRvnrhYkLyRozy+j+RP3KYVZCRRGXHde715?=
 =?iso-8859-1?Q?X52uSxztM5W+Qu8psvPHAay9f0kApKm8DdBSZxMSQ7Jr8Ud4IMyvXIseB8?=
 =?iso-8859-1?Q?eqH4/zSQf5yelsfYe+t/kc9P8k+9RDwao4KZHoLRKH7vr5FTpKTwbXZ9nt?=
 =?iso-8859-1?Q?/tcVOpxniiwHU2vLah37MrGYsikbNMt1NYWgx1C+QhfDv75wuayyLSO6RQ?=
 =?iso-8859-1?Q?bW0R/rgg4aKi671V0AsjLjdhbcc3IsqPKe18X+pqr0gUdezdg+hIxBaT0j?=
 =?iso-8859-1?Q?DDynL+3OlUgCrNzllzIT76RdhIkzFF4H7sNOpYB3vvwQQfpaEBTDoVVnDU?=
 =?iso-8859-1?Q?kSI8k3gzg492pNmpkRaIAgPcgLK9FT65pxwKOkw04+apri41Kg4Ap/YRHB?=
 =?iso-8859-1?Q?OZO4O3vCua16e/BxW5yH7owUbYk9biOl/LMSFScRGDjUfd6qOyUJVGgUdJ?=
 =?iso-8859-1?Q?TBRzos8iRh9KxjQq6J1cht9RqXH7VDPVv2DQNH3AMdCdqKzXW8Uz9Iq17Y?=
 =?iso-8859-1?Q?HqYHt6rxmYvw16zRJCkztjGru8n7sGlzfC1FT1K7Uy+vFbnoIRXmihvQGd?=
 =?iso-8859-1?Q?UWYD2jT+ZesYXQsHYh7F8+rWdQ3Y0MHepRw/q0ttyb7F4c3QzRDgfD96bS?=
 =?iso-8859-1?Q?97Apr/D+7xKhDD0+uOc6LnkWLVaMT8oe65y8lQaf74uJCKRxQunN4d++Fu?=
 =?iso-8859-1?Q?NwygOSY2o3xyCANgmo6apfRFX0hAnekDyn4nXPJlfLOH+FwlqwbMTx11Y1?=
 =?iso-8859-1?Q?zD5AtAZ1lutcXzHnu97g=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-28291.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR10MB5988.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: dfcfc5b8-36b0-47a4-5705-08dd1ea05502
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2024 13:40:12.6214
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4221

The driver of TI K3 ethernet port depends on PAGE_POOL configuration option=
. There should be a select PAGE_POOL under it configuration.=0A=
=0A=
--- a/drivers/net/ethernet/ti/Kconfig=0A=
+++ b/drivers/net/ethernet/ti/Kconfig=0A=
@@ -114,6 +114,7 @@ config TI_K3_AM65_CPSW_NUSS=0A=
        select TI_DAVINCI_MDIO=0A=
        select PHYLINK=0A=
        select TI_K3_CPPI_DESC_POOL=0A=
+       select PAGE_POOL=0A=
        imply PHY_TI_GMII_SEL=0A=
        depends on TI_K3_AM65_CPTS || !TI_K3_AM65_CPTS=0A=
        help=0A=
=0A=
Dashi Cao=

