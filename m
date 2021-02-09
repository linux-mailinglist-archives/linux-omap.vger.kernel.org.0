Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33C7B3154B9
	for <lists+linux-omap@lfdr.de>; Tue,  9 Feb 2021 18:12:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232938AbhBIRKv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 9 Feb 2021 12:10:51 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:37838 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232781AbhBIRKt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 9 Feb 2021 12:10:49 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 119H9qx2102125;
        Tue, 9 Feb 2021 11:09:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1612890592;
        bh=u5vAnv5SB+Rm/JkbSGwBqx7t3+ITuBQVLai2tRVOq4k=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=QaJayiqUgUHJRn/LJTa2EXaCp3cwrNKwqyh68jgHrwEhWOhRF4980uK5CSviTdZJW
         DpkP2nRBZxoVo1x3x9wVoAJIbkxUvqc0zT/b8tu9CcF7Ka4PXX+D+9tzsaRrZMw29B
         YQf/gfcry0lPCBGnzg0x7e4FX40cAhsFHICwX+Cc=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 119H9qYD114148
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 9 Feb 2021 11:09:52 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 9 Feb
 2021 11:09:51 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 9 Feb 2021 11:09:51 -0600
Received: from [10.250.35.110] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 119H9pS8105478;
        Tue, 9 Feb 2021 11:09:51 -0600
Subject: Re: [PATCH 1/2] dt-bindings: hwlock: Update OMAP HwSpinlock binding
 for AM64x SoCs
To:     Rob Herring <robh@kernel.org>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>
References: <20210125235653.24385-1-s-anna@ti.com>
 <20210125235653.24385-2-s-anna@ti.com>
 <20210209170025.GA3927023@robh.at.kernel.org>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <48f25fc0-5131-9821-d50d-7f4f7ef5815e@ti.com>
Date:   Tue, 9 Feb 2021 11:09:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210209170025.GA3927023@robh.at.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Rob,

On 2/9/21 11:00 AM, Rob Herring wrote:
> On Mon, Jan 25, 2021 at 05:56:52PM -0600, Suman Anna wrote:
>> Update the existing OMAP HwSpinlock binding to include the info for
>> AM64x SoCs. There are some minor IP integration differences between
>> the AM64x SoCs and the previous AM65x and J721E SoC families. A new
>> example is also added showcasing the difference in the IP's presence
>> on the interconnect.
>>
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> ---
>>  .../bindings/hwlock/ti,omap-hwspinlock.yaml   | 26 +++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml
>> index ac35491a6f65..ac146c0d628f 100644
>> --- a/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml
>> +++ b/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml
>> @@ -14,6 +14,7 @@ properties:
>>      enum:
>>        - ti,omap4-hwspinlock  # for OMAP44xx, OMAP54xx, AM33xx, AM43xx, DRA7xx SoCs
>>        - ti,am654-hwspinlock  # for K3 AM65x, J721E and J7200 SoCs
>> +      - ti,am64-hwspinlock   # for K3 AM64x SoCs
>>  
>>    reg:
>>      maxItems: 1
>> @@ -74,3 +75,28 @@ examples:
>>              };
>>          };
>>      };
>> +
>> +  - |
>> +    / {
>> +        /* K3 AM64x SoCs */
>> +        model = "Texas Instruments K3 AM642 SoC";
>> +        compatible = "ti,am642-evm", "ti,am642";
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        bus@f4000 {
>> +            compatible = "simple-bus";
>> +            #address-cells = <2>;
>> +            #size-cells = <2>;
>> +            ranges = <0x00 0x000f4000 0x00 0x000f4000 0x00 0x000002d0>, /* PINCTRL */
>> +                     <0x00 0x01000000 0x00 0x01000000 0x00 0x02330400>, /* First peripheral window */
>> +                     <0x00 0x0f000000 0x00 0x0f000000 0x00 0x00c44200>, /* Second peripheral window */
>> +                     <0x00 0x20000000 0x00 0x20000000 0x00 0x0a008000>; /* Third peripheral window */
>> +
>> +            spinlock@2a000000 {
> 
> Why are you doing the whole hierarchy here? Don't do that.

I added it because it's integration is slightly different and to help our
downstream consumers.

> 
> In any case, a new compatible doesn't warrant a whole new example, so 
> drop the example.

Yeah ok, will drop the example.

regards
Suman

> 
>> +                compatible = "ti,am64-hwspinlock";
>> +                reg = <0x00 0x2a000000 0x00 0x1000>;
>> +                #hwlock-cells = <1>;
>> +            };
>> +        };
>> +    };
>> -- 
>> 2.29.2
>>

