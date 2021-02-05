Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 473993115BD
	for <lists+linux-omap@lfdr.de>; Fri,  5 Feb 2021 23:44:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231131AbhBEWkA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 5 Feb 2021 17:40:00 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:48126 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231855AbhBEOCj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 5 Feb 2021 09:02:39 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 115E1cmp115333;
        Fri, 5 Feb 2021 08:01:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1612533698;
        bh=TGp6IigDxIpBSmlrVc45IQfgnTUYbtt60lWgtPYcvcQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=cs1HznXO6DKZbnn4RG5cdjm84+1cQRkS9ARXjccWUpMLgl/63grONxe+5ls/9Uyqx
         0z9OiOV/jRtEF39GR7O3e7w8a60aKw60VatNZH95XVb2K+A0t11B9XHQgAtb9SfFPH
         CWtehvxh4/uiNQMOy3xusM1sQnIrvzGNIvXhYFhI=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 115E1c4L071760
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 5 Feb 2021 08:01:38 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 5 Feb
 2021 08:01:38 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 5 Feb 2021 08:01:38 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 115E1aap127089;
        Fri, 5 Feb 2021 08:01:37 -0600
Subject: Re: [PATCH 1/2] ARM: omap2plus_defconfig: Enable Netfilter components
 as modules.
To:     Tony Lindgren <tony@atomide.com>
CC:     Ivan Jelincic <parazyd@dyne.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20210203113426.18964-1-parazyd@dyne.org>
 <72a4133f-db13-db12-0949-017054bc8265@ti.com> <YB1JEu8cfcy1Ixwb@atomide.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <7ab0268d-7dcf-494f-0120-c8ac42f47d70@ti.com>
Date:   Fri, 5 Feb 2021 16:01:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YB1JEu8cfcy1Ixwb@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 05/02/2021 15:33, Tony Lindgren wrote:
> * Grygorii Strashko <grygorii.strashko@ti.com> [210205 13:18]:
>> On 03/02/2021 13:34, Ivan Jelincic wrote:
>>> Enable the majority of the Netfilter components as loadable modules
>>> in the omap2plus_defconfig file.
> ...
>>> diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
>>> index f250bf1cc022..9847502d2c97 100644
>>> --- a/arch/arm/configs/omap2plus_defconfig
>>> +++ b/arch/arm/configs/omap2plus_defconfig
>>> @@ -87,6 +87,155 @@ CONFIG_IP_PNP_DHCP=y
>>>    CONFIG_IP_PNP_BOOTP=y
>>>    CONFIG_IP_PNP_RARP=y
>>>    CONFIG_NETFILTER=y
>>> +CONFIG_NF_CONNTRACK=m
>>> +CONFIG_NF_LOG_NETDEV=m
>>> +CONFIG_NF_CONNTRACK_ZONES=y
>>> +CONFIG_NF_CONNTRACK_EVENTS=y
>>> +CONFIG_NF_CONNTRACK_TIMEOUT=y
>>> +CONFIG_NF_CONNTRACK_TIMESTAMP=y
>>> +CONFIG_NF_CT_NETLINK=m
>>
>> [..]
>>
>> Do we really want to enable all these not TI specific configs?
>> The main purpose of omap2plus_defconfig is to enable TI specific HW and HW features and
>> config options required to tests/demonstrate these features - like support for some networking
>> HW offloads.
> 
> Well these are loadable modules. And I'd like to have omap2plus_defconfig
> and multi_v7_defconfig usable as a base config for distros to use.
> 
> For built-in options I agree. We should only enable absolute minimum
> for built-in optoins as otherwise things get even more bloated.

Ok. Up to you.

-- 
Best regards,
grygorii
