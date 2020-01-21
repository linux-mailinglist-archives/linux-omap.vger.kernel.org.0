Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FE281437A4
	for <lists+linux-omap@lfdr.de>; Tue, 21 Jan 2020 08:32:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728750AbgAUHcx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Jan 2020 02:32:53 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:41076 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbgAUHcw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Jan 2020 02:32:52 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00L7Wncx036835;
        Tue, 21 Jan 2020 01:32:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579591969;
        bh=8qCt/ZQ3iz3tMMfpD2VbPrdk7zpQZjklAyzKBKWUJmE=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=FNH2XfbBRitmg0do+So31j13NDPdukVw+O0tgipIqClNiOte2OIXlvMz+fjInYLTH
         rTuXktlSsRdEWUBsRHHk3gPjyPLke53PmAvZU3JeiYdBz9818DhAwuZ9y3s+MaldZH
         oyaH1ip/v7xyJbC01lCuZnPwjVq3afFIAWu7YhNw=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00L7Wn2G001973;
        Tue, 21 Jan 2020 01:32:49 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 21
 Jan 2020 01:32:48 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 21 Jan 2020 01:32:48 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00L7WjQj037082;
        Tue, 21 Jan 2020 01:32:46 -0600
Subject: Re: [Patch v4 01/10] clk: ti: dra7: add cam clkctrl data
To:     Stephen Boyd <sboyd@kernel.org>, Benoit Parrot <bparrot@ti.com>,
        Tony Lindgren <tony@atomide.com>, <linux-clk@vger.kernel.org>,
        <linux-omap@vger.kernel.org>
CC:     Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20191211140558.10407-1-bparrot@ti.com>
 <20191211140558.10407-2-bparrot@ti.com>
 <20191230195823.D48E1206CB@mail.kernel.org>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <8fd606d3-0840-ae7c-247c-fce992500535@ti.com>
Date:   Tue, 21 Jan 2020 09:32:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191230195823.D48E1206CB@mail.kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 30/12/2019 21:58, Stephen Boyd wrote:
> Quoting Benoit Parrot (2019-12-11 06:05:49)
>> Add clkctrl data for CAM domain.
>>
>> Signed-off-by: Benoit Parrot <bparrot@ti.com>
>> Acked-by: Tony Lindgren <tony@atomide.com>
>> Acked-by: Rob Herring <robh@kernel.org>
>> ---
> 
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> 

Queued this patch towards 5.6, thanks.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
