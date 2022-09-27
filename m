Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 326605EBF53
	for <lists+linux-omap@lfdr.de>; Tue, 27 Sep 2022 12:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231715AbiI0KL0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Sep 2022 06:11:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231786AbiI0KLY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 27 Sep 2022 06:11:24 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEAC825C1
        for <linux-omap@vger.kernel.org>; Tue, 27 Sep 2022 03:11:20 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id c11so14165927wrp.11
        for <linux-omap@vger.kernel.org>; Tue, 27 Sep 2022 03:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=dsxQ8Hghp4gOYoJ8Y2v6Xoic/JUbFpESDpnr6QJo/pY=;
        b=niFwwh9hYYj7lnORJj+1/9bCkYvqJXUuv2/E9qMvTDMZhQQv1iT5S5pqixTzDhZTNb
         bZrexqi+5/TFNw1SUdPovjuP55txd/Pz2kd7UxoQ05NYbxw7Uj4RSUVo59RZewUxHCpN
         OpA8aCN9ZjFuoJUz4PDUkr9z+dYvgx6DHWLT1Vx/SH1toKWptEgJmyxKHFuemilPgjff
         1VKRx/aXjmbrT1nB6Q2rYWOo0inTPBmpIuJRlUOB4N/s5skVIUHd88bln+HKGduyDwlh
         zlrqDMtx1z3kEXTUqq5IWCNk9+8ydsL7ZnUDn18Hrja0vJ2h7d9Hh5UaYtVI9q7+Kci7
         BPgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=dsxQ8Hghp4gOYoJ8Y2v6Xoic/JUbFpESDpnr6QJo/pY=;
        b=2Z1y5zAePVVNyS7jzkZRe5vIb+Tj6t1vOdDdAxJseOGUpMLOVAKmW07FL6cjGSuYWc
         YCzCmv5c7auBeZq6V3nD6mwAq9FD3rE2awHe7fU8BTB8IAgLorEPcOKj0sl4pGSd54E8
         +Id0rJanueOIUY/nu4bue5ETD8E+9OxasLjmY10tviQz+vCwLk1NpocnCW3api/iBXLO
         hh8BpbgxxNy4lRg+FOxnyLOwn/+xuncBaViY6VJdwPgS+QDIOvDtcAOTt7dKxikNRXPe
         ZQtZQzIDG3+rKmm0t7a7ZGOpF9VEQNQR0DQyRdfYJJYH6KurICK3zeHrPoe0Rb7jWp70
         fgSg==
X-Gm-Message-State: ACrzQf1M2iqNQ6oFTsxWPHQZ/t5nfruZECJenwK+LFkUOhkokuPB0IpY
        zjOzI3yzMmmYAxmXtbrzzhGtkw==
