Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79E4920D0B
	for <lists+linux-omap@lfdr.de>; Thu, 16 May 2019 18:31:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726460AbfEPQbL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 May 2019 12:31:11 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:58578 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726449AbfEPQbL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 May 2019 12:31:11 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4GGV5uh071848;
        Thu, 16 May 2019 11:31:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1558024265;
        bh=jeIiX1ugKjXjYzjsBh+YQO0SdT7K+s5DLa1X0RRUWts=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=X8vN/6swdvwHTh9ACc6niWQ2Ez3waZcTclkwMa4sMs8hSxlYB7ikUCLHy/ZVQijst
         OVVdV6CSPkgNlZABhfJHFr7ttwYRa0m9Ju8KoDPFndln1o2msJqih8t7cwTyu6axI3
         cpZAVpww1aL5jxO763DyWWm3en0OniSD5kUNgohg=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4GGV4mZ102942
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 16 May 2019 11:31:05 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 16
 May 2019 11:31:04 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 16 May 2019 11:31:04 -0500
Received: from [172.22.219.79] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4GGV27S044457;
        Thu, 16 May 2019 11:31:02 -0500
Subject: Re: [PATCH 2/2] arm: dts: dra76-evm: Disable rtc target module
To:     Tony Lindgren <tony@atomide.com>
CC:     <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <t-kristo@ti.com>
References: <20190516090657.25211-1-j-keerthy@ti.com>
 <20190516090657.25211-2-j-keerthy@ti.com> <20190516161256.GB5447@atomide.com>
From:   keerthy <j-keerthy@ti.com>
Message-ID: <f3c2a6cd-b478-cec4-cde6-3eb5b6a11392@ti.com>
Date:   Thu, 16 May 2019 22:01:01 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190516161256.GB5447@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 5/16/2019 9:42 PM, Tony Lindgren wrote:
> Hi,
> 
> * Keerthy <j-keerthy@ti.com> [190516 09:06]:
>> rtc is fused out on dra76 and accessing target module
>> register is causing a boot crash hence disable it.
> 
> So for a fix, can we have a separate dra7 something dtsi file
> to disable these instead?
> 
> Or are there already multiple SoC revisions for the same EVM?

dra76 & dra71 have rtc fused out. So i did not introduce a new dtsi file
to disable.

> 
> Then in the long run, if there are the same EVMs with multiple
> SoC options, the best thing to do is to would be to detect the
> SoC type and update the property dynamically to set the features
> not available on the booted SoC to status = "disabled". Seems
> like that could be done in the ti-sysc driver probe unless needed
> earlier.

For now rtc is disabled only in dra71/dra76. So best disable it in the 
evm.dts? Not sure if we need dynamic disabling as we know at DT level 
that it is to be disabled.


> 
> Regards,
> 
> Tony
> 
