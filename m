Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 615482CA13F
	for <lists+linux-omap@lfdr.de>; Tue,  1 Dec 2020 12:27:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727463AbgLALYI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Dec 2020 06:24:08 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:57910 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726689AbgLALYI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 1 Dec 2020 06:24:08 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B1BN9Rh044078;
        Tue, 1 Dec 2020 05:23:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606821789;
        bh=njY5/EJtd2IjlnHzgy8fUxRc8jYbfMy5z9fVwAcQn9A=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=yc6UeGQxItK4c8NUuuMLMBaCB0XaC3SV0VRIzr+LPNKL9yaZCgZAxtiawECH3mQm4
         4G/B0frfOjUBe59hyJK1P/nQuGi1Un4WgbTf90hHIG7qMvjraDHxOLSoDkFi66VfBi
         qQDj6xxsy432uuaM7JpHeuITwUg/ljVqYygJWYpI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B1BN9HJ050306
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 1 Dec 2020 05:23:09 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 1 Dec
 2020 05:23:09 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 1 Dec 2020 05:23:09 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B1BN7VW023845;
        Tue, 1 Dec 2020 05:23:07 -0600
Subject: Re: [PATCH v4 64/80] drm/omap: dsi: cleanup channel usages
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        <hns@goldelico.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-65-tomi.valkeinen@ti.com>
 <20201201001712.GI25713@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <a193685d-e176-2288-053c-01ca0887bc79@ti.com>
Date:   Tue, 1 Dec 2020 13:23:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201201001712.GI25713@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 01/12/2020 02:17, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Tue, Nov 24, 2020 at 02:45:22PM +0200, Tomi Valkeinen wrote:
>> The "channel" usage in omap dsi driver is super confusing. We have three
>> different "channels":
>>
>> 1) DSI virtual channel ID. This is a number from 0 to 3, included in the
>> packet payload.
>>
>> 2) VC. This is a register block in the DSI IP. There are four of those
>> blocks. A VC is a DSI "pipeline", with defined fifo settings, data
>> source (cpu or dispc), and some other settings. It has no relation to
>> the 1).
> 
> Lovely that it's called VC :-)

Yes. There are 4 VC blocks. My guess is that initially the HW designers meant that one HW VC block
is used for one DSI channel (DSI supports 4 channels). But at least I cannot see how the HW could be
used that way.

>> 3) dispc channel. It's the "pipeline" number dispc uses to send pixel
>> data.
>>
>> To clean this up use the following names for each of the above: 1)
>> "channel" 2) "vc" 3) "dispc_channel"
> 
> 1) and 2) will still be prone to confusion :-S Would it help to name 2)
> hw_vc or something similar ?

The omap dsi driver uses "vc" and "channel" consistently after this patch, and afaics in the DRM
framework it's always "channel". So I kind of agree with you but I hope this is enough. Otherwise
I'll spend lots of hours solving the conflicts after rename... Well, a new rename patch could be
done later on top if needed.

>> This patch is mostly about renaming things, but as in some places 1) and
>> 2) have gotten mixed up, additional changes were needed to untangle
>> them. This is mostly just adding a new parameter to some functions so
>> that we pass both the vc and the channel.
> 
> It would ease review if this could be split in two patches.

Ok. I'll see if I can split this up without a huge amount of work. They are a bit tangled up... But
I agree, this is a bit too big patch.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
