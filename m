Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5B8D2347E1
	for <lists+linux-omap@lfdr.de>; Fri, 31 Jul 2020 16:36:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729441AbgGaOgj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 31 Jul 2020 10:36:39 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:51630 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728961AbgGaOgi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 31 Jul 2020 10:36:38 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06VEZUqm112601;
        Fri, 31 Jul 2020 09:35:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1596206130;
        bh=GRu9XzAMRe4+pci8Uhro7LyH72wWLts+VnuOKHzpVv8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=WoRuLYGXbjzuuoqKVAWXrgHgTQTEY7FKptdrHeOuhCdEEDSnEh5Uvs1P1yMO11DKa
         7KJZxf8ZxVKQ/knSJ3RkD9zxrm63AJqFcaeEvvhtn5PQjTW7bjdzywXVFDILttLDwa
         waJCyQdaKkEevxWywh0ZYVyvUjRGLhxU4oBG2zsE=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06VEZUdk110843
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 31 Jul 2020 09:35:30 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 31
 Jul 2020 09:35:30 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 31 Jul 2020 09:35:30 -0500
Received: from [10.250.34.248] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06VEZTnO047666;
        Fri, 31 Jul 2020 09:35:29 -0500
Subject: Re: [PATCH v4 1/5] dt-bindings: irqchip: Add PRU-ICSS interrupt
 controller bindings
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        David Lechner <david@lechnology.com>
CC:     <tglx@linutronix.de>, <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        "Bajjuri, Praneeth" <praneeth@ti.com>,
        "Andrew F . Davis" <afd@ti.com>, Roger Quadros <rogerq@ti.com>
References: <1595927918-19845-1-git-send-email-grzegorz.jaszczyk@linaro.org>
 <1595927918-19845-2-git-send-email-grzegorz.jaszczyk@linaro.org>
 <01bac597-c1a0-1851-b630-a79929777a16@lechnology.com>
 <CAMxfBF6Ru1Fm1oWDyrSM=kBdCUe+eUDChqDgoYo4ziVr-8c50Q@mail.gmail.com>
 <19fbf4f6-ea75-3eb7-7e95-c7c9ce987996@lechnology.com>
 <CAMxfBF4jvWiT8CH+--OBxLiptiN42-WOMHAZhP7VM51GzgHWnA@mail.gmail.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <36a1157e-4f59-9de5-c9d8-05bcdd67e125@ti.com>
Date:   Fri, 31 Jul 2020 09:35:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMxfBF4jvWiT8CH+--OBxLiptiN42-WOMHAZhP7VM51GzgHWnA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi David,

On 7/31/20 9:16 AM, Grzegorz Jaszczyk wrote:
> On Fri, 31 Jul 2020 at 16:09, David Lechner <david@lechnology.com> wrote:
>>
>> On 7/31/20 6:48 AM, Grzegorz Jaszczyk wrote:
>>> On Wed, 29 Jul 2020 at 19:34, David Lechner <david@lechnology.com> wrote:
>>>> It is not clear what the meaning of each cell is. Looking at later patches, it
>>>> looks like the first cell is the PRU system event number, the second cell is the
>>>> channel and the third cell is the host event number.
>>>
>>> Ok, how about updating above description like this:
>>> Client users shall use the PRU System event number (the interrupt source
>>> that the client is interested in) [cell 1], PRU channel [cell 2] and PRU
>>> host_intr (target) [cell 3] as the value of the interrupts property in their
>>> node.  The system events can be mapped to some output host interrupts through 2
>>> levels of many-to-one mapping i.e. events to channel mapping and channels to
>>> host interrupts so through this property entire mapping is provided.
>>
>> Cell 3 is host_intr0-7? How would we map to other host events?
> 
> Again this is due to misleading TRM nomenclature: host_intr vs host
> interrupts (one that we discuss in patch #2). I will use "and PRU host
> event (target) [cell 3]...". Sorry for my mistake.

Idea is to do the event mapping for other host interrupts using the 
irq_create_fwspec_mapping() function from the PRU remoteproc driver. We 
can't use DT to represent them, or atleast can't use "interrupts" 
property for them since they are not targeted towards the Linux host 
processor.

regards
Suman
