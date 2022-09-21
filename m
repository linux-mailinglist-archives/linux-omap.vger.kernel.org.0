Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD975BF8F8
	for <lists+linux-omap@lfdr.de>; Wed, 21 Sep 2022 10:22:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbiIUIWD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 21 Sep 2022 04:22:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbiIUIV5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 21 Sep 2022 04:21:57 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B263B41D2E
        for <linux-omap@vger.kernel.org>; Wed, 21 Sep 2022 01:21:54 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id bq9so8586316wrb.4
        for <linux-omap@vger.kernel.org>; Wed, 21 Sep 2022 01:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=HfK0zpFllkWO5ImQTN0ipXzQC+1l48TSqOkc2wjZ28c=;
        b=l6pGY4vsF6p6Ok75Cp8SWOM0748F/RPsJGZbaAzqYt0oE8g3/PNKrJNh0Ia5v7h+A6
         8355JjyEvD3yD2r/x8/LzBmDfnrSan9l7u02aqM3ih/hRH6oCpXBOJISV4f0jLNVXd+8
         E7TIXPqjMlCSmLbdIFG2RJsFhJ4jHo6uXsx3AHPSwVlEgyZAi6bPc4wLOXYLq0FB37Sb
         pALRX+QrGeohHEtbt8Tkd5pEEyRDOj3jbDl+9mJFILw3FPloL+K/af4uSfOCBwv45bNa
         xXaZ9AnAIKT3taELBXZx8ZMRijdX1vVvvFDj14P/K+FwAKed7bkiiE6b44lb+AZh2qrJ
         bzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=HfK0zpFllkWO5ImQTN0ipXzQC+1l48TSqOkc2wjZ28c=;
        b=hEBjcHMKoAqmUHbfdPmMQo1ZM3ONxdRKE55mt1NZsRV6fMHn6kD0IQkJh5N/JqvNIf
         KHBFZUdKjmmXaAxcQu7HMAp0RAorTep2sAytxAvktKMx4jwFl2Yz6vfLWiECm6yadsp0
         loIpwI0Hx6TQxjkRt216eDI8tdQK9XqrFeQgydbgZbYsVJwiJroe5sz62KeN15nfUljg
         0gDmIrhRWP2dKDYQtZGbaiAvCvEOZhhP14ZgYLWMURa/+8WdsTOSesoTRa3inEpJsQkr
         1YMqnGQaQFwJgPUHe7282QIoz1u3nS7PMIY6k4K82euqa0qJoNWd0MS3QEREprjMcyh4
         jMwQ==
X-Gm-Message-State: ACrzQf3BmVV9DjuEdXoJ5oZ155BIwKmWKlYp/ycex6ztWPm26KoWAnVZ
        BhKY5F9Tgq/6eHGXy4Bl8phwBXSwYKHJdQ==
X-Google-Smtp-Source: AMsMyM6oXwbMV9CuVP+QfaHWvUsaZbi8ybLCZ6MKXK1NBzi7Dsve0GPVn3HrhD/nzoO0a1JNZ2HhiQ==
X-Received: by 2002:adf:f94a:0:b0:225:7383:d755 with SMTP id q10-20020adff94a000000b002257383d755mr16367693wrr.348.1663748512840;
        Wed, 21 Sep 2022 01:21:52 -0700 (PDT)
