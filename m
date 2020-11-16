Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B5502B45D2
	for <lists+linux-omap@lfdr.de>; Mon, 16 Nov 2020 15:28:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728041AbgKPO2D (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Nov 2020 09:28:03 -0500
Received: from vern.gendns.com ([98.142.107.122]:38928 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727305AbgKPO2D (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 16 Nov 2020 09:28:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=0q44A1LrsVM1ufm10U18bRl/Slcf2gwki6qy7vTVfFg=; b=DxZbsbv7eWjuFxzo7H7NjhfMCD
        lEpEJZ5Wz/cUzwC3XuO00/CsuNEqlLxcrNuiLlSVOMOJgIB0YrqfVgUsV0ty/6rAdDIQHfbfg4PZY
        SeXbJgcqJdqXgh7iJajpdRR61oSHva0mPch3htNLh0FwJt7GYgsfj9D+O1soo8rJx1Rt+CocsVMRN
        o6x2xJ60h87bMkKyaDAsT7SCkw+CXhtB7s7GiybCzx6F5vhs9fRPoImz9Pw+e1yrM/chj6kPcRVXe
        2wJxbIsl0WxGaitrAxD7ml34yZMCVP07/OrDWov+zslX6EpgUn3EkNje2yMnFZ8aKPRwg1Qaj5b7i
        55JBvpRg==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net ([108.198.5.147]:37112 helo=[192.168.0.134])
        by vern.gendns.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <david@lechnology.com>)
        id 1kefU6-0002sg-PC; Mon, 16 Nov 2020 09:27:58 -0500
Subject: Re: [PATCH 0/3] Enable eQEP counter driver on BeagleBone Blue
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Robert Nelson <robertcnelson@gmail.com>,
        Drew Fustini <drew@beagleboard.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20201012211229.3282128-1-david@lechnology.com>
 <20201116113658.GE26857@atomide.com>
From:   David Lechner <david@lechnology.com>
Message-ID: <34752e5c-a9fa-daac-3295-b686875b5d21@lechnology.com>
Date:   Mon, 16 Nov 2020 08:27:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201116113658.GE26857@atomide.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id: davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 11/16/20 5:36 AM, Tony Lindgren wrote:
> * David Lechner <david@lechnology.com> [201013 00:13]:
>> This series adds device tree nodes for the eQEP portion of the PWMSS on AM33xx
>> and enables it on BeagleBone Blue.
>>
>> I actually submitted these a year ago, but it looks like these patches never got
>> applied with the actual eQEP driver when it was merged.
> 
> Sorry if I dropped these earlier, I guess I though you're reposting the
> series and untagged them.

No worries, I forgot about them too. :-)

> 
>> For reference, there was some previous discussion about the clocks in "ARM: dts:
>> am33xx: Add nodes for eQEP". [1]
>>
>> [1]: https://lore.kernel.org/linux-omap/20190723145100.GS5447@atomide.com/
>>
>> I have also included a new patch to enable the eQEP driver in the defconfig.
> 
> Great, thanks applying these into omap-for-v5.11/dt and defconfig branches.
> 
> Regards,
> 
> Tony
> 

