Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68D291B7AB9
	for <lists+linux-omap@lfdr.de>; Fri, 24 Apr 2020 17:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728665AbgDXPyY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Apr 2020 11:54:24 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:59456 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728644AbgDXPyX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Apr 2020 11:54:23 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03OFsFk1113611;
        Fri, 24 Apr 2020 10:54:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1587743655;
        bh=F3vv+/r3MYmKyP0QQdhLLRZ5pZyCQ8GYvR24m2BMlOA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=XM1DY4VD2Th0ZfhWMczUmt/ftTXPrHB0X3xwD/aLkUpE5S5z/XMm1JUAr8upTfTmi
         Zh4L5aqe+bG7IrunszBMGsupbf35SfX2cq8uGhS+FcWeU5xNi3bDFiQBapiCuq1WEJ
         QuMNv70tftuSNhyNvHiOtT68kQAiJ+R28ePLbxis=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03OFsFnX071649
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 24 Apr 2020 10:54:15 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 24
 Apr 2020 10:54:14 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 24 Apr 2020 10:54:14 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03OFsDlg038492;
        Fri, 24 Apr 2020 10:54:13 -0500
Subject: Re: [PATCH 00/17] ARM: dts: dra7/am57xx: remoteproc support
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <s-anna@ti.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200424151244.3225-1-t-kristo@ti.com>
 <20200424155128.GK37466@atomide.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <5f8d4dbb-f4fc-ee97-8542-610e98d3f895@ti.com>
Date:   Fri, 24 Apr 2020 18:54:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200424155128.GK37466@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 24/04/2020 18:51, Tony Lindgren wrote:
> * Tero Kristo <t-kristo@ti.com> [200424 08:13]:
>> Hi Tony,
>>
>> This series adds the DT nodes necessary for remoteproc support, now that
>> the driver side changes are (mostly) in. Couple of things to note
>> though.
>>
>> 1) There is a new IOMMU issue, for which I posted a fix today [1]
>> 2) The remoteproc core still has an issue for which there is ongoing
>>     discussion [2]
>>
>> With these two issue taken care of, the omap remoteproc support is
>> functional. The question though is, whether we should just wait until
>> the above two issues are resolved and merge the DT patches post that, or
>> merge the DT patches with status = "disabled".
> 
> If there are no dependencies between the pending driver fixes and
> the dts changes I see no reason to not merge the dts changes.

Yeah, no hard dependencies as such, just that things won't work properly 
before they are in.

-Tero

> 
>> There aren't any boot failures without the mentioned two issues though,
>> as one needs to enable the RPMSG_VIRTIO support before the failures
>> really kick in (issue [2]), and this config is not enabled for OMAPs
>> yet. Also, multi-v7 config doesn't seem to enable omap remoteproc,
>> so that is safe also.
> 
> OK thanks for checking that.
> 
>> Another thing I was considering myself was to squash all the board
>> specific reserved-memory region patches into the
>> dra7-ipu-dsp-common.dtsi files. However Suman wants to have these
>> separate and as he is the actual author for these, I posted them in this
>> form. But anyway, just so you know it would be possible to merge them
>> together.
> 
> OK. The combining of common features can be done in later patches
> too.
> 
> Regards,
> 
> Tony
> 
>> [1] https://lore.kernel.org/linux-iommu/20200424145828.3159-1-t-kristo@ti.com/T/#u
>> [2] https://lkml.org/lkml/2020/4/20/1094

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
