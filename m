Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EBCA29500
	for <lists+linux-omap@lfdr.de>; Fri, 24 May 2019 11:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390181AbfEXJlv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 May 2019 05:41:51 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36514 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389630AbfEXJlv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 May 2019 05:41:51 -0400
Received: by mail-wr1-f66.google.com with SMTP id s17so9316336wru.3
        for <linux-omap@vger.kernel.org>; Fri, 24 May 2019 02:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=y5N3blBOF57aEuNrqnxupdWMUAa8sEMVdsUI1rflzSQ=;
        b=A3eoary35mP/ldGozEDAvNCMcz//E5Pp2NMOTYth62qhOZRHuBL/1IULlsfXC0iE9P
         2U0gHdxYDJUaj4/6vWvRNMk5HbYNmIhmOG5NAYpgm3RxPw/J/9h8cmhnbF+Cey7mkEbG
         ccMh7n93p3TomLg1SElpLdEG6psgy5ls35POE7RF/bxByT7tjwKwdXvhdPmpWY0gf3O7
         OtZsfHFApGsWlB1Rnobgx9Pxe8YvME0Af3Da4OtTI/6CIJtdOY4QyTRafmL1vqAuDiFa
         BzxusJ/C1QxGVMQzSZsPcl8j+TmsdyWxL3P+T5qGGixYakACt/r6OdNpNGJAvo2oZI61
         SFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=y5N3blBOF57aEuNrqnxupdWMUAa8sEMVdsUI1rflzSQ=;
        b=avnZgs1LlkxeUxdnC6onjjFrZSWJYaEI1Oixg4xE3llhtH33e/75wUQlRrSyRNXluF
         pNeOQpwZQUEA3si3cXZ/vaFswtlX3UBQ6AZFbswkUujbSPHQsma5wU+PLzexo/TfDrnB
         PjIkX8Aj71yTG6wjRRx+a35toiBTtLlU2ZSdpeEqzv8w7ctwhCZnIf9LLTp0NXMW63ek
         pWSS1TGJbamks01ZLzvJ+8F7DUAvM+TTNObzP5ZDwGbT+jvNTwNapyfh3uq7dCC6uSdk
         o7PcHp9cyq+N2W75Q/FUgYC12xKAuiMOxq0gBCJwkwex2uUMOcsCrDVDENta9sJZ4OAc
         YaLw==
X-Gm-Message-State: APjAAAUGnB3IBkCeEq/sMqIcSB89ijWiQsjdJJfNQB3+sLaYDQkfl4Si
        Qd52ZHn/TA9PjwH4V/TMzltYNQ==
X-Google-Smtp-Source: APXvYqwPRO4pFpxSPn86THLU1S+1gsKxZpAqGiQDN/sY0wzkykgkTLwXk57Z0fyJ2AQwWnT5Lmk4kQ==
X-Received: by 2002:adf:aa09:: with SMTP id p9mr9813762wrd.59.1558690909082;
        Fri, 24 May 2019 02:41:49 -0700 (PDT)
Received: from apalos (ppp-94-66-229-5.home.otenet.gr. [94.66.229.5])
        by smtp.gmail.com with ESMTPSA id o23sm247011wro.13.2019.05.24.02.41.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 May 2019 02:41:48 -0700 (PDT)
Date:   Fri, 24 May 2019 12:41:45 +0300
From:   Ilias Apalodimas <ilias.apalodimas@linaro.org>
To:     Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Cc:     grygorii.strashko@ti.com, hawk@kernel.org, davem@davemloft.net,
        ast@kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, xdp-newbies@vger.kernel.org,
        netdev@vger.kernel.org, daniel@iogearbox.net,
        jakub.kicinski@netronome.com, john.fastabend@gmail.com
Subject: Re: [PATCH net-next 0/3] net: ethernet: ti: cpsw: Add XDP support
Message-ID: <20190524094145.GA24675@apalos>
References: <20190523182035.9283-1-ivan.khoronzhuk@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190523182035.9283-1-ivan.khoronzhuk@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Ivan,

More XDP drivers, that's good!
> This patchset add XDP support for TI cpsw driver and base it on
> page_pool allocator. It was verified on af_xdp socket drop,
> af_xdp l2f, ebpf XDP_DROP, XDP_REDIRECT, XDP_PASS, XDP_TX.
> 
> It was verified with following configs enabled:
> CONFIG_JIT=y
> CONFIG_BPFILTER=y
> CONFIG_BPF_SYSCALL=y
> CONFIG_XDP_SOCKETS=y
> CONFIG_BPF_EVENTS=y
> CONFIG_HAVE_EBPF_JIT=y
> CONFIG_BPF_JIT=y
> CONFIG_CGROUP_BPF=y
> 
> Link on previous RFC:
> https://lkml.org/lkml/2019/4/17/861
> 
The recycling pattern has changed i'll have a closer look in the weekend and let
you know
> Also regular tests with iperf2 were done in order to verify impact on
> regular netstack performance, compared with base commit:
> https://pastebin.com/JSMT0iZ4
Do you have any XDP related numbers?
> 
> Based on net-next/master
> 
> Ivan Khoronzhuk (3):
>   net: ethernet: ti: davinci_cpdma: add dma mapped submit
>   net: ethernet: ti: davinci_cpdma: return handler status
>   net: ethernet: ti: cpsw: add XDP support
> 
>  drivers/net/ethernet/ti/Kconfig         |   1 +
>  drivers/net/ethernet/ti/cpsw.c          | 570 +++++++++++++++++++++---
>  drivers/net/ethernet/ti/cpsw_ethtool.c  |  55 ++-
>  drivers/net/ethernet/ti/cpsw_priv.h     |   9 +-
>  drivers/net/ethernet/ti/davinci_cpdma.c | 122 +++--
>  drivers/net/ethernet/ti/davinci_cpdma.h |   6 +-
>  drivers/net/ethernet/ti/davinci_emac.c  |  18 +-
>  7 files changed, 675 insertions(+), 106 deletions(-)
> 
> -- 
> 2.17.1
> 
Thanks
/Ilias
