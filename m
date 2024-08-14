Return-Path: <linux-omap+bounces-1908-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AC89518D7
	for <lists+linux-omap@lfdr.de>; Wed, 14 Aug 2024 12:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C675282AEA
	for <lists+linux-omap@lfdr.de>; Wed, 14 Aug 2024 10:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7E71AE03D;
	Wed, 14 Aug 2024 10:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YHAcGC9C"
X-Original-To: linux-omap@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2042.outbound.protection.outlook.com [40.107.102.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410E913D530;
	Wed, 14 Aug 2024 10:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723631522; cv=fail; b=hsoQkgttOfddLw3B+AhYky1zIABZPi9DVVs8BwKoYT3TjxBj+WQH2LBLRfT9BubfTsVVuYILmAJpUcdP2LJK0Wg+oHLBhuDW6LTE2s6EkPKHTfoOtuGcRFHWIfbCk5ZOIMRg2O8VrQ2xAzoBhEyk9CHj49XzSH3UtbfZzIoGuj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723631522; c=relaxed/simple;
	bh=NAKNrxd0HW8Yi5iO9RXc+Oocqg0btfZWQO6iWDKsFq4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IlopyURugn6rmpkiHAnRl4DTVX+e7LpIfhxJrMuhYwkfv3tifmpO3xgNBPRPT7AbY5uRdgtlgal01tKKHEhd/4GJCCXtWWx8DBjDFNqYjqyI9KzsnCY2URU7hoFqenvH3gpN5wSqJlKJ4XP63VJiC9JhAKT218FBTNEXMuDuXrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YHAcGC9C; arc=fail smtp.client-ip=40.107.102.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F2KSli/o8CbBdZ+LQhY1xi3BeBNp537Q4CxoEmT3dtocvkHMqV58NoRMqFp4LmzsNgVrgRxtF6/hMvQQ6kz1mpSEjcYC6w4NE9X2hRQ26C2hTeRV5+oZmGDp4ubIz7FHmA5iRVTewFnNSFMlkiO8Bc6FXBYGe3O7BbO/FKYBADShCmzkt4Zv5kvVVKa0vRgqDJzlaYXSW6EhV0mjnJXUchCE2lCxbWR4rUs3Cyqzg1/ZKyK/LA8vlbE3/iaM/kSeYbIgUxmzeSpdsokzPwGFkApTkeGF7F+6ov7NwQp8iU6NqJ3GRCC7X3YOZl0Pi/SS9NcyuSVu57RK8KnuqAU4Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qei40UCFBrK7dCPXO3y3eui7ChBA1iPqDZ6+HhiSTLM=;
 b=xcP/KaZypoZc2qMm0XimcoSYC6brWeyDENBTp+rNXJx4FrUNV7mdxU+hLw3X9dCgZDSEXk8pPHvSJrMc0QKIsFq9fRjT+LkGSOmVxPqH9wvPycXwHrjls3XBXy4oh5Dh4H17E/QnlMbxpVaQqGaMOKCsD5mtpahn+mu8UaDEt+2cgtfDFP3TKG4C1HPlmEWbVFmBuUhfQbJdGgNrpFGeQ5kdXVs4jUtv/Y2eABxZijkrGpAnRhoSRmZmfrkSZ70vOSUuJlG39YY1jenTD9tNPQ71UoGJcHzFrlN/2OkilmaVcA5CMBqpAljlwe0DBEhcFdEoGvV/wWHBUAlTt4zTLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qei40UCFBrK7dCPXO3y3eui7ChBA1iPqDZ6+HhiSTLM=;
 b=YHAcGC9CVOyxpJCDu5axf82ZPQ8HQ9cE7i0qiDW97KeS6XWFyYaFapzITz2dZbTSw8fKhLvAapSP0l47ezozDloUlPKXvR6POwZxr2QTzxSKpJDgG8ghdZ9rpUlkjNvPbuyUJvUvLSXt30PheD2ud6xWTALUB2roXhcv2SEXkWs=
Received: from MN0PR12MB5953.namprd12.prod.outlook.com (2603:10b6:208:37c::15)
 by MN0PR12MB6293.namprd12.prod.outlook.com (2603:10b6:208:3c2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.23; Wed, 14 Aug
 2024 10:31:57 +0000
Received: from MN0PR12MB5953.namprd12.prod.outlook.com
 ([fe80::6798:13c6:d7ba:e01c]) by MN0PR12MB5953.namprd12.prod.outlook.com
 ([fe80::6798:13c6:d7ba:e01c%5]) with mapi id 15.20.7875.016; Wed, 14 Aug 2024
 10:31:56 +0000
From: "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Thinh Nguyen
	<Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Simek, Michal" <michal.simek@amd.com>, Grygorii Strashko
	<grygorii.strashko@ti.com>, Vignesh R <vigneshr@ti.com>, Felipe Balbi
	<felipe.balbi@linux.intel.com>, Piyush Mehta <piyush.mehta@amd.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
CC: "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH 2/2] usb: dwc3: xilinx: add missing depopulate in probe
 error path
Thread-Topic: [PATCH 2/2] usb: dwc3: xilinx: add missing depopulate in probe
 error path
Thread-Index: AQHa7jNgJic99r4egU2eddzqZdh1erImjYzQ
Date: Wed, 14 Aug 2024 10:31:56 +0000
Message-ID:
 <MN0PR12MB59539C35E552516A6520121EB7872@MN0PR12MB5953.namprd12.prod.outlook.com>
References: <20240814101848.67501-1-krzysztof.kozlowski@linaro.org>
 <20240814101848.67501-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240814101848.67501-2-krzysztof.kozlowski@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB5953:EE_|MN0PR12MB6293:EE_
x-ms-office365-filtering-correlation-id: 50eebd0b-8d3d-408c-bac3-08dcbc4c529f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|921020|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?k7Dp7/ROeTyx55C1gZrjASY2pM9Gx1nqqnjPM4iWA+LvQNWsJCvX81nt1X2d?=
 =?us-ascii?Q?iAXc/dNKBr35ElBVLOvPQKOVj+lRgxBlCe0DLBWTQ0PiGC2GmEGRKGRRpTEC?=
 =?us-ascii?Q?a2s3oiYs6Ld7GWjws8/eMH8MJwTw1DQsIiIFzY/xLmAa6PSAXMIXFvK9JbL4?=
 =?us-ascii?Q?Y870+xvPDaJXdU350jIBSJaMUjf2DLpdwH6Xz3rH8LcflasUR0i1pN0xna4d?=
 =?us-ascii?Q?fAdMo5UNX9h0e6HOG1kUFN9Tr8gxJz6kXm7iDE+InfmYYt2VO4FsAkO4sD97?=
 =?us-ascii?Q?djFaReTELKjtUIqyQbDIvOVMlJbNZJnxe+5Y2NAm4hi3u/8Kp0SSAana1owG?=
 =?us-ascii?Q?EB0bEoof1mDAvmon5ALFQJKJwmYElnZ+BGvGYbY+OTwd8mtMmAKIlrYOORvW?=
 =?us-ascii?Q?AU81Ka1bkl+YH/qNoK8w6O2GPbVMoAnWmE/LHeL+m85tSRAysmSdHYv80JEL?=
 =?us-ascii?Q?8fiZyzYRRgSluHmMsVSgOC61jKwSsvTE0nIw0GZygTvSd3XVOl/SVERr/PWt?=
 =?us-ascii?Q?fQcYp9+LTkcaJWq8+zp+Und6k4KJGVU/DrMig9EHzI4Ot68ANXcvqEDuuhRo?=
 =?us-ascii?Q?Arcr6NGLfmRgGUAtnEjlmqSlYe5v/pDQyTIeAjfj+PYEDHhR6bLuS30fjjtA?=
 =?us-ascii?Q?+z2YB6nJac2ctVYCK+k4NwaucnJkDvZpP5u1q1BUJxGrDgGKcoE19EXQsrC3?=
 =?us-ascii?Q?7nDH8H9pDPEn0UjQ+CUsLrzKUK8IB/vPTWTMEDKVXx+zecCTIgIScI6lc2Yo?=
 =?us-ascii?Q?QEkkwh+4o2VHubL4qJd6bPl07NTngbDai+kEPlHR3jLpvjDAejkNzHaQ8oVa?=
 =?us-ascii?Q?8vNs+PJbYDO/viVBL7m2qToNujlqM4Z4fnpM/pVglzlae8zmbMNn9v3cDMlX?=
 =?us-ascii?Q?NZRzWBQ5/KnOCnWXOatuRYbGiWOKnKVkqC3UyGtSwY+UuiARAwHLhHmTY0WL?=
 =?us-ascii?Q?Xp40GlShIpNcxEiM1P+mHZ3Gs6Ft0nkGz3S0ws4XdyeT4OKRaaN8bnya5T8a?=
 =?us-ascii?Q?Sv6KgTT75FzIto8Wx1WPaLV6DgtBMPLo5hQ1d/stcrWJ3DiodTdsEe7ixHYG?=
 =?us-ascii?Q?dS25oig3nf7qTWfoQSgV+nWbk8or+JFNDlpkB5uWSLo8pSd8nZjeA+obwab0?=
 =?us-ascii?Q?7qtifw4twbzP1O5fYIEIGc95ulyKkwL4UVj+Yc08F+jG4c+VAx0B4fELeNXS?=
 =?us-ascii?Q?Wf/3/6d2/6PnwihJaAkWPwby9C3rRbD0iMLH51e341ZYGE/qBZw4dXfv50xW?=
 =?us-ascii?Q?Rprru1dXbCN59lUw5i5xrj134vTKBL7xKU/sqpOn0BZVFO/ccMtE1pm5GXlD?=
 =?us-ascii?Q?9umXtdwSsFYqZC+XPyWc5hyNJUZWUCP9nFJuO+hNT/Yujjoe0ONAGrs3yJT7?=
 =?us-ascii?Q?Dbp6Fg2fzdbZCXj2lZOldPqZX2Wj9JjzHIeRp11pKSIgRljk3dXVPb+sK1RA?=
 =?us-ascii?Q?Grf9mEDj9MU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5953.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?I5rtM0S+8990UxciCk1LM/TAFU8zdERlGG0G8uzeZLnLkAHTZrlEEK0TrXqX?=
 =?us-ascii?Q?UNyc+Z5ws+I5VIixJeozVPQjJmkNbv36T3RV9KY3POi2OS3q7E1lkFGFVYgd?=
 =?us-ascii?Q?VP510u2vkGWvPqBNuTRRkkpV/Y6w1WYltoG0JhFUDyHHeDaWen1Rzuy0OSQh?=
 =?us-ascii?Q?ELwTNXCulvr+YncthVVuijY1Gi4pSckaafpJs5lzN2mzQDLrt58BaKRbuQE4?=
 =?us-ascii?Q?wAJZuhia7j+aDdUyttSwWFSSXckIUZ/J0oampbEJzJM3aAJbJa78QKCiJ9Oj?=
 =?us-ascii?Q?RxOJXaKifTRNH8nBRhVJGnuR5Hkixt7VtJh3sCajrPY7yMOr4n6p1ww7P4Dm?=
 =?us-ascii?Q?+pgEEX7JLYHz6WMHTE2wGDPQHK+21vBdmRkm9DLGHd00U7ZPRUH2uUtsTfMG?=
 =?us-ascii?Q?MmUQZg7xJt70wHbilyjOOKKEdwNKqP9tA3cBuitOQ1Ze/dYWns8Gup/RzXkU?=
 =?us-ascii?Q?GnRxhHyl9IvAd0jpwJIiULy2UuCM7TvHuSs5mpLRyTS4+6K7BRvG7hwOjtwH?=
 =?us-ascii?Q?0K5v0XWyrvcFEdczAjy6SVKChawTQ/9HwBN6znCsXlOBlDG88efKu+JPLEhQ?=
 =?us-ascii?Q?+MjWM7Dag1VQgMetc3xoNgPp1wtYX9WcPDP3LQh7NkSbwxok/swW/iVh7SxD?=
 =?us-ascii?Q?7MSr35DT6mT1PW50SxRknoHWKb0I4jlEFA8CzqtLXuOWVUbMtUM8KQlTT268?=
 =?us-ascii?Q?jZUDfyhL1y33wlK9/Nr/fDBDG4tslGdzC0/WE1q8yeMqCvuUOYCJgpqgPfAs?=
 =?us-ascii?Q?wfGyECzYc9sKAhkxOerNScpBZgiokE7D4RuWHTg3HtnKS5B1JfFO75xGIkl/?=
 =?us-ascii?Q?1ddwgUVTYTq9WpISR6uP+7Mm++Lhu354tfCvU0T1Ys9J7Y6J8DyFn7gueEEy?=
 =?us-ascii?Q?hjBG/jjRxrATkLIv389SfYYvu1ENFm06V4eElxHO0r7xr9Kb1z7O411bZJxi?=
 =?us-ascii?Q?UO4r/+bwiZAutrtrnzhqT1xNLapfI4Mm4Z9kPg0DRkRq9GcaNv7eURgtPQ4L?=
 =?us-ascii?Q?051OztBp5ZRCz8L2W1GqQDS1Br3SIGOZKC+7aFllA1LcJUTTQllSMYOZRqxw?=
 =?us-ascii?Q?UmWTS9Rb26AaUiqGKi2eaEc4DSV6a99qTr2IvGPPAZp3jb67PBoT+YDCSMb4?=
 =?us-ascii?Q?RNCcMWzGhZQz4Vge3ZZmCc7CsotJ5YUztT0bbuIY5KYUYdUj/QoevYUkmWU3?=
 =?us-ascii?Q?6sqccieFKSJdi9IxXIMYBRilhLcJbxr8j0CaR1CCA1Mi5ooaiz9OreBK6aO6?=
 =?us-ascii?Q?HoYdfGcuZDT+J8z/CP+rc/+rMDM8Ln4RRwcdHE0+qZcAX1LDCfVJ+wWfQYrr?=
 =?us-ascii?Q?Nrflk0qTMpB5sO8l5BxqBNjiazW90d+UwuzUN5dGcgUpBIp7dwFbHnZ3/4Su?=
 =?us-ascii?Q?omNa+HNma+8WqFaqFdoqIgKI/6LEDGPR3LJNFxsBlS5SJ1VX+e1O8FuHrjUw?=
 =?us-ascii?Q?OAjO3xExfiLgkbSTsHE3mH0hNXeMDlnXRLxqgi5ykeIuWNu1n+4wNav1eERa?=
 =?us-ascii?Q?jDlK8bdloDyNpe06iX7ganB4jRKCnn7J3SYYa6xD6f/3vJPIsRUCOo5dXg?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5953.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50eebd0b-8d3d-408c-bac3-08dcbc4c529f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2024 10:31:56.9459
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iCU2ZRpF5KnaOdLgd5HSGqQvUPnaFizcQ4FC8LxGO/c8I27/vrzaxID7TOPg3xfg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6293

> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Sent: Wednesday, August 14, 2024 3:49 PM
> To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>; Simek, Michal <michal.simek@amd.com>;
> Grygorii Strashko <grygorii.strashko@ti.com>; Vignesh R <vigneshr@ti.com>=
;
> Felipe Balbi <felipe.balbi@linux.intel.com>; Pandey, Radhey Shyam
> <radhey.shyam.pandey@amd.com>; Piyush Mehta
> <piyush.mehta@amd.com>; linux-usb@vger.kernel.org; linux-
> omap@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>;
> stable@vger.kernel.org
> Subject: [PATCH 2/2] usb: dwc3: xilinx: add missing depopulate in probe
> error path
>=20
> Depopulate device in probe error paths to fix leak of children resources.
>=20
> Fixes: 53b5ff83d893 ("usb: dwc3: xilinx: improve error handling for PM AP=
Is")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Thanks!
> ---
>  drivers/usb/dwc3/dwc3-xilinx.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilin=
x.c
> index bb4d894c16e9..b7613a106da6 100644
> --- a/drivers/usb/dwc3/dwc3-xilinx.c
> +++ b/drivers/usb/dwc3/dwc3-xilinx.c
> @@ -330,6 +330,7 @@ static int dwc3_xlnx_probe(struct platform_device
> *pdev)
>  	return pm_runtime_resume_and_get(dev);
>=20
>  err_pm_set_suspended:
> +	of_platform_depopulate(dev);
>  	pm_runtime_set_suspended(dev);
>=20
>  err_clk_put:
> --
> 2.43.0


