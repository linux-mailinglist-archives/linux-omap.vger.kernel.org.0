Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DDE23035FE
	for <lists+linux-omap@lfdr.de>; Tue, 26 Jan 2021 06:58:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389038AbhAZF5V (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 Jan 2021 00:57:21 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:38760 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730339AbhAYPpS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 25 Jan 2021 10:45:18 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10PFhJOw068695;
        Mon, 25 Jan 2021 09:43:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1611589399;
        bh=vpK8KsGh4di2NeiKW/oNr1WDemKXSP0tZVJsjl+yK2I=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Pm76+CeI0lFGxKuMy53JoY+o4Um3hoRNRan78X6YFK0td+dwpiEPKQEL6Y2rY+jSq
         dN58ujcgdNdYXFPFzCpVMx3GcHeVf8HePFsVsZ+p36uw1rSl4vzzOaZ793XoJ3BJHz
         DQTJ0BRf2KRPpmmUE0W4ZGktfal7c3aEFEn2iHDA=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10PFhJ8v042342
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 25 Jan 2021 09:43:19 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 25
 Jan 2021 09:43:19 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 25 Jan 2021 09:43:19 -0600
Received: from [10.250.35.71] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10PFhIGL112819;
        Mon, 25 Jan 2021 09:43:19 -0600
Subject: Re: [PATCH v2 0/5] Introduce PRU remoteproc consumer API
To:     "santosh.shilimkar@oracle.com" <santosh.shilimkar@oracle.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        <ohad@wizery.com>, <bjorn.andersson@linaro.org>,
        <robh+dt@kernel.org>, <ssantosh@kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <lee.jones@linaro.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <praneeth@ti.com>,
        <rogerq@kernel.org>
References: <20201216165239.2744-1-grzegorz.jaszczyk@linaro.org>
 <20210106232704.GE9149@xps15> <11303a1b-5ab4-def5-77b1-c500894c9c87@ti.com>
 <20210107224448.GB43045@xps15> <75365443-57e3-e2e0-5865-f78af9d5890b@ti.com>
 <b0e32ad0-487f-9d57-7287-835eee836514@oracle.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <c5252e8d-094a-dcb7-7ccb-172e58ab3413@ti.com>
Date:   Mon, 25 Jan 2021 09:43:18 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b0e32ad0-487f-9d57-7287-835eee836514@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Santosh,

On 1/24/21 10:34 PM, santosh.shilimkar@oracle.com wrote:
> Hi Suman, Mathieu,
> 
> On 1/7/21 2:49 PM, Suman Anna wrote:
>> On 1/7/21 4:44 PM, Mathieu Poirier wrote:
>>> On Wed, Jan 06, 2021 at 06:03:25PM -0600, Suman Anna wrote:
>>>> Hi Mathieu,
>>>>
> [...]
>>> I only see input from Andy and Lars in the thread you point out, nothing from
>>> Greg.  I have also taken a look at the patch [1] that made checkpatch complain
>>> about ENOTSUPP.  From what I see in that commit log the goal is to prevent new
>>> additions of ENOTSUPP to the kernel.
>>>
>>> Please modify and resend, otherwise I'm sure someone will send another patch to
>>> fix it before the end of the cycle.
>>
>> Yeah ok. I will send out a v3.
>>
> I haven't seen v3 of this series yet. Please post it
> if you would like to include it for 5.12.

This series is dependent on couple of patches that would have to come through
the remoteproc tree first, and I need to post the next versions of those as
well. So, let me sort out those first. You can drop this from your queue for 5.12.

regards
Suman
