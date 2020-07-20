Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EED7225AB4
	for <lists+linux-omap@lfdr.de>; Mon, 20 Jul 2020 11:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbgGTJDC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 20 Jul 2020 05:03:02 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:33464 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbgGTJDC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 20 Jul 2020 05:03:02 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06K92l89036921;
        Mon, 20 Jul 2020 04:02:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595235767;
        bh=2aK1Nq6svwgyD10hnTIKEQ0POeQvbQCo+oPtFoI9kr0=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=Cb6YhH/ZAEY2ldzLaTlTLABumSyhtZDkqxxnjU5DJyPRcl2dKZn8cDmDCcCjBzzE+
         9CVG17ckKc0KsQwpsqG5IJL6FzgBEmYTi2PD+bSp1VARp2m+iKQopRTUvpiDrxo4gc
         i/SQfpLpJ789W+c2sVZvq8a9Ydde6HCoe+91RKMQ=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06K92lKZ074653;
        Mon, 20 Jul 2020 04:02:47 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 20
 Jul 2020 04:02:47 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 20 Jul 2020 04:02:47 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06K92jAh114354;
        Mon, 20 Jul 2020 04:02:46 -0500
Subject: Re: omap-mcbsp 49022000.mcbsp: TX Buffer Overflow!
To:     Jarkko Nikula <jarkko.nikula@bitmer.com>,
        Dave Young <dyoung@redhat.com>, <alsa-devel@alsa-project.org>,
        <linux-omap@vger.kernel.org>
References: <20200711033356.GA164619@dhcp-128-65.nay.redhat.com>
 <e4fc5a03-0343-d9c7-757f-b9652f0cd0ed@bitmer.com>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
X-Pep-Version: 2.0
Message-ID: <74f478d4-4028-0c5f-da21-f6cdf8d7e13e@ti.com>
Date:   Mon, 20 Jul 2020 12:03:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e4fc5a03-0343-d9c7-757f-b9652f0cd0ed@bitmer.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 14/07/2020 21.03, Jarkko Nikula wrote:
> Hi
>=20
> On 7/11/20 6:33 AM, Dave Young wrote:
>> Hi,
>>
>> I'm trying to use g_audio on my Nokia N900 with mainline kernel. Seems=

>> it does not work.  No sound when I play from a laptop, and also see a
>> lot of error like below:
>> [ 4729.557647] omap-mcbsp 49022000.mcbsp: TX Buffer Overflow!
>> ...
>>
> Head 0dc589da873b ("Merge tag 'iommu-fixes-v5.8-rc5' of
> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu") records and
> plays fine here (arecord -f dat |aplay), although I see some of those
> errors but don't hear any glitches etc.
>=20
> Peter, does above indicate a serious issue or is it perhaps a false
> alarm on OMAP3 (no audible glitches)?

I need to dig out my n900 or beagleXM, but it is hard to believe it is
not a result of a glitch.
The DMA is triggered by McBSP and it should write exactly what McBSP
expects to be receiving.

I can not recall any changes in the past years which would have
introduced regressions in McBSP or the sDMA driver.

> I believe you don't have some mixer knob on, N900 audio path is somewha=
t
> complex and needs bunch of mixer switches and volumes to be set. I
> attached my N900 mixer scripts for you to try.

This could be the reason for the silence, I have asoundrc files
somewhere to restore a 'good' mixer config.

> Set first everything off:
> ./aic34_scripts/shutdown.sh
>=20
> Then enable internal digital microphone and speakers:
> ./aic34_scripts/dmic.sh
> ./aic34_scripts/speakers.sh
>=20
> Hopefully these help you get going :-)
>=20

- P=C3=A9ter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

