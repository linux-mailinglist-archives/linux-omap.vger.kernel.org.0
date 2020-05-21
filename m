Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 952681DD448
	for <lists+linux-omap@lfdr.de>; Thu, 21 May 2020 19:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729011AbgEUR1F (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 21 May 2020 13:27:05 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:54824 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728864AbgEUR1E (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 21 May 2020 13:27:04 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04LHQlch012436;
        Thu, 21 May 2020 12:26:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590082007;
        bh=5sbZFMXFyR6R0M8wgkVp71flez8Gasc4Z5KA2W8N+4U=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Q88Uz8n8XFOimF1DN2mSKKhcwrafBNj5pONsJ20IssohVHQp/5QhGUuJifhF124qU
         F2raO0vuZAtZjMQWr3GIVnobvapohPdCbcgObPy051uA7r2/XnsZELrD+bh4Rj9DUe
         3o/AO66KI0VZ3ANwh60Xyh4Zc11aJAy+5N0IsLZg=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04LHQlTj058716
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 21 May 2020 12:26:47 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 21
 May 2020 12:26:46 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 21 May 2020 12:26:46 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04LHQheW043615;
        Thu, 21 May 2020 12:26:44 -0500
Subject: Re: [PATCH v2] arm: dts: am33xx-bone-common: add gpio-line-names
To:     Robert Nelson <robertcnelson@gmail.com>
CC:     Drew Fustini <drew@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux kernel <linux-kernel@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>
References: <20200520214757.GA362547@x1>
 <71dbf4e6-e65b-f001-319c-0b354f675568@ti.com>
 <CAOCHtYiw2jJuzbnW02FUmPy-xmmtErMmow46QQJUMs0VtX=cKg@mail.gmail.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <cdf82f9c-48fb-49a0-99e4-926dc292c109@ti.com>
Date:   Thu, 21 May 2020 20:26:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAOCHtYiw2jJuzbnW02FUmPy-xmmtErMmow46QQJUMs0VtX=cKg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 21/05/2020 17:41, Robert Nelson wrote:
>> Not sure if it should be in am335x-bone-common.dtsi.
>>
>> For example:
>> am335x-boneblack.dts
>>    #include "am335x-bone-common.dtsi"
>>    #include "am335x-boneblack-common.dtsi" <-- hdmi defined only here
> 
> Ah crap, yeah that's a good point.. So if we stick it in...
> am335x-boneblack-common.dtsi
> 
> Then the Black-Wireless now has Ethernet...
> 
> am335x-boneblack-wireless.dts
> #include "am335x-bone-common.dtsi"
> #include "am335x-boneblack-common.dtsi"
> 
> It's going to be ugly, copy and paste mess, but i guess we might as
> well stick it in the device " am335x-boneblack.dts"?

Seems like.

Unfortunately, there is no way to partially overwrite "gpio-line-names"
property.

-- 
Best regards,
grygorii