Received: from [10.5.3.187] (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id m21-20020a05600c3b1500b003b47a99d928sm2270370wms.18.2022.09.21.01.21.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 01:21:52 -0700 (PDT)
Message-ID: <edf56bca-3f90-5cac-7c21-085f4a563dac@smile.fr>
Date:   Wed, 21 Sep 2022 10:21:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: prueth: IEP driver doesn't probe anymore
Content-Language: en-US
From:   Romain Naour <romain.naour@smile.fr>
To:     Linux-OMAP <linux-omap@vger.kernel.org>
Cc:     "rogerq@kernel.org >> Roger Quadros" <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Md Danish Anwar <danishanwar@ti.com>
References: <9aced000-5e66-50b9-1e1b-28ff96871d42@smile.fr>
 <28dc112e-94ce-ca21-2e35-97074f251b97@smile.fr>
In-Reply-To: <28dc112e-94ce-ca21-2e35-97074f251b97@smile.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi All,

Le 19/09/2022 à 10:07, Romain Naour a écrit :
> Hi All,
> 
> Le 16/09/2022 à 10:55, Romain Naour a écrit :
>> Hi All,
>>
>> I'm able to use the prueth driver on a AM5749 cpu using the TI vendor branch
>> (ti-linux-5.10.y). But I need a more recent kernel to support other device on my
>> custom board. So I had to rebase all the TI work related to the out of tree
>> prueth driver on a the latest kernel.
>>
>> I hope this driver will be merged in the kernel soon but the series [1] doesn't
>> include the prueth driver for AM57xx cpus (only the icssg_prueth for AM65xx is
>> included).
>>
>> For some reason the IEP driver [2] [3] doesn't probe anymore. Is a side effect
>> of recent ti-sysc or legacy platform data work ? I'm using a 5.19.8 stable kernel.
>>
>> The prueth_probe() error out with "unable to get IEP" log message.
>>
>> Do you have any clue?
> 
> I tested several kernel releases between the 5.10 and 5.19 and It turn out that
> the issue appear in the 5.13.y kernel.
> 
> After a long and time consuming git bisect, the first bad commit is:
> 
> Merge tag 'arm-soc-5.13' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=01d7136894410a71932096e0fb9f1d301b6ccf07
> 
> Yes this is a merge commit from Linus.
> 
> I tested the kernel from each commit parent and the prueth sill works.
> 
> So I rebased the branch arm-soc-5.13 merged by Linus to have a fast-forward
> history. The second git bisect return this commit as first bad commit:
> 
> ARM: dts: Move dra7 l3 noc to a separate node:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=7f2659ce657e87cb7f47e6b15099608eaa1349ac
> 
> The switch to ti-sysc seems to have some side effect on some driver like pci-dra7xx:
> 
> "After updating pci-dra7xx driver to probe with ti-sysc and genpd, I
> noticed that dra7xx_pcie_probe() would not run if a power-domains property
> was configured for the interconnect target module."
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=e259c2926c016dd815e5547412356d378fc1f589
> 
> This is my current understanding of the issue... but I don't understand the side
> effect of the move of the dra7 l3 noc node. Also, there is something merged
> before the 'arm-soc-5.13' branch that is a second cause of the issue.

Ok, I understand what's going on...

The issue appear on the merge commit since on a omap side there was the switch
to ti-sysc (devicetree interconnect description) and on upstream side there was
a change on driver core behavior with fw_devlink=on being set by default:

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=ea718c699055c8566eb64432388a04974c43b2ea

Actually the issue is really on the TI's prueth and IEP driver whith
fw_devlink=on. The IEP driver probe correctly with fw_devlink=permissive.

Best regards,
Romain


> 
> Best regards,
> Romain
> 
>>
>> Danish, if you can provide a new version of the "PRUSS Remoteproc, Platform
>> APIS, and Ethernet Driver" series including the prueth and iep driver for
>> AM57xx, I will be able to test it [4].
>>
>> Thanks!
>>
>> [1] https://lore.kernel.org/netdev/20220406094358.7895-1-p-mohan@ti.com/
>> [2]
>> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?h=ti-linux-5.10.y&id=d3bf5a58c356a90fe14d34f213d6195b9a946dc5
>> [3]
>> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?h=ti-linux-5.10.y&id=7cb095866c8b436176dd783878a9e9c3c0bada0b
>> [4]
>> https://lore.kernel.org/linux-remoteproc/992019ad-5c58-d420-8a18-a82228f8e086@smile.fr/
>>
>> Best regards,
>> Romain
> 

