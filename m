Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9226186DC3
	for <lists+linux-omap@lfdr.de>; Mon, 16 Mar 2020 15:48:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731597AbgCPOsl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Mar 2020 10:48:41 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:40664 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731549AbgCPOsl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 16 Mar 2020 10:48:41 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02GEmaY5092372;
        Mon, 16 Mar 2020 09:48:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584370116;
        bh=UooX8ZNh9tr7y4gxXLpPFHF5TDh2m19GWAc6UYXvUo0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=oV18zW7FS2UjKbHiEMKyD9jTTTDsLv8Jt25tv0xLNCgqPgf8Zg0S0YJA/l9yB7Gca
         HgsFBwXLEA6MdCrR0Nexw/eT7EkonthCWD7CubrJ1iCrxFTSFh5zS3CxopWh4b/MAe
         11wUDTI6Rzie0jfI5j2kvXoOyTqjw8KCohun8r2k=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02GEma1A055336
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 16 Mar 2020 09:48:36 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 16
 Mar 2020 09:48:34 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 16 Mar 2020 09:48:34 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02GEmVxO027810;
        Mon, 16 Mar 2020 09:48:32 -0500
Subject: Re: [PATCH] clk: ti: am43xx: Fix clock parent for RTC clock
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tony Lindgren <tony@atomide.com>
CC:     <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-omap@vger.kernel.org>
References: <20200221171030.39326-1-tony@atomide.com>
 <158231096467.258574.11716255621346536160@swboyd.mtv.corp.google.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <831d632e-78da-07c4-f8c7-14d17ba1ef28@ti.com>
Date:   Mon, 16 Mar 2020 16:48:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <158231096467.258574.11716255621346536160@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 21/02/2020 20:49, Stephen Boyd wrote:
> Quoting Tony Lindgren (2020-02-21 09:10:30)
>> Currently enabling clkctrl clock on am4 can fail for RTC as the clock
>> parent is wrong for RTC.
>>
>> Fixes: 76a1049b84dd ("clk: ti: am43xx: add new clkctrl data for am43xx")
>> Signed-off-by: Tony Lindgren <tony@atomide.com>
>> ---
>>
>> It is unclear if we can end up with RTC hung with the current mainline
>> kernel in some cases. Probing RTC with device tree data only seems to
>> trigger this every time.
> 
> It's small enough and if it's annoying enough we can probably put it
> into clk-fixes to get it fixed for this release instead of waiting. Can
> Tero ack it?
> 

Sure,

Acked-by: Tero Kristo <t-kristo@ti.com>
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
