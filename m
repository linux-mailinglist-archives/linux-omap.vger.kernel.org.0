Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30B52D2DCC
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2019 17:33:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbfJJPcv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Oct 2019 11:32:51 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:58592 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbfJJPcu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Oct 2019 11:32:50 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9AFWkJq098313;
        Thu, 10 Oct 2019 10:32:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570721566;
        bh=RUWS7sx9oE5/v76QHiiPQhgGba9CbGW84cJd7KySne4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=I/e/eGnZFBmizck/Nz50IcrfGKcG4zQUh2f/BvgFuvGohdTHsTBCsUPWhKLRy0bBd
         8Y97+SSjzv9Qu5k3XkZThyCBtHsLHn49tu0unT2AS4YdgZLn0rJ8hAVZQLA8mMAlI4
         kxX/fD6IIKGsObOaU7mb4W1HZDZdtf7I0zO+mlEc=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9AFWkhJ127205
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 10 Oct 2019 10:32:46 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 10
 Oct 2019 10:32:42 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 10 Oct 2019 10:32:42 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9AFWiNY083856;
        Thu, 10 Oct 2019 10:32:44 -0500
Subject: Re: [PATCHv3 00/10] clk: ti: remoteproc / iommu support patches
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>, <s-anna@ti.com>
References: <20190912132613.28093-1-t-kristo@ti.com>
 <ef764d1c-8ebc-4b64-4543-7b296327e197@ti.com>
 <20191010143521.GX5610@atomide.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <e37f9a2f-c554-300f-0866-8c8651941585@ti.com>
Date:   Thu, 10 Oct 2019 18:32:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191010143521.GX5610@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 10/10/2019 17:35, Tony Lindgren wrote:
> * Tero Kristo <t-kristo@ti.com> [191010 08:34]:
>> On 12/09/2019 16:26, Tero Kristo wrote:
>>> Hi,
>>>
>>> V3 of this series sort of reverted back to pretty much V1 which expects
>>> strict sequencing of events from the bus driver. This one doesn't have
>>> any dependency towards the reset driver either, and the controversial
>>> reset handling APIs have been removed.
>>>
>>> -Tero
>>
>> Stephen, any comments on this one or shall I just craft a pull-request for
>> this and rest of the TI clock driver changes towards 5.5? There seems to be
>> a pile of them coming this time over...
> 
> Sounds like we need an immutable branch for the clkctrl related
> changes against v5.4-rc1 that I can also merge into omap-for-v5.5/prm
> branch in addition to the immutable prm reset driver branch.
> 
> Otherwise I can't apply any of the consumer device related dts
> changes into that branch AFAIK.

Well, the sgx patch you can probably merge, as it will fail silently and 
only cause issues if you actually try to enable the device.

However, yes I agree, we should probably setup an immutable branch here.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
