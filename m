Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2215E391E0C
	for <lists+linux-omap@lfdr.de>; Wed, 26 May 2021 19:23:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232861AbhEZRZN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 May 2021 13:25:13 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:57840 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234357AbhEZRZF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 26 May 2021 13:25:05 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14QHNTaY046004;
        Wed, 26 May 2021 12:23:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1622049809;
        bh=EW091oPaw1JH9/TPgL410MfvKvBaQ/JlXlEj681B77c=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=sy65Se2t3SxuKPiz1XdloX1hEjhYW5QUP96TVLOcwmL5pusQymm1unEybND4vm3JO
         c+d6XlnO0uAX9ds8awZ+9KX5nDKegz3GdWzQIekkLHTv4nkTVgT0Z18dxs4v30WarR
         IVrrn6c3ZfxjGtY6Mw97nJnjoF2oVy1F3aI75uzo=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14QHNTut105724
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 26 May 2021 12:23:29 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 26
 May 2021 12:23:28 -0500
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
 DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
 15.01.2176.012; Wed, 26 May 2021 12:23:28 -0500
From:   "Tammana, Gowtham" <g-tammana@ti.com>
To:     Tony Lindgren <tony@atomide.com>, "Anna, Suman" <s-anna@ti.com>
CC:     "bcousson@baylibre.com" <bcousson@baylibre.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "Strashko, Grygorii" <grygorii.strashko@ti.com>,
        "Menon, Nishanth" <nm@ti.com>
Subject: RE: [EXTERNAL] Re: [PATCH] ARM: dts: DRA7x: Fix duplicate USB4 device
 node
Thread-Topic: [EXTERNAL] Re: [PATCH] ARM: dts: DRA7x: Fix duplicate USB4
 device node
Thread-Index: AQHXTob/r6XIvLZ62EiiRlopKG8wt6rzGHyAgAD8fACAAfUYsA==
Date:   Wed, 26 May 2021 17:23:28 +0000
Message-ID: <8e9a178380914fc4bc9f7cef5f9d84f9@ti.com>
References: <20210521211851.14674-1-g-tammana@ti.com>
 <9445e5c9-819c-0aed-f96f-b1ac2ea7d13e@ti.com> <YKyY7mYkNCHIrgSm@atomide.com>
In-Reply-To: <YKyY7mYkNCHIrgSm@atomide.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.43.171]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



>-----Original Message-----
>From: Tony Lindgren <tony@atomide.com>
>Sent: Tuesday, May 25, 2021 1:28 AM
>
>* Suman Anna <s-anna@ti.com> [210524 15:24]:
>> This can be fixed in couple of different ways, and I see there have been
>> different commits that have ultimately caused this.
>>  6b14eb4705d6 ("ARM: dts: DRA7: Move USB_OTG 4 to dra74x.dtsi")
>>  549fce068a31 ("ARM: dts: dra7: Add l4 interconnect hierarchy and ti-
>sysc data"
>>  bcbb63b80284 (ARM: dts: dra7: Separate AM57 dtsi files")
>>  c7b72abca61e ("ARM: OMAP2+: Drop legacy platform data for dra7 dwc3")
>>
>> Would you prefer that we just drop the USB4 target-module reference in
>> dra7-l4.dtsi following the first commit?
>
>Looking at commit 549fce068a31 above, we have dra7-l4.dtsi define a module
>at 0x48940000. But maybe the module is only used for dwc on dra74x?
>
>If this controller instance is on all dra7 SoCs, then it should be in
>dra7-l4.dtsi. If the controller instance is only on dra74x, it should be
>only in dra74x.dtsi file.
>
>Sorry sounds like I have confused some hardware differences along the
>way.

Thanks for the review. The controller instance is seen only in dra74x, push=
ed
a v2 based on the above suggestion.

Thanks,
Gowtham

