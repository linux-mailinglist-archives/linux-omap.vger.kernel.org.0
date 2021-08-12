Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40C413EAA95
	for <lists+linux-omap@lfdr.de>; Thu, 12 Aug 2021 21:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231898AbhHLTFf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Aug 2021 15:05:35 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:41390 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231601AbhHLTFf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Aug 2021 15:05:35 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17CJ57uu123413;
        Thu, 12 Aug 2021 14:05:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1628795107;
        bh=pnF52mBukrcqc507SViWcTIkTwOehYM2s0GFL/9pkKU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=dluyR+fMMYACb4xDLLJuHHVfBGbwbwHO/8EWRJDmayUHsVHfFMjJWLNTZecfde6Yr
         cT3CdEhgsunqfBjprOopSijibWaxavCv/O4WoQuiN6SezCjVP+T0HpS4nJtrYb3BKE
         oc/SnRu9DHNZ2tK2D3yTtuLIGuRJndgqd0yyVymY=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17CJ57AC112395
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 12 Aug 2021 14:05:07 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 12
 Aug 2021 14:05:07 -0500
Received: from DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f]) by
 DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f%18]) with mapi id
 15.01.2176.012; Thu, 12 Aug 2021 14:05:07 -0500
From:   "Woodruff, Richard" <r-woodruff2@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     David Russell <david.russell73@gmail.com>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: RE: [EXTERNAL] OMAP2430 kernel hangs on ioremap of IVA2.1 addresses
Thread-Topic: [EXTERNAL] OMAP2430 kernel hangs on ioremap of IVA2.1 addresses
Thread-Index: AQHXW64KTel5D7x5GUqgCeE1dBGRWqsIrOqggALerYCAY3DfAP//vyPQgAFogACAAH2uAA==
Date:   Thu, 12 Aug 2021 19:05:07 +0000
Message-ID: <59544f58cf6e4e8c80bd57b392dbf64b@ti.com>
References: <E26ACA77-0F54-41BC-BA45-29B641A6BEA9@gmail.com>
 <cb562f9f798d4431a09f19e8efd24727@ti.com> <YMBdt8dDdvySofuC@atomide.com>
 <2B1CE4CB-689F-4547-A64C-A7FB699F0730@gmail.com>
 <6616af990c3d4cc8b3ca51e1a6e9283e@ti.com> <YRTAfDeGemh7Bt50@atomide.com>
In-Reply-To: <YRTAfDeGemh7Bt50@atomide.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.57.201]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello Tony,

> From: Tony Lindgren <tony@atomide.com>
> Sent: Thursday, August 12, 2021 1:32 AM

> The wl17xx wl18xx driver is behaving OK with various SoCs with the mainli=
ne
> kernel at least as tested with SDIO.
>=20
> For the Linux kernel, often the most recent long term kernel is used, tha=
t is
> linux-5.10.y currently and might be linux-5.15.y at the end of the year.
>=20
> If you just need basic SoC support and wl18xx, then I don't see issues us=
ing
> current stable kernels. The SoC is fairly similar for peripherals for var=
ious
> omap3 devices that are still being actively used :)
>=20
> If you need to use out of tree hardware accelerators and and power
> management, then things might get a bit trickier.

Your recommendation makes sense to me.  Thanks for the good summary of the =
current usage.

Regards,
Richard W.