X-Google-Smtp-Source: AMsMyM5AtLQmWT9dn//YzVEDl3oBQMpK7cwe1yBO/blahzYPmH20oGw8HwmilnzgUOXd/I3BR3I45w==
X-Received: by 2002:a5d:6c6f:0:b0:22a:7778:6ea2 with SMTP id r15-20020a5d6c6f000000b0022a77786ea2mr16687232wrz.15.1664273479334;
        Tue, 27 Sep 2022 03:11:19 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f? (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr. [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
        by smtp.gmail.com with ESMTPSA id w10-20020a05600c474a00b003b4ac05a8a4sm17144459wmo.27.2022.09.27.03.11.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 03:11:18 -0700 (PDT)
Message-ID: <276295a7-c6e0-5200-f6da-9c7298c914be@smile.fr>
Date:   Tue, 27 Sep 2022 12:11:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: prueth: IEP driver doesn't probe anymore
Content-Language: en-US
To:     Vignesh Raghavendra <vigneshr@ti.com>,
        Tony Lindgren <tony@atomide.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        "rogerq@kernel.org >> Roger Quadros" <rogerq@kernel.org>,
        Md Danish Anwar <danishanwar@ti.com>
References: <9aced000-5e66-50b9-1e1b-28ff96871d42@smile.fr>
 <28dc112e-94ce-ca21-2e35-97074f251b97@smile.fr>
 <edf56bca-3f90-5cac-7c21-085f4a563dac@smile.fr>
 <YzKa8csiFaJik79O@atomide.com> <714a68ee-a211-ea63-1da7-5962dbad9f39@ti.com>
From:   Romain Naour <romain.naour@smile.fr>
In-Reply-To: <714a68ee-a211-ea63-1da7-5962dbad9f39@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        URI_HEX autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi All,

Le 27/09/2022 à 10:04, Vignesh Raghavendra a écrit :
> 
> 
> On 27/09/22 12:10, Tony Lindgren wrote:
>> Hi,
>>
>> * Romain Naour <romain.naour@smile.fr> [220921 08:13]:
>>> Ok, I understand what's going on...
>>>
>>> The issue appear on the merge commit since on a omap side there was the switch
>>> to ti-sysc (devicetree interconnect description) and on upstream side there was
>>> a change on driver core behavior with fw_devlink=on being set by default:
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=ea718c699055c8566eb64432388a04974c43b2ea
>>
>> OK good to hear it's not the change to ti-sysc. That should be all pretty
>> much standard Linux driver related changes.
>>
>>> Actually the issue is really on the TI's prueth and IEP driver whith
>>> fw_devlink=on. The IEP driver probe correctly with fw_devlink=permissive.
>>
>> Argh not again, the fw_devlink changes seem to be causing all kind of
>> issues. Any ideas what the issue here might be? It might be worth testing
>> with v6.0-rc7 too as it has a series of fixes to related issues.

I rebased the prueth + IEP series on v6.0-rc7 and indeed the driver probe
correctly but with some delay due deferred probe.

[    9.568817] remoteproc remoteproc0: 4b234000.pru is available
[    9.580505] remoteproc remoteproc1: 4b238000.pru is available
[    9.625701] remoteproc remoteproc2: 4b2b4000.pru is available
[    9.632110] remoteproc remoteproc3: 4b2b8000.pru is available
[    9.932952] prueth pruss1_eth: unable to get IEP
[   10.238098] prueth pruss1_eth: unable to get IEP
[   10.469421] prueth pruss1_eth: unable to get IEP
[   10.675445] prueth pruss1_eth: unable to get IEP
[   10.885589] prueth pruss1_eth: unable to get IEP
[   11.117126] prueth pruss1_eth: unable to get IEP
[   11.755462] prueth pruss1_eth: unable to get IEP
[   12.316192] prueth pruss1_eth: unable to get IEP
[   13.387969] prueth pruss1_eth: unable to get IEP
[   14.175750] prueth pruss1_eth: unable to get IEP
[   14.388671] prueth pruss1_eth: unable to get IEP
[   14.648406] prueth pruss1_eth: unable to get IEP
[   16.946716] prueth pruss1_eth: unable to get IEP
[   25.037414] remoteproc remoteproc1: powering up 4b238000.pru
[   25.056793] remoteproc remoteproc1: Booting fw image
ti-pruss/am57xx-pru1-prueth-fw.elf, size 6952
[   25.065856] remoteproc remoteproc1: unsupported resource 5
[   25.071472] remoteproc remoteproc1: remote processor 4b238000.pru is now up
[   25.157104] remoteproc remoteproc0: powering up 4b234000.pru
[   25.165527] remoteproc remoteproc0: Booting fw image
ti-pruss/am57xx-pru0-prueth-fw.elf, size 6920
[   25.174713] remoteproc remoteproc0: unsupported resource 5
[   25.180328] remoteproc remoteproc0: remote processor 4b234000.pru is now up
[   27.047607] prueth pruss1_eth eth4: Link is Up - 100Mbps/Full - flow control off


>>
> 
> Could you also try [1] from Puranjay's series? He did have to rework
> pru_rproc_get()/pru_rproc_put() a bit to fix few probe failures seen
> only on > 5.11 kernels.
> 
> [1] https://lore.kernel.org/netdev/20220406094358.7895-3-p-mohan@ti.com/
> 

Thank for the link, I actually had a look to this series and updated the pru
remote proc driver.

Note: The RFC series "PRUSS Remoteproc, Platform APIS, and Ethernet Driver"
doesn't include yet the prueth driver for AM57xx so I had to fixup this driver
when needed. It would be great if the support for the AM57xx can be included in
the next submission [1].

[1]
https://lore.kernel.org/linux-remoteproc/992019ad-5c58-d420-8a18-a82228f8e086@smile.fr/

Best regards,
Romain
