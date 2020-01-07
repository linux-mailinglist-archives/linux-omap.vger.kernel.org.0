Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58B321324A1
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2020 12:16:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727427AbgAGLQm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jan 2020 06:16:42 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:50712 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726937AbgAGLQl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 Jan 2020 06:16:41 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 007BGXc2024300;
        Tue, 7 Jan 2020 05:16:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1578395793;
        bh=HXqsa6+h9NoRNz+G1rKqdekJZz8yz8ren1fxTOBhDrY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=WOX+/1IMdd097RzhC/63SuwVfRY2EPkT94tkpqLfeFiD0SSKHvc+7xIDjiCXX8Cc+
         m5e3/iqMlvEay2LILXYfaNoWFppmMtGLIxp+OXU1uE8wZhKxUIFONSvAPlAps/1Gng
         HKztDIn7I6qsUaeycJIICpyO2HrTwh0EczMQMw2Y=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 007BGX8L064520
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 7 Jan 2020 05:16:33 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 7 Jan
 2020 05:16:33 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 7 Jan 2020 05:16:33 -0600
Received: from [172.24.190.4] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 007BGTRd027407;
        Tue, 7 Jan 2020 05:16:30 -0600
Subject: Re: [PATCH v4 08/11] dt-bindings: sdhci-omap: Add documentation for
 ti,needs-special-reset property
To:     Rob Herring <robh@kernel.org>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <kishon@ti.com>, <adrian.hunter@intel.com>, <mark.rutland@arm.com>,
        <ulf.hansson@linaro.org>, <tony@atomide.com>
References: <20200106110133.13791-1-faiz_abbas@ti.com>
 <20200106110133.13791-9-faiz_abbas@ti.com> <20200106220313.GA6822@bogus>
From:   Faiz Abbas <faiz_abbas@ti.com>
Message-ID: <fa2866cb-485a-9eed-47c2-fb3f6f260d31@ti.com>
Date:   Tue, 7 Jan 2020 16:48:02 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20200106220313.GA6822@bogus>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Rob,

On 07/01/20 3:33 am, Rob Herring wrote:
> On Mon, Jan 06, 2020 at 04:31:30PM +0530, Faiz Abbas wrote:
>> Some controllers need a special software reset sequence. Document the
>> ti,needs-special-reset binding to indicate that a controller needs this.
>>
>> Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
>> ---
>>  Documentation/devicetree/bindings/mmc/sdhci-omap.txt | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-omap.txt b/Documentation/devicetree/bindings/mmc/sdhci-omap.txt
>> index 97efb01617dd..0f5389c72bda 100644
>> --- a/Documentation/devicetree/bindings/mmc/sdhci-omap.txt
>> +++ b/Documentation/devicetree/bindings/mmc/sdhci-omap.txt
>> @@ -21,6 +21,7 @@ Optional properties:
>>  - dma-names:	List of DMA request names. These strings correspond 1:1 with the
>>  		DMA specifiers listed in dmas. The string naming is to be "tx"
>>  		and "rx" for TX and RX DMA requests, respectively.
>> +- ti,needs-special-reset: Requires a special softreset sequence
> 
> Why can't this be implied by the compatible string?
> 

You are right. We can assign the special_reset flag in the next patch
using compatible as well. Will drop this patch in next version.

Thanks,
Faiz
