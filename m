Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 571462D9FBC
	for <lists+linux-omap@lfdr.de>; Mon, 14 Dec 2020 19:59:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502378AbgLNS5r (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 14 Dec 2020 13:57:47 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:60452 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502372AbgLNS5i (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 14 Dec 2020 13:57:38 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BEItdZD048597;
        Mon, 14 Dec 2020 12:55:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1607972139;
        bh=FrIJvqvn/fA/8kubIsWWJdm8jUX2lnhkpHnCmH1asCI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=PghQRcfNLUiJ+Y7Kvyy0Fj28Uok+8cuhENIw+BU8VNraIZDxdLR3+sDQX82Z64Szm
         NK9VZQ3X+o9G6saMMKo7LD5ZQAh5CxfUr4rTWLPuJ26VOOocgsw5bw8/w62Yow9ysm
         nptTs9PvkThpKLyYeTjumMEJdovs2lC+NqUlAFp8=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BEItd10092362
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 14 Dec 2020 12:55:39 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 14
 Dec 2020 12:55:39 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 14 Dec 2020 12:55:38 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BEItbgI078662;
        Mon, 14 Dec 2020 12:55:37 -0600
Subject: Re: [PATCH v5 27/29] drm/omap: dsi: remove ulps support
To:     Sebastian Reichel <sre@kernel.org>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <dri-devel@lists.freedesktop.org>,
        Tony Lindgren <tony@atomide.com>, <hns@goldelico.com>,
        Sekhar Nori <nsekhar@ti.com>, <linux-omap@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-28-tomi.valkeinen@ti.com>
 <20201214173923.2plaloeowhxddbwe@earth.universe>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <0484822c-40e1-6738-aea8-c4a5d6609bb1@ti.com>
Date:   Mon, 14 Dec 2020 20:55:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201214173923.2plaloeowhxddbwe@earth.universe>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 14/12/2020 19:39, Sebastian Reichel wrote:
> Hi,
> 
> On Tue, Dec 08, 2020 at 02:28:53PM +0200, Tomi Valkeinen wrote:
>> ULPS doesn't work, and I have been unable to get it to work. As ULPS
>> is a minor power-saving feature which requires substantial amount of
>> non-trivial code, and we have trouble just getting and
>> keeping DSI working at all, remove ULPS support.
>>
>> When the DSI driver works reliably for command and video mode displays,
>> someone interested can add it back.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> ---
> 
> Is it really 'minor power-saving'? If I search for DSI and ULPS among
> the first results is a TI datasheet for SN65DSI84, which claims device
> active current in the more than 100mA range and ULPS current in the
> less than 10mA range.

I don't have any numbers, just my guesses. For videomode displays or command mode displays in active
use, I don't think ULPS matters much. The link is mostly not in ULPS. And if the display is blanked,
things are off, so again not in ULPS.

It's only for command mode displays, when updated rarely, where I think ULPS matters. Which, of
course, is probably not unusual use case if you have a cmdmode display. But whether OMAP DSI power
savings matches SN65DSI84, I have no clue.

> Considering all known omapdrm DSI users are battery powered devices
> caring for saving as much power as possible, it might be good to just
> keep this until it is being fixed considering this is very close to
> the end of the series anyways?

I don't like to leave known to be broken code around, unless someone has plans to work on it. I
wouldn't be surprised to see ULPS still broken two years from now =). It should be trivial to add
the relevant bits back later.

But I can leave it here if you think it's better, presuming it doesn't have bigger conflicts with
the 29/29 or break anything. However, I have only a few days left in TI, which is why I'm rushing
here a bit (*). If I hit problems, I either have to drop the whole series, or push it in its current
form.

 Tomi

(*) But I will fix possible issues caused by my push, of course.

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
