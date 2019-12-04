Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBF3E112FB0
	for <lists+linux-omap@lfdr.de>; Wed,  4 Dec 2019 17:11:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728236AbfLDQLP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 4 Dec 2019 11:11:15 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:48462 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727912AbfLDQLO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 4 Dec 2019 11:11:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=72LNbJrxc9NI8EQkst4zx3kMXmKGJx6Z/v7rruWC6F4=; b=Dho7oe/xPqW/+92cUdOOQdss5
        4v7DPRlIQ/N+zdLdeHA5TTlkPd8hvvyn6BLDy/s+ZjbXRj/ON8avYZ7JjWlcVaNNao+dI/o6bOwhP
        Dzyt+m6odRb+AHboYFEPLOTegx2jYevNrsdch2w+zfLr6MaXb+q+i06raBMpjCFjtFUb8j/D35Qst
        mXkaSzdkE1kuSBsSNAK918xniqhWSEyVfBq0xUmrZmEr1ysF7p/YNWsFcX4Pi39EPcUH2+MW+YMzM
        7pnilJ4OS7D4UCnH2jLxC1ERSkClK7zS+UjRkLV5NyHuRCXtMBXVYITTHzZPJ0MC0Cj3ygaPvlcsY
        pPMkNsqaQ==;
Received: from [2601:1c0:6280:3f0::3deb]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1icXFA-0003VC-Ta; Wed, 04 Dec 2019 16:11:12 +0000
Subject: Re: linux-next: Tree for Dec 3 (switchdev & TI_CPSW_SWITCHDEV)
To:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        Jiri Pirko <jiri@resnulli.us>,
        Ivan Vecera <ivecera@redhat.com>, linux-omap@vger.kernel.org
References: <20191203155405.31404722@canb.auug.org.au>
 <58aebf62-54f8-9084-147b-801ea65327bb@infradead.org>
 <f2700b07-df9b-94ce-0323-a4fece236838@ti.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <af707faa-7f95-0d6f-3f72-1746161e09a8@infradead.org>
Date:   Wed, 4 Dec 2019 08:11:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <f2700b07-df9b-94ce-0323-a4fece236838@ti.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 12/4/19 7:35 AM, Grygorii Strashko wrote:
> 
> 
> On 04/12/2019 01:43, Randy Dunlap wrote:
>> On 12/2/19 8:54 PM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Please do not add any material for v5.6 to your linux-next included
>>> trees until after v5.5-rc1 has been released.
>>>
>>> Changes since 20191202:
>>
>> I am seeing this (happens to be on i386; I doubt that it matters):
>> CONFIG_COMPILE_TEST=y
>>
>>
>> WARNING: unmet direct dependencies detected for NET_SWITCHDEV
>>    Depends on [n]: NET [=y] && INET [=n]
>>    Selected by [y]:
>>    - TI_CPSW_SWITCHDEV [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_TI [=y] && (ARCH_DAVINCI || ARCH_OMAP2PLUS || COMPILE_TEST [=y])
>>
>> because TI_CPSW_SWITCHDEV blindly selects NET_SWITCHDEV even though
>> INET is not set/enabled, while NET_SWITCHDEV depends on INET.
>>
>> However, the build succeeds, including net/switchdev/*.
>>
>> So why does NET_SWITCHDEV depend on INET?
>>
>> It looks like TI_CPSW_SWITCHDEV should depend on INET (based on the
>> Kconfig rules), but in practice it doesn't seem to matter to the build.
>>
> 
> Thanks for reporting this. I'd like to ask for some advice of how to proceed?
> a) change it to "depends on NET_SWITCHDEV" (as it's done in other drivers),
> but this will require to add NET_SWITCHDEV in defconfig

IMO TI_CPSW_SWITCHDEV should depend on NET_SWITCHDEV, as other drivers do that.

That will require to add NET_SWITCHDEV in what defconfig?
To me, it just means that whoever is doing the kernel config must enable/set
NET_SWITCHDEV first, same as other drivers that depend on NET_SWITCHDEV.

> b) change it to "imply NET_SWITCHDEV", but then NET_SWITCHDEV can be switched off
> manually or by random build and cause build failure of cpsw_new.
> To fix build below diff can be used, but TI_CPSW_SWITCHDEV will not be functional
> 
> ---
> diff --git a/drivers/net/ethernet/ti/cpsw_new.c b/drivers/net/ethernet/ti/cpsw_new.c
> index 71215db7934b..22e8fc548d48 100644
> --- a/drivers/net/ethernet/ti/cpsw_new.c
> +++ b/drivers/net/ethernet/ti/cpsw_new.c
> @@ -368,8 +368,9 @@ static void cpsw_rx_handler(void *token, int len, int status)
>                 page_pool_recycle_direct(pool, page);
>                 goto requeue;
>         }
> -
> +#ifdef CONFIG_NET_SWITCHDEV
>         skb->offload_fwd_mark = priv->offload_fwd_mark;
> +#endif
>         skb_reserve(skb, headroom);
>         skb_put(skb, len);
>         skb->dev = ndev;
> 
> Thank you.
> 


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
