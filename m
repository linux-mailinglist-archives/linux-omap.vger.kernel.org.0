Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45CF71437A9
	for <lists+linux-omap@lfdr.de>; Tue, 21 Jan 2020 08:33:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727059AbgAUHdg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Jan 2020 02:33:36 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:41196 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbgAUHdg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Jan 2020 02:33:36 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00L7XHU1036962;
        Tue, 21 Jan 2020 01:33:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579591997;
        bh=C/ai8uT5QPbu2V9NTLy5SNVE15HzF2Uvd2OOTJ7N+PU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=CHISv2HIdRK0PX2pJpdMhp2h1cK6LU0sNyyNG0gnp6VOUs1JdxIlaT0WJTpYCJuz1
         v8QlDKXLIQQ9NHoSPwzdRiiW1OiS6cdraMbs4fyZCyqhA6t0Ll4eLCaSewBAo69dHV
         wiPG6EPbQZ7CyIp29nv9VYVgJKD1OkWjlDjdgNiA=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00L7XHu3100433
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 21 Jan 2020 01:33:17 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 21
 Jan 2020 01:33:16 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 21 Jan 2020 01:33:16 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00L7XDxB055876;
        Tue, 21 Jan 2020 01:33:14 -0600
Subject: Re: [PATCH] clk: ti: add clkctrl data dra7 sgx
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tony Lindgren <tony@atomide.com>
CC:     <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Robert Nelson <robertcnelson@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
References: <20191101162719.49781-1-tony@atomide.com>
 <20200106031426.B1B6D21582@mail.kernel.org>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <3d62b6f6-63ce-f009-84af-a177c7844d46@ti.com>
Date:   Tue, 21 Jan 2020 09:33:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200106031426.B1B6D21582@mail.kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 06/01/2020 05:14, Stephen Boyd wrote:
> Quoting Tony Lindgren (2019-11-01 09:27:19)
>> This is similar to what we have for omap5 except the gpu_cm address is
>> different, the mux clocks have one more source option, and there's no
>> divider clock.
>>
>> Note that because of the current dts node name dependency for mapping to
>> clock domain, we must still use "gpu-clkctrl@" naming instead of generic
>> "clock@" naming for the node. And because of this, it's probably best to
>> apply the dts node addition together along with the other clock changes.
>>
>> For accessing the GPU, we also need to configure the interconnect target
>> module for GPU similar to what we have for omap5, I'll send that change
>> separately.
>>
>> Cc: Benoit Parrot <bparrot@ti.com>
>> Cc: "H. Nikolaus Schaller" <hns@goldelico.com>
>> Cc: Robert Nelson <robertcnelson@gmail.com>
>> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> Signed-off-by: Tony Lindgren <tony@atomide.com>
>> ---
> 
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> 

Queued up towards 5.6, thanks.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
