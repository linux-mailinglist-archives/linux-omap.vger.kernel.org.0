Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF2A1709AF
	for <lists+linux-omap@lfdr.de>; Wed, 26 Feb 2020 21:30:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727310AbgBZUa0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 Feb 2020 15:30:26 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:49426 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727277AbgBZUa0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 26 Feb 2020 15:30:26 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01QKUJ1d116128;
        Wed, 26 Feb 2020 14:30:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582749019;
        bh=budjYnucAtskuwAvLEzRqHdYM4o3vzGP190UOcF1zcA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=TfVdbbvdknmFRBEwFiiy2UdLaoIfhwxT1jVwjs94XuLM10G0JOn49B4DIz0xvheUr
         4Yi4bq5UM2hTUJzuHk2q2ziXRueXnYQg1txIfzHTZic4WT9YrRVkzRE6LnEd1TMdsa
         jB9yK+foO/IKfq8rOZewQbiyo2n8t0pOqTvwFJxk=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01QKUHMh029326
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 26 Feb 2020 14:30:17 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 26
 Feb 2020 14:30:17 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 26 Feb 2020 14:30:17 -0600
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01QKUH8R111414;
        Wed, 26 Feb 2020 14:30:17 -0600
Subject: Re: [PATCH 0/3] Drop PRUSS and OMAP4 IPU/DSP hwmod data
To:     Tony Lindgren <tony@atomide.com>
CC:     Tero Kristo <t-kristo@ti.com>, Roger Quadros <rogerq@ti.com>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200224232152.25562-1-s-anna@ti.com>
 <20200226182603.GT37466@atomide.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <0f47de68-6b89-4219-5ff9-a9c39b6bc759@ti.com>
Date:   Wed, 26 Feb 2020 14:30:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200226182603.GT37466@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2/26/20 12:26 PM, Tony Lindgren wrote:
> * Suman Anna <s-anna@ti.com> [200224 15:22]:
>> Hi Tony,
>>
>> The following patches drop the hwmod data for PRUSS on AM33xx and AM437x
>> SoCs, and for the IPU and DSP processors on OMAP4 SoC. Patches are based
>> on 5.6-rc1. Please consider these for the 5.7 merge window.
>>
>> I will be submitting another series tomorrow to add the ti-sysc support
>> for PRUSS. Nevertheless, the PRUSS hwmods will not be used going forward
>> and can be dropped independently.
>>
>> The IPU and DSP hwmods were never added for OMAP5 and DRA7xx/AM57xx SoCs,
>> and the MMU data was already dropped for 5.6-rc1, as it has all been
>> converted to ti-sysc and omap-prm. The DT nodes for these will follow
>> for the next merge window once the current OMAP remoteproc DT support
>> is accepted [1].
> 
> Well we still need the hwmod data until dts data is in place to reset
> and idle these modules. So I'll wait with this set until we have the
> dts changes in place.

Not really, you cannot just idle these processors devices by themselves
without the cores running. The hwmod code actually keeps these in the
default reset asserted state itself, so no harm done in dropping the
data. The remoteproc bindings are acked, so for next merge window, we
can post the dts nodes once those get merged.

regards
Suman

