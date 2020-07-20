Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4375C225BAE
	for <lists+linux-omap@lfdr.de>; Mon, 20 Jul 2020 11:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727769AbgGTJbi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 20 Jul 2020 05:31:38 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:49996 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726520AbgGTJbi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 20 Jul 2020 05:31:38 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06K9VPuj092489;
        Mon, 20 Jul 2020 04:31:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595237485;
        bh=Mk0n1A2T8FvzB1xfSmHVxnF5QJPFxrkdVyVRA6kgP2g=;
        h=Subject:From:To:References:Date:In-Reply-To;
        b=KbxWNmWy/Z7ar0+6WC80Kp15UnVfQPANu21VcRx7/DcwhO30PjRFLtIPfYAyEFX5P
         oihJGaFAAFwPvTI8PvOOAWsF/RLJr/PAv5ftCS6PcikYuxR7TpMYFhjZ8waVurNetW
         iat1FTtMxNryoWaWVOCuKgSgeUV9vsvtENPMfdbo=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06K9VP7v106782
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 20 Jul 2020 04:31:25 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 20
 Jul 2020 04:31:24 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 20 Jul 2020 04:31:24 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06K9VN55023396;
        Mon, 20 Jul 2020 04:31:23 -0500
Subject: Re: omap-mcbsp 49022000.mcbsp: TX Buffer Overflow!
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
To:     Jarkko Nikula <jarkko.nikula@bitmer.com>,
        Dave Young <dyoung@redhat.com>, <alsa-devel@alsa-project.org>,
        <linux-omap@vger.kernel.org>
References: <20200711033356.GA164619@dhcp-128-65.nay.redhat.com>
 <e4fc5a03-0343-d9c7-757f-b9652f0cd0ed@bitmer.com>
 <74f478d4-4028-0c5f-da21-f6cdf8d7e13e@ti.com>
X-Pep-Version: 2.0
Message-ID: <d8829b8a-eca7-f0e3-600f-3263619332b3@ti.com>
Date:   Mon, 20 Jul 2020 12:32:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <74f478d4-4028-0c5f-da21-f6cdf8d7e13e@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 20/07/2020 12.03, Peter Ujfalusi wrote:
> Hi,
>=20
> On 14/07/2020 21.03, Jarkko Nikula wrote:
>> Hi
>>
>> On 7/11/20 6:33 AM, Dave Young wrote:
>>> Hi,
>>>
>>> I'm trying to use g_audio on my Nokia N900 with mainline kernel. Seem=
s
>>> it does not work.  No sound when I play from a laptop, and also see a=

>>> lot of error like below:
>>> [ 4729.557647] omap-mcbsp 49022000.mcbsp: TX Buffer Overflow!
>>> ...
>>>
>> Head 0dc589da873b ("Merge tag 'iommu-fixes-v5.8-rc5' of
>> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu") records and=

>> plays fine here (arecord -f dat |aplay), although I see some of those
>> errors but don't hear any glitches etc.
>>
>> Peter, does above indicate a serious issue or is it perhaps a false
>> alarm on OMAP3 (no audible glitches)?
>=20
> I need to dig out my n900 or beagleXM, but it is hard to believe it is
> not a result of a glitch.
> The DMA is triggered by McBSP and it should write exactly what McBSP
> expects to be receiving.
>=20
> I can not recall any changes in the past years which would have
> introduced regressions in McBSP or the sDMA driver.

I have booted linux-next on my BeagleXM (OMAP3630, McBSP2 <-> twl4030)
and I don't see the TX overflow print.

I have checked element and threshold modes and it looks fine.
I'm not sure why we have TX Overflow printed on n900.

>> I believe you don't have some mixer knob on, N900 audio path is somewh=
at
>> complex and needs bunch of mixer switches and volumes to be set. I
>> attached my N900 mixer scripts for you to try.
>=20
> This could be the reason for the silence, I have asoundrc files
> somewhere to restore a 'good' mixer config.
>=20
>> Set first everything off:
>> ./aic34_scripts/shutdown.sh
>>
>> Then enable internal digital microphone and speakers:
>> ./aic34_scripts/dmic.sh
>> ./aic34_scripts/speakers.sh
>>
>> Hopefully these help you get going :-)
>>
>=20
> - P=C3=A9ter
>=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

- P=C3=A9ter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

