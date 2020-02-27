Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B76317253D
	for <lists+linux-omap@lfdr.de>; Thu, 27 Feb 2020 18:40:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729982AbgB0RkJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 Feb 2020 12:40:09 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:54706 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729601AbgB0RkJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 27 Feb 2020 12:40:09 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01RHe1nJ114705;
        Thu, 27 Feb 2020 11:40:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582825201;
        bh=yCTQ91m5aGM6seUc7EpAnT1neSTpni3MsgYMcrP8N+o=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=oNyTDFCSA7V8J7KDRy4u9ObN0ydWqyDrCfr3QGYEqp6IgHTnKZ9JkrjXghtAIS9e3
         botgbKyq5mdTSzM7eoVHa6shz/UUT+6Sp95hPqeh7KmN5NidTDqXYxZ/xKiP1N/C+m
         SrfMKPWzXkwVo2jRF6NftxPl15D+YBCvehM/G47M=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01RHe1jL045726;
        Thu, 27 Feb 2020 11:40:01 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 27
 Feb 2020 11:40:00 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 27 Feb 2020 11:40:00 -0600
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01RHe0rO003481;
        Thu, 27 Feb 2020 11:40:00 -0600
Subject: Re: [PATCH 0/3] Drop PRUSS and OMAP4 IPU/DSP hwmod data
To:     Tony Lindgren <tony@atomide.com>
CC:     Tero Kristo <t-kristo@ti.com>, Roger Quadros <rogerq@ti.com>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200224232152.25562-1-s-anna@ti.com>
 <20200226182603.GT37466@atomide.com>
 <0f47de68-6b89-4219-5ff9-a9c39b6bc759@ti.com>
 <20200227012705.GD37466@atomide.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <188af17e-6293-9e97-b142-3b5f5b69bbd8@ti.com>
Date:   Thu, 27 Feb 2020 11:40:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200227012705.GD37466@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2/26/20 7:27 PM, Tony Lindgren wrote:
> * Suman Anna <s-anna@ti.com> [200226 20:31]:
>> On 2/26/20 12:26 PM, Tony Lindgren wrote:
>>> * Suman Anna <s-anna@ti.com> [200224 15:22]:
>>>> Hi Tony,
>>>>
>>>> The following patches drop the hwmod data for PRUSS on AM33xx and AM437x
>>>> SoCs, and for the IPU and DSP processors on OMAP4 SoC. Patches are based
>>>> on 5.6-rc1. Please consider these for the 5.7 merge window.
>>>>
>>>> I will be submitting another series tomorrow to add the ti-sysc support
>>>> for PRUSS. Nevertheless, the PRUSS hwmods will not be used going forward
>>>> and can be dropped independently.
>>>>
>>>> The IPU and DSP hwmods were never added for OMAP5 and DRA7xx/AM57xx SoCs,
>>>> and the MMU data was already dropped for 5.6-rc1, as it has all been
>>>> converted to ti-sysc and omap-prm. The DT nodes for these will follow
>>>> for the next merge window once the current OMAP remoteproc DT support
>>>> is accepted [1].
>>>
>>> Well we still need the hwmod data until dts data is in place to reset
>>> and idle these modules. So I'll wait with this set until we have the
>>> dts changes in place.
>>
>> Not really, you cannot just idle these processors devices by themselves
>> without the cores running. The hwmod code actually keeps these in the
>> default reset asserted state itself, so no harm done in dropping the
>> data. The remoteproc bindings are acked, so for next merge window, we
>> can post the dts nodes once those get merged.
> 
> OK if they are in reset from the bootloader.. I'll try to check.

OK thanks. FWIW, we have never added the hwmods for IPUs and DSPs on
OMAP5 and DRA7xx/AM57xx, and most of them are pseudo hwmods anyway for
reset purposes, and do not get exercised until the remoteproc driver
would have specifically requested for them.

regards
Suman
