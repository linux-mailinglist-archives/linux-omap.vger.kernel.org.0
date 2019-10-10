Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30FC6D2186
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2019 09:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733026AbfJJHQJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Oct 2019 03:16:09 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:58666 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732792AbfJJHOI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Oct 2019 03:14:08 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9A7DqTR083661;
        Thu, 10 Oct 2019 02:13:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570691632;
        bh=Igz9/V9k1PMM6aDmmF606+31uSx46fazy4qUkrGadDA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=wehcdvPRmkEeSFaZQAOXAzuNNCNGADesihvUrY429jDGaQKSqzy6+eDrTYS8562gv
         o8AT3QBPnot9VFZvKZRvtUATgiIibBjCvlMUVPbaChFxqaI6H5qstEd9O1ebr8y2aK
         ZaNknGroLRMOYoGHQi1Wm+Uffr+kfn9agrBagBo8=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9A7DpZk001188
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 10 Oct 2019 02:13:51 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 10
 Oct 2019 02:13:50 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 10 Oct 2019 02:13:50 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9A7Dmtv113245;
        Thu, 10 Oct 2019 02:13:49 -0500
Subject: Re: [PATCHv8 1/9] dt-bindings: omap: add new binding for PRM
 instances
To:     "santosh.shilimkar@oracle.com" <santosh.shilimkar@oracle.com>,
        Sebastian Reichel <sre@kernel.org>
CC:     <linux-omap@vger.kernel.org>, <ssantosh@kernel.org>,
        <tony@atomide.com>, <s-anna@ti.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <p.zabel@pengutronix.de>
References: <20191008125544.20679-1-t-kristo@ti.com>
 <20191008125544.20679-2-t-kristo@ti.com>
 <20191008154655.u34wkbqgmelv3aea@earth.universe>
 <115ab938-e025-98fa-3b9e-0b3ced39307d@ti.com>
 <dc2a9659-8593-e5d0-54b2-44d827e76759@oracle.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <95642d2d-af8e-061c-ef6a-7b615222f360@ti.com>
Date:   Thu, 10 Oct 2019 10:13:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <dc2a9659-8593-e5d0-54b2-44d827e76759@oracle.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 09/10/2019 18:59, santosh.shilimkar@oracle.com wrote:
> 
> 
> On 10/8/19 11:52 PM, Tero Kristo wrote:
>> On 08/10/2019 18:46, Sebastian Reichel wrote:
>>> Hi,
>>>
>>> On Tue, Oct 08, 2019 at 03:55:36PM +0300, Tero Kristo wrote:
>>>> +Example:
>>>> +
>>>> +prm_dsp2: prm@1b00 {
>>>> +    compatible = "ti,omap-prm-inst", "ti,dra7-prm-inst";
>>>
>>> Nit: compatible values are sorted the other way around (most
>>> specific first).
>>
>> Hmm right, I would not like to re-post the whole series just for this 
>> seeing all the acks are in place already.
>>
>> Santosh, do you want to fix this locally or shall we post a separate 
>> patch later on to fix this?
>>
> No need. I fixed it up. Pls check.
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keystone.git for_5.5/driver-soc 

Yeah, looks fine to me.

Thanks,
Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
