Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27B7EE7082
	for <lists+linux-omap@lfdr.de>; Mon, 28 Oct 2019 12:37:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730217AbfJ1LhH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 28 Oct 2019 07:37:07 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:55836 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbfJ1LhG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 28 Oct 2019 07:37:06 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9SBb2Ar009056;
        Mon, 28 Oct 2019 06:37:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572262622;
        bh=UPbLgtY+TrqdzraEtAlRQOylIe52OKafaKR8yNPIM0g=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=yqAyD27ZAYDq+bdJ4E0rsz3nkf4ovzF+aBlahfxnTBZQRt2CUq+L9dPdCnlQmE1hU
         /edla9jHm0oFSYtwp/uO2jKeq60e/o0hq6yzfU699HT4VqGbPGMhdWMxo7Yon3E7PQ
         thwOuCUQj1+ZKo60fHCtTNoiC3n0NNKMUhzN4S0U=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9SBb2B1063414
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 28 Oct 2019 06:37:02 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 28
 Oct 2019 06:36:50 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 28 Oct 2019 06:36:50 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9SBaxnY018416;
        Mon, 28 Oct 2019 06:37:00 -0500
Subject: Re: [PATCH 0/4] clk: ti: re-work divider clock support
To:     Tero Kristo <t-kristo@ti.com>, Stephen Boyd <sboyd@kernel.org>,
        <linux-clk@vger.kernel.org>, <mturquette@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>,
        <aford173@gmail.com>
References: <20191002120611.26121-1-t-kristo@ti.com>
 <1115e221-1523-1a60-02a3-1f1939170e64@ti.com>
 <20191028095906.27043208C0@mail.kernel.org>
 <9361d516-a92a-39cd-dbc8-10de10fe6295@ti.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <13533ed2-1a91-2255-5f69-a28e81fba0aa@ti.com>
Date:   Mon, 28 Oct 2019 13:36:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <9361d516-a92a-39cd-dbc8-10de10fe6295@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 28/10/2019 12:23, Tero Kristo wrote:
> On 28/10/2019 11:59, Stephen Boyd wrote:
>> Quoting Tero Kristo (2019-10-24 01:03:20)
>>> On 02/10/2019 15:06, Tero Kristo wrote:
>>>> Hi,
>>>>
>>>> The existing divider clock support appears to have an inherent bug
>>>> because of the bit field width implementation and limitation of divider
>>>> values based on this. The limitation by bit field only is not enough,
>>>> as we can have divider settings which accept only certain range of
>>>> dividers within the full range of the bit-field.
>>>>
>>>> Because of this, the divider clock is re-implemented to use 
>>>> min,max,mask
>>>> values instead of just the bit-field.
>>>
>>> Queued this up for 5.4 fixes, thanks.
>>
>> Is this a regression in 5.4-rc series? Please only send fixes for code
>> that is broken by code that went into the merge window, or is super
>> annoying and broken but we somehow didn't notice. If not, just let it
>> sit in -next until the next merge window and it may still be backported
>> to stable trees anyway.
> 
> Tony/Tomi, how much do you care which one this hits into?

Probably no hurry with this one, as the DSS side patch is enough to 
avoid the bad divider.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
