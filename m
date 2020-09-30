Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5380127E8B4
	for <lists+linux-omap@lfdr.de>; Wed, 30 Sep 2020 14:41:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728042AbgI3MlN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 30 Sep 2020 08:41:13 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:46170 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbgI3MlN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 30 Sep 2020 08:41:13 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08UCf1Yq104823;
        Wed, 30 Sep 2020 07:41:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1601469662;
        bh=E3JGTzimhdkSP/WG0ZL2hN7U5G3iDp4sM1T6UKdbBDA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=KCPiywxTdAigs7ets07O0RLNZo0e00UdTVER4DXP5nONYegDhx1Kdq4G2b7GMqJK2
         ncnFCWF8oYjubWcYiI0rGoOjVq697Na7o1MrRLmcbl0n/I74EVIU07/wUbiMC5zwe4
         X8YfDiqQRfAcO08HEXirV9ZBmqaZzEkZOuDb6bxQ=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08UCf1ex095011
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 30 Sep 2020 07:41:01 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 30
 Sep 2020 07:41:01 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 30 Sep 2020 07:41:01 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08UCf0en088092;
        Wed, 30 Sep 2020 07:41:00 -0500
Subject: Re: Slow booting on x15
To:     Tony Lindgren <tony@atomide.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
References: <20200918155844.GH28436@pendragon.ideasonboard.com>
 <20200923070758.GT7101@atomide.com>
 <20200923111346.GA3980@pendragon.ideasonboard.com>
 <20200924054220.GA9471@atomide.com> <20200924055313.GC9471@atomide.com>
 <fe0a4fa8-53fc-d316-261f-52f631f12469@ti.com>
 <20200924060826.GE9471@atomide.com>
 <20200924133049.GH3968@pendragon.ideasonboard.com>
 <20200925115147.GM9471@atomide.com>
 <20200925115817.GB3933@pendragon.ideasonboard.com>
 <20200930052057.GP9471@atomide.com>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
X-Pep-Version: 2.0
Message-ID: <d8d81891-7e22-81a2-19df-6e9a5f8679c4@ti.com>
Date:   Wed, 30 Sep 2020 15:41:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200930052057.GP9471@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 30/09/2020 8.20, Tony Lindgren wrote:
> * Laurent Pinchart <laurent.pinchart@ideasonboard.com> [200925 11:59]:
>> On Fri, Sep 25, 2020 at 02:51:47PM +0300, Tony Lindgren wrote:
>>> This is from beagle x15. I wonder how Tomi is seeing over six seconds=

>>> at that point though while I'm seeing two something.
>>
>> And I see 10s on the same platform.
>=20
> Hmm I wonder why that does not happen to me? I don't have any displays
> connected currently, maybe that makes a difference?
>=20
> Can you guys try to bisect it down?
>=20
>>>> Still, 1.5s spent there is quite a lot.
>>>
>>> Probably that's when module_init runs and we probe almost everything.=

>>> Might be worth profiling to see if we can optimize out some full dtb
>>> tree searches for example.
>>
>> As far as I can tell, module_init() runs later than that. If we probed=

>> everything there would be lots of messages printed during that period =
of
>> time.
>=20
> Hmm OK. Sorry no ideas other than than me not having displays connected=

> currently.

Fwiw on my beagle x15

v5.8
[    9.908787] Run /sbin/init as init process

v5.9-rc7
[   15.085373] Run /sbin/init as init process


It appears to be 'fixed' in next-20200928: the board does not even boot.

next-20200928 on omap5
[    9.936806] Run /sbin/init as init process


-rc7 spends most of it's time:
[    7.635530] Micrel KSZ9031 Gigabit PHY 48485000.mdio:01: attached PHY =
driver [Micrel KSZ9031 Gigabit PHY] (mii_bus:phy_addr=3D48485000.mdio:01,=
 irq=3DPOLL)
[   14.956671] cpsw 48484000.ethernet eth0: Link is Up - 1Gbps/Full - flo=
w control off
[   15.005211] IP-Config: Complete:


- P=C3=A9ter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/=
Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

