Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92EDC3047BA
	for <lists+linux-omap@lfdr.de>; Tue, 26 Jan 2021 20:12:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbhAZF5d (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 Jan 2021 00:57:33 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:34250 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729110AbhAZDK6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 25 Jan 2021 22:10:58 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10Q0GdCH124859;
        Mon, 25 Jan 2021 18:16:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1611620199;
        bh=L+f4ohZrdj488CP3I7uIPQegEJlAgJImjluiVuvJrcA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=SvdgqdQS3ePBAKHWoAKSIOh32WDJ+cxGIFBElawyaWhStFSv569KvJA+sx84x2f6E
         3yIjZq8TUh857IyO1M0YpXcPcQOOsbr9jG96QKAfogSsDBdF/LoRXFh7Z4psbqqnrx
         IqrA2p762TzawbT/tnwaamFTLnq/c1nMHi0XQob8=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10Q0Gdcd047151
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 25 Jan 2021 18:16:39 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 25
 Jan 2021 18:16:38 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 25 Jan 2021 18:16:38 -0600
Received: from [10.250.69.64] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10Q0GcAE007721;
        Mon, 25 Jan 2021 18:16:38 -0600
Subject: Re: [PATCH] dt-bindings: irqchip: Add #address-cells to PRUSS INTC
To:     Rob Herring <robh@kernel.org>
CC:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Nishanth Menon <nm@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Lechner <david@lechnology.com>,
        <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
References: <20210115205819.19426-1-s-anna@ti.com>
 <20210126000443.GA1223706@robh.at.kernel.org>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <8f4a47f8-18dc-cb73-10db-033e5e5adb25@ti.com>
Date:   Mon, 25 Jan 2021 18:16:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210126000443.GA1223706@robh.at.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Rob,

On 1/25/21 6:04 PM, Rob Herring wrote:
> On Fri, Jan 15, 2021 at 02:58:19PM -0600, Suman Anna wrote:
>> The '#address-cells' property looks to be a required property for
>> interrupt controller nodes as indicated by a warning message seen
>> when building dtbs with W=2. Adding the property to the PRUSS INTC
>> dts nodes though fails the dtbs_check. Add this property to the
>> PRUSS INTC binding to make it compliant with both dtbs_check and
>> building dtbs.
>>
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> ---
>> Hi Rob,
>>
>> This patch is also part of our effort to get rid of the warnings seen
>> around interrupt providers on TI K3 dtbs [1]. I needed this in the PRUSS
>> INTC bindings to not get a warning with dtbs_check while also ensuring
>> no warnings while building dtbs with W=2.
>>
>> I would have expected the '#address-cells' requirement to be inherited
>> automatically. And looking through the schema files, I actually do not
>> see the interrupt-controller.yaml included automatically anywhere. You
>> had asked us to drop the inclusion in this binding in our first version
>> with YAML [3]. Am I missing something, and how do we ensure that this
>> is enforced automatically for everyone?
> 
> interrupt-controller.yaml is applied to any node named 
> 'interrupt-controller'. More generally, if 'compatible' is not present, 
> then we look at $nodename for the default 'select'. In your case, you 
> didn't name the node appropriately.

Thanks for the clarification. Yeah, I didn't add anything specifically, since
the expectation is interrupt-controller. Should I be adding that to this binding?

>  
> We can't check this in interrupt-controller.yaml because #address-cells 
> is not always 0. GICv3 is one notable exception.
> 
>>
>> regards
>> Suman
>>
>> [1] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20210115083003.27387-1-lokeshvutla@ti.com/
> 
> I've commented on this thread now in regards to #address-cells.

I suppose I still need this patch to be defined to unblock the ICSSG nodes
getting accepted by our dts maintainer. Care to give your Reviewed-by for the
change? Or I can spin a v2 with $nodename added as well if that's needed too.

regards
Suman

> 
> Rob
> 
>> [2] https://patchwork.kernel.org/project/linux-arm-kernel/cover/20210114194805.8231-1-s-anna@ti.com/
>> [3] https://patchwork.kernel.org/comment/23484523/
>>
>>  .../bindings/interrupt-controller/ti,pruss-intc.yaml        | 6 ++++++
>>  1 file changed, 6 insertions(+)

